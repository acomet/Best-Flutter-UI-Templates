class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
    this.like = false,
    this.accomodationType = "All"
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  String accomodationType;
  double dist;
  double rating;
  int reviews;
  int perNight;
  bool like;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotel/hotel_1.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 1.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
      like: false,
      accomodationType: "All"
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_2.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 1.6,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
      like: false,
      accomodationType: "Apartment"
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_3.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 20.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
      like: true,
      accomodationType: "Home"
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_4.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
      like: false,
      accomodationType: "Villa"
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 10.0,
      reviews: 240,
      rating: 4.5,
      perNight: 2000,
      like: true,
      accomodationType: "Hotel"
    ),HotelListData(
      imagePath: 'assets/hotel/hotel_1.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 1800,
      like: false,
      accomodationType: "Resort"
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_2.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 580,
      like: true,
      accomodationType: "Home"
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_3.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 600,
      like: false,
      accomodationType: "Resort"
    ),
  ];
}
