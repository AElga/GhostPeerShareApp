import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';

class BluetoothDeviceManager {
  final BluetoothManager _bluetoothManager = BluetoothManager.instance;

  void startScan({required Duration timeout}) {
    _bluetoothManager.startScan(timeout: timeout);
  }

  Stream<List<BluetoothDevice>> get scanResults =>
      _bluetoothManager.scanResults;

  Future<void> connect(BluetoothDevice device) async {
    await _bluetoothManager.connect(device);
  }

  Future<void> disconnect() async {
    await _bluetoothManager.disconnect();
  }

  Future<void> sendData(List<int> bytes) async {
    await _bluetoothManager.writeData(bytes);
  }
}
