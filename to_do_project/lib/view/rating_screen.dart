import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/utils.dart';

class AppRatingScreen extends StatelessWidget {
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
            Text("Rating Screen"),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'How would you rate our app?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 3, // Initial rating (e.g., 3 stars)
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.blueGrey,
              ),
              onRatingUpdate: (rating) {
                // Handle the rating when the user updates it
                print(rating);
                // You can save the rating, show a thank you message, etc.
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit the rating or navigate to another screen
                // based on your app's logic.
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AppRatingScreen(),
  ));
}
