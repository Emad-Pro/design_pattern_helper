import 'dart:io' as file;

class MVVMProject {
  void createProjectStructure() {
    file.Directory('lib/view').createSync(recursive: true);
    file.Directory('lib/viewmodel').createSync(recursive: true);
    file.Directory('lib/model').createSync(recursive: true);

    file.File('lib/view/home_view.dart').writeAsStringSync('''
class HomeView {
  // كود واجهة المستخدم
}
''');

    file.File('lib/viewmodel/home_view_model.dart').writeAsStringSync('''
class HomeViewModel {
  // كود الـ ViewModel
}
''');

    file.File('lib/model/home_model.dart').writeAsStringSync('''
class HomeModel {
  // كود الـ Model
}
''');

    print("MVVM project structure created successfully!");
  }
}
