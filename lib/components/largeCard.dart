// import 'package:flutter/material.dart';
// import 'package:incedapp/models/vitimas.dart';

// // ignore: must_be_immutable
// class LargeCard extends StatelessWidget {
//   Vitimas vitima;
//   LargeCard({super.key, required this.vitima});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
//       child: Card(
//         child: InkWell(
//           onTap: () => {print('leu')},
//           child: SizedBox(
//             height: 500,
//             width: double.infinity,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(22)),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 380,
//                     child: Opacity(
//                       opacity: 0.8,
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(0),
//                           bottomRight: Radius.circular(0),
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                         child: Image.asset(
//                           vitima.urlImage,
//                           width: double.infinity,
//                           height: 200,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 120,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding:
//                               EdgeInsetsDirectional.fromSTEB(20, 12, 10, 12),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Nome:',
//                                 style: TextStyle(
//                                     fontFamily: 'Outfit',
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
//                                 child: Text(
//                                   vitima.nomeCompleto,
//                                   style: TextStyle(
//                                       fontFamily: 'Outfit',
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.normal),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
