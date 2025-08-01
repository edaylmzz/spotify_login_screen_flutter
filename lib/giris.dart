import 'package:flutter/material.dart';

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {

  static const double _backgroundAspectRatio = 1.4;
  static const double _backgroundTopOffset = 0.0;
  static const double _spotifyIconSize = 70.0;
  static const double _spotifyIconTopOffset = 0.37;
  static const double _textTopOffset = 0.32;
  static const double _horizontalPadding = 40.0;
  static const double _buttonSectionBottomOffset = 0.00;
  static const double _buttonHorizontalPadding = 20.0;
  static const double _signUpButtonHeight = 45.0;
  static const double _socialButtonHeight = 45.0;
  static const double _buttonSpacing = 10.0;
  static const double _socialIconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final double arkaplanResimGenisligi = screenWidth * _backgroundAspectRatio;
    final double arkaplanResimYuksekligi = screenHeight * 0.7;
    final double arkaplanResimTopKonumu = screenHeight * _backgroundTopOffset;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: arkaplanResimTopKonumu,
            left: (screenWidth - arkaplanResimGenisligi) / 1.4,
            width: arkaplanResimGenisligi,
            height: arkaplanResimYuksekligi,
            child: Image.asset(
              "resimler/arkaplan.png",
              fit: BoxFit.cover,
            ),
          ),

         //Gradyan Katmanı
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                    Colors.black,
                  ],
                  stops: const [0.0, 0.2, 0.4, 0.8, 1.0],
                ),
              ),
            ),
          ),
          //Spotify İkonu
          Positioned(
            top: screenHeight * _spotifyIconTopOffset,
            left: (screenWidth - _spotifyIconSize) / 2,
            child: Image.asset(
              'resimler/Spotify icon.png',
              width: _spotifyIconSize,
              height: _spotifyIconSize,
            ),
          ),
          //Başlık metni
          Positioned(
            top: screenHeight * ( _textTopOffset * 1.5),
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: Text(
                "Millions of songs.\nFree on Spotify.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ),
          ),
          //Butonlar Bölümü
          Positioned(
            bottom: screenHeight * _buttonSectionBottomOffset + MediaQuery.of(context).padding.bottom,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: _buttonHorizontalPadding),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: _signUpButtonHeight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1DB954), //spotify yeşili
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        elevation: 0, //gölge yok
                      ),
                      child: const Text(
                        "Sign up free",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: _buttonSpacing), //butonlar arası boşluk

                  // "Continue with phone number" butonu
                  _buildImageOutlinedButton(
                    imagePath: "resimler/Phone icon.png",
                    text: "Continue with phone number",
                    onPressed:() {},
                  ),
                  const SizedBox(height: _buttonSpacing / 2),

                  // "Continue with Google" butonu
                  _buildImageOutlinedButton(
                    imagePath: "resimler/google.png",
                    text: "Continue with Google",
                    onPressed:() {},
                  ),
                  const SizedBox(height: _buttonSpacing / 2),

                  // "Continue with Facebook" butonu
                  _buildImageOutlinedButton(
                    imagePath: "resimler/facebook.png",
                    text: "Continue with Facebook",
                    onPressed:() {},
                  ),
                  const SizedBox(height: _buttonSpacing / 2),

                  // "Log in" metin butonu
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildImageOutlinedButton({
    required String imagePath,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: _socialButtonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: _socialIconSize,
              width: _socialIconSize,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}