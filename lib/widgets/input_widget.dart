import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget({
    Key? key,
    required this.formKey,
    required this.editController,
    required this.itemCount,
    required this.nodes,
    this.icons,
    this.type,
    this.titles,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final int itemCount;
  final List<TextEditingController> editController;
  final List<IconData>? icons;
  final List<FocusNode> nodes;
  final List<TextInputType>? type;
  final List<String>? titles;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widget = <Widget>[];
    bool isSingle = false;

    if (itemCount <= 1) {
      isSingle = true;
      widget.add(
        TextFormField(
          obscureText: type![0] == TextInputType.visiblePassword,
          controller: editController[0],
          keyboardType: type![0],
          autofocus: true,
          focusNode: nodes[0],
          validator: (input) {
            if (input!.isEmpty) {
              return 'cant be null';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: titles![0],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(
              icons![0],
              color: Colors.red,
            ),
          ),
        ),
      );
    } else {
      isSingle = false;
      for (var i = 0; i < itemCount; i++) {
        widget.add(
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: TextFormField(
              controller: editController[i],
              keyboardType: type![i],
              obscureText: type![i] == TextInputType.visiblePassword,
              autofocus: true,
              focusNode: nodes[i],
              validator: (input) {
                if (input!.isEmpty) {
                  return 'cant be null';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: titles![i],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(
                  icons![i],
                  color: Colors.red,
                ),
              ),
            ),
          ),
        );
      }
    }

    return SizedBox(
      width: size.width * .7,
      child: Form(
        key: formKey,
        child: !isSingle
            ? Column(
                children: widget.toList(),
              )
            : widget[0],
      ),
    );
  }
}
