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
	String get drink_completion => 'Drink Completeion';
	String get hydrate => 'Hydrate';
	String get drink_types => 'Drink Types';
	String get weekly => 'Weekly';
	String get monthly => 'Monthly';
	String get yearly => 'Yearly';
	String get what_is_your_gender => 'What\'s your gender?';
	String get hydrify_is_here_to_tailor_a_hydration_plan_just_for_you => 'Hydrify is here to tailor a hydration plan just for you! Let\'s kick things off by getting to know you better.';
	String get how_tall_are_you => 'How tall are you?';
	String get your_height_is_another_key_factor_in_customizing_your_hydration_plan_choose_your_height_measurement => 'Your height is another key factor in customizing your hydration plan. Choose your height measurement:';
	String get male => 'Male';
	String get female => 'Female';
	String get prefer_not_to_say => 'Prefer not to say';
	String get how_much_do_you_weight => 'How much do you weight?';
	String get your_weight_plays_a_crucial_role_in_determining_your_hydration_needs_select_your_weight_below => 'Your weight plays a crucial role in determining your hydration needs. Select your weight below:';
	String get how_old_are_you => 'What\'s your age?';
	String get age_also_have_impacts_to_your_body_s_hydration_needs_scroll_and_select_your_age_from_the_options_below => 'Age also have impacts to your body\'s hydration needs. Scroll and select your age from the options below:';
	String get what_time_do_you_usually_wake_up => 'What\'s time do you usually wake up?';
	String get your_wake_up_time_helps_us_tailor_your_hydration_schedule_pick_your_waking_hour => 'Your wake-up time helps us tailor your hydration schedule. Pick your waking hour:';
	String get what_time_do_you_usually_go_to_bed => 'What\'s time do you usually go to bed?';
	String get your_bedtime_influences_your_hydration_pattern_choose_your_typical_bedtime => 'Your bedtime influences your hydration pattern.\nChoose your typical bedtime:';
	String get what_your_activity_level => 'What\'s your activity level?';
	String get understanding_your_activity_is_vital_for_crafting_a_personalized_hydration_plan_pick_the_option_that_best_describes_your_typical_activity_level => 'Understanding your activity is vital for crafting a personalized hydration plan. Pick the option that best describes your typical activity level:';
	String get sedentary => 'Sedentary';
	String get light_activity => 'Light Activity';
	String get moderate_active => 'Moderate Active';
	String get very_active => 'Very Active';
	String get limited_physical_activity_mostly_sitting_or_lying_down => 'Limited physical activity, mostly sitting or lying down.';
	String get some_movement_throughout_the_day_such_as_light_walking_or_occasional_standing => 'Some movement throughout the day, such as light walking or occasional standing.';
	String get regular_exercise_or_physical_activity_such_as_jogging_or_cycling => 'Regular exercise or physical activity, such as jogging or cycling.';
	String get intense_physical_activity_or_training_such_as_heavy_lifting_or_high_intensity_training => 'Intense physical activity or training, such as heavy lifting or high-intensity training.';
	String get what_the_climate_weather_like_in_your_area => 'What\'s the climate/weather like in your area?';
	String get hot => 'Hot';
	String get temperate => 'Temperate';
	String get cold => 'Cold';
	String get generating_personalized_hydration_plan_for_you => 'Generating personalized hydration plan for you...';
	String get this_will_just_take_a_moment_get_ready_to_transform_your_hidration_journey => 'This will just take a moment. Get ready to transform your hidration journey!';
	String get your_daily_goal_is => 'Your daily goal is';
	String get adjust => 'Adjust';
	String get continue_text => 'Continue';
	String get external_factors_like_weather_can_influence_your_hydration_needs_let_us_know_the_current_climate_in_your_area => 'External factors like weather can influence your hydration needs. Let us know the current climate in your area:';
	String get please_wait => 'Please wait...';
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
			case 'core.drink_completion': return 'Drink Completeion';
			case 'core.hydrate': return 'Hydrate';
			case 'core.drink_types': return 'Drink Types';
			case 'core.weekly': return 'Weekly';
			case 'core.monthly': return 'Monthly';
			case 'core.yearly': return 'Yearly';
			case 'core.what_is_your_gender': return 'What\'s your gender?';
			case 'core.hydrify_is_here_to_tailor_a_hydration_plan_just_for_you': return 'Hydrify is here to tailor a hydration plan just for you! Let\'s kick things off by getting to know you better.';
			case 'core.how_tall_are_you': return 'How tall are you?';
			case 'core.your_height_is_another_key_factor_in_customizing_your_hydration_plan_choose_your_height_measurement': return 'Your height is another key factor in customizing your hydration plan. Choose your height measurement:';
			case 'core.male': return 'Male';
			case 'core.female': return 'Female';
			case 'core.prefer_not_to_say': return 'Prefer not to say';
			case 'core.how_much_do_you_weight': return 'How much do you weight?';
			case 'core.your_weight_plays_a_crucial_role_in_determining_your_hydration_needs_select_your_weight_below': return 'Your weight plays a crucial role in determining your hydration needs. Select your weight below:';
			case 'core.how_old_are_you': return 'What\'s your age?';
			case 'core.age_also_have_impacts_to_your_body_s_hydration_needs_scroll_and_select_your_age_from_the_options_below': return 'Age also have impacts to your body\'s hydration needs. Scroll and select your age from the options below:';
			case 'core.what_time_do_you_usually_wake_up': return 'What\'s time do you usually wake up?';
			case 'core.your_wake_up_time_helps_us_tailor_your_hydration_schedule_pick_your_waking_hour': return 'Your wake-up time helps us tailor your hydration schedule. Pick your waking hour:';
			case 'core.what_time_do_you_usually_go_to_bed': return 'What\'s time do you usually go to bed?';
			case 'core.your_bedtime_influences_your_hydration_pattern_choose_your_typical_bedtime': return 'Your bedtime influences your hydration pattern.\nChoose your typical bedtime:';
			case 'core.what_your_activity_level': return 'What\'s your activity level?';
			case 'core.understanding_your_activity_is_vital_for_crafting_a_personalized_hydration_plan_pick_the_option_that_best_describes_your_typical_activity_level': return 'Understanding your activity is vital for crafting a personalized hydration plan. Pick the option that best describes your typical activity level:';
			case 'core.sedentary': return 'Sedentary';
			case 'core.light_activity': return 'Light Activity';
			case 'core.moderate_active': return 'Moderate Active';
			case 'core.very_active': return 'Very Active';
			case 'core.limited_physical_activity_mostly_sitting_or_lying_down': return 'Limited physical activity, mostly sitting or lying down.';
			case 'core.some_movement_throughout_the_day_such_as_light_walking_or_occasional_standing': return 'Some movement throughout the day, such as light walking or occasional standing.';
			case 'core.regular_exercise_or_physical_activity_such_as_jogging_or_cycling': return 'Regular exercise or physical activity, such as jogging or cycling.';
			case 'core.intense_physical_activity_or_training_such_as_heavy_lifting_or_high_intensity_training': return 'Intense physical activity or training, such as heavy lifting or high-intensity training.';
			case 'core.what_the_climate_weather_like_in_your_area': return 'What\'s the climate/weather like in your area?';
			case 'core.hot': return 'Hot';
			case 'core.temperate': return 'Temperate';
			case 'core.cold': return 'Cold';
			case 'core.generating_personalized_hydration_plan_for_you': return 'Generating personalized hydration plan for you...';
			case 'core.this_will_just_take_a_moment_get_ready_to_transform_your_hidration_journey': return 'This will just take a moment. Get ready to transform your hidration journey!';
			case 'core.your_daily_goal_is': return 'Your daily goal is';
			case 'core.adjust': return 'Adjust';
			case 'core.continue_text': return 'Continue';
			case 'core.external_factors_like_weather_can_influence_your_hydration_needs_let_us_know_the_current_climate_in_your_area': return 'External factors like weather can influence your hydration needs. Let us know the current climate in your area:';
			case 'core.please_wait': return 'Please wait...';
			default: return null;
		}
	}
}

