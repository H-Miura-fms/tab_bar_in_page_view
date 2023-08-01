import 'package:flutter/material.dart';
import 'package:tab_bar_in_page_view/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedIndex = 1;

  final List<Tab> tabs = <Tab>[
    const Tab(
      text: 'One',
    ),
    const Tab(
      text: "Two",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final List<Widget> _pages = [
    const Center(
      child: Text("0"),
    ),
  ];

  void _onPageChanged(int index) {
    print("pre$_selectedIndex, $index");
    print(_pages);
    if (_selectedIndex > index && _pages.length != 1) return;
    print("to left");
    if (index == _pages.length - 1)
      _pages.add(DetailScreen(index: _pages.length));
    setState(() {
      _selectedIndex = index;
    });
    print(_pages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tab bar test"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          DefaultTabController(
            length: 2,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size(double.infinity, 40.0),
                  child: Container(
                    color: const Color.fromARGB(255, 221, 221, 221),
                    child: const TabBar(
                        labelColor: Color.fromARGB(255, 0, 0, 0),
                        tabs: [
                          Tab(
                            text: "A",
                          ),
                          Tab(
                            text: "B",
                          )
                        ]),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: PageView(
                          reverse: true,
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          children: _pages,
                        ),
                      ),
                      const Center(
                        child: Text("B"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 133, 133, 133),
            //height: 500,

            child: const Center(
              child: Column(
                children: [
                  Text("space"),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
