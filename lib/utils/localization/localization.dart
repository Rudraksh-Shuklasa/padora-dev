import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'localization_en.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
      ].contains(locale.languageCode);

// @override
//   bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => _load(locale);

  static Future<Localization> _load(Locale locale) async {
    final String name =
        (locale.countryCode == null || locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    // if( locale.languageCode == "fr" ) {
    //   return LocalizationFR();
    // } else {
    //   return LocalizationEN();
    // }

    return LocalizationEN();
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}

abstract class Localization {
  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  String get internetNotConnected;

  String get msgEnterAddress;

  String get msgEnterValidAddress;

  String get msgEnterName;

  String get msgEnterMobile;

  String get errEnteEmail;

  String get tltForgotPassword;

  String get hintEmail;

  String get tltResetPassword;

  String get tltBackLogin;

  String get tltLogin;

  String get hintPassword;

  String get lblOr;

  String get tltCreateAccount;

  String get errEnterPassword;

  String get tltSignup;

  String get tltUsername;

  String get errUsername;

  String get hintUsername;

  // Card sagment
  String get tltAddCard;

  String get lblAddCardDetails;

  String get lblCardnumber;

  String get lblExpirydate;

  String get lblCvvnumber;

  String get lblFullName;

  String get errCardNumber;

  String get errExpiryDate;

  String get errCvvnumber;

  String get lblAddCard;

  String get lblExpiry;

  String get tltDefualtCard;

  String get lblNoCardAvailable;

  String get tltSavedCard;

  String get lblAddNewCard;

  String get lblContinue;

  String get lblPaymentMethodName;

  String get lblIsDefaultMethod;

  // home sagment

  String get tltHome;

  String get tltCards;

  String get tltReceipts;

  // cart sagment

  String get tltCart;

  String get lblItemPicked;

  String get lblItemCount;

  String get lblDoller;

  String get tltReceiptes;

  String get lblPaymentMethod;

  String get infoCloseFridge;

  String get lblTotal;

  String get tltChangeDefualt;

  // success recepits sagment

  String get tltShopAgain;

  String get tltItemList;

  String get tltClose;

  String get tltRetry;

  // scan qr code sagment

  String get infScanQrToUnlock;

  String get lblOrCapital;

  String get lblUnlockByFridgeCode;

  String get hintFridgeCode;

  String get lblUnlock;
}
