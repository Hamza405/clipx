import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/reviews_tab.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Theme/colors.dart';

class AddReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddReviewsBody();
  }
}

class AddReviewsBody extends StatefulWidget {
  @override
  _AddReviewsBodyState createState() => _AddReviewsBodyState();
}

class _AddReviewsBodyState extends State<AddReviewsBody> {
  TextEditingController _controller = TextEditingController();
  double? rating;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/movie poster.png'),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                scaffoldBackgroundColor.withOpacity(0.75),
                scaffoldBackgroundColor
              ],
              stops: [0.0, 0.4],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'CorpoMan',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Add your Review',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: unselectedLabelColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: RatingBar.builder(
                        minRating: 1,
                        itemCount: 5,
                        glowColor: transparentColor,
                        unratedColor: unselectedLabelColor,
                        onRatingUpdate: (value) {
                          rating = value;
                        },
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: premiumColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Let us know your feedback',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    EntryField(
                      controller: _controller,
                      maxLength: 200,
                      maxLines: 4,
                      label: 'Enter your review',
                      onTap: () {},
                    ),
                    Hero(
                      tag: 'add',
                      child: ContinueButton(() {
                        String date = '28 June 2020';
                        reviews.add(Reviews(
                          image: 'images/user/click to edit.png',
                          name: 'Anonymous',
                          rating: rating!.toInt(),
                          review: _controller.text,
                          date: date,
                        ));
                        Navigator.pop(context);
                      }, text: 'Submit'),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
