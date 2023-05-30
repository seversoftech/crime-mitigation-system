import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/icon.png"),
                  ),
                  Positioned(
                    right: -12,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: IconButton(
                        color: const Color(0xFF030116),
                        onPressed: () {},
                        icon: (Icon(
                          size: 28,
                          LineAwesomeIcons.camera,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
