import 'package:psdk_device_adapter/psdk_device_adapter.dart';
import 'package:psdk_frame_father/father/types/lifecycle.dart';
import 'generic_esc.dart';

class ESC {
  static GenericESC genericWithConnectedDevice(ConnectedDevice connectedDevice) {
    return genericWithLifecycle(Lifecycle(connectedDevice: connectedDevice));
  }

  static GenericESC genericWithLifecycle(Lifecycle lifecycle) {
    return GenericESC( lifecycle: lifecycle);
  }
}
