import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  final Map? user;
  const UserDetails({super.key, required this.user});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.user!['username']}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("name: ${widget.user!['name']}")),
          Center(child: Text("username: ${widget.user!['username']}")),
          Center(child: Text("email: ${widget.user!['email']}")),
          Center(child: Text("address:")),
          Center(child: Text("phone: ${widget.user!['phone']}")),
          Center(child: Text("website: ${widget.user!['website']}")),
        ],
      ),
    );
  }
}
