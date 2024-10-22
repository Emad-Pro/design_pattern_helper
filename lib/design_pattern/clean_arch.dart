import 'dart:io' as file;

import '../imports.dart';

class CleanArchProject {
  final String projectName;

  CleanArchProject({required this.projectName});

  void createProjectStructure() {
    String path = 'lib/${projectName.toLowerCase()}/features/';
    String classesName = projectName.capitalize();

    // Domain
    cleanArchDomain(path, classesName);

    // Presentation
    cleanArchPresntation(path, classesName);

    // Data
    cleanArchData(path, classesName);

    // إنشاء ملفات Presentation
    file.File('$path/presentation/pages/${projectName.toLowerCase()}_view.dart')
        .writeAsStringSync('''
class ${classesName}View {
  // كود واجهة المستخدم
}
''');

    file.File(
            '$path/presentation/controllers/${projectName.toLowerCase()}_bloc.dart')
        .writeAsStringSync('''
class ${classesName}Bloc {
  // كود الـ BLoC أو ViewModel أو Presenter
}
''');

    file.File(
            '$path/presentation/widgets/${projectName.toLowerCase()}_widget.dart')
        .writeAsStringSync('''
class ${classesName}Widget {
  // كود الودجت الخاص بالعرض
}
''');

    if (kDebugMode) {
      print(
          "Clean Architecture project structure created successfully for project: $projectName");
    }
  }

  void cleanArchData(String path, String classesName) {
    file.Directory('$path/data/models').createSync(recursive: true);
    file.Directory('$path/data/repository').createSync(recursive: true);
    file.Directory('$path/data/remote').createSync(recursive: true);
    file.Directory('$path/data/local').createSync(recursive: true);
    file.Directory('$path/data/cache').createSync(recursive: true);
    file.File('$path/data/models/${projectName.toLowerCase()}_model.dart')
        .writeAsStringSync('''
class ${classesName}Model extends ${classesName}Entity {
  // كود الـ Model
}
''');

    file.File(
            '$path/data/repository/${projectName.toLowerCase()}_repository_impl.dart')
        .writeAsStringSync('''
class ${classesName}RepositoryImpl implements ${classesName}Repository {
  // كود الـ Repository Implementation
}
''');

    file.File(
            '$path/data/remote/${projectName.toLowerCase()}_remote_data_source.dart')
        .writeAsStringSync('''
class ${classesName}RemoteDataSource {
  // كود Remote Data Source
}
''');

    file.File(
            '$path/data/local/${projectName.toLowerCase()}_local_data_source.dart')
        .writeAsStringSync('''
class ${classesName}LocalDataSource {
  // كود Local Data Source
}
''');

    file.File(
            '$path/data/cache/${projectName.toLowerCase()}_cache_data_source.dart')
        .writeAsStringSync('''
class ${classesName}CacheDataSource {
  // كود Cache Data Source
}
''');
  }

  void cleanArchPresntation(String path, String classesName) {
    file.Directory('$path/presentation/widgets').createSync(recursive: true);
    file.Directory('$path/presentation/pages').createSync(recursive: true);
    file.Directory('$path/presentation/controllers')
        .createSync(recursive: true);
    file.Directory('$path/presentation/screens').createSync(recursive: true);
  }

  void cleanArchDomain(String path, String classesName) {
    file.Directory('$path/domain/usecases').createSync(recursive: true);
    file.Directory('$path/domain/repositories').createSync(recursive: true);
    file.Directory('$path/domain/entities').createSync(recursive: true);
    file.File('$path/domain/entities/${projectName.toLowerCase()}.dart')
        .writeAsStringSync('''
class ${classesName}Entity {
  // كود الـ Entity
}
''');

    file.File(
            '$path/domain/usecases/${projectName.toLowerCase()}_usecases.dart')
        .writeAsStringSync('''
class ${classesName}UseCases {
  // كود الـ UseCases
}
''');

    file.File(
            '$path/domain/repositories/${projectName.toLowerCase()}_repositories.dart')
        .writeAsStringSync('''
abstract class ${classesName}Repository {
  // كود الـ Repositories
}
''');
  }
}
