import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en', 'es', 'ar', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
    String? esText = '',
    String? arText = '',
    String? ptText = '',
  }) =>
      [frText, enText, esText, arText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // pageAccueil
  {
    'jeos2dc3': {
      'fr': 'Journal de Gratitude',
      'ar': 'مذكرات الامتنان',
      'en': 'Gratitude Journal',
      'es': 'Diario de gratitud',
      'pt': 'Diário de gratidão',
    },
    '1ry21dq5': {
      'fr': 'Aujourd\'hui, je suis reconnaissante pour...',
      'ar': 'اليوم أنا ممتن ل...',
      'en': 'Today I am grateful for...',
      'es': 'Hoy me siento agradecido por...',
      'pt': 'Hoje sou grato por...',
    },
    '6i6rjfj0': {
      'fr': 'Sauvegarder',
      'ar': 'للحفاظ على',
      'en': 'To safeguard',
      'es': 'Para salvaguardar',
      'pt': 'Para salvaguardar',
    },
  },
  // tutoPage
  {
    '2gri74s6': {
      'fr': 'Guide de Gratitude',
      'ar': 'دليل الامتنان',
      'en': 'Gratitude Guide',
      'es': 'Guía de gratitud',
      'pt': 'Guia de gratidão',
    },
    'jd893qtd': {
      'fr': 'Découvrez l\'art de la reconnaissance quotidienne',
      'ar': 'اكتشف فن الامتنان اليومي',
      'en': 'Discover the art of daily gratitude',
      'es': 'Descubra el arte de la gratitud diaria',
      'pt': 'Descubra a arte da gratidão diária',
    },
    '0a9leqfi': {
      'fr': 'Comment ça marche ?',
      'ar': 'كيف يعمل؟',
      'en': 'How does it work?',
      'es': '¿Cómo funciona?',
      'pt': 'Como funciona?',
    },
    'ry2efu0a': {
      'fr': '1',
      'ar': '1',
      'en': '1',
      'es': '1',
      'pt': '1',
    },
    'netvm94x': {
      'fr': 'Prenez un moment de calme chaque soir',
      'ar': 'خذ لحظة هدوء كل مساء',
      'en': 'Take a quiet moment every evening',
      'es': 'Tómate un momento de tranquilidad cada noche.',
      'pt': 'Tire um momento de silêncio todas as noites',
    },
    't1c3fdb2': {
      'fr': 'Choisissez un endroit tranquille pour réfléchir à votre journée',
      'ar': 'اختر مكانًا هادئًا للتفكير في يومك',
      'en': 'Choose a quiet place to reflect on your day',
      'es': 'Elige un lugar tranquilo para reflexionar sobre tu día.',
      'pt': 'Escolha um lugar tranquilo para refletir sobre o seu dia',
    },
    'r6dbfd9c': {
      'fr': '2',
      'ar': '2',
      'en': '2',
      'es': '2',
      'pt': '2',
    },
    'sadvuxot': {
      'fr': 'Notez vos gratitudes',
      'ar': 'اكتب امتنانك',
      'en': 'Write down your gratitudes',
      'es': 'Escribe tus gratitudes',
      'pt': 'Escreva suas gratidões',
    },
    'a1kvsznh': {
      'fr':
          'Écrivez 5 choses pour lesquelles vous êtes reconnaissante aujourd\'hui',
      'ar': 'اكتب 5 أشياء تشعر بالامتنان لها اليوم',
      'en': 'Write down 5 things you are grateful for today',
      'es': 'Escribe 5 cosas por las que estás agradecido hoy',
      'pt': 'Escreva 5 coisas pelas quais você é grato hoje',
    },
    'xxieg4ax': {
      'fr': '3',
      'ar': '3',
      'en': '3',
      'es': '3',
      'pt': '3',
    },
    '6tcwrd9h': {
      'fr': 'Ressentez la joie',
      'ar': 'اشعر بالفرح',
      'en': 'Feel the joy',
      'es': 'Siente la alegría',
      'pt': 'Sinta a alegria',
    },
    '0mdft225': {
      'fr':
          'Prenez le temps de ressentir la gratitude pour chaque élément noté',
      'ar': 'خذ وقتًا لتشعر بالامتنان لكل عنصر قمت بتدوينه.',
      'en': 'Take time to feel gratitude for each item noted.',
      'es': 'Tómate el tiempo para sentir gratitud por cada elemento anotado.',
      'pt': 'Reserve um tempo para sentir gratidão por cada item anotado.',
    },
    'b61he8rw': {
      'fr': 'Commencer mon journal',
      'ar': 'ابدأ يومياتي',
      'en': 'Start my journal',
      'es': 'Empezar mi diario',
      'pt': 'Comece meu diário',
    },
  },
  // notationPage
  {
    'ifeb39ug': {
      'fr': 'Votre Avis Compte',
      'ar': 'رأيك مهم',
      'en': 'Your Opinion Matters',
      'es': 'Tu opinión importa',
      'pt': 'Sua opinião importa',
    },
    'oty8e6hk': {
      'fr': 'Aidez-nous à améliorer votre expérience de gratitude',
      'ar': 'ساعدنا على تحسين تجربة الامتنان الخاصة بك',
      'en': 'Help us improve your gratitude experience',
      'es': 'Ayúdanos a mejorar tu experiencia de gratitud',
      'pt': 'Ajude-nos a melhorar sua experiência de gratidão',
    },
    'supov1te': {
      'fr': 'Vous appréciez Gratitude+ ?',
      'ar': 'هل تحب Gratitude+؟',
      'en': 'Do you like Gratitude+?',
      'es': '¿Te gusta Gratitude+?',
      'pt': 'Você gosta do Gratitude+?',
    },
    'go7inmnx': {
      'fr':
          'Votre retour nous aide à créer une meilleure expérience pour tous les utilisateurs du journal de gratitude.',
      'ar':
          'تساعدنا تعليقاتك على إنشاء تجربة أفضل لجميع مستخدمي مجلة Gratitude Journal.',
      'en':
          'Your feedback helps us create a better experience for all Gratitude Journal users.',
      'es':
          'Sus comentarios nos ayudan a crear una mejor experiencia para todos los usuarios del Diario de Gratitud.',
      'pt':
          'Seu feedback nos ajuda a criar uma experiência melhor para todos os usuários do Gratitude Journal.',
    },
    '6sh64nod': {
      'fr': 'Notez-nous et écrivez un commentaire',
      'ar': 'قم بتقييمنا وكتابة مراجعة',
      'en': 'Rate us and write a review',
      'es': 'Califícanos y escribe una reseña',
      'pt': 'Avalie-nos e escreva uma avaliação',
    },
    'oek9rfo1': {
      'fr': 'Noter sur l\'App Store',
      'ar': 'قم بتقييم التطبيق على متجر التطبيقات',
      'en': 'Rate on the App Store',
      'es': 'Calificar en la App Store',
      'pt': 'Avalie na App Store',
    },
  },
  // loginPage
  {
    'jpaug43c': {
      'fr': 'Bienvenue',
      'ar': 'مرحباً',
      'en': 'Welcome',
      'es': 'Bienvenido',
      'pt': 'Bem-vindo',
    },
    'yfnta7m0': {
      'fr': 'Débutez votre voyage vers la reconaissance',
      'ar': 'ابدأ رحلتك نحو الاعتراف',
      'en': 'Start your journey to recognition',
      'es': 'Comienza tu viaje hacia el reconocimiento',
      'pt': 'Comece sua jornada para o reconhecimento',
    },
    'nbmmkc42': {
      'fr': 'Découvrez la puissance de la gratitude',
      'ar': 'اكتشف قوة الامتنان',
      'en': 'Discover the power of gratitude',
      'es': 'Descubra el poder de la gratitud',
      'pt': 'Descubra o poder da gratidão',
    },
    's22j6cvh': {
      'fr': 'Commencer l\'expérience',
      'ar': 'ابدأ التجربة',
      'en': 'Start the experience',
      'es': 'Comienza la experiencia',
      'pt': 'Comece a experiência',
    },
  },
  // calendarPage
  {
    '9ok2l68k': {
      'fr': 'Mes Gratitudes',
      'ar': 'امتناني',
      'en': 'My Gratitudes',
      'es': 'Mis gratitudes',
      'pt': 'Minhas gratidões',
    },
    '4u7n4lxf': {
      'fr': 'Ce jour, j\'ai été reconnaissante pour...',
      'ar': 'اليوم كنت ممتنًا لـ...',
      'en': 'Today I was grateful for...',
      'es': 'Hoy me sentí agradecido por...',
      'pt': 'Hoje eu fiquei grato por...',
    },
  },
  // Miscellaneous
  {
    '9pb6rrnx': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'hf1c8yh5': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '86hv94y9': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'th8fgrim': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '2aziq78l': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'w3julu05': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '0js9uuno': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'ulb1jx2c': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '6eoeuy3q': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'uk7x72r1': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'l6kdxr0l': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'r5arv9mr': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'wba4rlq9': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'ctgbw4np': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '65a2imao': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'ueyyzaou': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '06suewzd': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    '0s5gmb1o': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'hna86qvk': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'irq619ge': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'vv52kmmt': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'vgp2ky9i': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'sno2f3x9': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'h5o7fco0': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
    'glzitslh': {
      'fr': '',
      'ar': '',
      'en': '',
      'es': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
