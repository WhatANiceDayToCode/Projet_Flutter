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
    _page1 = const Page1();
    _page2 = Page2Widget();
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

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page1 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
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
