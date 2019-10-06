import 'package:server/server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AuthMiddleware extends Controller {
  @override
  Future<RequestOrResponse> handle(Request request) async {
     try{
      final String token = request.raw.headers['authorization'][0].replaceAll('Bearer ', '');
      final JwtClaim claim = verifyJwtHS256Signature(token, 'ASDF_QWERTY_REPLACE_ME_PLZ_THX');
      print(claim);
      claim.validate(issuer: 'ACME Widgets Corp',audience: 'example.com');
      request.attachments['username'] = claim.subject;
      return request;
    }catch (e) {
      return Response.unauthorized(body: {
        "error": 'User not authorized'
      });
    }
  }
}