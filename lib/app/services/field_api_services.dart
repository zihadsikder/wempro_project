import 'package:http/http.dart' as http;
import '../data/models/entity.dart';

class FieldApiService {
  final String apiUrl =
      "http://team.dev.helpabode.com:54292/api/wempro/flutter-dev/coding-test-2024/";

  Future<Entity> fetchFields() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the response JSON into an Entity object
      return entityFromJson(response.body);
    } else {
      throw Exception("Failed to load fields");
    }
  }
}
