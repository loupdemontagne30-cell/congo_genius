import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const CongoGenius());
}

class CongoGenius extends StatelessWidget {
  const CongoGenius({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Congo Genius',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      home: const AccueilPage(),
    );
  }
}

// ======================================================
// DONNÉES DES QUESTIONS
// ======================================================

final Map<String, List<Map<String, dynamic>>> quizData = {
  'Histoire de la RDC': [
    {
      'question':
          'Quelle ville est devenue la capitale du Congo belge en 1929 ?',
      'reponses': [
        'Kinshasa',
        'Lubumbashi',
        'Kisangani',
        'Goma',
      ],
      'bonne': 'Kinshasa',
    },
    {
      'question': 'En quelle année la RDC a-t-elle obtenu son indépendance ?',
      'reponses': [
        '1955',
        '1960',
        '1965',
        '1970',
      ],
      'bonne': '1960',
    },
    {
      'question': 'Quelle date marque l’indépendance de la RDC ?',
      'reponses': [
        '30 juin 1960',
        '1er janvier 1960',
        '24 avril 1965',
        '17 mai 1997',
      ],
      'bonne': '30 juin 1960',
    },
    {
      'question':
          'Qui fut le premier Premier ministre de la RDC indépendante ?',
      'reponses': [
        'Joseph Kasa-Vubu',
        'Patrice Lumumba',
        'Mobutu Sese Seko',
        'Laurent-Désiré Kabila',
      ],
      'bonne': 'Patrice Lumumba',
    },
    {
      'question': 'Quel était le nom du pays entre 1971 et 1997 ?',
      'reponses': [
        'Congo français',
        'Zaïre',
        'Congo belge',
        'Congo central',
      ],
      'bonne': 'Zaïre',
    },
  ],

  'Géographie': [
    {
      'question': 'Quelle est la capitale de la RDC ?',
      'reponses': [
        'Lubumbashi',
        'Kinshasa',
        'Goma',
        'Kisangani',
      ],
      'bonne': 'Kinshasa',
    },
    {
      'question': 'Quel fleuve porte le même nom que le pays ?',
      'reponses': [
        'Le Nil',
        'Le Niger',
        'Le Congo',
        'Le Zambèze',
      ],
      'bonne': 'Le Congo',
    },
    {
      'question': 'Dans quel continent se trouve la RDC ?',
      'reponses': [
        'Europe',
        'Asie',
        'Afrique',
        'Amérique',
      ],
      'bonne': 'Afrique',
    },
    {
      'question': 'Quelle ville est située dans l’est de la RDC ?',
      'reponses': [
        'Goma',
        'Matadi',
        'Kinshasa',
        'Boma',
      ],
      'bonne': 'Goma',
    },
    {
      'question': 'Quel grand lac se trouve à l’est de la RDC ?',
      'reponses': [
        'Lac Tanganyika',
        'Lac Tchad',
        'Lac Victoria',
        'Lac Malawi',
      ],
      'bonne': 'Lac Tanganyika',
    },
  ],

  'Culture congolaise': [
    {
      'question':
          'Quel genre musical est particulièrement associé aux deux Congo ?',
      'reponses': [
        'Soukous',
        'Flamenco',
        'Reggae',
        'Country',
      ],
      'bonne': 'Soukous',
    },
    {
      'question':
          'Quelle langue est largement utilisée comme langue nationale en RDC ?',
      'reponses': [
        'Lingala',
        'Espagnol',
        'Arabe',
        'Portugais',
      ],
      'bonne': 'Lingala',
    },
    {
      'question':
          'Quel plat congolais est préparé à base de feuilles de manioc ?',
      'reponses': [
        'Pondu',
        'Pizza',
        'Sushi',
        'Couscous',
      ],
      'bonne': 'Pondu',
    },
    {
      'question':
          'Quel aliment constitue une base importante de l’alimentation congolaise ?',
      'reponses': [
        'Manioc',
        'Blé',
        'Olive',
        'Riz uniquement',
      ],
      'bonne': 'Manioc',
    },
    {
      'question':
          'Combien de langues nationales sont généralement reconnues en RDC ?',
      'reponses': [
        '2',
        '4',
        '10',
        '20',
      ],
      'bonne': '4',
    },
  ],

  'Sport': [
    {
      'question': 'Quel sport est très populaire en RDC ?',
      'reponses': [
        'Football',
        'Cricket',
        'Hockey sur glace',
        'Baseball',
      ],
      'bonne': 'Football',
    },
    {
      'question':
          'Quel surnom porte l’équipe nationale masculine de football de la RDC ?',
      'reponses': [
        'Les Léopards',
        'Les Lions',
        'Les Éléphants',
        'Les Aigles',
      ],
      'bonne': 'Les Léopards',
    },
    {
      'question':
          'Combien de joueurs d’une équipe sont normalement sur le terrain au football ?',
      'reponses': [
        '9',
        '10',
        '11',
        '12',
      ],
      'bonne': '11',
    },
    {
      'question':
          'Combien de points vaut un panier classique au basketball ?',
      'reponses': [
        '1',
        '2',
        '3',
        '4',
      ],
      'bonne': '2',
    },
    {
      'question':
          'Quel sport utilise un ballon et deux paniers ?',
      'reponses': [
        'Football',
        'Basketball',
        'Tennis',
        'Volley-ball',
      ],
      'bonne': 'Basketball',
    },
  ],

  'Culture générale': [
    {
      'question':
          'Combien y a-t-il de continents généralement reconnus ?',
      'reponses': [
        '5',
        '6',
        '7',
        '8',
      ],
      'bonne': '7',
    },
    {
      'question': 'Quelle est la planète la plus proche du Soleil ?',
      'reponses': [
        'Mars',
        'Vénus',
        'Mercure',
        'Jupiter',
      ],
      'bonne': 'Mercure',
    },
    {
      'question': 'Combien de jours compte une année normale ?',
      'reponses': [
        '360',
        '365',
        '366',
        '370',
      ],
      'bonne': '365',
    },
    {
      'question': 'Quel est le plus grand océan du monde ?',
      'reponses': [
        'Atlantique',
        'Indien',
        'Arctique',
        'Pacifique',
      ],
      'bonne': 'Pacifique',
    },
    {
      'question': 'Combien de côtés possède un triangle ?',
      'reponses': [
        '2',
        '3',
        '4',
        '5',
      ],
      'bonne': '3',
    },
  ],
};

// ======================================================
// PAGE D'ACCUEIL
// ======================================================

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  Map<String, int> meilleursScores = {};

  @override
  void initState() {
    super.initState();
    chargerMeilleursScores();
  }

  Future<void> chargerMeilleursScores() async {
    final prefs = await SharedPreferences.getInstance();

    final scores = <String, int>{};

    for (final categorie in quizData.keys) {
      scores[categorie] =
          prefs.getInt('meilleur_$categorie') ?? 0;
    }

    if (mounted) {
      setState(() {
        meilleursScores = scores;
      });
    }
  }

  int meilleurScoreGeneral() {
    if (meilleursScores.isEmpty) {
      return 0;
    }

    return meilleursScores.values.reduce(
      (a, b) => a > b ? a : b,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF087830),
              Color(0xFF064D25),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),

                // LOGO
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '🇨🇩',
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'CONGO GENIUS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Teste tes connaissances 🇨🇩',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 35),

                // MEILLEUR SCORE
                TweenAnimationBuilder<double>(
                  tween: Tween(
                    begin: 0,
                    end: 1,
                  ),
                  duration: const Duration(
                    milliseconds: 800,
                  ),
                  curve: Curves.easeOutBack,
                  builder: (
                    context,
                    value,
                    child,
                  ) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(30),
                      borderRadius:
                          BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white30,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        const Text(
                          '🏆',
                          style: TextStyle(fontSize: 32),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          children: [
                            const Text(
                              'MEILLEUR SCORE',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${meilleurScoreGeneral()} / 5',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // JOUER
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ChoixCategoriePage(),
                        ),
                      ).then((_) {
                        chargerMeilleursScores();
                      });
                    },
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor:
                          const Color(0xFF087830),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'JOUER',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // CATÉGORIES
                SizedBox(
                  width: 250,
                  height: 55,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ChoixCategoriePage(),
                        ),
                      );
                    },
                    style:
                        OutlinedButton.styleFrom(
                      foregroundColor:
                          Colors.white,
                      side: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'CATÉGORIES',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                const Text(
                  'Apprends • Joue • Progresse',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// CHOIX DE CATÉGORIE
// ======================================================

class ChoixCategoriePage extends StatelessWidget {
  const ChoixCategoriePage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'nom': 'Histoire de la RDC',
      'icone': Icons.history,
    },
    {
      'nom': 'Géographie',
      'icone': Icons.public,
    },
    {
      'nom': 'Culture congolaise',
      'icone': Icons.theater_comedy,
    },
    {
      'nom': 'Sport',
      'icone': Icons.sports_soccer,
    },
    {
      'nom': 'Culture générale',
      'icone': Icons.psychology,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choisir une catégorie',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final categorie = categories[index];

            return TweenAnimationBuilder<double>(
              tween: Tween(
                begin: 0,
                end: 1,
              ),
              duration: Duration(
                milliseconds: 300 + (index * 100),
              ),
              curve: Curves.easeOut,
              builder: (
                context,
                value,
                child,
              ) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(
                      0,
                      20 * (1 - value),
                    ),
                    child: child,
                  ),
                );
              },
              child: Card(
                margin:
                    const EdgeInsets.only(bottom: 15),
                elevation: 3,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.all(15),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundColor:
                        Colors.green.shade100,
                    child: Icon(
                      categorie['icone'],
                      color:
                          Colors.green.shade800,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    categorie['nom'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    '5 questions • 15 secondes',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QuizPage(
                          categorie:
                              categorie['nom'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ======================================================
// PAGE QUIZ
// ======================================================

class QuizPage extends StatefulWidget {
  final String categorie;

  const QuizPage({
    super.key,
    required this.categorie,
  });

  @override
  State<QuizPage> createState() =>
      _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with TickerProviderStateMixin {
  int questionActuelle = 0;
  int score = 0;

  String? reponseChoisie;

  bool reponseValidee = false;

  Timer? timer;

  int secondesRestantes = 15;

  late AnimationController
      animationBonneController;

  late AnimationController
      animationMauvaiseController;

  late AnimationController
      animationQuestionController;

  List<Map<String, dynamic>>
      get questionsCategorie {
    return quizData[widget.categorie] ?? [];
  }

  @override
  void initState() {
    super.initState();

    animationBonneController =
        AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500),
    );

    animationMauvaiseController =
        AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500),
    );

    animationQuestionController =
        AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500),
    );

    demarrerAnimationQuestion();

    demarrerTimer();
  }

  // ====================================================
  // ANIMATION QUESTION
  // ====================================================

  void demarrerAnimationQuestion() {
    animationQuestionController.forward(
      from: 0,
    );
  }

  // ====================================================
  // CHRONOMÈTRE
  // ====================================================

  void demarrerTimer() {
    timer?.cancel();

    secondesRestantes = 15;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) {
        if (!mounted) {
          t.cancel();
          return;
        }

        if (secondesRestantes > 1) {
          setState(() {
            secondesRestantes--;
          });
        } else {
          t.cancel();

          setState(() {
            secondesRestantes = 0;
          });

          tempsEcoule();
        }
      },
    );
  }

  // ====================================================
  // TEMPS ÉCOULÉ
  // ====================================================

  void tempsEcoule() {
    if (reponseValidee) return;

    animationMauvaiseController.forward(
      from: 0,
    );

    setState(() {
      reponseChoisie = null;
      reponseValidee = true;
    });
  }

  // ====================================================
  // CHOISIR UNE RÉPONSE
  // ====================================================

  void choisirReponse(String reponse) {
    if (reponseValidee) return;

    timer?.cancel();

    final bonneReponse =
        questionsCategorie[questionActuelle]
            ['bonne'];

    final estCorrect =
        reponse == bonneReponse;

    if (estCorrect) {
      score++;

      animationBonneController.forward(
        from: 0,
      );
    } else {
      animationMauvaiseController.forward(
        from: 0,
      );
    }

    setState(() {
      reponseChoisie = reponse;
      reponseValidee = true;
    });
  }

  // ====================================================
  // QUESTION SUIVANTE
  // ====================================================

  void questionSuivante() {
    timer?.cancel();

    if (questionActuelle <
        questionsCategorie.length - 1) {
      setState(() {
        questionActuelle++;
        reponseChoisie = null;
        reponseValidee = false;
        secondesRestantes = 15;
      });

      demarrerAnimationQuestion();
      demarrerTimer();
    } else {
      afficherResultat();
    }
  }

  // ====================================================
  // SAUVEGARDER MEILLEUR SCORE
  // ====================================================

  Future<bool> sauvegarderMeilleurScore() async {
    final prefs =
        await SharedPreferences.getInstance();

    final ancienneValeur =
        prefs.getInt(
              'meilleur_${widget.categorie}',
            ) ??
            0;

    if (score > ancienneValeur) {
      await prefs.setInt(
        'meilleur_${widget.categorie}',
        score,
      );

      return true;
    }

    return false;
  }

  // ====================================================
  // RÉSULTAT
  // ====================================================

  Future<void> afficherResultat() async {
    timer?.cancel();

    final nouveauRecord =
        await sauvegarderMeilleurScore();

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return TweenAnimationBuilder<double>(
          tween: Tween(
            begin: 0.7,
            end: 1,
          ),
          duration:
              const Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          builder: (
            context,
            value,
            child,
          ) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: AlertDialog(
            title: Column(
              children: [
                Text(
                  nouveauRecord
                      ? '🏆 NOUVEAU RECORD !'
                      : '🎉 QUIZ TERMINÉ !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: nouveauRecord
                        ? Colors.orange
                        : Colors.green,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),

            content: Column(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Text(
                  widget.categorie,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Ton score',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                TweenAnimationBuilder<int>(
                  tween: IntTween(
                    begin: 0,
                    end: score,
                  ),
                  duration:
                      const Duration(
                    milliseconds: 1000,
                  ),
                  builder: (
                    context,
                    value,
                    child,
                  ) {
                    return Text(
                      '$value / ${questionsCategorie.length}',
                      style:
                          const TextStyle(
                        fontSize: 40,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.green,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 15),

                if (nouveauRecord)
                  const Text(
                    '🔥 Tu viens de battre ton meilleur score !',
                    textAlign:
                        TextAlign.center,
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
              ],
            ),

            actions: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child:
                        const Text('ACCUEIL'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                      setState(() {
                        questionActuelle = 0;
                        score = 0;
                        reponseChoisie =
                            null;
                        reponseValidee =
                            false;
                        secondesRestantes =
                            15;
                      });

                      demarrerAnimationQuestion();
                      demarrerTimer();
                    },
                    child:
                        const Text('REJOUER'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // ====================================================
  // COULEUR RÉPONSE
  // ====================================================

  Color couleurReponse(
    String reponse,
  ) {
    if (!reponseValidee) {
      return Colors.white;
    }

    final bonneReponse =
        questionsCategorie[questionActuelle]
            ['bonne'];

    if (reponse == bonneReponse) {
      return Colors.green.shade200;
    }

    if (reponse == reponseChoisie) {
      return Colors.red.shade200;
    }

    return Colors.white;
  }

  // ====================================================
  // COULEUR TIMER
  // ====================================================

  Color couleurTimer() {
    if (secondesRestantes <= 5) {
      return Colors.red;
    }

    return Colors.green.shade700;
  }

  // ====================================================
  // DISPOSE
  // ====================================================

  @override
  void dispose() {
    timer?.cancel();

    animationBonneController.dispose();
    animationMauvaiseController.dispose();
    animationQuestionController.dispose();

    super.dispose();
  }

  // ====================================================
  // INTERFACE
  // ====================================================

  @override
  Widget build(BuildContext context) {
    final question =
        questionsCategorie[questionActuelle];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categorie,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // ==========================================
            // QUESTION / SCORE / TIMER
            // ==========================================

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${questionActuelle + 1}/${questionsCategorie.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                Text(
                  'Score : $score',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration:
                      BoxDecoration(
                    color: couleurTimer()
                        .withAlpha(25),
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                    border: Border.all(
                      color: couleurTimer(),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 19,
                        color:
                            couleurTimer(),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$secondesRestantes s',
                        style: TextStyle(
                          color:
                              couleurTimer(),
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ==========================================
            // PROGRESSION
            // ==========================================

            LinearProgressIndicator(
              value:
                  (questionActuelle + 1) /
                      questionsCategorie.length,
              minHeight: 8,
              borderRadius:
                  BorderRadius.circular(10),
            ),

            const SizedBox(height: 30),

            // ==========================================
            // QUESTION ANIMÉE
            // ==========================================

            FadeTransition(
              opacity:
                  animationQuestionController,
              child: SlideTransition(
                position:
                    Tween<Offset>(
                  begin:
                      const Offset(
                    0.15,
                    0,
                  ),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent:
                        animationQuestionController,
                    curve:
                        Curves.easeOut,
                  ),
                ),
                child: Container(
                  width:
                      double.infinity,
                  padding:
                      const EdgeInsets.all(
                    25,
                  ),
                  decoration:
                      BoxDecoration(
                    color:
                        Colors.green.shade50,
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Text(
                    question['question'],
                    textAlign:
                        TextAlign.center,
                    style:
                        const TextStyle(
                      fontSize: 21,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ==========================================
            // RÉPONSES
            // ==========================================

            Expanded(
              child: ListView.builder(
                itemCount:
                    question['reponses']
                        .length,

                itemBuilder:
                    (context, index) {
                  final reponse =
                      question['reponses']
                          [index];

                  final estBonne =
                      reponse ==
                          question['bonne'];

                  final estChoisie =
                      reponse ==
                          reponseChoisie;

                  Widget bouton =
                      ElevatedButton(
                    onPressed: () {
                      choisirReponse(
                        reponse,
                      );
                    },

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          couleurReponse(
                        reponse,
                      ),
                      foregroundColor:
                          Colors.black,
                      padding:
                          const EdgeInsets
                              .symmetric(
                        vertical: 16,
                        horizontal: 15,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                          15,
                        ),
                      ),
                    ),

                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Colors.green,
                          foregroundColor:
                              Colors.white,
                          child: Text(
                            String.fromCharCode(
                              65 + index,
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 15,
                        ),

                        Expanded(
                          child: Text(
                            reponse,
                            style:
                                const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),

                        if (reponseValidee &&
                            estBonne)
                          const Icon(
                            Icons
                                .check_circle,
                            color:
                                Colors.green,
                          ),

                        if (reponseValidee &&
                            estChoisie &&
                            !estBonne)
                          const Icon(
                            Icons.cancel,
                            color:
                                Colors.red,
                          ),
                      ],
                    ),
                  );

                  // ANIMATION BONNE RÉPONSE
                  if (reponseValidee &&
                      estBonne) {
                    return ScaleTransition(
                      scale:
                          Tween<double>(
                        begin: 1,
                        end: 1.03,
                      ).animate(
                        CurvedAnimation(
                          parent:
                              animationBonneController,
                          curve:
                              Curves.easeOutBack,
                        ),
                      ),
                      child:
                          _conteneurReponse(
                        bouton,
                      ),
                    );
                  }

                  // ANIMATION MAUVAISE RÉPONSE
                  if (reponseValidee &&
                      estChoisie &&
                      !estBonne) {
                    return AnimatedBuilder(
                      animation:
                          animationMauvaiseController,
                      builder:
                          (context, child) {
                        final valeur =
                            animationMauvaiseController
                                .value;

                        final decalage =
                            (valeur < 0.5
                                    ? valeur
                                    : 1 - valeur) *
                                12;

                        return Transform.translate(
                          offset:
                              Offset(
                            decalage *
                                (index.isEven
                                    ? 1
                                    : -1),
                            0,
                          ),
                          child: child,
                        );
                      },
                      child:
                          _conteneurReponse(
                        bouton,
                      ),
                    );
                  }

                  return _conteneurReponse(
                    bouton,
                  );
                },
              ),
            ),

            // ==========================================
            // TEMPS ÉCOULÉ
            // ==========================================

            if (reponseValidee &&
                secondesRestantes == 0 &&
                reponseChoisie == null)
              Container(
                width:
                    double.infinity,
                margin:
                    const EdgeInsets.only(
                  bottom: 10,
                ),
                padding:
                    const EdgeInsets.all(
                  12,
                ),
                decoration:
                    BoxDecoration(
                  color:
                      Colors.red.shade50,
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.timer_off,
                      color: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Temps écoulé ! La bonne réponse est en vert.',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // ==========================================
            // BOUTON SUIVANT
            // ==========================================

            if (reponseValidee)
              TweenAnimationBuilder<double>(
                tween: Tween(
                  begin: 0,
                  end: 1,
                ),
                duration:
                    const Duration(
                  milliseconds: 400,
                ),
                curve:
                    Curves.easeOutBack,
                builder: (
                  context,
                  value,
                  child,
                ) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: SizedBox(
                  width:
                      double.infinity,
                  height: 55,
                  child:
                      ElevatedButton(
                    onPressed:
                        questionSuivante,
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(
                        0xFF087830,
                      ),
                      foregroundColor:
                          Colors.white,
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius
                                .circular(
                          15,
                        ),
                      ),
                    ),
                    child: Text(
                      questionActuelle ==
                              questionsCategorie
                                      .length -
                                  1
                          ? 'VOIR LE RÉSULTAT'
                          : 'QUESTION SUIVANTE',
                      style:
                          const TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ====================================================
  // CONTENEUR RÉPONSE
  // ====================================================

  Widget _conteneurReponse(
    Widget bouton,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 12,
      ),
      width:
          double.infinity,
      child: bouton,
    );
  }
}