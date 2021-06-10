

import 'package:get_it/get_it.dart';
import 'package:learnanimation/preference_service.dart';
import 'package:learnanimation/tarnsition_provider/initial_screen/initial_viewmodel.dart';
import 'package:learnanimation/tarnsition_provider/size_transition/size_transition.dart';
import 'package:learnanimation/tarnsition_provider/size_transition/size_viewmodel.dart';

import 'navigation_services.dart';

GetIt locator = GetIt();

void setupLocator() {

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => PreferenceService());

  locator.registerFactory(() => InitialViewModel());
  locator.registerFactory(() => SizeTransitionViewModel());

}