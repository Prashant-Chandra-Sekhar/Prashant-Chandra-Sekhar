import 'package:mysql1/mysql1.dart'; // Import for database connection
import 'dart:convert';
import 'package:crypto/crypto.dart';


String hashPassword(String password) {
  final salt = _generateSalt();
  final key = utf8.encode(password);
  final hmac = Hmac(sha256, key);
  final hashedPassword = hmac.convert(salt).toString();
  return '$salt$hashedPassword';
}

List<int> _generateSalt() {
  final salt = List<int>.generate(16, (index) => DateTime.now().millisecondsSinceEpoch % 256);
  return salt;
}

// Replace with your actual connection details (avoid hardcoding in production)
const String _host = 'localhost';
const int _port = 3306; // Default MySQL port
const String _user = 'Prashant-C';
const String _password = '12345'; // Use a secure method to store password
const String _database = 'dating_app';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final String school;
  final String organization;
  final int age;
  final String gender;
  final String lookingFor;
  final String profilePicture;
  final String userName;
  final String password;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.school,
    required this.organization,
    required this.age,
    required this.gender,
    required this.lookingFor,
    required this.profilePicture,
    required this.userName,
    required this.password,
  });

  factory User.fromMap(ResultRow row) => User(
        id: row['id'] as int,
        firstName: row['first_name'] as String,
        lastName: row['last_name'] as String,
        emailAddress: row['email_address'] as String,
        phoneNumber: row['phone_number'] as String,
        school: row['school'] as String,
        organization: row['organization'] as String,
        age: row['age'] as int,
        gender: row['gender'] as String,
        lookingFor: row['looking_for'] as String,
        profilePicture: row['profile_picture'] as String,
        userName: row['user_name'] as String,
        password: row['password'] as String,
      );
}

class UserDAO {
  final String _host;
  final int _port;
  final String _user;
  final String _password;
  final String _database;

  UserDAO(this._host, this._port, this._user, this._password, this._database);

  Future<MySqlConnection> getConnection() async {
    try {
      final conn = await MySqlConnection.connect(
        ConnectionSettings(
          host: _host,
          port: _port,
          user: _user,
          password: _password,
          db: _database,
        ),
      );
      return conn;
    } catch (error) {
      print('Error connecting to the database: $error');
      throw Exception('Failed to connect to database');
    }
  }

  

  Future<void> insertUser(User user) async {
    final conn = await getConnection();
    try {
      await conn.query('''
        INSERT INTO users (
          id,
          first_name,
          last_name,
          email_address,
          phone_number,
          school,
          organization,
          age,
          gender,
          looking_for,
          profile_picture,
          user_name,
          password
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      ''', [
        user.id,
        user.firstName,
        user.lastName,
        user.emailAddress,
        user.phoneNumber,
        user.school,
        user.organization,
        user.age,
        user.gender,
        user.lookingFor,
        user.profilePicture,
        user.userName,
        hashPassword(user.password),
      ]);
    } catch (error) {
      print('Error inserting user: $error');
      rethrow;
    } finally {
      await conn.close();
    }
  }

  Future<List<User>> getAllUsers() async {
    final conn = await getConnection();
    try {
      final results = await conn.query('SELECT * FROM users');
      return results.map((row) => User.fromMap(row)).toList();
    } finally {
      await conn.close();
    }
  }

  Future<void> updateUser(User user) async {
    final conn = await getConnection();
    try {
      // Add your logic for updating the user in the database
    } finally {
      await conn.close();
    }
  }
}
