///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsVi extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsVi({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.vi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <vi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsVi _root = this; // ignore: unused_field

	@override 
	TranslationsVi $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsVi(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCoreVi core = _TranslationsCoreVi._(_root);
}

// Path: core
class _TranslationsCoreVi extends TranslationsCoreEn {
	_TranslationsCoreVi._(TranslationsVi root) : this._root = root, super.internal(root);

	final TranslationsVi _root; // ignore: unused_field

	// Translations
	@override String get login => 'Đăng nhập';
	@override String get register => 'Đăng ký';
	@override String get email => 'Email';
	@override String get password => 'Mật khẩu';
	@override String get confirmPassword => 'Xác nhận mật khẩu';
	@override String get forgotPassword => 'Quên mật khẩu';
	@override String get createAccount => 'Tạo tài khoản';
	@override String get alreadyHaveAccount => 'Đã có tài khoản';
	@override String get dontHaveAccount => 'Chưa có tài khoản';
	@override String get loginSuccess => 'Đăng nhập thành công';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsVi {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'core.login': return 'Đăng nhập';
			case 'core.register': return 'Đăng ký';
			case 'core.email': return 'Email';
			case 'core.password': return 'Mật khẩu';
			case 'core.confirmPassword': return 'Xác nhận mật khẩu';
			case 'core.forgotPassword': return 'Quên mật khẩu';
			case 'core.createAccount': return 'Tạo tài khoản';
			case 'core.alreadyHaveAccount': return 'Đã có tài khoản';
			case 'core.dontHaveAccount': return 'Chưa có tài khoản';
			case 'core.loginSuccess': return 'Đăng nhập thành công';
			default: return null;
		}
	}
}

