import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>with TickerProviderStateMixin {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],
       body: SingleChildScrollView(child: Content()),
    );
  }
  Widget Content(){
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Align(alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Image.asset('images/delivery.jpg',height: 200,),
                  Text('Parcel Tracker',style: TextStyle(fontSize: 30),),
                ],
              ),
            ),
          ),
        ),
        body(),
        LocationStepper(),
      ],
    );
  }
  Widget body(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Text('Tracking Number:',style: TextStyle(fontSize: 16),),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
          child: Row(
            children: [
              Container(
                height: 60,width: 310,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50),),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'eg: #980988979',),
                ),
              ),
              SizedBox(width: 30,),
              Icon(Icons.search,size: 35,),
            ],
          ),
        ),
      ],
    );
  }
  Widget LocationStepper(){
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Step 1 title'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 1')),
        ),
         Step(
          title: Text('Step 2 title'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 2')),
        ),
         Step(
          title: Text('Step 3 title'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 3')),
        ),
        Step(
          title: Text('Step 4 title'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 4')),
        ),
      ],
    );
  }
}
