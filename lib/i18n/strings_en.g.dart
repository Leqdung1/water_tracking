///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCoreEn core = TranslationsCoreEn.internal(_root);
}

// Path: core
class TranslationsCoreEn {
	TranslationsCoreEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get login => 'Login';
	String get register => 'Register';
	String get email => 'Email';
	String get password => 'Password';
	String get confirmPassword => 'Confirm Password';
	String get forgotPassword => 'Forgot Password';
	String get createAccount => 'Create Account';
	String get alreadyHaveAccount => 'Already have an account';
	String get dontHaveAccount => 'Don\'t have an account';
	String get loginSuccess => 'Login successfully';
	String get createAccountToTrack => 'Create an account to track your water intake, set reminders, and unlock achievements';
	String get signUp => 'Sign Up...';
	String get emailIsRequired => 'Email is required';
	String get home => 'Home';
	String get history => 'History';
	String get report => 'Report';
	String get setting => 'Setting';
	String get logout => 'Logout';
	String drink_n_mL({required Object n}) => 'Drink (${n} mL)';
	String get view_all => 'View All';
	String get no_history_today => 'You have no history of water intake today';
	String get switch_cup_size => 'Switch Cup Size';
	String get monday => 'Monday';
	String get tuesday => 'Tuesday';
	String get wednesday => 'Wednesday';
	String get thursday => 'Thursday';
	String get friday => 'Friday';
	String get saturday => 'Saturday';
	String get sunday => 'Sunday';
	String get orDrink => 'Or Drink';
	String get beer => 'Beer';
	String get carbon => 'Carbon';
	String get coconute => 'Coconute';
	String get coffee => 'Coffee';
	String get juice => 'Juice';
	String get liquor => 'Liquor';
	String get smoothie => 'Smoothie';
	String get soda => 'Soda';
	String get tea => 'Tea';
	String get wine => 'Wine';
	String get today => 'Today';
	String get yesterday => 'Yesterday';
	String get january => 'January';
	String get february => 'February';
	String get march => 'March';
	String get april => 'April';
	String get may => 'May';
	String get june => 'June';
	String get july => 'July';
	String get august => 'August';
	String get september => 'September';
	String get october => 'October';
	String get november => 'November';
	String get december => 'December';
	String get editWaterIntake => 'Edit Water Intake';
	String get cancel => 'Cancel';
	String get save => 'Save';
	String get ok => 'OK';
	String get back => 'Back';
	String get setDate => 'Set Date';
	String get setHour => 'Set Hour';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'core.login': return 'Login';
			case 'core.register': return 'Register';
			case 'core.email': return 'Email';
			case 'core.password': return 'Password';
			case 'core.confirmPassword': return 'Confirm Password';
			case 'core.forgotPassword': return 'Forgot Password';
			case 'core.createAccount': return 'Create Account';
			case 'core.alreadyHaveAccount': return 'Already have an account';
			case 'core.dontHaveAccount': return 'Don\'t have an account';
			case 'core.loginSuccess': return 'Login successfully';
			case 'core.createAccountToTrack': return 'Create an account to track your water intake, set reminders, and unlock achievements';
			case 'core.signUp': return 'Sign Up...';
			case 'core.emailIsRequired': return 'Email is required';
			case 'core.home': return 'Home';
			case 'core.history': return 'History';
			case 'core.report': return 'Report';
			case 'core.setting': return 'Setting';
			case 'core.logout': return 'Logout';
			case 'core.drink_n_mL': return ({required Object n}) => 'Drink (${n} mL)';
			case 'core.view_all': return 'View All';
			case 'core.no_history_today': return 'You have no history of water intake today';
			case 'core.switch_cup_size': return 'Switch Cup Size';
			case 'core.monday': return 'Monday';
			case 'core.tuesday': return 'Tuesday';
			case 'core.wednesday': return 'Wednesday';
			case 'core.thursday': return 'Thursday';
			case 'core.friday': return 'Friday';
			case 'core.saturday': return 'Saturday';
			case 'core.sunday': return 'Sunday';
			case 'core.orDrink': return 'Or Drink';
			case 'core.beer': return 'Beer';
			case 'core.carbon': return 'Carbon';
			case 'core.coconute': return 'Coconute';
			case 'core.coffee': return 'Coffee';
			case 'core.juice': return 'Juice';
			case 'core.liquor': return 'Liquor';
			case 'core.smoothie': return 'Smoothie';
			case 'core.soda': return 'Soda';
			case 'core.tea': return 'Tea';
			case 'core.wine': return 'Wine';
			case 'core.today': return 'Today';
			case 'core.yesterday': return 'Yesterday';
			case 'core.january': return 'January';
			case 'core.february': return 'February';
			case 'core.march': return 'March';
			case 'core.april': return 'April';
			case 'core.may': return 'May';
			case 'core.june': return 'June';
			case 'core.july': return 'July';
			case 'core.august': return 'August';
			case 'core.september': return 'September';
			case 'core.october': return 'October';
			case 'core.november': return 'November';
			case 'core.december': return 'December';
			case 'core.editWaterIntake': return 'Edit Water Intake';
			case 'core.cancel': return 'Cancel';
			case 'core.save': return 'Save';
			case 'core.ok': return 'OK';
			case 'core.back': return 'Back';
			case 'core.setDate': return 'Set Date';
			case 'core.setHour': return 'Set Hour';
			default: return null;
		}
	}
}

