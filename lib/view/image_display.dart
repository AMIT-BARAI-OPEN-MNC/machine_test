import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:machine_test/view_model/provider_controller.dart';
import 'package:provider/provider.dart';

class imageDisplay extends StatelessWidget {
  const imageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.arrow_back_ios))
        // ],
      ),
      body: Consumer<ImageProvidermodel>(
        builder: (context, imageProvider, _) {
          final int indexof = imageProvider.imageindex;
          var data = imageProvider.dataFor[indexof];
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.75,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      "${data.regularUrlimage}",
                      height: screenHeight * 0.5,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          size: screenHeight * 0.04,
                        ),
                        SizedBox(
                          width: screenWidth * 0.1,
                        ),
                        // Icon(
                        //   Icons.messenger_outline_rounded,
                        //   size: screenHeight * 0.035,
                        // ),
                        // SizedBox(
                        //   width: screenWidth * 0.04,
                        // ),
                        // Icon(
                        //   Icons.share,
                        //   size: screenHeight * 0.035,
                        // ),
                        // SizedBox(
                        //   width: screenWidth * 0.04,
                        // ),
                        IconButton(
                            onPressed: () {
                              String imageUrl = data.fullUrlimage;
                              imageProvider.downloadImage(imageUrl);
                            },
                            icon: Icon(
                              Icons.download,
                              size: screenHeight * 0.035,
                            ))
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${data.likes}",
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      "${data.description ?? 'Here is no description'}",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
