import 'package:domi/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final di = GetIt.instance;

@InjectableInit(initializerName: 'init')
void configureDI() => di.init();
