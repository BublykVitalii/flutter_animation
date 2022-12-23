import 'package:flutter_animation/infrastructure/injectible.init.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
Future<void> configureDependencies(GetIt getIt) async => $initGetIt(getIt);
