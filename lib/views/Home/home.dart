import 'package:api_flutter/models/user.dart';
import 'package:api_flutter/views/UserDetails/userDetails.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Map>> users = User().fetchUsers();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: FutureBuilder(
          future: User().fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(snapshot.data[index]['name']),
                  subtitle: Text(snapshot.data[index]['email']),
                  contentPadding: EdgeInsets.only(bottom: 20.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UserDetails(user: snapshot.data[index])));
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
