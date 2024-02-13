import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../domain/use_case/login_use_case.dart';
import '../domain/use_case/sing_up_use_case.dart';
import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

void setupLocator() {
  getIt.registerLazySingleton(() => SignUpUseCase());
  getIt.registerLazySingleton(() => LoginUseCase());
}
