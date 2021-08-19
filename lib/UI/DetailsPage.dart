import 'package:accucia_task/Model/Models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedProds extends StatelessWidget {
  final List<Variants> varients;
  final String ProductName;
  final Tax tax;

  const DetailedProds({Key key, this.varients, this.ProductName, this.tax})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          color: Colors.blueAccent,
          child: Column(
            children: [
              Container(
                height: 300,
                child: Center(
                  child: Text(
                    ProductName,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17),
                        topRight: Radius.circular(17))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Varients",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: varients.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return VarientTile(
                              colors: varients[index].color.toString() == "Blue"
                                  ? Colors.blue
                                  : varients[index].color.toString() == "Black"
                                      ? Colors.black
                                      : varients[index].color.toString() ==
                                              "Red"
                                          ? Colors.red
                                          : varients[index].color.toString() ==
                                                  "White"
                                              ? Colors.white
                                              : Colors.grey,
                              text: varients[index].price.toString(),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tax",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            tax.name + " : " + tax.value + "%",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}

class VarientTile extends StatelessWidget {
  const VarientTile({
    Key key,
    this.colors,
    this.text,
  }) : super(key: key);

  final Color colors;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: colors,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 3,
                  color: Colors.black.withOpacity(0.2))
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.poppins(
              color: colors == Colors.white ? Colors.black : Colors.white
              ),
        )));
  }
}
