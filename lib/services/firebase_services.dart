import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDevices() async {
  List devices = [];
  CollectionReference collectionReferenceDevices = db.collection('devices');

  QuerySnapshot queryDevices = await collectionReferenceDevices.get();

  queryDevices.docs.forEach((documento) {
      devices.add(documento.data());
   });

  return devices;
}