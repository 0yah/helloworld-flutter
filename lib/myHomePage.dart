
import 'package:flutter/material.dart';
import 'textInput.dart';
import 'post.dart';
import 'postList.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];
  String text = "";

  void newPost(String text) {
    this.setState(() {
      this.text = text;
      posts.add(new Post(text, "Ian"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World")),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList(this.posts)),
          TextInputWidget(this.newPost)
        ],
      ),
    );
  }
}
