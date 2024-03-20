import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bluetooth_manager.dart'; // Ensure this points to the correct file where BluetoothDeviceManager is defined
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:permission_handler/permission_handler.dart';

class MyBluetoothPage extends StatefulWidget {
  const MyBluetoothPage({Key? key}) : super(key: key);

  @override
  _MyBluetoothPageState createState() => _MyBluetoothPageState();
}

class _MyBluetoothPageState extends State<MyBluetoothPage> {
  final BluetoothDeviceManager _bluetoothDeviceManager =
      BluetoothDeviceManager();
  BluetoothDevice? _selectedDevice;

  @override
  void initState() {
    super.initState();
    requestBluetoothPermissions().then((_) {
      _bluetoothDeviceManager.startScan();
    });
  }

  Future<void> requestBluetoothPermissions() async {
    var bluetoothScanStatus = await Permission.bluetoothScan.status;
    if (!bluetoothScanStatus.isGranted) {
      await Permission.bluetoothScan.request();
    }

    var bluetoothConnectStatus = await Permission.bluetoothConnect.status;
    if (!bluetoothConnectStatus.isGranted) {
      await Permission.bluetoothConnect.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Devices'),
      ),
      body: StreamBuilder<List<BluetoothDevice>>(
        stream: _bluetoothDeviceManager.scanResults,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var device = snapshot.data![index];
                return ListTile(
                  title: Text(device.name ?? 'Unknown Device'),
                  subtitle: Text(device.address ?? 'Unknown address'),
                  onTap: () async {
                    _selectedDevice = device;
                    await _bluetoothDeviceManager.connect(device);
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedDevice != null) {
            _bluetoothDeviceManager.sendData(utf8.encode('Hello World'));
          }
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
