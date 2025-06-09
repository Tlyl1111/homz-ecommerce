// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timberr/constants.dart';
// import 'package:timberr/models/product.dart';
// import 'package:timberr/services/search_service.dart';
// import 'package:timberr/widgets/tiles/product_list_tile.dart';

// class ProductSearchDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       if (query.isNotEmpty)
//         IconButton(
//           onPressed: () {
//             query = "";
//           },
//           icon: const Icon(Icons.clear),
//         ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         Get.back();
//       },
//       icon: const Icon(Icons.arrow_back_ios),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return FutureBuilder(
//       future: SearchService().searchProduct(query),
//       builder: (context, snapshot) {
//         List responseList;
//         if (snapshot.connectionState == ConnectionState.done) {
//           try {
//             responseList = snapshot.data as List;
//             if (responseList.isEmpty) {
//               return Center(
//                 child: Text(
//                   "No Matching Products Found 🥺",
//                   style: kNunitoSans16.copyWith(
//                     color: kGrey,
//                   ),
//                 ),
//               );
//             } else {
//               List<Product> productList = responseList
//                   .map((productResponse) => Product.fromJson(productResponse))
//                   .toList();
//               return ListView.separated(
//                 physics: const BouncingScrollPhysics(),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
//                 itemCount: productList.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index == 0) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 16),
//                       child: Row(
//                         children: [
//                           Text(
//                             "Results for \"$query\"",
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: "Poppins",
//                             ),
//                           ),
//                           const Spacer(),
//                           Text(
//                             "${productList.length} results found",
//                             style: const TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Poppins",
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                   return ProductListTile(
//                     product: productList[index - 1],
//                     heroMode: false,
//                   );
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return const SizedBox(height: 16);
//                 },
//               );
//             }
//           } catch (e) {
//             //in case no response is received
//           }
//         } else if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(
//               color: kOffBlack,
//             ),
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return const SizedBox();
//   }
// }
