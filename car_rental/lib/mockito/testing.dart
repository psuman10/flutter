import 'dart:convert';
import 'package:http/http.dart' as http;

class UserApiProvider{
  final http.Client client;
  UserApiProvider({ required this.client});
  }