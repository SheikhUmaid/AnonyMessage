import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class ScreenShotController extends GetxController {
  final ScreenshotController screenshotController = ScreenshotController();
  late String shareableImage;
  RxBool loading = false.obs;
  Future saveScreenshot(bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/anonyresult.jpg');
    image.writeAsBytesSync(bytes);
    shareableImage = image.path;
    loading.value = false;
    return image;
  }

  Future shareScreenshot() async {
    await Share.shareFiles([shareableImage], text: 'Look at AnonyReply');
  }

  Future<Uint8List?> captureScreenshot() async {
    try {
      loading.value = true;
      final image = await screenshotController.capture();
      if (image == null) return null;
      final shareableImage = saveScreenshot(image);
      return image;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
