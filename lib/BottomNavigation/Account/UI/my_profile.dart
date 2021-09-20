import 'package:flutter/material.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Theme/colors.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            Center(
              child: Hero(
                tag: 'profile_image',
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/user/my profile.png'),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 15.5,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        color: mainColor,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),

            EntryField(
              textCapitalization: TextCapitalization.words,
              label: 'Full Name',
              initialValue: 'Samantha Smith',
              readOnly: true,
            ),

            //email textField
            EntryField(
              textCapitalization: TextCapitalization.none,
              label: 'Email Address',
              initialValue: 'samathasmith@mail.com',
              readOnly: true,
            ),

            //phone textField
            EntryField(
              label: 'Phone Num',
              readOnly: true,
              initialValue: '+91__________',
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
