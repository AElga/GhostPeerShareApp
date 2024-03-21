import 'dart:convert';
import 'package:flutter/material.dart';
import 'bluetooth_manager.dart';
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
    _requestBluetoothPermissions().then((_) {
      _bluetoothDeviceManager.startScan(timeout: const Duration(seconds: 4));
    });
  }

  Future<void> _requestBluetoothPermissions() async {
    await [
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();
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
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No devices found. Try scanning again.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var device = snapshot.data![index];
              return ListTile(
                title: Text(device.name ?? 'Unknown Device'),
                subtitle: Text(device.address ?? 'Unknown address'),
                onTap: () async {
                  setState(() {
                    _selectedDevice = device;
                  });
                  await _bluetoothDeviceManager.connect(device);
                },
                trailing: _selectedDevice?.address == device.address
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_selectedDevice != null) {
            final message = utf8.encode('Hello World');
            await _bluetoothDeviceManager.sendData(message);
          }
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
