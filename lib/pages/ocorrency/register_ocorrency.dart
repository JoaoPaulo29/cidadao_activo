import 'dart:io';

import 'package:cidadao_activo/models/ocurrency_model.dart';
import 'package:cidadao_activo/models/user_model.dart';
import 'package:cidadao_activo/pages/home.dart';
import 'package:cidadao_activo/service/authentication.dart';
import 'package:cidadao_activo/service/ocurrency.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class RegisterOcurrencyPage extends StatefulWidget {
  const RegisterOcurrencyPage({super.key});

  @override
  State<RegisterOcurrencyPage> createState() => _RegisterOcurrencyPageState();
}

class _RegisterOcurrencyPageState extends State<RegisterOcurrencyPage> {
  DateTime getDate = DateTime.now();
  TimeOfDay getTime = TimeOfDay.now();

  TextEditingController designationController = TextEditingController();
  TextEditingController localController = TextEditingController();
  TextEditingController descritionController = TextEditingController();
  AuthenticationService service = AuthenticationService();
  late String hora;
  OcorrencyService ocorrencyService = OcorrencyService();

  bool alert = false;

  @override
  void initState() {
    // TODO: implement initState
    hora = "${getTime.hour} - ${getTime.minute}";
    super.initState();
  }

  var uuid = const Uuid();
  File? _file;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF81E1D7),
        title: const Text(
          'RegisterOcurrency',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                          child: Image.asset(
                            'assets/images/logo2.png',
                            width: MediaQuery.of(context).size.width * 0.32,
                            height: MediaQuery.of(context).size.height * 0.12,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 35,
                          ),
                          child: TextField(
                            controller: designationController,
                            decoration: const InputDecoration(
                              label: Text(
                                'Designação',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 35,
                          ),
                          child: TextField(
                            controller: localController,
                            decoration: const InputDecoration(
                              label: Text(
                                'Local',
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                              ),
                              child: SizedBox(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors
                                        .transparent, // Cor do texto do botão
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      side: const BorderSide(),
                                    ),
                                  ),
                                  onPressed: () async {
                                    final TimeOfDay? time =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                    if (time != null) {
                                      setState(() {
                                        getTime = time;
                                        hora =
                                            "${getTime.hour} - ${getTime.minute}";
                                      });
                                    }
                                  },
                                  child: Text(
                                    hora,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                              ),
                              child: SizedBox(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors
                                        .transparent, // Cor do texto do botão
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      side: const BorderSide(),
                                    ),
                                  ),
                                  onPressed: () async {
                                    final DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: getDate,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(3000));
                                    if (date != null) {
                                      setState(() {
                                        getDate = date;
                                      });
                                    }
                                  },
                                  child: Text(
                                    '${getDate.year} - ${getDate.month}- ${getDate.day}',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 35,
                          ),
                          child: TextFormField(
                            controller: descritionController,
                            minLines: 2,
                            maxLines: 6,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: 'Descrição',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 35,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ElevatedButton(
                              onPressed: () {
                                selectFile();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 58, 65, 65),
                              ),
                              child: const Text(
                                'Seleciona a foto',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 35,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  alert = true;
                                  _registerSubmit();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF81E1D7),
                              ),
                              child: const Text(
                                'REGISTAR',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // (alert == true)
              //     ? Positioned(
              //         bottom: 0,
              //         child: Container(
              //           height: 200,
              //           width: MediaQuery.of(context).size.width,
              //           decoration: BoxDecoration(
              //               color: Colors.amber,
              //               border: const Border(
              //                 top: BorderSide(
              //                   color: Colors.black,
              //                   width: 2,
              //                 ),
              //               ),
              //               borderRadius: BorderRadius.circular(20)),
              //         ),
              //       )
              //     : Container(),
            ],
          ),
        ),
      ),
    );
  }
 

  Future selectFile() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _file = File(pickedFile.path);
        } else {
          print('No file selected.');
        }
      });
    } catch (e) {
      print(e);
      print('\noggg');
    }
  }

  _registerSubmit() async {
    String description = descritionController.text;
    String designation = designationController.text;
    String local = localController.text;
    UserModel userModel = await service.getCurrentUser();
    String id = uuid.v4().toString();
    String? fotoUrl;

    if (_file != null) {
      fotoUrl = await ocorrencyService.uploadFoto(_file!, id);
    }

    // Verifique se todos os campos obrigatórios estão preenchidos
    if (description.isNotEmpty &&
        designation.isNotEmpty &&
        local.isNotEmpty &&
        _file != null) {
      OcurrencyModel currencyModel = OcurrencyModel(
        id: id,
        description: description,
        designation: designation,
        local: local,
        hora: hora, // Certifique-se de que getTime retorne TimeOfDay
        data: getDate, // Certifique-se de que getDate retorne DateTime
        foto: fotoUrl,
        user: userModel,
      );

      bool cadastrado = await ocorrencyService.register(currencyModel);

      if (cadastrado == true) {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        print('Erro ao cadastrar ocorrência');
      }
    } else {
      print('Por favor, preencha todos os campos obrigatórios.');
    }
  }
}
