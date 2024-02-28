
import 'package:anna_sakkoa/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" K o t i s i v u"),
        
      ),
      drawer: MyDrawer(),
    );
  }
}
