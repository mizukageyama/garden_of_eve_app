import 'package:flutter/material.dart';
import 'package:garden_of_eve/features/products/presentation/home_products/home_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsScreen(),
    );
  }
}

// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     getUserById();
//     super.initState();
//   }

//   void getUserById() async {
//     try {
//       Response response = await Dio().get('http://10.0.2.2:3000/api/users/3');
//       final Map<String, dynamic> data = response.data;
//       final User user = User.fromJson(data['data']);
//       //print(data);
//       print(data['data']);
//       print(user);
//       print(user.toJson());
//     } catch (e) {
//       print(e);
//     }
//   }

