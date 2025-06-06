import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utilidades/src/Controller/about_controller.dart';

class AboutView extends StatelessWidget {
  final AboutController controller = AboutController();
  AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final about = controller.getAbout();
    return Padding(
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(about.photoURL),
              radius: 60,
            ),
            const SizedBox(height: 20),
            Column(
              children: about.aboutMe
                  .map(
                    (texto) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        texto,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: about.SocialLinks.map((link){
                return Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    IconButton(onPressed: () {}, icon: FaIcon(link.icon),color: link.cor,),
                    Text(link.name,style: TextStyle(fontSize: 12,color: Colors.black)),
                  ],
                ),
                );
              }).toList()
            ),
          ],
        ),
      ),
    );
  }
}
