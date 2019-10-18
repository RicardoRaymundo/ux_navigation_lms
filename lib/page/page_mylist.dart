import 'package:flutter/material.dart';

class PageMyList extends StatefulWidget {
  @override
  _PageMyListState createState() => _PageMyListState();
}

class _PageMyListState extends State<PageMyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //`true` if you want Flutter to automatically add Back Button when needed,
        //or `false` if you want to force your own back button every where
        automaticallyImplyLeading: false,
        title: Text('Minha lista'),
      ),
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.builder(
            itemCount: 11,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: (MediaQuery.of(context).size.width) / (MediaQuery.of(context).size.height - 100),
            ),
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/" + (index + 1).toString() + ".jpg"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                onTap: () {},
              );
            }),
      ),
    );
  }
}
