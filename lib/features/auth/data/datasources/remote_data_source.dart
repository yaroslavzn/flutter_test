import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/entities/customer.dart';
import '../../domain/usecases/sign_in_usecase.dart';

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource({required this.client});

  Future<Customer> signIn(SignInParams params) async {
    final response = await http.post(
      Uri.parse('https://development.api.kayamoola.co.za/auth/login'),
      // headers: {'Content-Type': 'application/json'},
      body: {
        'brand_id': 'KAYAMOOLA_CO_ZA',
        'email': params.username,
        'passwrod': params.password,
        'login_type_id': 'regular',
        'system_id': 'web',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['user'];
    } else {
      throw Exception();
    }
  }
}
