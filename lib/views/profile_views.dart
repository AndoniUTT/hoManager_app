import 'package:flutter/material.dart';

class ProfileViews extends StatefulWidget {
  const ProfileViews({super.key});

  @override
  State<ProfileViews> createState() => _ProfileViewsState();
}

class _ProfileViewsState extends State<ProfileViews> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("PROFILE"),
        ],
      ),
    );
  }
}