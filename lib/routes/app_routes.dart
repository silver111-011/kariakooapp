
// import 'package:agape_s_application1/app/modules/Login/views/login_view.dart';
// import 'package:flutter/material.dart';


// import "../app/modules/CreateAccount/views/create_account_view.dart";
// import '../app/modules/splashscreen/views/splashscreen_view.dart';
// import '../app/modules/BidhaaCategory/views/bidhaa_category_view.dart';
// import '../app/modules/bidhaa/views/bidhaa_view.dart';
// import '../app/modules/cart/views/cart_view.dart';
// import '../app/modules/favourite/views/favourite_view.dart';
// import '../app/modules/home/views/home_view.dart';
// import '../app/modules/profile/views/profile_view.dart';
// import '../app/modules/profilepicture/views/profilepicture_view.dart';
// import '../presentation/onboarding_screen/onboarding_screen.dart';
// import 'app_navigation_screen.dart';

// // Import the app navigation screen

// class Routes {
//   static const String splashscreen= '/splash_screen';
//   //static const String createAccountScreen = '/create_account_screen';
//    static const String createAccountView = 'lib/app/modules/CreateAccount/views/create_account_view.dart"';
//   static const String loginView='lib/app/modules/Login/views/login_view.dart';
//   static const String onboardingScreen = '/onboarding_screen';
//   static const String fullProfileContainerScreen =
//       '/full_profile_container_screen';
//   static const String appNavigationScreen = '/app_navigation_screen';
//   static const String cartView = '/lib/app/modules/cart/views/cart_view.dart';
//   static const String bidhaaView =
//       'lib/app/modules/bidhaa/views/bidhaa_view.dart';
//   static const String favouriteView =
//       'lib/app/modules/favourite/views/favourite_view.dart';
//   static const String homeView = 'lib/app/modules/home/views/home_view.dart';
//   static const String profileView =
//       'lib/app/modules/profile/views/profile_view.dart';
//   static const String bidhaacategoryview =
//       'lib/app/modules/BidhaaCategory/views/bidhaa_category_view.dart';
//   static const String profilepictureView=
//       'lib/app/modules/profilepicture/views/profilepicture_view.dart';

//   static Map<String, WidgetBuilder> routes = {
//     splashscreen:(context) => SplashscreenView(),
//     loginView:(context) => LoginView(),
//     createAccountView:(context) => CreateAccountView(),
//     //createAccountScreen: (context) => CreateAccountScreen(),
//     onboardingScreen: (context) => OnboardingScreen(),
//     appNavigationScreen: (context) => AppNavigationScreen(),
//     favouriteView: (context) => FavouriteView(),
//     bidhaaView: (context) => BidhaaView(),
//     cartView: (context) => CartView(),
//     profileView: (context) => ProfileView(),
//     homeView: (context) => HomeView(),
//     bidhaacategoryview: (context) => BidhaaCategoryView(),
//     profilepictureView: (context) => ProfilePictureView(),

//   };
//   static const BIDHAA_CATEGORY = '/bidhaa-category';
  

  
  
// }

import 'package:agape_s_application1/app/modules/history/controllers/history_controller.dart';
import 'package:agape_s_application1/app/modules/BidhaaDetails/controllers/bidhaa_details_controller.dart';
import 'package:agape_s_application1/app/modules/EmailVerification/controllers/email_verification_controller.dart';
import 'package:agape_s_application1/app/modules/OrderRequest/controllers/orderRequest_controller.dart';
import 'package:agape_s_application1/app/modules/OrderRequest/views/orderRequest_view.dart';
import 'package:agape_s_application1/app/modules/bidhaa/controllers/bidhaa_controller.dart';
import 'package:agape_s_application1/app/modules/cart/controllers/cart_controller.dart';
import 'package:agape_s_application1/app/modules/chat/controllers/chat_controller.dart';
import 'package:agape_s_application1/app/modules/chat/views/chat_view.dart';
//import 'package:agape_s_application1/app/modules/chat/controllers/chat_controller.dart';
//import 'package:agape_s_application1/app/modules/chat/views/chat_view.dart';
import 'package:agape_s_application1/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:agape_s_application1/app/modules/checkout/controllers/ushahidi_controller.dart';
import 'package:agape_s_application1/app/modules/checkout/views/checkout_view.dart';
import 'package:agape_s_application1/app/modules/checkout/views/mwisho_view.dart';
import 'package:agape_s_application1/app/modules/checkout/views/ushahidi_view.dart';
//import 'package:agape_s_application1/app/modules/conversation/controllers/conversation_controller.dart';
import 'package:agape_s_application1/app/modules/payment/controllers/payment_controller.dart';
import 'package:agape_s_application1/app/modules/profile/bindings/profile_binding.dart';
import 'package:agape_s_application1/app/modules/sellereditprofile/views/sellereditprofile_view.dart';
//import 'package:agape_s_application1/app/modules/sellerprofile/controllers/sellerprofile_controller.dart';
import 'package:agape_s_application1/app/modules/sellerregister/controllers/sellerregister_controller.dart';
import 'package:agape_s_application1/app/modules/sellerregister/views/sellerregister_view.dart';
import 'package:agape_s_application1/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:agape_s_application1/app/repositories/cartrepository.dart';
import 'package:agape_s_application1/routes/app_navigation_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:agape_s_application1/app/modules/CreateAccount/views/create_account_view.dart';
import 'package:agape_s_application1/app/modules/Login/views/login_view.dart';
import 'package:agape_s_application1/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:agape_s_application1/app/modules/history/views/history_view.dart';
import 'package:agape_s_application1/app/modules/bidhaa/views/bidhaa_view.dart';
import 'package:agape_s_application1/app/modules/cart/views/cart_view.dart';
//import 'package:agape_s_application1/app/modules/conversation/views/conversation_view.dart';
import 'package:agape_s_application1/app/modules/home/views/home_view.dart';
import 'package:agape_s_application1/app/modules/profile/views/profile_view.dart';
import 'package:agape_s_application1/app/modules/profilepicture/views/profilepicture_view.dart';
import 'package:agape_s_application1/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:agape_s_application1/app/modules/CreateAccount/controllers/create_account_controller.dart';
import '../app/modules/BidhaaDetails/views/bidhaa_details_view.dart';
import '../app/modules/Login/controllers/login_controller.dart';
import '../app/modules/continue/views/continue_view.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../app/modules/payment/views/payment_view.dart';
import '../app/modules/sellereditprofile/controllers/sellereditprofile_controller.dart';
import '../app/modules/sellerhome/controllers/sellerhome_controller.dart';
import '../app/modules/sellerhome/views/sellerhome_view.dart';
import '../app/modules/sellerlogin/controllers/sellerlogin_controller.dart';
import '../app/modules/sellerlogin/views/sellerlogin_view.dart';
//import '../app/modules/sellerprofile/views/sellerprofile_view.dart';
import '../app/repositories/sellerprofilerepository.dart';
import '../repositories/AuthenticationRepository.dart';
import 'package:agape_s_application1/app/modules/EmailVerification/views/email_verification_view.dart';
import 'package:agape_s_application1/app/modules/Success/views/success_view.dart';
import 'package:agape_s_application1/app/modules/Success/controllers/success_controller.dart';


class Routes {
    static const String splashscreen = '/splashscreen';
    static const String createAccountView = '/createAccount';
    static const String loginView = '/login';
    static const String onboardingScreen = '/onboarding_screen';
    static const String appNavigationScreen = '/app_navigation_screen';
    static const String cartView = '/cart';
    static const String bidhaaView = '/bidhaa';
    static const String conversationView= '/conversation';
    static const String homeView = '/home';
    static const String profileView = '/profile';
    static const String historyView = '/history';
    static const String profilepictureView = '/profilepicture';
    static const String emailVerificationView = '/emailverification';
    static const String successView = '/success';
    static const String continueView= '/continue';
    static const String sellerregisterView= '/sellerregister';
    static const String sellerloginView= '/sellerlogin';
    static const String sellerhomeView= '/sellerhome';
    static const String bidhaaDetailsView= '/bidhaa_details';
    static const String checkoutView= '/checkout';
    static const String paymentView= '/payment';
    //static const String sellerprofileView = '/sellerprofile';
    static const String sellereditprofileView = '/sellereditprofile';
    static const String chatView = '/chat';
    static const String orderRequestsView = '/orderrequest';
    static const String ushahidiView = '/ushahidi';
    static const String mwishoView = '/mwisho';



    
    
    static final List<GetPage> routes = [
 
      
        GetPage(
            name: '/splashscreen',
            page: () => SplashscreenView(),
            binding: BindingsBuilder(() {
                Get.lazyPut(() => SplashscreenController());
                Get.lazyPut(() => AuthenticationRepository());
            }),
        ),


              GetPage(
            name: '/ushahidi',
            page: () => UshahidiPage(),
            binding: BindingsBuilder(() {
                Get.lazyPut(() => UshahidiController());
                Get.lazyPut(() => AuthenticationRepository());
            }),
        ),




              GetPage(
            name: '/mwisho',
            page: () => MwishoPage(),
            binding: BindingsBuilder(() {
                Get.lazyPut(() => UshahidiController());
                Get.lazyPut(() => AuthenticationRepository());
            }),
        ),





        GetPage(
            name: '/createAccount',
            page: () => CreateAccountView(),                   
            binding: BindingsBuilder(() {
                Get.lazyPut<CreateAccountController>(() => CreateAccountController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
            }),
       ),
         GetPage(
            name: '/emailverification',
            page: () => EmailVerificationView(),                   
            binding: BindingsBuilder(() {
                Get.lazyPut<EmailVerificationController>(() => EmailVerificationController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
            }),
       ),

       GetPage(
        name: '/success',
         page: () => SuccessView(),
         binding: BindingsBuilder((){
           Get.lazyPut<SuccessController>(() => SuccessController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),
             GetPage(
        name: '/login',
         page: () => LoginView(),
         binding: BindingsBuilder((){
           Get.lazyPut<LoginController>(() => LoginController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),

        GetPage(
        name: '/sellerregister',
         page: () => SellerRegisterView(),
         binding: BindingsBuilder((){
           Get.lazyPut<SellerRegisterController>(() => SellerRegisterController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),

          GetPage(
        name: '/sellerhome',
         page: () => SellerHomeView(sellerId: 'sellerId',),
         binding: BindingsBuilder((){
           Get.lazyPut<SellerHomeController>(() => SellerHomeController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),

 GetPage(
        name: '/sellerlogin',
         page: () => SellerLoginView(),
         binding: BindingsBuilder((){
           Get.lazyPut<SellerLoginController>(() => SellerLoginController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),


 GetPage(
        name: '/cart',
         page: () => CartView(),
         binding: BindingsBuilder((){
          Get.lazyPut<CartRepository>(() => CartRepository(userId: 'your_user_id')); // Provide CartRepository instance
    Get.lazyPut<CartController>(() => CartController(Get.find<CartRepository>())); // Initialize CartController with CartRepository
           //Get.lazyPut<CartController>(() => CartController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),

    GetPage(
        name: '/bidhaa',
         page: () => BidhaaView(),
         binding: BindingsBuilder((){
           Get.lazyPut<BidhaaController>(() => BidhaaController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),



       
        GetPage(
        name: '/history',
         page: () => HistoryOrderPage(),
         binding: BindingsBuilder((){
           Get.lazyPut<OrderHistoryController>(() => OrderHistoryController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),
 GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController(
          repository: SellerProfileRepository(firestore: FirebaseFirestore.instance),
          firestore: FirebaseFirestore.instance,
        ));
        Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
      }),
    ),
        GetPage(
      name: bidhaaDetailsView,
      page: () => BidhaaDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BidhaaDetailsController>(() {
          final arguments = Get.arguments as Map<String, dynamic>;
          final product = arguments['product'];
          final userId = arguments['userId'];
          return BidhaaDetailsController(product: product, userId: userId);
        });
        Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
      }),
    ),

//         GetPage(
//         name: '/bidhaa_details',
//          page: () => BidhaaDetailsView(),
//          binding: BindingsBuilder((){
//            Get.lazyPut<BidhaaDetailsController>(() => BidhaaDetailsController());
//                 Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
//  } ),
//        ),
           GetPage(
        name: '/checkout',
         page: () => CheckoutView(),
        // page: () => CheckoutView(productId: Get.arguments),

         binding: BindingsBuilder((){
           Get.lazyPut<CheckoutController>(() => CheckoutController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),

//            GetPage(
//         name: '/payment',
//          page: () => PaymentView(
//           // Pass the required parameters to PaymentView
//                 productPrice: Get.find<CartController>().product.value?.price ?? 0.0,
//                 deliveryCharge: Get.find<CartController>().deliveryCharge,
//                 discount: Get.find<CartController>().discount.value,
//          ),
//          binding: BindingsBuilder((){
//            Get.lazyPut<PaymentController>(() => PaymentController());
//                 Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
//  } ),
//       ),


    // GetPage(
    //   name: '/payment',
    //   page: () => PaymentView(
    //     productPrice: Get.find<CartController>().totalPrice - Get.find<CartController>().deliveryCharge + Get.find<CartController>().discount.value, // Calculated product price
    //     deliveryCharge: Get.find<CartController>().deliveryCharge,
    //     discount: Get.find<CartController>().discount.value,
    //     products: Get.find<CartController>().products,
    //     quantities: Get.find<CartController>().quantities,
    //   ),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<PaymentController>(() => PaymentController());
    //     Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    //   }),
    // ),



      GetPage(
    name: '/payment',
    page: () => PaymentView(),
    binding: BindingsBuilder(() {
      Get.lazyPut<PaymentController>(() => PaymentController());
      Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
      Get.lazyPut<CartRepository>(() => CartRepository(userId: 'your_user_id')); // Provide CartRepository instance
    Get.lazyPut<CartController>(() => CartController(Get.find<CartRepository>())); // Initialize CartController with CartRepository
      //Get.lazyPut<CartController>(() => CartController());
    }),
  ),

//             GetPage(
//         name: '/sellerprofile',
//          page: () => SellerProfileView(id: 'id',),
//          binding: BindingsBuilder((){
//            Get.lazyPut<SellerProfileController>(() => SellerProfileController(id: 'id'));
//                 Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
//  } ),
//        ),

// GetPage(
//   name: '/sellerprofile',
//   page: () => SellerProfileView(sellerId: Get.parameters['sellerId']!),
//   binding: BindingsBuilder(() {
//     Get.lazyPut<SellerProfileController>(() => SellerProfileController(Get.parameters['sellerId']!, ));
//     Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
//   }),
// ),

       GetPage(
        name: '/sellereditprofile',
         page: () => SellerEditProfileView(),
         binding: BindingsBuilder((){
           Get.lazyPut<SellerEditProfileController>(() => SellerEditProfileController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),


             GetPage(
        name: '/orderrequest',
         page: () => OrderRequestsView(),
         binding: BindingsBuilder((){
           Get.lazyPut<OrderRequestsController>(() => OrderRequestsController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),
       

             GetPage(
        name: '/chat',
         page: () => ChatView(userId: '', sellerId: '', businessName: '', productName: '', productImage: '',),
         binding: BindingsBuilder((){
           Get.lazyPut<ChatController>(() =>ChatController());
                Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
 } ),
       ),



//           GetPage(
//         name: '/conversation',
//          page: () => ConversationView(),
//          binding: BindingsBuilder((){
//            Get.lazyPut<ConversationController>(() =>ConversationController());
//                 Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
//  } ),
//        ),






        // Add other GetPage entries for other routes
       // GetPage(name: loginView, page: () => LoginView()),
        GetPage(name: loginView, page: () => LoginView()),
        GetPage(name: createAccountView, page: () => CreateAccountView()),
        GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
        GetPage(name: appNavigationScreen, page: () => AppNavigationScreen()),
        GetPage(name: cartView, page: () => CartView()),
        GetPage(name: bidhaaView, page: () => BidhaaView()),
        //GetPage(name: conversationView, page: () => ConversationView()),
        GetPage(name: homeView, page: () => HomeView()),
         GetPage(
    name: '/profile',
    page: () => ProfileView(),
    binding: ProfileBinding(Get.parameters['userId'] ?? ''), // Use parameter from route
  ),
        GetPage(name: historyView, page: () => HistoryOrderPage()),
        GetPage(name: profilepictureView, page: () => ProfilePictureView()),
        GetPage(name: emailVerificationView, page: () => EmailVerificationView()),
        GetPage(name: successView, page: () => SuccessView()),
        GetPage(name: continueView, page: () => ContinueView()),
        GetPage(name: sellerregisterView, page: () => SellerRegisterView()),
        GetPage(name: sellerhomeView, page: () => SellerHomeView(sellerId: 'sellerId',)),
        GetPage(name: sellerloginView, page: () => SellerLoginView()),
        GetPage(name: bidhaaDetailsView, page:() => BidhaaDetailsView()),
       // GetPage(name: checkoutView, page:() => CheckoutView(productId: Get.arguments)),
       GetPage(name: checkoutView, page:() => CheckoutView()),
       GetPage(name: ushahidiView, page:() => UshahidiPage()),
       GetPage(name: mwishoView, page:() => MwishoPage()),


        
        GetPage(name: orderRequestsView, page:() => OrderRequestsView()),
       // GetPage(name: conversationView, page:() => ConversationView()),

       // GetPage(name: sellerprofileView, page: ()=> SellerProfileView(sellerId: 'sellerId',)),
       // GetPage(name: sellerprofileView, page:() => SellerProfileView(id: 'id',)),
        GetPage(name: sellereditprofileView, page: () => SellerEditProfileView()),
        GetPage(name: chatView, page:() => ChatView(userId: '', sellerId: '', businessName: '', productName: '', productImage: '',)),
        // GetPage(name: paymentView, page: () => PaymentView( // Pass the required parameters to PaymentView
        //          productPrice: Get.find<CartController>().totalPrice - Get.find<CartController>().deliveryCharge + Get.find<CartController>().discount.value, // Calculated product price
        // deliveryCharge: Get.find<CartController>().deliveryCharge,
        // discount: Get.find<CartController>().discount.value,
        // products: Get.find<CartController>().products,
        // quantities: Get.find<CartController>().quantities,)),
       



         GetPage(
    name: '/payment', // Adjust name as needed
    page: () => PaymentView(), // Initialize PaymentView without passing parameters directly
    binding: BindingsBuilder(() {
      Get.lazyPut<CartRepository>(() => CartRepository(userId: 'your_user_id')); // Provide CartRepository instance
    Get.lazyPut<CartController>(() => CartController(Get.find<CartRepository>())); // Initialize CartController with CartRepository
     // Get.lazyPut<CartController>(() => CartController()); // Ensure CartController is initialized
    }),
  ),
    ];
}

