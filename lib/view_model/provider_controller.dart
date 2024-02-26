import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/model/model.dart';
import 'package:path_provider/path_provider.dart';

class ImageProvidermodel extends ChangeNotifier {
  late List<CustomData> dataFor = [];

  late int imageindex;

  Future<void> fetchImages() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.unsplash.com/photos/?client_id=8fZZLAtYG6LkkNbNsa7-_35CESYO-62CM5zQfc_-Nas'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        dataFor = parseCustomData(response.body);
        print(data);
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      notifyListeners();
    }
  }

  List<CustomData> parseCustomData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CustomData>((json) => CustomData.fromJson(json)).toList();
  }

  Future<void> downloadImage(String imageUrl) async {
    try {
      // Fetch the image data
      http.Response response = await http.get(Uri.parse(imageUrl));

      // Get the local app directory
      Directory appDir = await getApplicationDocumentsDirectory();

      // Create a new file in the app directory with a unique name
      String fileName = imageUrl.split('/').last;
      File imageFile = File('${appDir.path}/$fileName');

      // Write the image data to the file
      await imageFile.writeAsBytes(response.bodyBytes);

      print('Image downloaded to: ${imageFile.path}');
    } catch (e) {
      print('Error downloading image: $e');
    }
  }
}
