import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
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

  // saveNetworkImage(String imageUrl) async {
  //   var response = await Dio()
  //       .get("$imageUrl", options: Options(responseType: ResponseType.bytes));
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(response.data),
  //       quality: 60,
  //       name: "hello");
  //   print(result);
  // }

  Future<void> saveNetworkImage(String imageUrl, BuildContext context) async {
    try {
      // Show snackbar when download starts
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloading image...')),
      );

      var response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello",
      );

      if (result != null && result['isSuccess']) {
        // Show snackbar when download is successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image downloaded successfully')),
        );
      } else {
        // Show snackbar when download fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download image')),
        );
      }
    } catch (e) {
      print('Error downloading image: $e');
      // Show snackbar when an error occurs during download
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading image')),
      );
    }
  }
}
