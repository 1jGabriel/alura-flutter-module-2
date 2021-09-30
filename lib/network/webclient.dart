import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';

final Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()], requestTimeout: Duration(seconds: 5));

final Uri baseUrl = Uri(host: '10.0.0.105:8080/transactions');
