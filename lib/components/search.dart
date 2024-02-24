import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  TextEditingController searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 20, 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.height * 0.08,
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
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 1, 0),
              child: TextField(
                controller: searchText,
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                  label: Text('Procurar'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 1, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.135,
              height: MediaQuery.of(context).size.height * 0.08,
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
                  onPressed: () => {print(searchText.text)},
                  icon: const Icon(Icons.search_sharp)),
            ),
          ),
        ],
      ),
    );
  }
}
