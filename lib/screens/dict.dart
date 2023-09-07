import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:studentapp/screens/selectActivity.dart';

// void main() {
//   runApp(DictionaryApp());
// }

class dictionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: BackButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const selectScreen()),
              );
            },),
          title: Text('Dictionary'),
        ),
        body: DictionaryScreen(),
      ),
    );
  }
}

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  TextEditingController _wordController = TextEditingController();
  String _definition = '';
  String _partOfSpeech = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _wordController,
            decoration: InputDecoration(
              labelText: 'Enter a word',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => _fetchDefinition(_wordController.text),
          child: Text('Search'),
        ),
        SizedBox(height: 20),
        Text(
          'Definition:',
          style: TextStyle(fontSize: 18),
        ),
        // Text(
        //   'Part of Speech:',
        //   style: TextStyle(fontSize: 18),
        // ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _definition,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 22,),
                  ),

                  SizedBox(height: 20,),
                  Text(
                    _partOfSpeech,
                    style: TextStyle(fontStyle: FontStyle.italic,fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _fetchDefinition(String word) async {
    final response = await http.get(
      Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        final definition = data[0]['meanings'][0]['definitions'][0]['definition'];
        final partOfSpeech = data[0]['meanings'][0]['partOfSpeech'];
        setState(() {
          _definition = definition;
          _partOfSpeech = 'Part of Speech: $partOfSpeech';
        });
      } else {
        setState(() {
          _definition = 'Definition not found';
          _partOfSpeech = '';
        });
      }
    } else {
      setState(() {
        _definition = 'Error fetching data';
        _partOfSpeech = '';
      });
    }
  }
}
