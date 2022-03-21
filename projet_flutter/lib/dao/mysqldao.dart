import '../infos/donnees.dart';
import 'package:http/http.dart' as http;

class MySQLDAODonnees {
  static const String urlServeur =
      "https://devweb.iutmetz.univ-lorraine.fr/~gall17u/";

  static Future<List<Donnees>> getDonnees() async {
    final response = await http.get(Uri.parse(urlServeur + 'identite.php'));
    if (response.statusCode == 200) {
      return Donnees.listeFromJsonString(response.body);
    } else {
      throw Exception('Impossible de charger les categories');
    }
  }
}
