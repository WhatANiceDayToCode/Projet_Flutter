import 'dart:convert';

class Donnees {
  // Les attributs ne sont pas 'final' car dans un cas plus complet
  // est amené à modifier les valeurs
  String _nom;
  String _prenom;
  String _telPort;

// Getters
  get nom {
    return _nom;
  }

  get prenom {
    return _prenom;
  }

  get telPort {
    return _telPort;
  }

  Donnees(
    this._nom,
    this._prenom,
    this._telPort,
  );

  // @override
  // String toString() {
  //   return _nom;
  // }

  // Méthode utiisée par la DAO pour créer une liste d'instances de Donnees
  // -> à partir d'une liste d'objets JSON
  static List<Donnees> listeFromJsonString(String sJSON) {
    List<Donnees> liste = [];

    var json = jsonDecode(sJSON);

    for (var value in json) {
      liste.add(Donnees(
        //int.parse(value['nom']),
        value['nom'],
        value['prenom'],
        value['telPort'],
      ));
    }

    return liste;
  }
}
