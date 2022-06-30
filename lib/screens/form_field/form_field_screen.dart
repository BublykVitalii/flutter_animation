import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

import 'package:flutter_animation/screens/form_field/domaine/user.dart';

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

class _FormFieldScreenState extends State<FormFieldScreen> {
  final users = List<User>.generate(21, (i) {
    return User(
      name: 'Ruru $i',
      money: '50.345 ETH',
      id: i,
    );
  });

  final _formKey = GlobalKey<FormState>();

  List<User> changedUsers = [];
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_kTitle.toUpperCase()),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.black54,
            );
          },
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final isSelected = changedUsers.contains(user);
            return CheckboxListTile(
              value: isSelected,
              onChanged: (value) {
                if (value!) {
                  changedUsers.add(user);
                } else {
                  changedUsers.remove(user);
                }
                setState(() {});
              },
              tileColor: AppColors.backgroundButton,
              secondary: Image.asset(
                AppImages.faceGirl,
                width: 40,
                height: 40,
              ),
              title: Text(user.name),
              subtitle: Text(
                user.money,
                style: context.theme.textTheme.caption!.copyWith(
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
