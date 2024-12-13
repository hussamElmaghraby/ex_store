class FontFamilyHelper {


  const FontFamilyHelper._();

  static const instance = FontFamilyHelper._();


  static const cairoArabic = "Cairo";
  static const poppinsEnglish = "Poppins";


  static String getLocalizedFontFamily(){
    ///TODO Get the current language of the app here from SharedPref
    const currentLanguage = 'ar';
    if(currentLanguage == 'ar'){
      return cairoArabic;
    }else {
      return poppinsEnglish;
    }
  }
}