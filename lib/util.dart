import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

DateTime parseTime(dynamic date) {
  if( date == null ) {
    return null;
  } else if (date is Timestamp) {
    return Timestamp(date.seconds, date.nanoseconds).toDate();
  } else if (date is DateTime) {
    return date;
  } else {
    //we problably don't get here, and it probably isn't right anyway
    if (Platform.isIOS) {
      final dt = (date as Timestamp);
      return dt.toDate();
    } else {
      final dt = (date as DateTime);
      return dt;
    }
  }
}