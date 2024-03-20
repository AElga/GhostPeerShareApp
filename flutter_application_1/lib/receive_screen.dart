import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  _ReceiveScreenState createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  final BluetoothManager _bluetoothManager = BluetoothManager.instance;

  @override
  void initState() {
    super.initState();
    _bluetoothManager.startScan(timeout: const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Video'),
      ),
      body: StreamBuilder<List<BluetoothDevice>>(
        stream: _bluetoothManager.scanResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No devices found. Pull down to refresh.'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              BluetoothDevice device = snapshot.data![index];
              return ListTile(
                title: Text(device.name ??
                    'Unknown Device'), // Fallback to 'Unknown Device' if null
                subtitle: Text(device.address ??
                    'Unknown Address'), // Fallback to 'Unknown Address' if null
                onTap: () async {
                  // Implement connection logic here
                  // Example: Attempt to connect to the selected Bluetooth device
                  try {
                    await _bluetoothManager.connect(device);
                    // Handle successful connection (e.g., navigate to another screen or show a success message)
                  } catch (error) {
                    // Handle connection errors (e.g., show an error message)
                    print('Error connecting to device: $error');
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
