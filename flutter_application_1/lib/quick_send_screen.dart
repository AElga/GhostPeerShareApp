import 'package:flutter/material.dart';
import 'package:flutter_application_1/bluetooth_manager.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';

class QuickSendScreen extends StatefulWidget {
  const QuickSendScreen({Key? key}) : super(key: key);

  @override
  _QuickSendScreenState createState() => _QuickSendScreenState();
}

class _QuickSendScreenState extends State<QuickSendScreen> {
  final BluetoothManager _bluetoothManager = BluetoothManager.instance;
  final List<BluetoothDevice> _devicesList = [];
  BluetoothDevice? _selectedDevice;

  @override
  void initState() {
    super.initState();
    startScan();
  }

  bool isScanning = false;

  void startScan() {
    if (!isScanning) {
      isScanning = true;
      _bluetoothManager
          .startScan(timeout: const Duration(seconds: 4))
          .then((_) {
        isScanning = false;
      }).catchError((error) {
        // Handle the error or simply log it
        isScanning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Send'),
      ),
      body: _devicesList.isEmpty
          ? Center(
              child: ElevatedButton(
                onPressed: startScan,
                child: const Text('Scan for Devices'),
              ),
            )
          : ListView.builder(
              itemCount: _devicesList.length,
              itemBuilder: (context, index) {
                var device = _devicesList[index];
                return ListTile(
                  title: Text(device.name ?? 'Unknown Device'),
                  subtitle: Text(device.address ?? 'Unknown address'),
                  onTap: () {
                    setState(() {
                      _selectedDevice = device;
                    });
                  },
                  trailing: _selectedDevice?.address == device.address
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendData,
        child: const Icon(Icons.send),
      ),
    );
  }

  void _sendData() {
    if (_selectedDevice != null) {
      // Connect and send data
    }
  }
}
