import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:sago_user/widgets/nameconvenstion/adapt_string_tamil.dart';

class calcListView extends StatelessWidget {
  final String name;
  final String serialNumber;
  final String tansportNumber;
  final String datePick;
  final String firstW;
  final String secondW;
  final String approxW;
  final String sandWPer;
  final String sandWaste;
  final String totalW;
  final String point;
  final String pointrate;
  final String tonprice;
  final String box1;
  final String labourprice;
  final String box2;
  final String travellPrice;
  final String foods;
  final String advances;
  final String totalWeight;

  calcListView({
    super.key,
    required this.name,
    required this.serialNumber,
    required this.tansportNumber,
    required this.datePick,
    required this.firstW,
    required this.secondW,
    required this.approxW,
    required this.sandWPer,
    required this.sandWaste,
    required this.totalW,
    required this.point,
    required this.pointrate,
    required this.tonprice,
    required this.box1,
    required this.labourprice,
    required this.box2,
    required this.travellPrice,
    required this.foods,
    required this.advances,
    required this.totalWeight,
  });

  @override
  Widget build(BuildContext context) {
    void createPdf() async {
      String path = 'assets/custom_Anand_MuktaMalar.ttf';
      pw.Font? tamilFont = pw.Font.ttf(await rootBundle.load(path));
      final doc = pw.Document();

      // return PdfPreview(
      //           maxPageWidth: 700,
      //           build: (format) async => await generatePDF(format),
      //           allowPrinting: true,
      //           allowSharing: true,
      //         );
      //       }),
      // );
      doc.addPage(
        pw.Page(
            theme:
                pw.ThemeData(defaultTextStyle: pw.TextStyle(font: tamilFont)),
            // pageFormat: PdfPageFormat.a4,
            // maxPageWidth
            build: (pw.Context context) {
              return pw.SizedBox(
                // height: 540.47244094,
                // width: 377.95275591,
                child: pw.Container(
                  child: pw.Column(
                    children: [
                      pw.Container(
                          color: PdfColors.grey100,
                          // child: pw.Image(memoryImage),
                          // child: pw.Text('Sago',
                          //     textAlign: pw.TextAlign.center,
                          //     style: const pw.TextStyle(fontSize: 17)
                          //     ),
                          width: double.infinity,
                          alignment: pw.Alignment.center),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'திரு : $name'.toPrintPdf,
                              style: const pw.TextStyle(
                                color: PdfColors.red,
                                // FontWeight.bold
                                //fontWeight: pw.FontWeight.bold
                                fontSize: 23,
                              ),
                            ),
                            pw.Text(
                              serialNumber,
                              // namePerson.text,
                              style: pw.TextStyle(
                                  fontSize: 23,
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ]),
                      pw.SizedBox(height: 5),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'வாகன எண்: $tansportNumber '.toPrintPdf,
                              style: pw.TextStyle(
                                fontSize: 23,
                                color: PdfColors.red,
                              ),
                            ),
                            pw.Text(
                              'தேதி: $datePick'.toPrintPdf,
                              style: pw.TextStyle(
                                fontSize: 23,
                                color: PdfColors.red,
                              ),
                            ),
                            // pw.Text('9/2/2022'),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Divider(
                        color: PdfColors.black,
                      ),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'முதல் எடை '.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 21, color: PdfColors.indigo900),
                            ),
                            pw.Text(
                              "${firstW}",
                              style: pw.TextStyle(fontSize: 21),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'இரண்டாம் எடை'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 21, color: PdfColors.indigo900),
                            ),
                            pw.Text(
                              "${secondW}",
                              style: pw.TextStyle(fontSize: 21),
                            ),
                          ]),
                      // pw.SizedBox(height: 1),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'நிகர எடை'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 21, color: PdfColors.red),
                            ),
                            pw.Text(
                              "${approxW}",
                              style: pw.TextStyle(
                                  fontSize: 21,
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ]),
                      pw.SizedBox(height: 2),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'மண் கழிவு சதவீதம்'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.indigo900),
                            ),
                            pw.Text(
                              "${sandWPer}" '%',
                              style: pw.TextStyle(fontSize: 20),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'மண் கழிவு'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.indigo900),
                            ),
                            pw.Text(
                              "${sandWaste}",
                              style: pw.TextStyle(fontSize: 20),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'மொத்த எடை'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.red),
                            ),
                            pw.Text(
                              "${totalW}",
                              style: pw.TextStyle(
                                  fontSize: 20,
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ]),
                      pw.SizedBox(height: 2),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'பாயிண்ட் '.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.green900),
                            ),
                            pw.Text(
                              "${point}",
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.green900),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'பாயிண்ட் விலை'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.green900),
                            ),
                            pw.Text(
                              "${pointrate}",
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.green900),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'ஒரு டன்னிற்க்கான விலை'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.green900),
                            ),
                            pw.Text(
                              "${tonprice}",
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.green900),
                            ),
                          ]),
                      pw.SizedBox(height: 2),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'பட்டியல் 1 '.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.red),
                            ),
                            pw.Text(
                              "${box1}",
                              style: pw.TextStyle(
                                  fontSize: 20,
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'இறக்கு கூலி'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.indigo900),
                            ),
                            pw.Text(
                              "${labourprice}",
                              style: pw.TextStyle(fontSize: 20),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'பட்டியல் 2'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.red),
                            ),
                            pw.Text(
                              "${box2}",
                              style: pw.TextStyle(
                                  fontSize: 20,
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ]),
                      // pw.SizedBox(height: 1),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'வாடகை + வெட்டுக்கூலி'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.indigo900),
                            ),
                            pw.Text(
                              "${travellPrice}",
                              style: pw.TextStyle(fontSize: 20),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'இதர செலவுகள்'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.indigo900),
                            ),
                            pw.Text(
                              "${foods}",
                              style: pw.TextStyle(fontSize: 20),
                            ),
                          ]),
                      // pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'அட்வான்ஸ்'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.indigo900),
                            ),
                            pw.Text(
                              advances,
                              style: pw.TextStyle(fontSize: 20),
                            ),
                          ]),
                      pw.SizedBox(height: 4),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'மொத்த பட்டியல் தொகை'.toPrintPdf,
                              style: pw.TextStyle(
                                  fontSize: 20, color: PdfColors.red),
                            ),
                            pw.Divider(
                              color: PdfColors.black,
                            ),
                            pw.Text(
                              "${totalWeight}",
                              style: pw.TextStyle(
                                  decoration: pw.TextDecoration.underline,
                                  fontSize: 22,
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ]),
                      pw.SizedBox(height: 10),
                      pw.Divider(
                        color: PdfColors.black,
                      ),
                      pw.SizedBox(
                        // height: 60,
                        // width: 400,
                        child: pw.Center(
                          child: pw.Container(
                              color: PdfColors.grey300,
                              child: pw.Text("SERAN TRADERS ",
                                  textAlign: pw.TextAlign.center,
                                  style: const pw.TextStyle(
                                      color: PdfColors.black, fontSize: 16)),
                              width: double.infinity,
                              alignment: pw.Alignment.center),
                        ),
                      ),
                      pw.Center(
                        child: pw.Container(
                            color: PdfColors.grey300,
                            child: pw.Text(
                                "6/324, RJ BUILDING VADACHENNIMALAI POST, ATTUR, SALEM",
                                textAlign: pw.TextAlign.center,
                                style: const pw.TextStyle(
                                    color: PdfColors.black, fontSize: 14)),
                            width: double.infinity,
                            alignment: pw.Alignment.center),
                      )
                    ],
                  ),
                ),
              );
            }),
      );
      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => doc.save());
    }

    return Card(
      child: ExpansionTile(
        childrenPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        title: Text(
          "Name:${name}",
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'திரு:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${name}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'Serial Number:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${serialNumber}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'வாகன எண்:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${tansportNumber}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'தேதி:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${datePick}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'முதல் எடை:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${firstW}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'இரண்டாம் எடை:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${secondW}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'நிகர எடை:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${approxW}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'மண் கழிவு சதவீதம்:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${sandWPer}' + '%',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'மண் கழிவு:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${sandWaste}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'மொத்த எடை:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${totalW}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'பாயிண்ட்:',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${point}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'பாயிண்ட் விலை:',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${pointrate}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'ஒரு டன்னிற்க்கான விலை:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${tonprice}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'பட்டியல் 1:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${box1}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'இறக்கு கூலி:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${labourprice}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'பட்டியல் 2:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${box2}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'வாடகை + வெட்டுக்கூலி:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${travellPrice}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'இதர செலவுகள்:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${foods}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'அட்வான்ஸ்:',
                style: const TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: advances,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          ListTile(
            // leading: Icon(Icons.circle),
            title: RichText(
              text: TextSpan(
                text: 'மொத்த பட்டியல் தொகை:',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '${totalWeight}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: createPdf,
              icon: const Icon(Icons.picture_as_pdf_rounded)),
        ],
      ),
    );
  }
}
