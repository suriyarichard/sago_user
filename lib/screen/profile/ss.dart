// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String _name = '';
//   int _age = 0;
//   String _bio = '';

//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   Future<void> _getData() async {
//     final ref = FirebaseFirestore.instance.collection('users').doc('user_id');
//     final snapshot = await ref.get();
//     final data = snapshot.data();
//     setState(() {
//       _name = data['name'];
//       _age = data['age'];
//       _bio = data['bio'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(_name, style: TextStyle(fontSize: 24)),
//           Text('Age: $_age', style: TextStyle(fontSize: 18)),
//           Text(_bio, style: TextStyle(fontSize: 18)),
//         ],
//       ),
//     );
//   }
// }