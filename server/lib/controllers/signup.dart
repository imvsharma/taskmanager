import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../model/user.model.dart';
import '../utils/hash.dart';

class SignupController extends ResourceController {
  SignupController(this.context);
  final ManagedContext context;
  @Operation.post()
  Future<Response> createUser(@Bind.body() User user) async {
    user.password = Hash.create(user.password);
    return Response.ok(await Query(context, values: user).insert());
  }
}