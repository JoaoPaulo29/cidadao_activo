import 'package:cidadao_activo/pages/ocorrency/detals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowOcorrencyPage extends StatefulWidget {
  const ShowOcorrencyPage({super.key});

  @override
  State<ShowOcorrencyPage> createState() => _ShowOcorrencyPageState();
}

class _ShowOcorrencyPageState extends State<ShowOcorrencyPage> {
  bool showFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  showFilter = !showFilter;
                });
              },
              icon: const Icon(
                Icons.filter_alt,
                color: Colors.white,
              )),
        ],
        backgroundColor: const Color(0xFF81E1D7),
        title: const Text(
          'Listar Ocorreências',
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
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('ocorrencies')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Erro ao carregar os dados do Firestore'),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalsOcurrencyPage(
                                  data: data,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.20,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF1F5F8),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black54,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Image.asset(
                                        data['foto'],
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.32,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, left: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Designação:'.toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                data['designation']
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Outfit',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 1.0, left: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Local:'.toUpperCase(),
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                data['local'].toUpperCase(),
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Outfit',
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0, left: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Data:'.toUpperCase(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Outfit',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${data['data'].toDate().day}/${data['data'].toDate().month}/${data['data'].toDate().year}',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Outfit',
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0, left: 4),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'hora:'.toUpperCase(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Outfit',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Text(
                                                    data['hora'].toUpperCase(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Outfit',
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
              (showFilter)
                  ? Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.amber,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
