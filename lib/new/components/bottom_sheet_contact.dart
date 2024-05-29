import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoClinicBottomSheet extends StatelessWidget {
  // final ClinicModelItems clinic;

  final String phone;
  final String? email;

  const ContactInfoClinicBottomSheet(
      {Key? key, required this.phone, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Contact Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () async {
              // launch('tel:${clinic.phone}');
              // _launchUrl(clinic.phone.toString());
              // _makePhoneCall(clinic.phone.toString());
              final Uri url = Uri(scheme: 'tel', path: phone.toString());
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                print("cannot launch this url");
              }
            },
            child: Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 5),
                Text('${phone}'),
              ],
            ),
          ),
          email!.isNotEmpty
              ? TextButton(
                  onPressed: () async {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    final Uri url = Uri(
                        scheme: 'mailto',
                        path: email.toString(),
                        query: encodeQueryParameters(<String, String>{
                          'subject': "Hi ",
                          'body': "I want to learn more about you"
                        }));
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                          url); // Handle potential error or show a message
                    } else {
                      print("cannot launch this url: " + email.toString());
                    }
                  },
                  child: Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 5),
                      Text('${email}'),
                    ],
                  ),
                )
              : SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
