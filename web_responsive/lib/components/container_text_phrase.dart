// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import '../utils/styles/styles.dart';
// import '../utils/utils.dart';
// import '../widgets/widgets.dart';
//
// Future<String> fetchAdvice() async {
//   final response =
//       await http.get(Uri.parse('https://api.adviceslip.com/advice'));
//
//   if (response.statusCode == 200) {
//     final jsonResponse = json.decode(response.body);
//     return jsonResponse['slip']['advice'];
//   } else {
//     throw Exception('Failed to load advice');
//   }
// }
//
// Widget containerTextPhrase(double width) {
//   return Container(
//     color: ColorsStyleUtils.backgroundBlack,
//     height: ConstsUtils.xlSmall,
//     width: width,
//     child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(
//           'www.albertoguaman.com',
//           style: GoogleFonts.badScript(
//             textStyle: TextStyleUtils.textGlobal(
//               color: ColorsStyleUtils.textWhite,
//               fontWeight: FontWeight.bold,
//               fontSize: ConstsUtils.mSmall,
//             ),
//           ),
//           textAlign: TextAlign.center,
//         )
//         // FutureBuilder<String>(
//         //   future: fetchAdvice(),
//         //   builder: (context, snapshot) => CatchErrorBuilder(
//         //     snapshot: snapshot,
//         //     builder: (data) => Text(
//         //       data,
//         //       style: GoogleFonts.badScript(
//         //         textStyle: TextStyleUtils.textGlobal(
//         //           color: ColorsStyleUtils.textWhite,
//         //           fontWeight: FontWeight.bold,
//         //           fontSize: ConstsUtils.mSmall,
//         //         ),
//         //       ),
//         //       textAlign: TextAlign.center,
//         //     ),
//         //   ),
//         // ),
//         ),
//   );
// }
