
import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  /* When this widget is done clean it up */
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {

    FocusScope.of(context).unfocus();
    widget.callback(controller.text);
    controller.clear();

    
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a message:",
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            onPressed: this.click,
            tooltip: "Post Message",
            splashColor: Colors.blue,
          )),
    );
  }
}
