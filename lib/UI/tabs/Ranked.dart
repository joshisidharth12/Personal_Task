import 'package:accucia_task/Model/Models.dart';
import 'package:accucia_task/UI/DetailsPage.dart';
import 'package:accucia_task/services/WebService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RankedList extends StatefulWidget {
  @override
  _RankedListState createState() => _RankedListState();
}

class _RankedListState extends State<RankedList> {
  Future<Model> _model;

  @override
  void initState() {
    // TODO: implement initState
    _model = WebServices().getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<Model>(
          future: _model,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.rankings.length,
                  itemBuilder: (context, index) {


                    var ranked = snapshot.data.rankings[index];
                    var products = ranked.products;
                    var prodLength = ranked.products;
                   /* List<int> MostViewed;
                    for(int i=0 ; i<prodLength.length;i++){
                      MostViewed.add(ranked.ranking.toString() ==
                          "Most Viewed Products"
                          ? products[index]
                          .viewCount
                          : ranked.ranking.toString() ==
                          "Most OrdeRed Products"
                          ? products[index]
                          .orderCount

                          : ranked.ranking
                          .toString() ==
                          "Most ShaRed Products"
                          ? products[index]
                          .shares
                          : 0,);
                    }*/

                    //print(MostViewed);

                    print(prodLength.length);
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              ranked.ranking,
                              style: GoogleFonts.poppins(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                itemCount: prodLength.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: EdgeInsets.only(
                                          right: 10, top: 20, bottom: 20,left: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          /*Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailedProds(
                                                        varients:
                                                        products[index].,
                                                        ProductName: products[index].name,
                                                        tax: products[index].tax,
                                                      )));*/
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.deepOrange,
                                            elevation: 3,
                                            shadowColor: Colors.deepOrange
                                                .withOpacity(0.3),
                                            padding: EdgeInsets.all(7),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Icon(
                                                ranked.ranking.toString() ==
                                                    "Most Viewed Products"
                                                    ? Icons.remove_red_eye
                                                    : ranked.ranking.toString() ==
                                                    "Most OrdeRed Products"
                                                    ? Icons.account_box
                                                    : ranked.ranking
                                                    .toString() ==
                                                    "Most ShaRed Products"
                                                    ? Icons.share
                                                    : "nothing",
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                ranked.ranking.toString() ==
                                                        "Most Viewed Products"
                                                    ? products[index]
                                                        .viewCount
                                                        .toString()
                                                    : ranked.ranking.toString() ==
                                                            "Most OrdeRed Products"
                                                        ? products[index]
                                                            .orderCount
                                                            .toString()
                                                        : ranked.ranking
                                                                    .toString() ==
                                                                "Most ShaRed Products"
                                                            ? products[index]
                                                                .shares
                                                                .toString()
                                                            : "nothing",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
