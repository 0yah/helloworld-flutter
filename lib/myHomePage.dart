import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/database.dart';
import 'textInput.dart';
import 'post.dart';
import 'postList.dart';

class MyHomePage extends StatefulWidget {
  final User? user;
  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];
  String text = "";

  void newPost(String text) {
    var post = new Post(text, widget.user!.displayName.toString());
    post.setId(savePost(post));
    this.setState(() {
      this.text = text;

      posts.add(post);
    });
  }

  void updatePosts() {
    getAllPosts().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updatePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World")),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList(this.posts, widget.user!)),
          TextInputWidget(this.newPost)
        ],
      ),
    );
  }
}
