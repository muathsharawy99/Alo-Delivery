import 'package:alo_delivery/core/extensions/unified_extensions.dart';

import '../manager/register_state.dart';

/// Toast the error, or toast success and go to login for [type].
void onRegisterStateChanged(RegisterState state, UserType type) {
  if (state.status.isError) {
    FlashHelper.showToast(state.msg);
  } else if (state.status.isDone) {
    FlashHelper.showToast(state.msg, type: MessageType.success);
    replacement(NamedRoutes.login, arg: {RouteString.type: type});
  }
}
