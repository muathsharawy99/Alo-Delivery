import 'package:flutter/material.dart';

class AppConstants {
  /// The design frame the screens were drawn on.
  static const Size appSize = Size(430, 932);
  static const splashDuration = Duration(milliseconds: 2500);

  /// Login answers with this message while the account isn't activated.
  static const pendingMessage =
      'You cannot complete the process because your account is inactive';
  static const acceptedStatus = 'accepted';

  // ── Contact (no offers available)
  static const supportPhone = '+201555776493';
  static const supportWhatsapp = '201555776493';

  /// Placeholder avatar on the home app bar and offer cards.
  static const placeholderAvatar =
      'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
}
