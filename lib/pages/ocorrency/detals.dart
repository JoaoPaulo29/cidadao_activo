import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetalsOcurrencyPage extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
  const DetalsOcurrencyPage({super.key, required this.data});

  @override
  State<DetalsOcurrencyPage> createState() => _DetalsOcurrencyPageState();
}

class _DetalsOcurrencyPageState extends State<DetalsOcurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetalsOcurrency'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.height * 0.03,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Image.asset(
                widget.data['foto'],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Text(
                  'Designação:',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
