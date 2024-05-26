// import 'package:flutter/material.dart';
// import 'package:mlk/products/domaine/entities/one_product.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _textController = TextEditingController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final ScrollController _scrollController = ScrollController();
//   List<OneProduct> _allLogList = [];
//   List<OneProduct> _filteredList = [];

//   @override
//   void initState() {
//     super.initState();
//     // Fetching the data from firestore
//     Collection<SpendingLog>(path: "spending-log").getData().then((value) {
//       setState(() {
//         _allLogList = value;
//         _allLogList.sort((a, b) => b.date.compareTo(a.date));
//         _filteredList = _allLogList;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//   void _filterLogListBySearchText(String searchText) {
//     setState(() {
//       _filteredList = _allLogList
//           .where((product) =>
//               product.title!.toLowerCase().contains(searchText.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Container(
//           height: 40,
//           decoration: BoxDecoration(
//               color: const Color(0xffF5F5F5),
//               borderRadius: BorderRadius.circular(5)),
//           child: TextField(
//             controller: _textController,
//             decoration: InputDecoration(
//               prefixIcon: IconButton(
//                 icon: Icon(
//                   Icons.search_rounded,
//                   color: Theme.of(context).primaryColorDark,
//                 ),
//                 onPressed: () => FocusScope.of(context).unfocus(),
//               ),
//               suffixIcon: IconButton(
//                   icon: Icon(
//                     Icons.clear_rounded,
//                     color: Theme.of(context).primaryColorDark,
//                   ),
//                   onPressed: () {
//                     _textController.text = "";
//                     _filterLogListBySearchText("");
//                   }),
//               hintText: 'Search...',
//               border: InputBorder.none,
//             ),
//             onChanged: (value) => _filterLogListBySearchText(value),
//             onSubmitted: (value) => _filterLogListBySearchText(value),
//           ),
//         ),
//         iconTheme: IconThemeData(
//           color: Theme.of(context).primaryColorDark,
//         ),
//         backgroundColor: Theme.of(context).backgroundColor,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(
//           screenSize.height * 0.05,
//           screenSize.height * 0.1,
//           screenSize.height * 0.05,
//           0,
//         ),
//         child: ListView.builder(
//           physics: const AlwaysScrollableScrollPhysics(),
//           controller: _scrollController,
//           itemCount: _filteredList.length,
//           shrinkWrap: true,
//           padding: const EdgeInsets.only(bottom: 10),
//           itemBuilder: (BuildContext context, int index) {
//             // I omit the part to build card items from the list
//           },
//         ),
//       ),
//     );
//   }
// }