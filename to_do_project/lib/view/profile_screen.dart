import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IconButton(
            //     onPressed: () {
            //       pop(context);
            //     },
            //     icon: Icon(
            //       Icons.arrow_back,
            //       color: Colors.white,
            //     )),
            Text("Profile Screen"),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.blueGrey,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'),
                          ),
            SizedBox(height: 16),
            Text(
              'Laiba Azam', 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins-Bold"
              ),
            ),
            SizedBox(height: 8),
            Text(
              'laibaazam.31@gmail.com', 
              style: TextStyle(
                fontSize: 18,fontFamily: "Poppins-Bold",
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('0323 3423325'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location'), 
            ),
          ],
        ),
      ),
    );
  }
}