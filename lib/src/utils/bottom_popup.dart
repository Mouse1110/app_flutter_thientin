// import 'package:app_flutter_thientin/src/login/models/user_local.dart';
// import 'package:flutter/material.dart';

// class BottomPopupUser {
//   static Future<void> show(
//     BuildContext context, {
//     required List<UserLocal> user,
//     required Function accept,
//   }) async {
//     return showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           color: Colors.white,
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const Text('Danh sách tài khoản'),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Column(
//                   children: user
//                       .map((e) => Column(
//                             children: [
//                               TextButton(
//                                   onPressed: () {
//                                     accept(e);
//                                     Navigator.pop(context);
//                                   },
//                                   child: Text(e.phone)),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                             ],
//                           ))
//                       .toList(),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
