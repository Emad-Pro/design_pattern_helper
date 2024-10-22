library design_pattern_helper;

import 'package:design_pattern_helper/imports.dart';

class DesignPatternHelper {
  void main(List<String> arguments) {
    // إعداد محلل الخيارات
    final parser = ArgParser()
      ..addOption('pattern',
          abbr: 'p',
          help: 'Choose design pattern (mvvm, mvc, mvp, clean)',
          allowed: ['mvvm', 'mvc', 'mvp', 'clean'],
          defaultsTo: 'mvvm')
      ..addOption('project',
          abbr: 'n', help: 'Set project name', defaultsTo: 'DefaultProject');

    // تحليل المدخلات
    var argResults = parser.parse(arguments);

    var pattern = argResults['pattern'];
    var projectName = argResults['project'];

    switch (pattern) {
      case 'mvvm':
        print("Creating MVVM project structure...");
        MVVMProject().createProjectStructure();
        break;
      case 'mvc':
        print("Creating MVC project structure...");
        MVCProject(projectName: projectName).createProjectStructure();
        break;
      case 'mvp':
        print("Creating MVP project structure...");
        MVPProject().createProjectStructure();
        break;
      case 'clean':
        print("Creating Clean Architecture project structure...");
        CleanArchProject(projectName: projectName).createProjectStructure();
        break;
      default:
        print("اختيار غير صحيح. حاول مرة أخرى.");
    }
  }
}
