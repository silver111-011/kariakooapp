// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MwishoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//      // Initialize the controller
//     //final MwishoController controller = Get.put(MwishoController());
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 80.0,
//                 height: 80.0,
//                 decoration: BoxDecoration(
//                   color:Color.fromARGB(255, 49, 73, 214),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.check,
//                   color: Colors.white,
//                   size: 40.0,
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'Umekamilisha Malipo',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 'Karibu Tena',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Implement your Pata Ankara action here
//                     },
//                     child: Text('Pata Ankara'),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor:Theme.of(context).primaryColor,// Text color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       minimumSize: Size(double.infinity, 60), // Increase the height of the button
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Get.toNamed('/home');
//                       // Implement your Rudi Kununua action here
//                     },
//                     child: Text('Rudi Kununua'),
//                 style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor:Theme.of(context).primaryColor,// Text color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       minimumSize: Size(double.infinity, 60), // Increase the height of the button
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MwishoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 49, 73, 214),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Umekamilisha Malipo',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                'Karibu Tena',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement your Pata Ankara action here
                      },
                      child: Text('Pata Ankara'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.0), // Increase the height of the button
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/home');
                        // Implement your Rudi Kununua action here
                      },
                      child: Text('Rudi Kununua'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.0), // Increase the height of the button
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
