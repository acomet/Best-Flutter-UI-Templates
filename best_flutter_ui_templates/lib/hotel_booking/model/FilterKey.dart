import 'package:best_flutter_ui_templates/hotel_booking/model/popular_filter_list.dart';
import 'package:flutter/material.dart';

class FilterKey {
  List<PopularFilterListData>? popularFilterListData;
  List<PopularFilterListData>? accomodationListData;
  RangeValues? range;
  double? dist;

  FilterKey({
    this.popularFilterListData,
    this.accomodationListData,
    this.range,
    this.dist,
  });

  @override
  String toString() {
    return 'FilterKey{popularFilterListData: $popularFilterListData, accomodationListData: $accomodationListData, range: $range, dist: $dist}';
  }
}
