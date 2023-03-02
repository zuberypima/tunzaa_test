import 'package:flutter/material.dart';
import 'package:tunzaatest/core/extensions/app_extensions.dart';
import 'package:tunzaatest/features/home/viewmodel/home_view_model.dart';
import 'package:tunzaatest/features/home/viewmodel/searchmodel.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  void initState() {
    HomeViewModel();
  }

  State<SearchView> createState() => _SearchViewState();
}

// String? searchedValue;
TextEditingController searchedValue = TextEditingController();

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.primaryColor,
        title: const Text('Search product'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchedValue,
              onSubmitted: (value) {
                // HomeViewModel().searchItems(searchedValue.text);
                // ShopApiService().searchProduct(searchedValue.text);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                icon: Icon(
                  Icons.search,
                  color: context.primaryColor,
                ),
              ),
            ),
          ),
          Container(
            height: 600,
            child:searchedValue.text==null? Text('no item'): FutureBuilder(
              future: ShopApiService().searchProduct(searchedValue.text),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(snapshot.data[index]['title']),
                      );
                    },
                  );
                }
                return Text("No data");
              },
            ),
          ),
        ],
      ),
    );
  }
}
