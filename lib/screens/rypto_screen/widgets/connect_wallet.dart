import 'package:flutter/material.dart';
import 'package:flutter_animation/infrastructure/theme/theme_extension.dart';

class ConnectWallet extends StatelessWidget {
  const ConnectWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 20,
      child: Container(
        height: 140,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Connect Wallet',
              style: context.theme.textTheme.caption!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
