class Conversation {
  final String id;
  final String sellerName;
  final String lastMessage;
  final String lastMessageTime;

  Conversation({
    required this.id,
    required this.sellerName,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory Conversation.fromFirestore(Map<String, dynamic> data) {
    return Conversation(
      id: data['id'] ?? '',
      sellerName: data['sellerName'] ?? '',
      lastMessage: data['lastMessage'] ?? '',
      lastMessageTime: data['lastMessageTime'] ?? '',
    );
  }
}
