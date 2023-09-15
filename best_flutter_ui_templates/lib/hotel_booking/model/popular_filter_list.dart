class PopularFilterListData {
  PopularFilterListData(
    this.id, {
    this.titleTxt = '',
    this.isSelected = false,
  });

  String titleTxt;
  bool isSelected;
  int id;


  @override
  String toString() {
    return 'PopularFilterListData{titleTxt: $titleTxt, isSelected: $isSelected, id: $id}';
  }

  static List<PopularFilterListData> popularFList = <PopularFilterListData>[
    PopularFilterListData(
      1,
      titleTxt: 'Free Breakfast',
      isSelected: true,
    ),
    PopularFilterListData(
      2,
      titleTxt: 'Free Parking',
      isSelected: true,
    ),
    PopularFilterListData(
      3,
      titleTxt: 'Pool',
      isSelected: true,
    ),
    PopularFilterListData(
      4,
      titleTxt: 'Pet Friendly',
      isSelected: true,
    ),
    PopularFilterListData(
      5,
      titleTxt: 'Free wifi',
      isSelected: true,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      6,
      titleTxt: 'All',
      isSelected: true,
    ),
    PopularFilterListData(
      7,
      titleTxt: 'Apartment',
      isSelected: false,
    ),
    PopularFilterListData(
      8,
      titleTxt: 'Home',
      isSelected: false,
    ),
    PopularFilterListData(
      9,
      titleTxt: 'Villa',
      isSelected: false,
    ),
    PopularFilterListData(
      10,
      titleTxt: 'Hotel',
      isSelected: false,
    ),
    PopularFilterListData(
      11,
      titleTxt: 'Resort',
      isSelected: false,
    ),
  ];
}
