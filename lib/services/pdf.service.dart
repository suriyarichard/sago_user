import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryService {
  var uid = FirebaseAuth.instance.currentUser?.uid;
  final historyData = FirebaseFirestore.instance.collection("userInvoice");

  Future<dynamic> get() async {
    List<Map> historyList = [];

    // DocumentSnapshot userSnapshot = await historyData.doc(uid).get();

    // QuerySnapshot historySnapshot = await userSnapshot.reference
    //     .collection("calcu")
    //     .where("userId", isEqualTo: uid)
    //     .get();
    QuerySnapshot historySnapshot =
        await historyData.where("userId", isEqualTo: uid).get();

    historySnapshot.docs.forEach((doc) {
      historyList.add(doc.data() as Map);
    });
    return historyList;
  }
}
