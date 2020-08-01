import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DocumentGetter {
  //static final String BASE_URL = "https://firebasestorage.googleapis.com/v0/b/maintenance-acd46.appspot.com/o/ELS%2001%20Juni%202020.pdf?alt=media&token=1651fc79-35f9-462f-b3b8-b1fe3098314b";

  static Future<String> loadPDF(String baseUrl) async {
    var response = await http.get(baseUrl);

    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}
