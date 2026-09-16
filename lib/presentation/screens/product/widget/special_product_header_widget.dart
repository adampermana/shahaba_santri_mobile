// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

// class SpecialProductHeader extends StatelessWidget {
//   const SpecialProductHeader({required this.child, super.key});

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.fromSize(
//       size: const Size.fromHeight(202),
//       child: ColoredBox(
//         color: ColorPalette.kPurple800,
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 60, 20, 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       context.pop();
//                     },
//                     child: const Row(
//                       children: [
//                         Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.white,
//                           size: 18,
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           'Kembali',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               child,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
