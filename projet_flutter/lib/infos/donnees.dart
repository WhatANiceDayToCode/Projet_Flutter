import 'dart:convert';

class Donnees {
  // Les attributs ne sont pas 'final' car dans un cas plus complet
  // est amené à modifier les valeurs
  String _nom;
  String _prenom;
  String _date;
  String _lieu;
  String _enseignant;
  String _matiere;
  String _promo;
  String _licence;
  String _rue;
  String _batiment;
  String _ville;
  String _cp;
  String _telPerso;
  String _telPort;
  String _telProf;
  String _mail;
  String _empPrincipal;

// Getters
  get nom {
    return _nom;
  }

  get prenom {
    return _prenom;
  }

  get date {
    return _date;
  }

  get lieu {
    return _lieu;
  }

  get enseignant {
    return _enseignant;
  }

  get matiere {
    return _matiere;
  }

  get promo {
    return _promo;
  }

  get licence {
    return _licence;
  }

  get rue {
    return _rue;
  }

  get batiment {
    return _batiment;
  }

  get ville {
    return _ville;
  }

  get cp {
    return _cp;
  }

  get telPerso {
    return _telPerso;
  }

  get telPort {
    return _telPort;
  }

  get telProf {
    return _telProf;
  }

  get mail {
    return _mail;
  }

  get empPrincipal {
    return _empPrincipal;
  }

  Donnees(
    this._nom,
    this._prenom,
    this._date,
    this._lieu,
    this._enseignant,
    this._matiere,
    this._promo,
    this._licence,
    this._rue,
    this._batiment,
    this._ville,
    this._cp,
    this._telPerso,
    this._telPort,
    this._telProf,
    this._mail,
    this._empPrincipal,
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
        value['date'],
        value['lieu'],
        value['enseignant'],
        value['matiere'],
        value['promo'],
        value['licence'],
        value['rue'],
        value['batiment'],
        value['ville'],
        value['cp'],
        value['tel_perso'],
        value['tel_port'],
        value['tel_prof'],
        value['mail'],
        value['emp_principal'],
      ));
    }

    return liste;
  }
}
