import 'package:flutter/material.dart';

import 'package:flutter_animation/infrastructure/theme/app_colors.dart';
import 'package:flutter_animation/infrastructure/theme/app_images.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

import 'package:flutter_animation/screens/form_field/domaine/user.dart';

class UserForm extends FormField<List<User>> {
  UserForm({
    Key? key,
    required FormFieldSetter<List<User>> onSaved,
    FormFieldValidator<List<User>>? validator,
    required List<User> users,
    required List<User> selectedUser,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (state) {
            return UserList(
              users: users,
              selectedUser: state.value ?? selectedUser,
              onChanged: state.didChange,
            );
          },
        );
}

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
    required this.users,
    required this.selectedUser,
    required this.onChanged,
  }) : super(key: key);

  final List<User> users;
  final List<User> selectedUser;
  final ValueChanged<List<User>> onChanged;

  void _onSelectUser(User user, bool isSelected) {
    final userList = List<User>.from(selectedUser);
    if (isSelected) {
      userList.add(user);
    } else {
      userList.remove(user);
    }
    onChanged(userList);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.black54,
        );
      },
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        bool isSelected = selectedUser.contains(user);
        return CheckboxListTile(
          value: isSelected,
          onChanged: (value) {
            _onSelectUser(user, value!);
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
    );
  }
}
