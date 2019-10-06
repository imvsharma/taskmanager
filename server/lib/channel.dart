import './utils/configuration.dart';
import './utils/db.connection.dart';
import 'server.dart';
import './controllers/login.dart';
import './controllers/signup.dart';
import './controllers/task/task.controller.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class TaskmanagerChannel extends ApplicationChannel {
  ManagedContext context;
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = TaskManagerConfiguration(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);
    context = ManagedContext(dataModel, psc);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  /// 
  
  Future willOpen() async {
    final config = TaskManagerConfiguration(options.configurationFilePath);
    await createDatabaseSchema(context, config.database.isTemporary);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    router
      .route('/user/login')
      .link(() => LoginController(context));

    router
      .route('/user/signup')
      .link(() => SignupController(context));

    router
      .route('/task/create')
      .link(() => TaskController(context));

    return router;
  }
}