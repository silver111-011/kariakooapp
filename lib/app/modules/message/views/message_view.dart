import 'package:flutter/material.dart';



import '/widgets/custom_bottom_bar.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MessageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}


// class MessageView extends GetView<MessageController> {
//   const MessageView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MessageView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'MessageView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
