// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:projet_flutter/dao/mysqldao.dart';
import 'package:projet_flutter/infos/donnees.dart';
import 'package:search_page/search_page.dart';

void main() {
  runApp(const MyApp());
}

class Person {
  final String name, surname;
  final num age;
  Person(this.name, this.surname, this.age);
}

const String page1 = "Ajouter";
const String page2 = "Afficher";
const String title = "Projet Flutter";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _pages;
  late Widget _page1;
  late Page2Widget _page2;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _page1 = Page1();
    _page2 = const Page2Widget();
    _pages = [_page1, _page2];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  // Changement de page / onglet
  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _changeTab(index);
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: page1,
              icon: Icon(Icons.edit),
            ),
            BottomNavigationBarItem(
              label: page2,
              icon: Icon(Icons.list),
            ),
          ]),
    );
  }
}

enum TitreEnseignant { titulaire, vacataire, ater, moniteur }

class Page1 extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? _selectedDate;

  Page1({Key? key}) : super(key: key);

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    var context;
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }

  TitreEnseignant? _character = TitreEnseignant.titulaire;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nom',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le nom';
              }
              return null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Prénom',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le prénom';
              }
              return null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Lieu de naissance',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le lieu de naissance';
              }
              return null;
            },
          ),

          ElevatedButton(
              onPressed: _presentDatePicker,
              child: const Text('Date de naissance')),

          // display the selected date
          Container(
            padding: const EdgeInsets.all(0),
            child: Text(
              _selectedDate != null
                  ? _selectedDate.toString()
                  : 'Veuillez choisir une date',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          AppBar(title: const Text("Adresse")),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Rue',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer la rue';
              }
              return null;
            },
          ),

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Batiment',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le batiment';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Ville',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer la ville';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Code Postal',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le code postal';
              }
              return null;
            },
          ),
          AppBar(title: const Text("Renseignements complémentaires")),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Téléphone personnel',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le numéro de téléphone personnel';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Téléphone portable',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le numéro de téléphone portable';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Téléphone professionnel',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer le numéro de téléphone professionnel';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Adresse électronique',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer l\'adresse électronique';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Employeur principal : adresse complète',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer l\'adresse complète de l\'employeur principal';
              }
              return null;
            },
          ),
          AppBar(title: const Text("Enseignant")),
          RadioListTile<TitreEnseignant>(
            title: const Text('Titulaire'),
            value: TitreEnseignant.titulaire,
            groupValue: _character,
            onChanged: (TitreEnseignant? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          RadioListTile<TitreEnseignant>(
            title: const Text('Vacataire'),
            value: TitreEnseignant.vacataire,
            groupValue: _character,
            onChanged: (TitreEnseignant? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          RadioListTile<TitreEnseignant>(
            title: const Text('ATER'),
            value: TitreEnseignant.ater,
            groupValue: _character,
            onChanged: (TitreEnseignant? value) {
              setState(() {
                _character = value;
              });
            },
          ),

          RadioListTile<TitreEnseignant>(
            title: const Text('Moniteur'),
            value: TitreEnseignant.moniteur,
            groupValue: _character,
            onChanged: (TitreEnseignant? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('VALIDER'),
            ),
          ),
        ],
      )),
    );
  }

  void setState(Null Function() param0) {}
}

class Page3 extends StatelessWidget {
  Donnees user;
  Page3(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Informations de " + user.nom + " " + user.prenom)),
        body:
            // Gestion du bouton back de l'appBar ET du téléphone
            WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            return false;
          },
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Nom : " + user.nom),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Prénom : " + user.prenom),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Date de naissance : " + user.date),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Lieu de naissance : " + user.lieu),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: const Text("Adresse : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Rue : " + user.rue),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Batiment : " + user.batiment),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Ville : " + user.ville),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Code Postal : " + user.cp),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: const Text("Renseignements complémentaires : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Téléphone Perso : " + user.telPerso),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Téléphone Portable : " + user.telPort),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Teléphone Professeur : " + user.telProf),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Adresse Electronique : " + user.mail),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Employeur principal (adresse complète) : " +
                    user.empPrincipal),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: const Text("Enseignant : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Enseignant : " + user.enseignant),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Matière : " + user.matiere),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: Text("Promotion : " + user.promo),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                alignment: Alignment.topLeft,
                child: Text("Licence : " + user.licence),
              ),
            ],
          )),
        ));
  }
}

class Page2Widget extends StatefulWidget {
  const Page2Widget({Key? key}) : super(key: key);

  @override
  State<Page2Widget> createState() => Page2();
}

class Page2 extends State<Page2Widget> {
  // const Page2({Key? key}) : super(key: key);
  // Données stockées en dûr
  // static List<Person> people = [
  //   Person('Nom', 'Prénom', 00),
  //   Person('Mike', 'Barron', 64),
  //   Person('Todd', 'Black', 30),
  //   Person('Ahmad', 'Edwards', 55),
  //   Person('Anthony', 'Johnson', 67),
  //   Person('Annette', 'Brooks', 39),
  // ];

  late List<Donnees> _donnees;

  @override
  void initState() {
    _chargeCategories();
    super.initState();
  }

  void _chargeCategories() async {
    _donnees = await MySQLDAODonnees.getDonnees();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _donnees == null
          ? const Center(
              child: Text("Chargement en cours..."),
            )
          : ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                for (var idx = 0; idx < _donnees.length; idx++)
                  ListTile(
                    title: Text(_donnees[idx].nom),
                    subtitle: Text(_donnees[idx].prenom),
                    trailing: Text(_donnees[idx].telPort),
                    onTap: () {
                      //Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Page3(_donnees[idx])));
                    },
                  )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Rechercher quelqu\'un...',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Donnees>(
            // ignore: avoid_print
            onQueryUpdate: (s) => print(s),
            items: _donnees == null ? [] : _donnees,
            searchLabel: 'Rechercher quelqu\'un...',
            suggestion: const Center(
              child: Text('Rechercher par nom, prénom ou numéro de téléphone'),
            ),
            failure: const Center(
              child: Text('Aucun résultat :('),
            ),
            filter: (person) => [
              person.nom,
              person.prenom,
              person.telPort,
            ],
            builder: (person) => ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Page3(person)));
              },
              title: Text(person.nom),
              subtitle: Text(person.prenom),
              trailing: Text(person.telPort),
            ),
          ),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
