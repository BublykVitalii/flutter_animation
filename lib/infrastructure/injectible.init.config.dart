// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../screens/dji_shop/domain/product_repository.dart' as _i3;
import '../screens/dji_shop/domain/product_service.dart' as _i5;
import '../screens/dji_shop/repository/mock_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.ProductRepository>(_i4.MockRepository());
  gh.singleton<_i5.ProductService>(
      _i5.ProductService(get<_i3.ProductRepository>()));
  return get;
}
