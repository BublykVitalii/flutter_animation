import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

class Quantity extends StatelessWidget {
  const Quantity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Center(
            child: Text(
              '10',
              style: context.theme.textTheme.subtitle2!.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
