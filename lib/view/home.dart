import 'package:flutter/material.dart';
import 'package:machine_test/view/image_display.dart';

import 'package:machine_test/view_model/provider_controller.dart';
import 'package:machine_test/view_model/downloadController.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    final imageProvider =
        Provider.of<ImageProvidermodel>(context, listen: false);
    imageProvider.fetchImages();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 239, 234),
      body: Consumer<ImageProvidermodel>(
        builder: (context, imageProvider, _) {
          // Access the data from imageProvider.dataFor
          // For example, you can display a ListView of images
          return ListView.builder(
            itemCount: imageProvider.dataFor.length,
            itemBuilder: (context, index) {
              var imageData = imageProvider.dataFor[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.005),
                child: Container(
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.01),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.02,
                              left: screenWidth * 0.02),
                          child: Row(
                            children: [
                              CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                    "${imageData.smollUrlimage}",
                                  )),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Text(
                                "${imageData.username}",
                                style: TextStyle(fontSize: screenWidth * 0.04),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.015,
                        ),
                        InkWell(
                          onTap: () {
                            imageProvider.imageindex = index;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => imageDisplay()),
                            );
                          },
                          child: Container(
                            child: Image.network(
                              "${imageData.regularUrlimage}",
                              fit: BoxFit.cover,
                              height: screenHeight * 0.45,
                              width: screenWidth * 0.9,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
