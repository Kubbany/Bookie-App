abstract class DatabaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> getData(String path);
  Future<Map<String, dynamic>?> getDataById(String path, String id);
  Future<void> editData(String path, String id, Map<String, dynamic> data);
}
