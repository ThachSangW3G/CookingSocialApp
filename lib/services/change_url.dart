import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

Future<File> convertImageUrlToFile(String imageUrl) async {
  var response = await http.get(Uri.parse(imageUrl));
  final documentDirectory = await getTemporaryDirectory();
  final timestamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
  File file = File('${documentDirectory.path}/image_$timestamp.webp');
  await file.writeAsBytes(response.bodyBytes);
  return file;
}
