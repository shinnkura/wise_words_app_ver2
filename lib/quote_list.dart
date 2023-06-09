import 'package:flutter/material.dart';
import 'quote_form.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List _quotes = [];

  void _addQuote(String quote, String author) {
    setState(() {
      _quotes.add({'quote': quote, 'author': author});
    });
  }

  void _removeQuote(int index) {
    setState(() {
      _quotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quote List')),
      body: ListView.builder(
        itemCount: _quotes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_quotes[index]['quote']),
            subtitle: Text(_quotes[index]['author']),
            onTap: () {
              // 名言の詳細画面に遷移する処理を実装する
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 名言フォーム画面に遷移し、結果を待つ
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuoteForm(),
            ),
          );

          // 結果がnullでない場合、名言を追加する
          if (result != null) {
            _addQuote(result['quote'], result['author']);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quote List')),
      body: ListView.separated(
        itemCount: _quotes.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_quotes[index]['quote']),
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
            onDismissed: (direction) {
              _removeQuote(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Quote deleted')),
              );
            },
            child: ListTile(
              title: Text(_quotes[index]['quote']),
              subtitle: Text(_quotes[index]['author']),
              onTap: () {
                // 名言の詳細画面に遷移する処理を実装する
              },
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 名言フォーム画面に遷移し、結果を待つ
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuoteForm(),
            ),
          );

          // 結果がnullでない場合、名言を追加する
          if (result != null) {
            _addQuote(result['quote'], result['author']);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
*/
