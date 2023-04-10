import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class McqPage extends StatefulWidget {
  const McqPage({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const McqPage());
  }

  @override
  State<McqPage> createState() => _McqPageState();
}

class _McqPageState extends State<McqPage> {
  late List<Question> _questions;

  @override
  void initState() {
    super.initState();
    _fetchMcqs();
  }

  static const baseUrl = 'http://localhost:8000';
  static const endPoint = '/api/questions';
  static const uri = baseUrl + endPoint;

  Future<List<Question>> _fetchMcqs() async {
    var apiUrl = Uri.parse(uri);

    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<Question> questions =
          data.map((json) => Question.fromJson(json)).toList();
      setState(() {
        _questions = questions;
      });
      if (kDebugMode) {
        print(_questions);
      }
      return _questions;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question List'),
      ),
      body: _questions == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _questions.length,
              itemBuilder: (BuildContext context, int index) {
                final question = _questions[index];
                return Card(
                  child: ListTile(
                    title: Text(question.question),
                    subtitle: Text(question.answer),
                  ),
                );
              },
            ),
    );
  }
}

class Question {
  final String question;
  final String a;
  final String b;
  final String c;
  final String d;
  final String answer;

  Question({
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      a: json['a'],
      b: json['b'],
      c: json['c'],
      d: json['d'],
      answer: json['answer'],
    );
  }
}
