import 'package:flutter/widgets.dart';

class AboutModel {
  final String photoURL;
  final List<String> aboutMe;
  final List<SocialLink> SocialLinks;

  AboutModel({
    required this.photoURL,
    required this.aboutMe,
    required this.SocialLinks,
  });
}

class SocialLink{
  final String name;
  final IconData icon;
  final String url;
  
  SocialLink({required this.name,required this.icon,required this.url});
}
