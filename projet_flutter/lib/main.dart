import 'package:flutter/material.dart';
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
const String page3 = "Rechercher";
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
  late Widget _page2;
  // late Widget _page3;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _page1 = const Page1();
    _page2 = const Page2();
    // _page3 = Page3(changePage: _changeTab);
    _pages = [_page1, _page2];
    _currentIndex = 0;
    _currentPage = _page1;
  }

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
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              _navigationItemListTitle(page1, 0),
              _navigationItemListTitle(page2, 1),
              // _navigationItemListTitle(page3, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
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

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  static List<Person> people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final Person person = people[index];
          return ListTile(
            title: Text(person.name),
            subtitle: Text(person.surname),
            trailing: Text('${person.age} yo'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search people',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Person>(
            onQueryUpdate: (s) => print(s),
            items: people,
            searchLabel: 'Search people',
            suggestion: Center(
              child: Text('Filter people by name, surname or age'),
            ),
            failure: Center(
              child: Text('No person found :('),
            ),
            filter: (person) => [
              person.name,
              person.surname,
              person.age.toString(),
            ],
            builder: (person) => ListTile(
              title: Text(person.name),
              subtitle: Text(person.surname),
              trailing: Text('${person.age} yo'),
            ),
          ),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}

// class Page3 extends StatelessWidget {
//   const Page3({Key? key, required this.changePage}) : super(key: key);
//   final void Function(int) changePage;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('$page3 Page', style: Theme.of(context).textTheme.headline6),
//           ElevatedButton(
//             onPressed: () => changePage(0),
//             child: const Text('Switch to Home Page'),
//           )
//         ],
//       ),
//     );
//   }
// }
