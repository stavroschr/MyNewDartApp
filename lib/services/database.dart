

import 'package:flutter_time2/services/api_path.dart';

import '../app/home/models/job.dart';
import 'firestore_service.dart';
abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job?>> jobsStream();
}

String documentIdFromCurrentDate()=> DateTime.now().toIso8601String();

class FirestoreDatabase  implements Database {
  FirestoreDatabase({required this.uid});
  final String uid; //istance database

  final _service = FirestoreService.instance;//1 object of service can be made


  Future<void> createJob(Job job) =>
      _service.setData(
        path: APIPath.job(uid, documentIdFromCurrentDate()),
        data: job.toMap(),
      );


  Stream<List<Job?>> jobsStream() => _service.collectionStream(
    path: APIPath.jobs(uid),
    builder: (data) => Job.fromMap(data),
  );


  // void readJobs(){
  //   final path = APIpath.jobs(uid!);
  //   final reference = FirebaseFirestore.instance.collection(path);
  //   final snapshots = reference.snapshots();
  //   snapshots.listen((snapshot){ //collections snapshot
  //     snapshot.docs.forEach((snapshot) => print(snapshot.data())); //document snapshot
  //   });
  // }



}

