import 'package:flutter/material.dart';
import 'package:utilidades/src/Model/about_model.dart';

class AboutController {
  AboutModel getAbout() {
    return AboutModel(
      photoURL:
      "https://paponacolina.com.br/wp-content/uploads/2024/02/Vegetti-e-lider-em-duelos-aereos-ganhos-no-Brasil-desde-que-chegou-no-Vasco.jpg"
          ,
      aboutMe: [
        '🏴‍☠️ Pablo Ezequiel Vegetti Pfaffen (Santo Domingo, 15 de outubro de 1988) é um futebolista argentino que atua como centroavante. Atualmente joga no Vasco da Gama.',
      ],
      SocialLinks: [
        SocialLink(name: "Github", icon: Icons.add, url: "https://github.com/"),
      ],
    );
  }
}
