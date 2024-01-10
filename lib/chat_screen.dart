import 'package:flutter/material.dart';
import 'chat_list.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text(
              'Enter a new message',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall, // Updated to headlineSmall
            ),
            const SizedBox(height: 16),
            Text(
              'Type a message and hit Enter to add it to the stream. '
              'Firestore security rules apply.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Updated to bodyMedium
            ),
            const SizedBox(height: 16),
            ChatInput(),
            SizedBox(height: 32),
            Text(
              'The latest messages',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall, // Updated to headlineSmall
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ChatList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter your message and hit Enter',
        ),
        onSubmitted: (String value) {
          // FirebaseService().addMessage(value); // Uncomment this line if needed
        },
      ),
    );
  }
}
