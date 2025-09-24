import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qaza_namaz/theme.dart';


class ThemeController extends GetxController{
  final _box =GetStorage();
  final _key = 'theme';

  // available themes

  final Map<String, ThemeData> themes = {
    "Oasis": AppThemes.oasisTheme,
    "Galaxy Night": AppThemes.galaxyNightTheme,
    "Blossom": AppThemes.blossomTheme,
  };

  //Reactive theme name
  var selectedTheme= "islamic".obs;
  ThemeData get currentTheme => themes[selectedTheme.value]??AppThemes.blossomTheme;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //load saved theme from storage
    String? savedTheme = _box.read(_key);
    if (savedTheme!=null && themes.containsKey(savedTheme)){
      selectedTheme.value=savedTheme;
    } else {
      selectedTheme.value = "Islamic";
    }
  }

  void setTheme(String themeName){
    selectedTheme.value =themeName;
    _box.write(_key, themeName);
    Get.changeTheme(themes[themeName]!);
  }
}