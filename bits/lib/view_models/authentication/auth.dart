import '../../utils/utils.dart';
import 'authentication_api.dart';

class UrlFetcher {
  late Authentication auth;

  UrlFetcher() {
    auth = Authentication();
  }

  Future<void> fetchRedirectUrl(
      Function(String) onUrlFetched, Function(String) onError) async {
    try {
      auth.fetchUrl().then((url) {
        onUrlFetched(url);
      }).catchError((e) {
        onError(e.toString());
        Utils.showCustomSnackbar('Error', e.toString());
      });
    } catch (e) {
      onError(e.toString());
      Utils.showCustomSnackbar('Error', e.toString());
    }
  }
}
