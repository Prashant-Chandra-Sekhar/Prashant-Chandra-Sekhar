import 'package:flutter/material.dart';
import 'users_dao.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userDAO = UserDAO('localhost', 3306, 'Prashant-C', '12345', 'dating_app');

  String _id = '';
  String _firstName = '';
  String _lastName = '';
  String _emailAddress = '';
  String _phoneNumber = '';
  String _school = '';
  String _organization = '';
  int _age = 0;
  String _gender = '';
  String _lookingFor = '';
  String _userName = '';
  String _password = '';
  String _profilePicture = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign-Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'ID'),
                  enabled: false,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your First Name';
                    }
                    return null;
                  },
                  onSaved: (value) => _firstName = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Last Name';
                    }
                    return null;
                  },
                  onSaved: (value) => _lastName = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email Address'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email Address';
                    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) => _emailAddress = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone Number';
                    }
                    return null;
                  },
                  onSaved: (value) => _phoneNumber = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'School'),
                  onSaved: (value) => _school = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Organization'),
                  onSaved: (value) => _organization = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Age';
                    }
                    return null;
                  },
                  onSaved: (value) {
  print('Age value: $value');
  _age = int.parse(value!);
},
          
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Gender'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Gender';
                    }
                    return null;
                  },
                  onSaved: (value) => _gender = value!,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Looking For'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter what you\'re looking for';
                    }
                    return null;
                  },
                  onSaved: (value) => _lookingFor = value!,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _handleSignUp,
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Hash the password before saving to the database
      final String hashedPassword = hashPassword(_password);
       // Debug prints
    print('ID: $_id');
    print('Age: $_age');
    

      // Create a User object with the entered data
      final User user = User(
        id: int.tryParse(_id.trim()) ?? 0,
        firstName: _firstName,
        lastName: _lastName,
        emailAddress: _emailAddress,
        phoneNumber: _phoneNumber,
        school: _school,
        organization: _organization,
        age: _age,
        gender: _gender,
        lookingFor: _lookingFor,
        userName: _userName,
        password: hashedPassword,
        profilePicture: _profilePicture,
      );

      try {
        print('Before inserting user to database');
        await _userDAO.insertUser(user);
        print('After inserting user to database');
        Navigator.pushNamed(context, '/'); // Replace with appropriate navigation route
       print('After Navigator pushNamed'); // Add this line
      } on Exception catch (error) {
        print('Error saving user: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred. Please try again later.'),
          ),
        );
      }
    }
  }
}
