import 'package:flutter/material.dart';

class QuoteForm extends StatefulWidget {
  @override
  _QuoteFormState createState() => _QuoteFormState();
}

class _QuoteFormState extends State<QuoteForm> {
  final _formKey = GlobalKey<FormState>();
  String _quote = '';
  String _author = '';

  // フォームの送信処理を実装する
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // 名言を保存する処理を実装する
      Navigator.pop(context, {'quote': _quote, 'author': _author});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Quote')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Quote'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a quote';
                }
                return null;
              },
              onSaved: (value) => _quote = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Author'),
              onSaved: (value) => _author = value!,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Save Quote'),
            ),
          ],
        ),
      ),
    );
  }
}

class RaisedButton {}
