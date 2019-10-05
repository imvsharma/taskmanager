import '../server.dart';

class TaskManagerConfiguration extends Configuration {
  TaskManagerConfiguration(String path): super.fromFile(File(path));
  DatabaseConfiguration database;
}