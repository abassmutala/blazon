import 'package:blazon/constants/app_colors.dart';
import 'package:blazon/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Search'),
      ),
      body: ListView(
        padding: kTabLabelPadding.add(kMaterialListPadding),
        children: [
          InkWell(
            onTap: () {
              showSearch(
                context: context,
                delegate: MovieSearch(
                  hintText: 'Search...'
                ),
              );
            },
            child: Container(
              height: 45.0,
              width: screenWidth,
              // constraints: BoxConstraints(
              //   maxWidth: 360.0,
              // ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                    color: AppColors.acentColour!,
                  )

                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey, offset: Offset(0.0, 1.5), blurRadius: 1.5)
                  // ],
                  ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Ionicons.search_outline,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Search...',
                    style: buttonText(context)!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            // decoration: InputDecoration(
            //   hintText: 'Search...',
            //   filled: true,
            //   border: OutlineInputBorder(),
            //   isDense: true,
            //   prefixIcon: Icon(Ionicons.search_outline),
            // ),
          )
        ],
      ),
    );
  }
}

class MovieSearch extends SearchDelegate {
  MovieSearch({
    required String hintText,
  }): super(searchFieldLabel: hintText,);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Ionicons.close_outline),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isNotEmpty
        ? ListTile(
            title: Text(query),
          )
        : Container();
  }
}
