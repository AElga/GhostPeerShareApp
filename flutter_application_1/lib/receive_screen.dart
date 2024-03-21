import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:permission_handler/permission_handler.dart';

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
    _requestPermissions().then((granted) {
      if (granted) {
        _bluetoothManager.startScan(timeout: const Duration(seconds: 4));
      } else {
        // Consider prompting the user about the necessity of Bluetooth permissions.
        print('Bluetooth permissions are not granted');
      }
    });
  }

  Future<bool> _requestPermissions() async {
    var status = await Permission.bluetoothScan.request();
    if (status != PermissionStatus.granted) {
      return false;
    }
    status = await Permission.bluetoothConnect.request();
    return status == PermissionStatus.granted;
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
                title: Text(device.name ?? 'Unknown Device'),
                subtitle: Text(device.address ?? 'Unknown Address'),
                onTap: () async {
                  try {
                    await _bluetoothManager.connect(device);
                    // Handle successful connection, e.g., navigate to a screen to receive data
                  } catch (error) {
                    // Handle connection errors, e.g., show an error message
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
