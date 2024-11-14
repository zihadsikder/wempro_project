import '../../services/api_clients.dart';
import '../../services/api_endpoints.dart';
import '../models/network_response.dart';

class EntityRepository {
  static Future<NetworkResponse> getEntityData() async {
    final NetworkResponse response =
        await ApiClient().getRequest(ApiEndPoints.entity,
        );
    return response;
  }

}
