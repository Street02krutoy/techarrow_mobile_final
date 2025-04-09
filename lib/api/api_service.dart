import 'package:techarrow_mobile_final/swagger_generated_api/client_index.dart';

class ApiService {
  final api = Swagger.create(baseUrl: Uri.parse('http://192.168.168.29:5252'));
}
