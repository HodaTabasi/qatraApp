class ItemBoard {
  String title;
  String body;
  String image;

  ItemBoard(this.title, this.body, this.image);

  static List<ItemBoard> pageInfos = [
    ItemBoard(
        "اختر المسجد",
        '''
      حدد كمية كراتين  المياه
          او أي مدينة آخرى
      ''',
        "assets/img1.png"),
    ItemBoard("اختر الكمية", "حدد كمية كراتين  المياه", "assets/img2.png"),
    ItemBoard(
        "تتبع جميع خطوات طلبك ",
        '''سوف يتم إرسال صور الطلب
           عند التوصيل
          ''',
        "assets/img3.png"),
  ];
}
