import 'dart:convert';

class Donnees {
  // Les attributs ne sont pas 'final' car dans un cas plus complet
  // est amené à modifier les valeurs
  final int _id;
  String _nom;
  String _prenom;
  String _lieu;

  get id {
    return _id;
  }

  get nom {
    return _nom;
  }

  get prenom {
    return _prenom;
  }

  get lieu {
    return _lieu;
  }

  Donnees(this._id, this._nom, this._prenom, this._lieu);

  @override
  String toString() {
    return _nom;
  }

  // Méthode utiisée par la DAO pour créer une liste d'instances de Donnees
  // -> à partir d'une liste d'objets JSON
  static List<Donnees> listeFromJsonString(String sJSON) {
    List<Donnees> liste = [];

    var json = jsonDecode(sJSON);

    for (var value in json) {
      liste.add(Donnees(
        //int.parse(value['nom']),
        int.parse(value['id']),
        value['nom'],
        value['prenom'],
        value['lieu'],
      ));
    }

    return liste;
  }
}
