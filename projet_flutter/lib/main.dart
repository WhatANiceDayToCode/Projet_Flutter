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
// const String page3 = "Rechercher";
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
            // BottomNavigationBarItem(
            //   label: page3,
            //   icon: Icon(Icons.search),
            // ),
          ]),
      // Burger menu
      // drawer: Drawer(
      //   child: Container(
      //     margin: const EdgeInsets.only(top: 20.0),
      //     child: Column(
      //       children: <Widget>[
      //         _navigationItemListTitle(page1, 0),
      //         _navigationItemListTitle(page2, 1),
      //         // _navigationItemListTitle(page3, 2),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  // Widget _navigationItemListTitle(String title, int index) {
  //   return ListTile(
  //     title: Text(
  //       '$title Page',
  //       style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
  //     ),
  //     onTap: () {
  //       Navigator.pop(context);
  //       _changeTab(index);
  //     },
  //   );
  // }
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

  late List<Donnees> _categories;

  @override
  void initState() {
    _chargeCategories();
    super.initState();
  }

  void _chargeCategories() async {
    _categories = await MySQLDAODonnees.getDonnees();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      //   itemCount: people.length,
      //   itemBuilder: (context, index) {
      //     final Person person = people[index];
      //     return ListTile(
      //       title: Text(person.name),
      //       subtitle: Text(person.surname),
      //       trailing: Text('${person.age} ans'),
      //     );
      //   },
      // ),
      body: _categories == null
          ? const Center(
              child: Text("Chargement en cours..."),
            )
          : ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                for (var idx = 0; idx < _categories.length; idx++)
                  ListTile(
                    title: Text(_categories[idx].nom),
                    subtitle: Text(_categories[idx].prenom),
                    trailing: Text(_categories[idx].id.toString()),
                  )
                //   ListTile(
                //     title: Text(_categories![idx].libelle),
                //     trailing: Icon(Icons.remove_circle,
                //         subtitle: Text(_categories![idx].libelle),
                //         trailing: Text(_categories![idx].libelle),
                //         color: Theme.of(context).primaryColor),
                //     onTap: () {
                //       _showDialogSuppr(_categories![idx]);
                //     },
                // ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Rechercher quelqu\'un...',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Donnees>(
            // ignore: avoid_print
            onQueryUpdate: (s) => print(s),
            items: _categories == null ? [] : _categories,
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
              // person.age.toString(),
            ],
            builder: (person) => ListTile(
              title: Text(person.nom),
              subtitle: Text(person.prenom),
              // trailing: Text('${person.age} ans'),
            ),
          ),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
//   void _showDialogSuppr(Donnees categorieSelectionnee) {
//     showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: const Text('Etes-vous sûr que vous voulez supprimer ?'),
//         content: Text(categorieSelectionnee.libelle),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'Cancel'),
//             child: const Text('ANNULER'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _categories!.remove(categorieSelectionnee);
//               });
//               Navigator.pop(context, 'OK');
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }