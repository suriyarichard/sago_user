import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryService {
  var uid = FirebaseAuth.instance.currentUser?.uid;
  final historyData = FirebaseFirestore.instance.collection("call");

  Future<dynamic> get() async {
    List<Map> historyList = [];

    DocumentSnapshot userSnapshot = await historyData.doc(uid).get();

    QuerySnapshot historySnapshot = await userSnapshot.reference
        .collection("calcu")
        .where("Name", isEqualTo: 'Joe')
        .get();

    historySnapshot.docs.forEach((doc) {
      historyList.add(doc.data() as Map);
    });
    return historyList;
  }
}
