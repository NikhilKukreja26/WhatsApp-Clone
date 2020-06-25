import 'package:flutter/material.dart';

import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StoryController controller = StoryController();

    return Material(
      child: StoryView(
        storyItems: [
          StoryItem.text(
            title:
                'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Windows, Mac, Linux, Google Fuchsia and the web from a single codebase. The first version of Flutter was known as codename "Sky" and ran on the Android operating system',
            backgroundColor: Colors.blue,
            roundedTop: true,
          ),
          StoryItem.inlineImage(
            url:
                'https://i1.wp.com/sovitpoudel.com.np/wp-content/uploads/2019/01/flutter.png',
            imageFit: BoxFit.contain,
            caption: Text(
              "Flutter",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black54,
                fontSize: 17,
              ),
            ),
            controller: controller,
          ),
          StoryItem.inlineImage(
            url:
                "https://roszkowski.dev/images/2020-05-04/flutter_logo_leg.gif",
            imageFit: BoxFit.contain,
            controller: controller,
            duration: Duration(seconds: 10),
            roundedTop: false,
            caption: Text(
              "Flutter logo gif",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black54,
                fontSize: 17,
              ),
            ),
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
          Navigator.of(context).pop();
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        inline: false,
        controller: controller,
      ),
    );
  }
}
