import 'package:flutter/material.dart';

class RegisterOcurrencyPage extends StatefulWidget {
  const RegisterOcurrencyPage({super.key});

  @override
  State<RegisterOcurrencyPage> createState() => _RegisterOcurrencyPageState();
}

class _RegisterOcurrencyPageState extends State<RegisterOcurrencyPage> {
  DateTime getDate = DateTime.now();
  TimeOfDay getTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F8),
      appBar: AppBar(
        title: const Text('RegisterOcurrency'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 35,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  'Designação',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 35,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  'Local',
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 35,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:
                        Colors.transparent, // Cor do texto do botão
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Borda arredondada
                    ),
                  ),
                  onPressed: () async {
                    final TimeOfDay? time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (time != null) {
                      setState(() {
                        getTime = time;
                      });
                    }
                  },
                  child: Text(
                    '${getTime.hour} - ${getTime.minute}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 35,
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 180),
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Cor do texto do botão
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Borda arredondada
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
                  ),
                ),
              )),
          const Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 35,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  'Designação',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 35,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  'Designação',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
