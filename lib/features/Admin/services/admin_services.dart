import 'dart:io';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      // uploading the files on the cloudinary and with creting the folder as the name of the products
      final cloudinary = CloudinaryPublic('deiodipe6', 'orikezus');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }
      
      // ready the data by pass in model for going to server
      Product product= Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}