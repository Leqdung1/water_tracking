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
			default: return null;
		}
	}
}

