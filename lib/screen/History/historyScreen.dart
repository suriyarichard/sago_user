import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sago_user/screen/authCheck/main_page.dart';
import 'package:sago_user/services/pdf.service.dart';
import 'package:sago_user/shared/nodata.dart';
import 'package:sago_user/widgets/History/tilecard.dart';

class UserHistroy extends StatefulWidget {
  const UserHistroy({super.key});

  @override
  State<UserHistroy> createState() => _UserHistroyState();
}

class _UserHistroyState extends State<UserHistroy> {
  HistoryService historyService = HistoryService();
  List<dynamic> historyData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sago User"),
        toolbarHeight: 60,
        backgroundColor: Colors.pink,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.exit_to_app),
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFEBFFD8),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: historyService.get(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Display a loading spinner while waiting for data
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // Display an error message if the future throws an error
                    return Text("Error: ${snapshot.error}");
                  } else {
                    historyData = snapshot.data;
                    // print("hello ${snapshot.data['Name']}");
                    // Call the function from the instance of MyClass and display the fetched data
                    if (historyData.length == 0) {
                      return NoData(text: 'No Data Available');
                    } else {
                      // Call the function from the instance of MyClass and display the fetched data

                      // return Text(snapshot.data[0]['totalweight'].toString());
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: 365,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            // return Text(
                            //     snapshot.data[index]['Name'].toString());
                            return calcListView(
                              name: snapshot.data[index]['Name'].toString(),
                              advances:
                                  snapshot.data[index]['advance'].toString(),
                              approxW:
                                  snapshot.data[index]['approx weg'].toString(),
                              box1: snapshot.data[index]['box1'].toString(),
                              box2: snapshot.data[index]['box2'].toString(),
                              datePick: snapshot.data[index]['Date'].toString(),
                              firstW:
                                  snapshot.data[index]['First Weg'].toString(),
                              foods: snapshot.data[index]['foods'].toString(),
                              labourprice: snapshot.data[index]['labour price']
                                  .toString(),
                              point: snapshot.data[index]['point'].toString(),
                              pointrate:
                                  snapshot.data[index]['point rate'].toString(),
                              sandWPer: snapshot.data[index]['sandwaste per']
                                  .toString(),
                              sandWaste:
                                  snapshot.data[index]['sand waste'].toString(),
                              secondW:
                                  snapshot.data[index]['second weg'].toString(),
                              serialNumber: snapshot.data[index]['serialnumber']
                                  .toString(),
                              tansportNumber: snapshot.data[index]
                                      ['Transport number']
                                  .toString(),
                              tonprice: snapshot.data[index]['oneTon rate']
                                  .toString(),
                              totalW: snapshot.data[index]['totalWeight1']
                                  .toString(),
                              totalWeight: snapshot.data[index]['totalweight']
                                  .toString(),
                              travellPrice: snapshot.data[index]
                                      ['travell price']
                                  .toString(),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              ),
            ]),
      ),
    );
  }
}
