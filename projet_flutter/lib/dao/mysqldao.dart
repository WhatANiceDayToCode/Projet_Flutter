import '../infos/donnees.dart';
import 'package:http/http.dart' as http;

class MySQLDAOCategorie {
  static const String urlServeur =
      "https://lpsil.iutmetz.univ-lorraine.fr/android/ws_recettes/";

  static Future<List<Donnees>> getCategories() async {
    final response =
        await http.get(Uri.parse(urlServeur + 'get_categories.php'));
    if (response.statusCode == 200) {
      return Donnees.listeFromJsonString(response.body);
    } else {
      throw Exception('Impossible de charger les categories');
    }
  }
}
