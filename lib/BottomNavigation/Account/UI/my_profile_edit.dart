import 'package:flutter/material.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/management/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class EditMyProfilePage extends StatefulWidget {
  @override
  _EditMyProfilePageState createState() => _EditMyProfilePageState();
}

class _EditMyProfilePageState extends State<EditMyProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<AuthProvider>(context).user.data.user;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Edit My Profile'),
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
            TextFormField(
              initialValue: userData.firstname,
              cursorColor: mainColor,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: lightTextColor),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: unselectedLabelColor),
                  labelText: 'First Name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter youre name';
                }
              },
              onSaved: (value) {
                // _authData['firstName'] = value;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: userData.lastname,
              cursorColor: mainColor,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: lightTextColor),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: unselectedLabelColor),
                  labelText: 'Last Name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter youre name';
                }
              },
              onSaved: (value) {
                // _authData['lastName'] = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text('Cancel',
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                ),
                TextButton(
                  child: Text('Save',
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                ),
              ],
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
