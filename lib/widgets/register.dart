import 'package:flutter/material.dart';
import 'package:flutter_fire_base_register/auth/auth.dart';
import 'package:flutter_fire_base_register/screens/screen.dart';
import 'package:flutter_fire_base_register/widgets/widget.dart';

class Register extends StatefulWidget {
  Register({
    Key? key,
    required this.formKeys,
    required this.textControllers,
    required this.nodes,
  }) : super(key: key);

  final GlobalKey<FormState> formKeys;
  final List<TextEditingController> textControllers;
  final List<FocusNode> nodes;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthSerives _serives = AuthSerives();

  String? mail;

  String? password;

  void logIn(BuildContext context) async {
    final check = widget.formKeys.currentState!.validate();

    mail = widget.textControllers[0].text;
    password = widget.textControllers[1].text;
    if (mail!.isNotEmpty && password!.isNotEmpty) {
      await _serives.registerMailPasword(mail, password);
    } else if (mail!.isNotEmpty && password!.isEmpty) {
      FocusScope.of(context).requestFocus(widget.nodes[1]);
    }
  }

  void back(BuildContext context) {
    WelcomeScreen.of(context).onBack();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Firabe register'),
        leading: IconButton(
          onPressed: () => back(context),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputWidget(
              formKey: widget.formKeys,
              editController: widget.textControllers,
              itemCount: widget.textControllers.length,
              nodes: widget.nodes,
              icons: [
                Icons.mail,
                Icons.lock,
              ],
              type: [
                TextInputType.emailAddress,
                TextInputType.visiblePassword,
              ],
              titles: [
                'e-mail',
                'password',
              ],
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: size.width * .8,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Register'),
                onPressed: () => logIn(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
