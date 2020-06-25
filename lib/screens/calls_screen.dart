import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_call,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CallsListTile(
                avatarUrl:
                    'https://pbs.twimg.com/profile_images/1138210118603038726/CzKjf1Zj_400x400.jpg',
                titleText: 'Tony Stark',
                subTitle: Row(
                  children: <Widget>[
                    Icon(
                      Icons.call_made,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      '(4) June 25, 2:13PM',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        letterSpacing: 0.3,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                trailingIcon: Icons.call,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 85.0),
                child: Divider(
                  color: Colors.blueGrey,
                ),
              ),
              CallsListTile(
                avatarUrl:
                    'https://pbs.twimg.com/profile_images/1138210118603038726/CzKjf1Zj_400x400.jpg',
                titleText: 'Tony Stark',
                subTitle: Row(
                  children: <Widget>[
                    Icon(
                      Icons.call_missed,
                      color: Theme.of(context).errorColor,
                    ),
                    Text(
                      '(4) June 25, 2:10PM',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        letterSpacing: 0.3,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                trailingIcon: Icons.call,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 85.0),
                child: Divider(
                  color: Colors.blueGrey,
                ),
              ),
              CallsListTile(
                avatarUrl:
                    'https://lh3.googleusercontent.com/proxy/qV48wd8duZWjyMTnNh6Sgh3aEWOrNgZBna15AfbSFYvOOjjmJ-GDYXbQJyw0D2QCxxvIpvbRvcfjfUenmvuwcEsFZkibrFdwHWa8-unZlGxBYG2ZusN2dI9N_INlRieXtAswTdsdjPPLfdYUNGJwwpGzggJwSQJ9',
                titleText: 'Sunil',
                subTitle: Row(
                  children: <Widget>[
                    Icon(
                      Icons.call_made,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      '(8) June 22, 5:19PM',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        letterSpacing: 0.3,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                trailingIcon: Icons.videocam,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 85.0),
                child: Divider(
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallsListTile extends StatelessWidget {
  final String avatarUrl;
  final String titleText;
  final Widget subTitle;
  final IconData trailingIcon;
  final Function onTap;

  const CallsListTile({
    Key key,
    @required this.avatarUrl,
    @required this.titleText,
    @required this.subTitle,
    this.onTap,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 55.0,
        height: 55.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: avatarUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(
              heightFactor: 18.0,
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: Colors.black,
            ),
          ),
        ),
      ),
      title: Text(
        titleText,
        style: TextStyle(
          letterSpacing: 0.3,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subTitle,
      trailing: Icon(
        trailingIcon,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
