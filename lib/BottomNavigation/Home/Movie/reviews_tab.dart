import 'package:flutter/material.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';

class Reviews {
  final String image;
  final String name;
  final String date;
  final int rating;
  final String review;

  Reviews({this.image, this.name, this.date, this.rating, this.review});
}

List<Reviews> reviews = [
  Reviews(
    image: 'images/user/click to edit.png',
    name: 'Emili Williamson',
    date: '15 June 2020',
    rating: 5,
    review:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  ),
  Reviews(
    image: 'images/user/click to edit-1.png',
    name: 'Rose Taylor',
    date: '13 June 2020',
    rating: 4,
    review:
        'Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua labore et dolore magna aliqua labore et dolore',
  ),
  Reviews(
    image: 'images/user/click to edit-2.png',
    name: 'Emili Williamson',
    date: '10 June 2020',
    rating: 2,
    review:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua labore et dolore',
  ),
  Reviews(
    image: 'images/user/click to edit-3.png',
    name: 'Emili Williamson',
    date: '5 June 2020',
    rating: 5,
    review:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  ),
];

class ReviewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Color(0xff4abc22),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('4.3 '),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 12.0,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text('98 People rated'),
                Spacer(flex: 10),
              ],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    ListTile(
                      leading: Image.asset(
                        reviews[index].image,
                        height: 30.0,
                        width: 30.0,
                      ),
                      title: Text(
                        reviews[index].name,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      subtitle: Text(
                        reviews[index].date,
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(color: lightTextColor),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            reviews[index].rating,
                            (ind) => Icon(
                                  Icons.star,
                                  color: premiumColor,
                                  size: 16.0,
                                )),
                      ),
                    ),
                    Text(
                      reviews[index].review,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(height: 1.5),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PageRoutes.addReviewPage);
        },
        child: Icon(Icons.add),
        heroTag: 'add',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
