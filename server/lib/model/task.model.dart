import '../server.dart';
import './user.model.dart';

class Task extends ManagedObject<_Task> implements _Task{}

class _Task {
  @primaryKey
  int id;

  @Column(unique: false, indexed: true)
  String title;

  @Column(unique: false, indexed: true)
  String description;

  @Relate(#tasks)
  User user;
}