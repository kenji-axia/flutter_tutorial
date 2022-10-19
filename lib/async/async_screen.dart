import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({Key? key}) : super(key: key);

  @override
  State<AsyncScreen> createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();

  String _name = '未設定';
  String _age = '未設定';
  String _birthday = '未設定';

  Future<void> _getSharedPreferences() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _name = prefs.getString('name') ?? '未設定';
      _age = prefs.getString('age') ?? '未設定';
      _birthday = prefs.getString('birthday') ?? '未設定';
    });
  }

  Future<void> _setSharedPreferences() async {
    final SharedPreferences prefs = await _prefs;
    prefs
      ..setString('name', _name)
      ..setString('age', _age)
      ..setString('birthday', _birthday);
  }

  @override
  void initState() {
    super.initState();
    _getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('名前 $_name'),
            Text('年齢 $_age'),
            Text('誕生日 $_birthday'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          _displayInputDialog(context);
        },
      ),
    );
  }

  Future<void> _displayInputDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('登録'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "名前"),
                  onSaved: (value) => _name = value!,
                  validator: (value) =>
                      (value == null || value.isEmpty) ? '未入力です' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "年齢"),
                  onSaved: (value) => _age = value!,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) =>
                      (value == null || value.isEmpty) ? '未入力です' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "誕生日"),
                  onSaved: (value) => _birthday = value!,
                  validator: (value) =>
                      (value == null || value.isEmpty) ? '未入力です' : null,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _formKey.currentState!.save();
                  });
                  _setSharedPreferences();
                  Navigator.pop(context);
                }
              },
              child: const Text('保存'),
            ),
          ],
        );
      },
    );
  }
}
