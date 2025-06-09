// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timberr/constants.dart';
// import 'package:timberr/models/address.dart';
// import 'package:timberr/screens/input/edit_shipping_screen.dart';

// class AddressCard extends StatelessWidget {
//   final Address address;
//   final int index;
//   final bool isEditable;
//   const AddressCard(
//       {super.key,
//       this.isEditable = true,
//       required this.address,
//       required this.index});

//   void _onEditTap() {
//     Get.to(
//       () => EditShippingScreen(
//         initialAddress: address,
//         index: index,
//       ),
//       transition: Transition.cupertino,
//       duration: const Duration(milliseconds: 600),
//       curve: Curves.easeOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       width: double.infinity,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Image.asset("assets/location.png", height: 32, width: 32),
//           const SizedBox(width: 20),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 address.name,
//                 style: kNunitoSansBold18,
//               ),
//               Text(
//                 address.displayAddress(),
//                 style: kNunitoSans14.copyWith(
//                   color: kGrey,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
