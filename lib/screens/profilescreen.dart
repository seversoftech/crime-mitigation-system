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
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        child: IconButton(
                          color: const Color(0xFFFFFFFF),
                          onPressed: () {},
                          icon: (Icon(
                            LineAwesomeIcons.camera,
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        size: 30,
                        LineAwesomeIcons.user_circle,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
