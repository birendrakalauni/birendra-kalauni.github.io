import 'package:url_launcher/url_launcher.dart';

Future<bool> openExternalUrl(String url) async {
  final uri = Uri.tryParse(url);

  final isAllowed =
    uri != null &&
    (
      ((uri.isScheme('https') || uri.isScheme('http')) &&
          uri.host.isNotEmpty) ||
      (uri.isScheme('mailto') && uri.path.isNotEmpty)
    );
  if (!isAllowed) return false;

  try {
    return await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (_) {
    return false;
  }
}
