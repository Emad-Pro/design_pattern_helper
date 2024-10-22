import 'dart:io' as file;

class MVCProject {
  final String projectName;

  MVCProject({required this.projectName});

  void createProjectStructure() {
    file.Directory('lib/${projectName.toLowerCase()}/view')
        .createSync(recursive: true);
    file.Directory('lib/${projectName.toLowerCase()}}/controller')
        .createSync(recursive: true);
    file.Directory('lib/${projectName.toLowerCase()}/model')
        .createSync(recursive: true);

    file.File('lib/$projectName/view/${projectName.toLowerCase()}_view.dart')
        .writeAsStringSync('''
class ${projectName}View {
  // كود واجهة المستخدم
}
''');

    file.File(
            'lib/$projectName/controller/${projectName.toLowerCase()}_controller.dart')
        .writeAsStringSync('''
class ${projectName}Controller {
  // كود الـ Controller
}
''');

    file.File('lib/$projectName/model/${projectName.toLowerCase()}_model.dart')
        .writeAsStringSync('''
class ${projectName}Model {
  // كود الـ Model
}
''');

    print("MVC project structure created successfully!");
  }
}
