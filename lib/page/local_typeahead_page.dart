import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:typeahead_example/data/user_data.dart';
import 'package:typeahead_example/data/user_detail_page.dart';

class LocalTypeAheadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: TypeAheadField<User?>(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search Username',
                ),
              ),
              suggestionsCallback: UserData.getSuggestions,
              itemBuilder: (context, User? suggestion) {
                final user = suggestion!;

                return ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    child: Image.network(
                      user.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(user.name),
                );
              },
              noItemsFoundBuilder: (context) => Container(
                height: 100,
                child: Center(
                  child: Text(
                    'No Users Found.',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              onSuggestionSelected: (User? suggestion) {
                final user = suggestion!;

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserDetailPage(user: user),
                ));
              },
            ),
          ),
        ),
      );
}
