import 'dart:io' as file;

class MVPProject {
  void createProjectStructure() {
    file.Directory('lib/view').createSync(recursive: true);
    file.Directory('lib/presenter').createSync(recursive: true);
    file.Directory('lib/model').createSync(recursive: true);

    file.File('lib/view/home_view.dart').writeAsStringSync('''
class HomeView {
  // كود واجهة المستخدم
}
''');

    file.File('lib/presenter/home_presenter.dart').writeAsStringSync('''
class HomePresenter {
  // كود الـ Presenter
}
''');

    file.File('lib/model/home_model.dart').writeAsStringSync('''
class HomeModel {
  // كود الـ Model
}
''');

    print("MVP project structure created successfully!");
  }
}
