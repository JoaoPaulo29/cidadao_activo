import 'package:cidadao_activo/service/authentication.dart';
import 'package:cidadao_activo/utils/variaveis_globals.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  final AuthenticationService _authenticationService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            drawerState();
            print(drawerShow);
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.78,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.125,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F8),
            border: Border.all(
              width: 2, // Largura da borda
              color: Colors.black45,
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  'MENU',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black45,
                      width: 1,
                    ),
                    top: BorderSide(
                      color: Colors.black45,
                      width: 2,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Registar Ocorrências'.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 13,
                      color: Color(0xFF0F1113),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black45,
                      width: 1,
                    ),
                    top: BorderSide(
                      color: Colors.black45,
                      width: 2,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Listar Ocorrências'.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 14,
                      color: Color(0xFF0F1113),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1B49B),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black45,
                      width: 2,
                    ),
                    top: BorderSide(
                      color: Colors.black45,
                      width: 1,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    logout();
                  },
                  child: const Text(
                    'LOGOUT',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void drawerState() {
    setState(() {
      drawerShow = !drawerShow;
    });
  }

  void logout() async {
    await _authenticationService.logOut();
  }
}
