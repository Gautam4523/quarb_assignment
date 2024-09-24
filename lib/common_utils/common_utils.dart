import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

String checkAndFixInvalidUrl(String url) {
  url = url = url.trim();
  url = url.replaceAll(' ', '').replaceAll('%20', '');
  try {
    // Remove leading/trailing spaces and decode all encoded characters
    return Uri.decodeFull(url.trim());
  } catch (e) {
    // If the URL cannot be decoded, return the original or handle error
    return url;
  }
}

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget(
      {super.key, required this.imageUrl, this.width, this.height});

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        checkAndFixInvalidUrl(
          imageUrl,
        ),
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        fit: BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              ),
            );
          }
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: SvgPicture.asset(
              '',
              width: width ?? double.infinity,
              height: height ?? double.infinity,
              fit: BoxFit.fill,
            ),
          ); // Placeholder image
        },
      ),
    );
  }
}
