
import 'package:agape_s_application1/app/modules/history/controllers/history_controller.dart';
import 'package:agape_s_application1/app/modules/CreateAccount/controllers/create_account_controller.dart';
import 'package:agape_s_application1/app/modules/EmailVerification/controllers/email_verification_controller.dart';
import 'package:agape_s_application1/app/modules/Login/controllers/login_controller.dart';
import 'package:agape_s_application1/app/modules/OrderRequest/controllers/orderRequest_controller.dart';
import 'package:agape_s_application1/app/modules/Success/controllers/success_controller.dart';
import 'package:agape_s_application1/app/modules/cart/controllers/cart_controller.dart';
import 'package:agape_s_application1/app/modules/chat/controllers/chat_controller.dart';
import 'package:agape_s_application1/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:agape_s_application1/app/modules/checkout/controllers/mwisho_controller.dart';
import 'package:agape_s_application1/app/modules/checkout/controllers/ushahidi_controller.dart';
import 'package:agape_s_application1/app/modules/continue/controllers/continue_controller.dart';
//import 'package:agape_s_application1/app/modules/conversation/controllers/conversation_controller.dart';
import 'package:agape_s_application1/app/modules/home/controllers/home_controller.dart';
import 'package:agape_s_application1/app/modules/payment/controllers/payment_controller.dart';
import 'package:agape_s_application1/app/modules/sellerhome/controllers/sellerhome_controller.dart';
import 'package:agape_s_application1/app/modules/sellerlogin/controllers/sellerlogin_controller.dart';
import 'package:agape_s_application1/app/modules/sellerregister/controllers/sellerregister_controller.dart';
import 'package:agape_s_application1/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:agape_s_application1/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:agape_s_application1/app/repositories/cartrepository.dart';
import 'package:agape_s_application1/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; // Import Get package
import 'app/modules/sellereditprofile/controllers/sellereditprofile_controller.dart';
//import 'app/modules/sellerlogin/controllers/sellerlogin_controller.dart';
import 'app/repositories/SellerRepository.dart';
// import 'app/repositories/chat_repository.dart';
import 'app/repositories/notificatio_repository.dart';
import 'app/repositories/product_repository.dart';
import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:agape_s_application1/repositories/AuthenticationRepository.dart';
import 'package:agape_s_application1/app/repositories/sellerprofilerepository.dart';




var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // Initialize Firebase services
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Register AuthenticationRepository with GetX
    Get.put<AuthenticationRepository>(AuthenticationRepository());
     // Register the ProductRepository with Get.put() for eager loading
    Get.put(ProductRepository());
     // Register the NotificationRepository with Get.put() for eager loading
    //Get.put(NotificationRepository());
    // Register the ChatRepository with Get.put() for eager loading
    //Get.put(ChatRepository());
    // Register the SellerRepository
    Get.put(SellerRepository());
     Get.put(CartRepository(userId: 'your_user_id')); 
   Get.put(SellerProfileRepository(firestore: FirebaseFirestore.instance)); // Register SellerProfileRepository
  //Get.put(ConversationRepository());


    // Register controllers with GetX
    Get.put(CreateAccountController());
    Get.put(EmailVerificationController());
    Get.put(SuccessController());
    Get.put(SellerRegisterController());
    Get.put(LoginController());
   // Get.put(HomeController());
    Get.put(SellerLoginController());
    Get.put(ContinueController());
    Get.put(OrderHistoryController());
    Get.put(SellerHomeController());
    Get.put(AuthenticationRepository());
      Get.put(CartController(Get.find<CartRepository>()));
    //Get.put(CartController());
    Get.put(ChatController());

    //Get.put(BidhaadetailsController());
    Get.put(CheckoutController());
    Get.put(PaymentController());
    //Get.put(SellerProfileController());
    Get.put(SellerEditProfileController);
    Get.put(OrderRequestsController());
    Get.put(UshahidiController());
    Get.put(MwishoController());
    //Get.put(ConversationController());
Get.put<HomeController>(
  HomeController(
    repository: SellerProfileRepository(firestore: firestore),
    firestore: firestore,
  ),
);





    // Lock orientation to portrait up
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Setup the theme and other app configurations
    ThemeHelper().changeTheme('primary');

    // Run the app
    runApp(MyApp());
}


class AuntheticationRepository {
}


 class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
           theme: theme,
           title: 'kariakoo _Connect_app',
           debugShowCheckedModeBanner: false,
           initialRoute: Routes.splashscreen,
           getPages: Routes.routes,
          //routes: Routes.routes,
        home: SplashscreenView(), // Add home page here
         initialBinding: SplashscreenBinding(), // Add initial binding here
        );
      },
     );
  }

}
class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
      () => SplashscreenController(),
    );
  }
}





