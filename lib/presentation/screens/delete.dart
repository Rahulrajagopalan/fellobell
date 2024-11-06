// import 'dart:async';
// import 'package:fello_bell_project/presentation/custom_widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';

// class OTPScreen extends StatefulWidget {
//   @override
//   _OTPScreenState createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   var _start = 60.obs;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     _start = 60.obs;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_start > 0) {
//         _start--;
//       } else {
//         _timer.cancel();
//       }
//     });
//   }

//   void resetTimer() {
//     _timer.cancel();
//     startTimer();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Verify the Authorization Code",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               "Sent to 7687653902",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Pinput(
//               controller: TextEditingController(),
//               length: 4,
//               defaultPinTheme: PinTheme(
//                 width: 60,
//                 height: 55,
//                 textStyle: const TextStyle(fontSize: 20, color: Colors.black),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: _start == 0.obs ? () {
//                 // Reset the timer and resend OTP
//                 resetTimer();
//                 print("Resend OTP");
//               } : null,
//               child: Obx(() => Text(
//                 "Resend Authorization Code in $_start sec",
//                 style: TextStyle(
//                   color: _start == 0.obs ? Colors.blue : Colors.grey,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )),
//             ),
//             SizedBox(height: 30),
//             CustomButton(
//                 buttonText: "Verify",
//                 buttonFunction: () {}),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class OTPScreen extends StatelessWidget {
// //   var count = 0.obs;
// //   @override
// //   Widget build(context) => Scaffold(
// //       appBar: AppBar(title: Text("counter")),
// //       body: Center(
// //         child: Obx(() => Text("$count")),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         child: Icon(Icons.add),
// //         onPressed: () => count ++,
// //       ));
// // }