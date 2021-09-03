import 'package:flutter/material.dart';
import 'package:hello/myHomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name="";

  TextEditingController controller = new TextEditingController();

  void click() {
    this.name = controller.text;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: this.controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Type Your Name:",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 5)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: this.click,
                    tooltip: "Submit",
                    splashColor: Colors.blue,
                  )),
            )));
  }
}


