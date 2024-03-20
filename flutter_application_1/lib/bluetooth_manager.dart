import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';

class BluetoothDeviceManager {
  BluetoothManager bluetoothManager = BluetoothManager.instance;

  void startScan() {
    bluetoothManager.startScan(timeout: const Duration(seconds: 4));
  }

  Stream<List<BluetoothDevice>> get scanResults => bluetoothManager.scanResults;

  Future<void> connect(BluetoothDevice device) async {
    await bluetoothManager.connect(device);
  }

  Future<void> disconnect() async {
    await bluetoothManager.disconnect();
  }

  Future<void> sendData(List<int> bytes) async {
    await bluetoothManager.writeData(bytes);
  }
}
