import 'package:flutter/material.dart';

class SettingsDetailsTile extends StatelessWidget {
  final IconData icon;
  final String titleText;
  final String subTitleText;
  final Widget trailingIcon;
  final Function onTap;

  const SettingsDetailsTile({
    Key key,
    @required this.icon,
    @required this.titleText,
    @required this.subTitleText,
    this.onTap,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 26.0,
        color: Color(0xFF128C7E),
      ),
      title: Text(
        titleText,
        style: TextStyle(
          letterSpacing: 0.3,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subTitleText,
        style: TextStyle(
          color: Colors.blueGrey,
          letterSpacing: 0.3,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: trailingIcon,
    );
  }
}
