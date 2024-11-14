import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({Key? key}) : super(key: key);
 @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Hakiki Barua Pepe'),
                centerTitle: true,
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        // Text: Hakiki barua pepe yako hapa!
                        Text(
                            'Hakiki barua pepe yako hapa!',
                            style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        // Text: Hongera , Akaunti yako inasubiri, Hakiki barua pepe kuanza kuuza na kununua pamoja nasi.
                        Text(
                            'Hongera, Akaunti yako inasubiri.\nHakiki barua pepe kuanza kuuza na kununua pamoja nasi.',
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center, // Center text
                        ),
                        const SizedBox(height: 16),
                        

       ElevatedButton(
    onPressed: controller.verifyEmail,
    child: Text(
        'Endelea',
        style: TextStyle(
            color: Colors.white, // Set the text color to white
        ),
    ),
    
    style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 11, 4, 225), // Set the button background color to blue
        minimumSize: Size.fromHeight(50), // Increase the height of the button
    ),
),

            const SizedBox(height: 16),
            // Resend verification code button
            TextButton(
              onPressed: controller.verifyEmail,
              child: Text('Zitume tena '),
            ),
          ],
        ),
      ),
    );
  }
}

