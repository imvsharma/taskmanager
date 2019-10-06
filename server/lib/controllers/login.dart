import 'dart:async';
import 'package:aqueduct/aqueduct.dart';
import '../model/user.model.dart';
import '../utils/hash.dart';
import '../helpers/auth.provider.dart';

class LoginController extends ResourceController {
  LoginController(this.context);
  final ManagedContext context;
  @Operation.post()
  FutureOr<Response> login(@Bind.body() User user) async {
    if(user.username == null || user.password == null) {
      return Response.badRequest(
        body: {
          'error': 'username and password are required'
        }
      );
    }

    final query = Query<User>(context)
      ..where((u) => u.username).equalTo(user.username);
    final User fetchedUser = await query.fetchOne();
    print(fetchedUser);
    if(fetchedUser == null) {
      return Response.badRequest(
        body: {
          'error': 'user not found'
        }
      );
    }else {
      if(fetchedUser.password == Hash.create(user.password)){
      return Response.ok({
        "success": true,
        "message": 'Successfully login',
        "token": await AuthProvider().auth(user.username)
      });
      } else {
        return Response.badRequest(
          body: {
            'error': 'password is wrong'
          }
        );
      }
    }

  }

}