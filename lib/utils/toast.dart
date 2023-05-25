import 'package:toast/toast.dart';

void showToast({required String string}) {
  Toast.show(string, duration: Toast.lengthShort, gravity: Toast.bottom);
}
