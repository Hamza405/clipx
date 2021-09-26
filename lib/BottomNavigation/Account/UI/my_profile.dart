import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Account/UI/my_profile_edit.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/management/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class MyProfilePage extends StatelessWidget {
  // storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<AuthProvider>(context).user.data.user;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('My Profile'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => EditMyProfilePage()));
              },
              icon: Icon(
                Icons.edit,
                color: mainColor,
              ))
        ],
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
              initialValue: '${userData.firstname} ${userData.lastname}',
              readOnly: true,
            ),

            //email textField
            EntryField(
              textCapitalization: TextCapitalization.none,
              label: 'Email Address',
              initialValue: '${userData.email}',
              readOnly: true,
            ),

            //phone textField
            EntryField(
              label: 'Phone Num',
              readOnly: true,
              initialValue: '${userData.mobile}',
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
