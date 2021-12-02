import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
            radius: 25,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 7,
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 6,
          ),
        ],
      ),
      title: Text('Pham Anh Duc'),
      subtitle: Text('You: hello world'),
      trailing: Text(
        '2021-10-21 09:57PM',
        style: TextStyle(fontSize: 11),
      ),
    );
  }
}
