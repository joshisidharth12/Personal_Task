import 'package:accucia_task/Model/Models.dart';
import 'package:accucia_task/UI/DetailsPage.dart';
import 'package:accucia_task/services/WebService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Model> _model;

  void get() {
    WebServices().getdata().then((value) {
      print("value" + value.categories.length.toString());
    });
  }

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
                  itemCount: snapshot.data.categories.length,
                  itemBuilder: (context, index) {
                    var category = snapshot.data.categories[index];
                    var prodLen = category.products;
                    print(prodLen.length.toString());
                    var products = category.products;
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              category.name,
                              style: GoogleFonts.poppins(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                itemCount: prodLen.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: EdgeInsets.only(
                                          right: 10, top: 20, bottom: 20,left: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailedProds(
                                                        varients:
                                                            products[index]
                                                                .variants,
                                                        ProductName: products[index].name,
                                                        tax: products[index].tax,
                                                      )));
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
                                          child: Text(
                                            products[index].name,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
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
