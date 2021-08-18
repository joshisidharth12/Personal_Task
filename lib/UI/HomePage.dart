import 'package:accucia_task/Model/Models.dart';
import 'package:accucia_task/services/WebService.dart';
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
      appBar: AppBar(
        title: Text(
          "Accucia Shop",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
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
                          Text(
                            category.name,
                            style: GoogleFonts.poppins(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            child: ListView.builder(
                                itemCount: prodLen.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: EdgeInsets.only(right: 20),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrangeAccent,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Center(
                                          child: Text(products[index].name,style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500
                                          ),)));
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
