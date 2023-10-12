import 'package:flutter/material.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({super.key});

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {

  
  
  @override
  Widget build(BuildContext context) {
        final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return   Scaffold(

      body:Stack(
        
        children: [
          Positioned(
            top:height*0.5 ,
            child:  Container(child: Row(
          children: [Image.asset('assets/images/arrow-down.png'), Text('Month')],

          ),)
          ,
        )
        ],
      )
      
    );
  }
}