import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generator/modalclass/invoice_modal.dart';
import 'package:invoice_generator/screen/itemscreen.dart';

class Invoicescreen extends StatefulWidget {
  const Invoicescreen({Key? key}) : super(key: key);

  @override
  State<Invoicescreen> createState() => _InvoicescreenState();
}

class _InvoicescreenState extends State<Invoicescreen> {
  @override
  Widget build(BuildContext context) {
    InvoiceModal i = ModalRoute.of(context)!.settings.arguments as InvoiceModal;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        child: Text(
                      "Invoice",
                      style: TextStyle(color: Colors.white),
                    ))
                  ];
                },
                color: Colors.indigo,
              )
            ],
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: Colors.indigo, size: 25)),
            elevation: 0,
            title: Text("Invoice",
                style: GoogleFonts.poppins(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w700,
                    fontSize: 25))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: RepaintBoundary(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  client("Name", "${i.name}"),
                  SizedBox(height: 20),
                  client("Email", "${i.email}"),
                  SizedBox(height: 20),
                  client("Number", "${i.number}"),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                alignment: Alignment.centerLeft,
                                child: Text("Name",
                                    style: GoogleFonts.poppins(
                                        color: Colors.indigo,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(width: 5),
                              Container(
                                width: 70,
                                alignment: Alignment.center,
                                child: Text("Price",
                                    style: GoogleFonts.poppins(
                                        color: Colors.indigo,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 70,
                                alignment: Alignment.center,
                                child: Text("Quntity",
                                    style: GoogleFonts.poppins(
                                        color: Colors.indigo,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 80,
                                alignment: Alignment.center,
                                child: Text(
                                    i.invoicetype == 'wholesale'
                                        ? "tax"
                                        : "Discount",
                                    style: GoogleFonts.poppins(
                                        color: Colors.indigo,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                          Column(
                            children: i.item!
                                .asMap()
                                .entries
                                .map((e) => listitem(e.key, i))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400, width: 2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Column(
                      children: [
                        client("Subtotal", "${i.subtotal}"),
                        client(i.invoicetype == "wholesale" ? "Tex" : "Discount",
                            "${i.discounttotal}"),
                        Divider(
                            height: 1,
                            thickness: 2,
                            color: Colors.grey.shade400,
                            endIndent: 2,
                            indent: 2),
                        client("Total", "${i.total}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listitem(int index, InvoiceModal i) {
    return Column(
      children: [
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              alignment: Alignment.centerLeft,
              child: Text("${productlist[index].itemname}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              width: 70,
              alignment: Alignment.center,
              child: Text("${productlist[index].price}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              width: 70,
              alignment: Alignment.center,
              child: Text("${productlist[index].quntity}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              width: 70,
              alignment: Alignment.center,
              child: Text(
                  i.invoicetype == 'wholesale'
                      ? "${productlist[index].tex}"
                      : "${productlist[index].discount}",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ],
    );
  }

  Row client(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title",
          style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w400),
        ),
        Text(
          "$subtitle",
          style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.blueGrey.shade900,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
