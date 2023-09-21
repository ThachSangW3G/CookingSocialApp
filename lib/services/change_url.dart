import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<File> convertImageUrlToFile(String imageUrl) async {
  var response = await http.get(Uri.parse(imageUrl));
  final documentDirectory = await getTemporaryDirectory();
  final path = documentDirectory.path;
  File file = File('$path/image.webp');
  await file.writeAsBytes(response.bodyBytes);
  return file;
}
