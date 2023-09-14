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
    this.accomodationType = "All",
    this.popular = "",
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  String accomodationType;
  String popular;
  double dist;
  double rating;
  int reviews;
  int perNight;
  bool like;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
        imagePath: 'assets/hotel/hotel_1.png',
        titleTxt: 'Grand Royal Hotel',
        subTxt: 'HK',
        dist: 5.0,
        reviews: 80,
        rating: 4.4,
        perNight: 100,
        like: false,
        accomodationType: "Apartment",
        popular: "Free Breakfast"),
    HotelListData(
        imagePath: 'assets/hotel/hotel_2.png',
        titleTxt: 'Queen Hotel',
        subTxt: 'Wembley, London',
        dist: 6.0,
        reviews: 74,
        rating: 4.5,
        perNight: 200,
        like: false,
        accomodationType: "Apartment",
        popular: "Free wifi"),
    HotelListData(
        imagePath: 'assets/hotel/hotel_3.png',
        titleTxt: 'Grand Royal Hotel',
        subTxt: 'Wembley, London',
        dist: 8.0,
        reviews: 62,
        rating: 4.0,
        perNight: 300,
        like: true,
        accomodationType: "Home",
        popular: "Free Parking"),
    HotelListData(
        imagePath: 'assets/hotel/hotel_4.png',
        titleTxt: 'Queen Hotel',
        subTxt: 'Wembley, London',
        dist: 7.0,
        reviews: 90,
        rating: 4.4,
        perNight: 170,
        like: false,
        accomodationType: "Villa",
        popular: "Free Breakfast"),
    HotelListData(
        imagePath: 'assets/hotel/hotel_5.png',
        titleTxt: 'Grand Royal Hotel',
        subTxt: 'Wembley, London',
        dist: 10.0,
        reviews: 240,
        rating: 4.5,
        perNight: 2000,
        like: true,
        accomodationType: "Hotel"),
    HotelListData(
        imagePath: 'assets/hotel/hotel_1.png',
        titleTxt: 'Grand Royal Hotel',
        subTxt: 'Wembley, London',
        dist: 2.0,
        reviews: 80,
        rating: 4.4,
        perNight: 1800,
        like: false,
        accomodationType: "Resort",
        popular: "Free wifi"),
    HotelListData(
        imagePath: 'assets/hotel/hotel_2.png',
        titleTxt: 'Queen Hotel',
        subTxt: 'Wembley, London',
        dist: 4.0,
        reviews: 74,
        rating: 4.5,
        perNight: 580,
        like: true,
        accomodationType: "Home",
        popular: "Pet Friendly"),
    HotelListData(
        imagePath: 'assets/hotel/hotel_3.png',
        titleTxt: 'Grand Royal Hotel',
        subTxt: 'Wembley, London',
        dist: 3.0,
        reviews: 62,
        rating: 4.0,
        perNight: 600,
        like: false,
        accomodationType: "Resort",
        popular: "Pool"),
  ];
}
