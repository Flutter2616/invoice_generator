import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generator/modalclass/invoice_modal.dart';
import 'package:invoice_generator/modalclass/item_modal.dart';
import 'package:invoice_generator/screen/home_screen.dart';

import 'client_data_screen.dart';

List<Itemmodal> productlist = [
  Itemmodal(
      itemname: "prince", tex: "2", quntity: "2", discount: "2", price: "27"),
];
num? subtotal = 0, total = 0, discounttotal = 0;

// String kaushik='';
class Itemscreen extends StatefulWidget {
  const Itemscreen({Key? key}) : super(key: key);

  @override
  State<Itemscreen> createState() => _ItemscreenState();
}

class _ItemscreenState extends State<Itemscreen> {
  TextEditingController itemname = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quntity = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController tax = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,
                    color: Colors.indigo, size: 30, weight: 200)),
            backgroundColor: Colors.white,
            title: Text(
              "Product Informatoin",
              style: GoogleFonts.poppins(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 15),
              Expanded(
                child: FloatingActionButton.extended(
                    onPressed: () {
                      return dailog();
                    },
                    label: Text(
                      "Add Item",
                    ),
                    backgroundColor: Colors.indigo),
              ),
              SizedBox(width: 15),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      subtotal=0;
                      discounttotal=0;
                      for(int i=0;i<productlist.length;i++)
                        {
                          subtotal=subtotal!+(num.parse("${productlist[i].price}")*num.parse("${productlist[i].quntity}"));
                        }
                      // for(int i=0;i<productlist.length;i++)
                      //   {
                      //     discounttotal=discounttotal!+num.parse("${productlist[i].discount}");
                      //   }
                    });
                    InvoiceModal i = InvoiceModal(
                        total: total,
                        discounttotal: discounttotal,
                        subtotal: subtotal,
                        item: productlist,
                        invoicetype: invoicetype,
                        email: email.text,
                        number: number.text,
                        img: path,
                        name: name.text,
                        add: add.text);
                    Navigator.pushNamed(context, 'invoice', arguments: i);
                  },
                  child: Container(
                      width: 100,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          border: Border.all(color: Colors.indigo, width: 2)),
                      child: Text(
                        "Create Invoice",
                        style: GoogleFonts.poppins(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text("Client",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.indigo)),
              ExpansionTile(
                title: Text("${name.text}"),
                backgroundColor: Colors.grey.shade200,
                leading: path == null
                    ? Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/person.jpg"),
                                fit: BoxFit.fill),
                            color: Colors.indigo,
                            shape: BoxShape.circle),
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(File("${path}")),
                                fit: BoxFit.fill),
                            color: Colors.indigo,
                            shape: BoxShape.circle),
                      ),
                subtitle: Text("${invoicetype}"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 100,
                            child: Text(
                              "Mobile:",
                              style: GoogleFonts.poppins(
                                  color: Colors.indigo,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )),
                        Text(
                          "+91 ${number.text}",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 100,
                            child: Text(
                              "Email:",
                              style: GoogleFonts.poppins(
                                  color: Colors.indigo,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )),
                        Text(
                          "${email.text}",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 100,
                            child: Text(
                              "Address:",
                              style: GoogleFonts.poppins(
                                  color: Colors.indigo,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )),
                        Container(
                            width: 250,
                            child: Text(
                              "${add.text}",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  )
                ],
                tilePadding: EdgeInsets.all(3),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.indigo)),
                  Spacer(),
                  Text("Price",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.indigo)),
                  SizedBox(width: 15),
                  Text("Quntity",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.indigo)),
                  SizedBox(width: 8),
                  invoicetype == 'wholesale'
                      ? Text("Tax",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.indigo))
                      : Text("Discount",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.indigo)),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return detail(productlist[index]);
                    },
                    itemCount: productlist.length,
                    padding: EdgeInsets.symmetric(vertical: 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row detail(Itemmodal p) {
    return Row(
      children: [
        Container(
            width: 110,
            alignment: Alignment.centerLeft,
            child: Text(
              "${p.itemname}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            )),
        Spacer(),
        Container(
            width: 70,
            alignment: Alignment.centerRight,
            child: Text(
              "${p.price}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            )),
        SizedBox(width: 10),
        Container(
            width: 80,
            alignment: Alignment.centerRight,
            child: Text(
              "${p.quntity}",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            )),
        SizedBox(width: 10),
        invoicetype == "wholesale"
            ? Container(
                width: 80,
                alignment: Alignment.centerRight,
                child: Text(
                  "${p.discount}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ))
            : Container(
                width: 80,
                alignment: Alignment.centerRight,
                child: Text(
                  "${p.tex}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )),
      ],
    );
  }

  void dailog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ITEM DETAILS",
                  style: GoogleFonts.poppins(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close,
                      size: 25, color: Colors.indigo, weight: 500))
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: itemname,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    label: Text("Item Name"),
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: price,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    label: Text("Item Price"),
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: quntity,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    label: Text("Item Quntity"),
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: invoicetype == 'wholesale' ? discount : tax,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    label: invoicetype == 'wholesale'
                        ? Text("Tax")
                        : Text("Discount"),
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    Itemmodal p = Itemmodal(
                        tex: tax.text,
                        quntity: quntity.text,
                        discount: discount.text,
                        price: price.text,
                        itemname: itemname.text);
                    productlist.add(p);
                    tax.text = '';
                    price.text = '';
                    discount.text = '';
                    quntity.text = '';
                    itemname.text = '';
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.indigo),
                  child: Text("Add Item",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
