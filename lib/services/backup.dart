import 'package:flutter/services.dart';
import 'dart:async';

class BackupService {
  static const _methodChannel = const MethodChannel("com.breez.client/backup");

  Future<dynamic> backup(List<String> paths, String nodeId, {bool silent = false}) {
    return _methodChannel.invokeMethod("backup", {"paths": paths, "nodeId": nodeId, "silent": silent});
  }

  Future<dynamic> restore({String nodeId = ""}) {
    return _methodChannel.invokeMethod("restore", {"nodeId": nodeId}).catchError((err){
      if (err.runtimeType == PlatformException) {
        throw (err as PlatformException).message;
      }
      throw err;
    });
  }

  Future<dynamic> signOut(){
     return _methodChannel.invokeMethod("signOut").catchError((err){
      if (err.runtimeType == PlatformException) {
        throw (err as PlatformException).message;
      }
      throw err;
    });
  }
}