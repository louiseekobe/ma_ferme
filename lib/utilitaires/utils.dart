//LA CLASSE PROPOSITION NOUS PERMET DE DEFINIR UN OBJET
//QUI VA NOUS FAIRE DEFILER LES OBJETS DANS NOS CLASSE
//ON AURA ENNONCE QUI EST LE TITRE DE NOTRE OBJET
//EXPLICATION SUR L'OBJET
//IMAGE DE NOTRE OBJET
class Proposition {
  String enonce;
  String explication;
  String imagePath;
  Proposition(String enonce, String explication, String imagePath) {
    this.enonce = enonce;
    this.explication = explication;
    this.imagePath = imagePath;
  }
}

//LA CLASSE QUI VA GERER LE QUIZZ SUR L'APPLICATION
class Question {
  String enonce;
  Question(String enonce) {
    this.enonce = enonce;
  }
}

class Images {
  String imagePath;
  bool reponse;
  Images(String imagePath, bool reponse) {
    this.imagePath = imagePath;
    this.reponse = reponse;
  }
}

class Images2 {
  String imagePath;
  bool reponse;
  Images2(String imagePath, bool reponse) {
    this.imagePath = imagePath;
    this.reponse = reponse;
  }
}

class ListMusique {
  String stringPath;
  ListMusique(String musiquePath) {
    this.stringPath = musiquePath;
  }
}
