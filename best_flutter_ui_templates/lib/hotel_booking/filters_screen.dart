import 'package:best_flutter_ui_templates/hotel_booking/model/FilterKey.dart';
import 'package:best_flutter_ui_templates/utils/log_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hotel_app_theme.dart';
import 'model/popular_filter_list.dart';
import 'range_slider_view.dart';
import 'slider_view.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<PopularFilterListData> originalPopularFilterListData = PopularFilterListData.popularFList;
  List<PopularFilterListData> originalAccomodationListData = PopularFilterListData.accomodationList;

  /// 空数组写法 1
  List<PopularFilterListData> filterPopularFilterListData = [];

  /// 空数组写法 2
  var filterAccomodationListData = List<PopularFilterListData>.empty(growable: true);

  RangeValues _defaultRangeValue = const RangeValues(0, 5000);
  double distValue = 50.0;

  @override
  void initState() {
    super.initState();

    for(var item in originalPopularFilterListData){
      /// 这样会导致元数据被修改
      // filterPopularFilterListData.add(item);

      var newItem = PopularFilterListData(item.id, titleTxt: item.titleTxt, isSelected: item.isSelected);
      filterPopularFilterListData.add(newItem);
    }

    for(var item in originalAccomodationListData){
      var newItem = PopularFilterListData(item.id, titleTxt: item.titleTxt, isSelected: item.isSelected);
      filterAccomodationListData.add(newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HotelAppTheme.buildLightTheme().backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    priceBarFilter(),
                    const Divider(
                      height: 1,
                    ),
                    popularFilter(),
                    const Divider(
                      height: 1,
                    ),
                    distanceViewUI(),
                    const Divider(
                      height: 1,
                    ),
                    allAccommodationUI()
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 8),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: HotelAppTheme.buildLightTheme().primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 8,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    highlightColor: Colors.transparent,
                    onTap: () {
                      // 把条件返回上一个页面
                      var keys = FilterKey(
                          popularFilterListData: filterPopularFilterListData,
                          accomodationListData: filterAccomodationListData,
                          range: _defaultRangeValue,
                          dist: distValue / 10);

                      Navigator.of(context).pop(keys);
                    },
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget allAccommodationUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Type of Accommodation',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: getAccomodationListUI(),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  List<Widget> getAccomodationListUI() {
    final List<Widget> noList = <Widget>[];
    for (int i = 0; i < filterAccomodationListData.length; i++) {
      final PopularFilterListData date = filterAccomodationListData[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              setState(() {
                checkAppPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      date.titleTxt,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: date.isSelected
                        ? HotelAppTheme.buildLightTheme().primaryColor
                        : Colors.grey.withOpacity(0.6),
                    onChanged: (bool value) {
                      setState(() {
                        checkAppPosition(i);
                      });
                    },
                    value: date.isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(const Divider(
          height: 1,
        ));
      }
    }
    return noList;
  }

  void checkAppPosition(int index) {
    if (index == 0) {
      if (filterAccomodationListData[0].isSelected) {
        filterAccomodationListData.forEach((d) {
          d.isSelected = false;
        });
      } else {
        filterAccomodationListData.forEach((d) {
          d.isSelected = true;
        });
      }
    } else {
      filterAccomodationListData[index].isSelected = !filterAccomodationListData[index].isSelected;

      int count = 0;
      for (int i = 0; i < filterAccomodationListData.length; i++) {
        if (i != 0) {
          final PopularFilterListData data = filterAccomodationListData[i];
          if (data.isSelected) {
            count += 1;
          }
        }
      }

      if (count == filterAccomodationListData.length - 1) {
        filterAccomodationListData[0].isSelected = true;
      } else {
        filterAccomodationListData[0].isSelected = false;
      }
    }
  }

  Widget distanceViewUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Distance from city center',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        SliderView(
          distValue: distValue,
          onChangedistValue: (double value) {
            distValue = value;
          },
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget popularFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            'Popular filters',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            // child: Column(
            //   children: getPList(),
            // ),
            child: getPListNew()),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getPList() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    const int columnCount = 2;
    for (int row = 0; row < filterPopularFilterListData.length / columnCount; row++) {
      final List<Widget> listUI = <Widget>[];
      for (int j = 0; j < columnCount; j++) {
        try {
          final PopularFilterListData date = filterPopularFilterListData[count];
          listUI.add(Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {
                      setState(() {
                        date.isSelected = !date.isSelected;
                        filterPopularFilterListData[count].isSelected =
                            date.isSelected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            date.isSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: date.isSelected
                                ? HotelAppTheme.buildLightTheme().primaryColor
                                : Colors.grey.withOpacity(0.6),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            date.titleTxt,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
          if (count < filterPopularFilterListData.length - 1) {
            count += 1;
          } else {
            break;
          }
        } catch (e) {
          print(e);
        }
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  ///
  /// 条件
  ///
  Widget getPListNew() {

    return GridView(
      // 有个奇怪的想象，不设置边距的话，会自带一个默认值
      padding: EdgeInsets.only(top: 0),
      physics: const BouncingScrollPhysics(),
      // 方向
      scrollDirection: Axis.vertical,
      // Flutter-ListView嵌套高度问题，GridView 和 listview 必须要设置shrinkWrap: true,
      shrinkWrap: true,
      children: List<Widget>.generate(
        filterPopularFilterListData.length,
            (int index) {
          var date = filterPopularFilterListData[index];
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              onTap: () {
                for (int j = 0; j < filterPopularFilterListData.length; j++) {
                  if (filterPopularFilterListData[j].id == date.id) {
                    setState(() {
                      /// 这样写会影响到原始数据
                      filterPopularFilterListData[j].isSelected = !date.isSelected;
                    });
                  }
                }
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    date.isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                    color: date.isSelected ? HotelAppTheme.buildLightTheme().primaryColor : Colors.grey.withOpacity(0.6),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    date.titleTxt,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // grid 的基本操作，可以定义横排，竖排数量、item之间的间隔、item的比例
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 5,
      ),
    );
  }

  Widget priceBarFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Price (for 1 night)',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        RangeSliderView(
          values: _defaultRangeValue,
          onChangeRangeValues: (RangeValues values) {
            _defaultRangeValue = values;
            logF("what is range $_defaultRangeValue");
          },
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: HotelAppTheme.buildLightTheme().backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Filters',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}
