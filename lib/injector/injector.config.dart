// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:user_registration/data/repository/login_repository_impl.dart'
    as _i6;
import 'package:user_registration/data/repository/user_repository_impl.dart'
    as _i10;
import 'package:user_registration/domain/repositories/login_repository.dart'
    as _i5;
import 'package:user_registration/domain/repositories/user_repository.dart'
    as _i9;
import 'package:user_registration/domain/use_case/login_use_case.dart' as _i4;
import 'package:user_registration/domain/use_case/sing_up_use_case.dart' as _i8;
import 'package:user_registration/presentation/bloc/login/login_bloc.dart'
    as _i3;
import 'package:user_registration/presentation/bloc/sing_up/sing_up_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LoginBloc>(() => _i3.LoginBloc(gh<_i4.LoginUseCase>()));
    gh.factory<_i5.LoginRepository>(() => _i6.LoginRepositoryImpl());
    gh.factory<_i7.SignUpBloc>(() => _i7.SignUpBloc(gh<_i8.SignUpUseCase>()));
    gh.factory<_i9.SignUpRepository>(() => _i10.SignUpRepositoryImpl());
    return this;
  }
}
