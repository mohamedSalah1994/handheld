import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
static const routeName = 'home';
  Future<void> fetchSuppliers() async {
    const url = 'https://handheld_api.cloudiax.com/api/PurchaseOrder/GetSuppliers';

    try {
      HttpClient httpClient = HttpClient()
        ..badCertificateCallback = (cert, host, port) => true; // 👈 Ignore SSL
      IOClient ioClient = IOClient(httpClient);

      final response = await ioClient.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('✅ Suppliers fetched successfully:');
        print(data);
      } else {
        print('❌ Failed to fetch suppliers. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error occurred while fetching suppliers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchSuppliers,
          child: const Text('Get Suppliers'),
        ),
      ),
    );
  }
}
