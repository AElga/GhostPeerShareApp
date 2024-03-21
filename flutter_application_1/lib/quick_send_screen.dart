import 'dart:convert';
import 'package:flutter/material.dart';
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
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
    if (!_isScanning) {
      setState(() {
        _isScanning = true;
        _devicesList.clear(); // Clear previous devices
      });
      _bluetoothManager
          .startScan(timeout: const Duration(seconds: 4))
          .then((result) {
        setState(() {
          _devicesList.addAll(result);
          _isScanning = false;
        });
      }).catchError((error) {
        // Handle or log the error
        setState(() {
          _isScanning = false;
        });
      });
    }
  }

  Future<void> _sendData() async {
    if (_selectedDevice != null && !_isScanning) {
      try {
        await _bluetoothManager.connect(_selectedDevice!);
        List<int> bytes = latin1.encode('Hello world!\n\n\n').toList();
        await _bluetoothManager.writeData(bytes);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Data sent to ${_selectedDevice!.name}")));
      } catch (error) {
        // Handle connection or sending error
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error sending data: $error")));
      } finally {
        await _bluetoothManager.disconnect();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Send'),
        actions: [
          IconButton(
            icon: Icon(_isScanning ? Icons.stop : Icons.search),
            onPressed: _startScan,
          ),
        ],
      ),
      body: _devicesList.isEmpty
          ? Center(
              child: _isScanning
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _startScan,
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
                  onTap: () => setState(() {
                    _selectedDevice = device;
                  }),
                  trailing: _selectedDevice?.address == device.address
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendData,
        backgroundColor: _selectedDevice == null
            ? Colors.grey
            : Theme.of(context).primaryColor,
        child: const Icon(Icons.send),
      ),
    );
  }
}
