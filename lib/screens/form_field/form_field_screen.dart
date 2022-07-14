import 'package:flutter/material.dart';

import 'package:flutter_animation/screens/form_field/domaine/user.dart';
import 'package:flutter_animation/screens/form_field/widgets/list_checkbox.dart';
import 'package:flutter_animation/screens/form_field/widgets/user_form.dart';

// ---Texts---
const _kTitle = 'Form field check';

// ---Parameters---

class FormFieldScreen extends StatefulWidget {
  static const _routeName = '/form-field-screen-screen';

  static PageRoute<FormFieldScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return const FormFieldScreen();
      },
    );
  }

  const FormFieldScreen({Key? key}) : super(key: key);

  @override
  State<FormFieldScreen> createState() => _FormFieldScreenState();
}

List<User> selectedUser = [];

class _FormFieldScreenState extends State<FormFieldScreen> {
  final _formKey = GlobalKey<FormState>();

  bool checkboxValue = false;

  final users = List<User>.generate(21, (i) {
    return User(
      name: 'Ruru $i',
      money: '50.345 ETH',
      id: i,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_kTitle.toUpperCase()),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ListCheckBoxForm(
              selectedCheckBox: checkboxValue,
              onSaved: (value) {
                checkboxValue = value!;
              },
            ),
            Expanded(
              child: UserForm(
                users: users,
                selectedUser: selectedUser,
                onSaved: (value) {
                  if (value != null) {
                    setState(() {
                      selectedUser = value;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: _onPressedSave,
        child: const Text('Saved'),
      ),
    );
  }

  _onPressedSave() async {
    _formKey.currentState!.save();
  }
}
