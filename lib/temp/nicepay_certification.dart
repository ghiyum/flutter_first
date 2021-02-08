import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';


class NPCertification extends StatefulWidget {
  @override
  _npCertify createState() => _npCertify();
}
class _npCertify extends State<NPCertification> {



  String _text = "Http Example";
  void _fetchPosts() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    setState(() {
      _text = response.body;
    });
  }

  void _createPost() async {
    final response = await http.post(
      'https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb',
      body: jsonEncode(
        {

        },

      ),
      headers: {'Content-Type': "application/json"},
    );

 //   final Post parsedResponse = Post.fromJSON(jsonDecode(response.body));
  }

  @override
  void initState() {
    super.initState();
    // _fetchPosts();
    _createPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_text),
      ),
    );
  }
}