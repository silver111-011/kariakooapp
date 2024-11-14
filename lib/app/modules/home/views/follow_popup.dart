// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FollowButton extends StatefulWidget {
//   final String sellerId;
//   final String userId;

//   const FollowButton({Key? key, required this.sellerId, required this.userId})
//       : super(key: key);

//   @override
//   _FollowButtonState createState() => _FollowButtonState();
// }

// class _FollowButtonState extends State<FollowButton> {
//   bool isFollowing = false; // Track if the user is currently following this seller

//   void checkFollowingStatus() async {
//     // Check Firestore if the current user is already following this seller
//     DocumentSnapshot doc = await FirebaseFirestore.instance
//         .collection('sellers')
//         .doc(widget.sellerId)
//         .get();

//     setState(() {
//       isFollowing = (doc['followers'] as List<dynamic>).contains(widget.userId);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkFollowingStatus();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         if (isFollowing) {
//           // User is currently following, so unfollow
//           unfollowSeller();
//         } else {
//           // User is not following, so follow
//           followSeller();
//         }
//       },
//       child: Text(isFollowing ? 'Unfollow' : 'Follow'),
//     );
//   }

//   void followSeller() async {
//     try {
//       await FirebaseFirestore.instance.collection('sellers').doc(widget.sellerId).update({
//         'followers': FieldValue.arrayUnion([widget.userId]),
//       });

//       setState(() {
//         isFollowing = true;
//       });
//     } catch (e) {
//       print('Error following seller: $e');
//       // Handle error as needed
//     }
//   }

//   void unfollowSeller() async {
//     try {
//       await FirebaseFirestore.instance.collection('sellers').doc(widget.sellerId).update({
//         'followers': FieldValue.arrayRemove([widget.userId]),
//       });

//       setState(() {
//         isFollowing = false;
//       });
//     } catch (e) {
//       print('Error unfollowing seller: $e');
//       // Handle error as needed
//     }
//   }
// }

import 'package:flutter/material.dart';

class FollowPopup extends StatelessWidget {
  final String sellerId;
  final bool isFollowing;
  final Function(bool) onFollowChanged;

  const FollowPopup({
    required this.sellerId,
    required this.isFollowing,
    required this.onFollowChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isFollowing ? 'Acha Kumfuata Muuzaji' : 'Mfuate Muuzaji'),
      content: Text(
        isFollowing
            ? 'Una uhakika unataka kuacha kumfuata muuzaji huyu?'
            : 'Je, unataka kumfuata muuzaji huyu ili upate masasisho?',
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Text('Ghairi'),
        ),
        ElevatedButton(
          onPressed: () {
            // Toggle follow status
            onFollowChanged(!isFollowing);
            Navigator.pop(context); // Close the dialog
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor, // Text color
            minimumSize: Size(150, 50), // Adjust this size as needed
          ),
          child: Text(isFollowing ? 'Acha Kumfuata' : 'Mfuate'),
        ),
      ],
    );
  }
}

