import 'package:cidadao_activo/components/card.dart';
import 'package:cidadao_activo/components/drawer.dart';
import 'package:cidadao_activo/components/search.dart';
import 'package:cidadao_activo/components/titleArea.dart';
import 'package:cidadao_activo/pages/ocorrency/register_ocorrency.dart';
import 'package:cidadao_activo/utils/variaveis_globals.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F8),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 0, 1, 0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.13,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                50, 10, 10, 0),
                            child: Image.asset(
                              'assets/images/logo2.png',
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.1,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 0, 1, 0),
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x34090F13),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    drawerState();
                                  },
                                  icon: const Icon(Icons.menu_sharp)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 10, 16, 12),
                              child: Text(
                                'PROCURAR OCORRÊNCIAS',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 20,
                                  color: Color(0xFF0F1113),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SearchForm(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                35, 8, 20, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterOcurrencyPage(),
                                        ),
                                      ),
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              2, 0, 2, 0),
                                      backgroundColor: const Color(0xFF81E1D7),
                                      fixedSize: const Size(250, 65),
                                    ),
                                    child: const Text(
                                      'Registrar Ocorrência',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Outfit',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //          ListAcidentPage(),
                                      //   ),
                                      // )
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(2, 0, 0, 0),
                                        backgroundColor:
                                            const Color(0xFFF1B49B),
                                        fixedSize: const Size(250, 65)),
                                    child: const Text(
                                      'Ocorrências',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Outfit',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const TitleArea(
                      titulo: 'Imagem de algumas ocorrências',
                      font: 'Outfit',
                      fontWeight: FontWeight.bold,
                      fontSizes: 22,
                      color: Color(0xFF0F1113),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 12, 0, 12),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardComponet(
                                img: 'assets/images/acidente.jpg',
                              ),
                              CardComponet(
                                img: 'assets/images/acidente1.jpg',
                              ),
                              CardComponet(
                                img: 'assets/images/ACIDENTE-1.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const TitleArea(
                      titulo: 'Video de algumas ocorrências',
                      font: 'Outfit',
                      fontWeight: FontWeight.bold,
                      fontSizes: 24,
                      color: Color(0xFF0F1113),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 12, 0, 12),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardComponet(
                                img: 'assets/images/acidente.jpg',
                              ),
                              CardComponet(
                                img: 'assets/images/acidente1.jpg',
                              ),
                              CardComponet(
                                img: 'assets/images/ACIDENTE-1.jpg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                (drawerShow) ? const DrawerComponent() : Container(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contacto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void drawerState() {
    setState(() {
      drawerShow = !drawerShow;
    });
  }
}
