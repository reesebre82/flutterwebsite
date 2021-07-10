// "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"

import 'package:http/http.dart' as http;

class EmailSender {
  static sendRegistrationNotification(String email) async {
    Map<String, String> headers = new Map();
    headers["Authorization"] =
        "Bearer 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";
    headers["Content-Type"] = "application/json";
    // headers['Access-Control-Allow-Origin'] = "*";

    var url = 'https://api.sendgrid.com/v3/mail/send';
    var response =
        await http.post(Uri.parse(url), headers: headers, body: "Testing");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}


// import 'package:sendgrid_mailer/sendgrid_mailer.dart';

// class EmailSender {
//   static sendRegistrationNotification(String email) async {
//     final mailer = Mailer(
//         "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");
//     final toAddress = Address('brendan@brendanreese.com');
//     final fromAddress = Address('brendan@brendanreese.com');
//     final content = Content('text/plain', 'Hello World!');
//     final subject = 'Hello Subject!';
//     final personalization = Personalization([toAddress]);

//     final email =
//         Email([personalization], fromAddress, subject, content: [content]);
//     mailer.send(email).then((result) {
//       // ...
//     });
//   }
// }

