import 'package:flutter/material.dart';
import 'package:ondamenu/widgets/action_bar.dart';

class ProfileTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Profile Tab"),
          ),
          ActionBar(
            title: "Profile Page",
            // hasTitle: false,
            hasBackArrow: false,
          ),
        ],
      ),
    );
  }
}
