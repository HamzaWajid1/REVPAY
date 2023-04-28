import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  void Function(String)? onChanged;
  //final ValueChanged<String> onChanged;
  final TextEditingController controller1;
  final TextInputType? textInputType;
  final String? errorMessage;
  final bool disabled;

  TextFieldWidget(
      {Key? key,
      required this.label,
      required this.text,
      required this.onChanged,
      required this.controller1,
      this.textInputType,
      this.disabled = false,
      required this.errorMessage})
      : super(key: key);

  @override
  TextfieldWidgetState createState() => TextfieldWidgetState();
}

class TextfieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    //controller.dispose();

    //super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 20,
          //   width: double.infinity,
          // ),
          // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          Positioned(
              // key: Key('1'),
              child: Container(
                  height: 70,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    onChanged: widget.onChanged,
                    readOnly: widget.disabled,
                    keyboardType: widget.textInputType,
                    controller: widget.controller1,
                    decoration: InputDecoration(
                        errorText: widget.errorMessage,
                        focusColor: const Color(0xFFFF4A47),
                        focusedBorder: const OutlineInputBorder(),
                        border: const OutlineInputBorder(

                            // borderRadius: BorderRadius.circular(7)),
                            )),
                  ))),
          Positioned(
              // key: Key('2'),
              // height: 50,
              left: 18,
              bottom: widget.errorMessage == null ? 47.0 : 57.0,
              // top: 45,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  // alignment: Alignment.center,
                  color: Colors.grey[50],
                  // height: 20,
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ))),
        ],
      );
}
