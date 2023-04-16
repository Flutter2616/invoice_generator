import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController number = TextEditingController();
TextEditingController add = TextEditingController();

var textkey = GlobalKey<FormState>();
String? path;
String? invoicetype;

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: Form(
        key: textkey,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                    onPressed: () {
                      dialog();
                    },
                    icon: Icon(Icons.arrow_back,
                        color: Colors.indigo, size: 30, weight: 200)),
                backgroundColor: Colors.white,
                title: Text(
                  "Client Informatoin",
                  style: GoogleFonts.poppins(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    detail("Full Name", name, TextInputType.name),
                    detail("E-mail", email, TextInputType.emailAddress),
                    detail("phone number", number, TextInputType.phone),
                    detail("Address", add, TextInputType.streetAddress),
                    SizedBox(height: 15),
                    Text("Invoice Type",
                        style: GoogleFonts.poppins(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          child: RadioListTile(
                              value: "wholesale",
                              activeColor: Colors.indigo,
                              groupValue: invoicetype,
                              onChanged: (value) {
                                setState(() {
                                  invoicetype = "wholesale";
                                });
                              },
                              title: Text("Wholesale",
                                  style: GoogleFonts.poppins(
                                      color: Colors.indigo,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                        ),
                        Container(
                          width: 180,
                          child: RadioListTile(
                              value: "Retail",
                              activeColor: Colors.indigo,
                              groupValue: invoicetype,
                              onChanged: (value) {
                                setState(() {
                                  invoicetype = "Retail";
                                });
                              },
                              title: Text("Retails",
                                  style: GoogleFonts.poppins(
                                      color: Colors.indigo,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500))),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text("Profile picture",
                        style: GoogleFonts.poppins(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        return image();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlueAccent),
                        child: path == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/person.jpg",
                                  fit: BoxFit.cover,
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(File("$path"),
                                    fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        if (textkey.currentState!.validate()) {

                          Navigator.pushNamed(context, 'item');
                        }
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.indigo),
                        child: Text("Save Client",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detail(String title, TextEditingController con, TextInputType kbord) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title",
              style: GoogleFonts.poppins(
                  color: Colors.indigo,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          TextFormField(
            controller: con,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter the Details";
              }
            },
            cursorColor: Colors.indigo,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
            keyboardType: kbord,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2)),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2)),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> back() async {
    dialog();
    return await false;
  }

  void dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure to cancel invoice?"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                  child: Text("yes", style: TextStyle(color: Colors.white)),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.indigo)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No", style: TextStyle(color: Colors.indigo)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300)),
            ],
          ),
        );
      },
    );
  }

  void image() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () async {
                    ImagePicker img = ImagePicker();
                    XFile? xfile =
                        await img.pickImage(source: ImageSource.camera);
                    setState(() {
                      path = xfile!.path;
                    });
                  },
                  icon: Icon(Icons.camera_alt, color: Colors.indigo, size: 30)),
              IconButton(
                  onPressed: () async {
                    ImagePicker img = ImagePicker();
                    XFile? xfile =
                        await img.pickImage(source: ImageSource.gallery);
                    setState(() {
                      path = xfile!.path;
                    });
                  },
                  icon: Icon(Icons.image, color: Colors.indigo, size: 30)),
            ],
          ),
        );
      },
    );
  }
}
