import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getDevices() async {
  List<Map<String, dynamic>> devices = []; 
  CollectionReference collectionReferenceDevices = db.collection('devices');
  QuerySnapshot queryDevices = await collectionReferenceDevices.get();
  queryDevices.docs.forEach((documento) {
      devices.add(documento.data() as Map<String, dynamic>); 
  });
  return devices;
}

Future<void> addDevice(String name, String type, String room) async {
  await db.collection("devices").add({
    "name": name,
    "type": type, 
    "room": room,
  });
}

Future<Map<String, dynamic>> getDeviceDetails(String deviceId) async {
  DocumentSnapshot document = await db.collection('devices').doc(deviceId).get();
  return document.data() as Map<String, dynamic>;
}

Future<void> updateDeviceStatus(String deviceId, bool status) async {
    await db.collection("devices").doc(deviceId).update({
      "status": status,
    });
}

Future<Map<String, dynamic>> getAutomationSettings() async {
  try {
    DocumentSnapshot document = await db.collection('automationSettings').doc('default').get();
    if (document.exists) {
      print("Se obtuvo documento");
      return document.data() as Map<String, dynamic>;
    } else {
      print("NO SE OBTUVO DOCUMENTO");
      return {};
    }
  } catch (e) {
    print('Error al obtener las configuraciones de automatización: $e');
    throw e; 
  }
}