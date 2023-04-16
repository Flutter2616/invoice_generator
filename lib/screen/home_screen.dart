import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_generator/modalclass/invoice_modal.dart';
int? no;
List<InvoiceModal> invoicelist = [
  InvoiceModal(
      name: "prince",
      number: "9762576567",
      email: "princerawl225@gmail.com",
      img: "assets/logo.png",
      invoicetype: "wholesale",
      add: "surat,amroli,global city"),
];

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'client');
          },
          child: Icon(Icons.add, color: Colors.white, size: 25),
          backgroundColor: Colors.indigo,
        ),
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            leading: Icon(Icons.all_inclusive, color: Colors.white, size: 25),
            title: Text("Invoice Studio",
                style: GoogleFonts.dynaPuff(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500))),
        body: ListView.builder(
          itemBuilder: (context, index) {
           return box(index);
          },
          itemCount: invoicelist.length,
          physics: BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.start,
        ),
      ),
    );
  }

  Widget box(int i) {
    return ExpansionTile(
      title: Text("${invoicelist[i].name}"),
      backgroundColor: Colors.grey.shade200,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("${invoicelist[i].img}"), fit: BoxFit.fill),
            color: Colors.indigo,
            shape: BoxShape.circle),
      ),
      subtitle: Text("${invoicelist[i].invoicetype}"),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("Delete"), Icon(Icons.delete)],
            ),
            onTap: () {},
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("Edit"), Icon(Icons.edit)],
            ),
            onTap: () {},
          ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 100,
                  child: Text(
                    "Shop Name:",
                    style: GoogleFonts.poppins(
                        color: Colors.indigo,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
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
                    "Mobile:",
                    style: GoogleFonts.poppins(
                        color: Colors.indigo,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
              Text(
                "+91 ${invoicelist[i].number}",
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
                "${invoicelist[i].email}",
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
                  width: 300,
                  child: Text(
                    "${invoicelist[i].add}",
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
    );
  }
}
