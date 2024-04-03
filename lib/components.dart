import 'package:flutter/material.dart';

AppBar AppHeader({
  required String avatar,
  required String header,
  required List<Widget> content,
}) {
  return AppBar(
    toolbarHeight: 240,
    flexibleSpace: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(header),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.5)
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: content.length == 1
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          width: 105,
                          avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ...content
                ])
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 62,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(avatar),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: content)
                  ],
                ),
        ),
      ],
    ),
  );
}
