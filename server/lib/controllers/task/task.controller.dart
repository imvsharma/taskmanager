import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../../model/task.model.dart';

class TaskController extends ResourceController {
  TaskController(this.context);
  final ManagedContext context;

  @Operation.post()
  FutureOr<Response> createTask(@Bind.body() Task task) async {
    final taskQuery = Query<Task>(context)
      ..values.user = task.user;
    final fetchedTask = await taskQuery.insert();
    print(fetchedTask);
    return Response.ok(fetchedTask);
  }
}
