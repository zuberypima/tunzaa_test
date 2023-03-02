import 'package:flutter/material.dart';
import 'package:tunzaatest/services/apiService.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController  searched =TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searched,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/1.5,
            child: FutureBuilder(
            future:ShopApiService().searchProduct("clothing"),
          
            builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
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
          ),)
        ],

      ),
      
    );
  }
}
