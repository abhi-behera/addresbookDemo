import 'package:carousel_slider/carousel_slider.dart';
import 'package:dumyapp1/api_endpoints/api_endpoints.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:dumyapp1/view/Home/eventsDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final controller = CarouselSliderController();
  final controller2 = CarouselSliderController();
  final popularPeopleimages = [
    "https://qaiadmin.neelsystems.com/InstituteImages/237/Public/flutter.jpg",
    'https://assets.aboutamazon.com/dims4/default/4c677cb/2147483647/strip/true/crop/2000x1074+0+130/resize/1440x773!/format/webp/quality/90/?url=https%3A%2F%2Famazon-blogs-brightspot.s3.amazonaws.com%2F56%2F01%2F834aa61747c19ef723f0b48ec134%2F20180517nealthompsonauthor-js-11.jpg',
    'https://s26162.pcdn.co/wp-content/uploads/2021/01/glasses-on-bible-fuji-x-10.jpg',
    'https://c.tadst.com/gfx/750x500/authors-day-fun.jpg'
  ];
  final imageList = [
    Api.imageListApi + Images.books,
  ];
  final cat1Title = [
    'Books',
    'Specs',
    'Codeing',
    'Chat',
    'LMS',
    'Appointment',
    "Support",
    "Contacts",
    "user",
    "Holidays"
  ];
  final LMSTitle = ['Flutter Course', 'Web Devlopment', 'Course 3'];
  final meetupcount = ['3,028', '1,740', '208'];
  int activeIndex = 0;

  final urlImages = [
    Api.imageListApi + Images.christmas,
    Api.imageListApi + Images.meeting,
    Api.imageListApi + Images.presentation
  ];

  final textOverImage = ["Christmas Eve", "Office", "Meetings"];
  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotHeight: 6, dotWidth: 9, activeDotColor: Colors.black87),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  final List<Map<String, String>> categories = [
    {
      "image":
          "https://images.unsplash.com/photo-1509062522246-3755977927d7?q=80&w=3332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Study Material",
      "subtitle": "From ₹679"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1518826778770-a729fb53327c?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Pencil",
      "subtitle": "50-80% Off"
    },
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1714397546754-3c1ef1be26e9?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Graduation",
      "subtitle": "Just ₹1,29,999"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=3328&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Library",
      "subtitle": "Free"
    },
  ];

  final List<Map<String, String>> categories1 = [
    {
      "image":
          "https://images.unsplash.com/photo-1509062522246-3755977927d7?q=80&w=3332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Study Material",
      "subtitle": "From ₹679"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1518826778770-a729fb53327c?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Pencil",
      "subtitle": "50-80% Off"
    },
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1714397546754-3c1ef1be26e9?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Graduation",
      "subtitle": "Just ₹1,29,999"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=3328&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Library",
      "subtitle": "Free"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1509062522246-3755977927d7?q=80&w=3332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Study Material",
      "subtitle": "From ₹679"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1518826778770-a729fb53327c?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Pencil",
      "subtitle": "50-80% Off"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Category Page'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                  child: Text(
                    "Events Gallery",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            // eventsCarousel
            eventCarouselBuilder(context, controller, urlImages, textOverImage),
            // dots code
            buildIndicator(),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 1',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
              child: category1StaggeredGrid(),
            ),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 2',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))),
              ],
            ),
            category2LMSCardBuilder(controller2, meetupcount, LMSTitle),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 3',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
            ),
            category3gridView(context),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 4',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return category4Card(
                      categories[index]["image"]!,
                      categories[index]["title"]!,
                      categories[index]["subtitle"]!,
                    );
                  },
                ),
              ),
            ),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 5',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return categoryCard5withTitle(
                      categories[index]["image"]!,
                      categories[index]["title"]!,
                      categories[index]["subtitle"]!,
                    );
                  },
                ),
              ),
            ),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 6',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(123, 1, 52, 1),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, top: 8, bottom: 8),
                        child: Text(
                          'There For You',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return categoryCard6withBgTitle(
                          categories[index]["image"]!,
                          categories[index]["title"]!,
                          categories[index]["subtitle"]!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 7',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: (2 / 3),
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return category7GridView(
                      categories1[index]["image"]!,
                      categories1[index]["title"]!,
                      categories1[index]["subtitle"]!,
                    );
                  },
                ),
              ),
            ),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 8',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 10,
                    childAspectRatio: (1 / 1.5),
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return category8BuildGridTile(
                      imageList[0],
                      categories1[index]["title"]!,
                      // categories1[index]["subtitle"]!,
                    );
                  },
                ),
              ),
            ),
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
                    child: Text('Category 9',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: (1 / 1.3),
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return category9BuildGridTile(
                      imageList[0],
                      categories1[index]["title"]!,
                      // categories1[index]["subtitle"]!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget builMeetingCard(
          String urlImage, int index, String text, String count) =>
      Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
              height: 180,
              width: 250,
              child: Image.network(
                urlImage,
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          top: 16,
          left: 0,
          right: 10,
          child: Row(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.transparent,
                            Color.fromARGB(69, 0, 0, 0),
                            Colors.black26,
                            Color.fromARGB(0, 0, 0, 0)
                          ])),
                  height: 80,
                  width: 200,
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 26.0),
                  )),
            ],
          ),
        ),
      ]);

  Widget buildGridTile(String imageName, String title) {
    return Container(
        decoration: BoxDecoration(
          // color: Colors.blueAccent,
          gradient: const LinearGradient(colors: [
            Color.fromARGB(58, 216, 218, 226),
            Color.fromRGBO(232, 237, 242, 0.612),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [SizedBox(width: 74, child: Image.network(imageName))],
            ),
          ],
        ));
  }

  GestureDetector eventCarouselBuilder(
      BuildContext context,
      CarouselSliderController controller,
      List<String> urlImages,
      List<String> textOverImage) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsPage()),
        )
      },
      child: CarouselSlider.builder(
        carouselController: controller,
        itemCount: urlImages.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = urlImages[index];
          final text = textOverImage[index];
          return eventsCarousel(urlImage, index, text);
        },
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 15),
            autoPlayAnimationDuration: const Duration(seconds: 4),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() => activeIndex = index);
            }),
      ),
    );
  }

  Widget eventsCarousel(String urlImage, int index, String text) => Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 190.0,
              width: 350.0,
              child: Image.network(
                urlImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 10,
            child: Row(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [
                          Colors.transparent,
                          Colors.black38,
                          Colors.black26,
                          Colors.transparent
                        ])),
                    height: 120,
                    width: 278,
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    )),
              ],
            ),
          ),
        ],
      );

  StaggeredGrid category1StaggeredGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[0]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[1]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[2]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[3]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[4]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[5]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[6]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[7]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[8]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.5,
          child: buildGridTile(imageList[0], cat1Title[9]),
        ),
      ],
    );
  }

  CarouselSlider category2LMSCardBuilder(CarouselSliderController controller2,
      List<String> meetupcount, List<String> popularPeopleCardTitle) {
    return CarouselSlider.builder(
        carouselController: controller2,
        itemCount: meetupcount.length,
        itemBuilder: (context, index, realIndex) {
          final images = popularPeopleimages[index];
          final text = popularPeopleCardTitle[index];
          final count = meetupcount[index];
          return builMeetingCard(images, index, text, count);
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.22,
          viewportFraction: 0.65,
          disableCenter: true,
          enableInfiniteScroll: false,
        ));
  }

  Container category3gridView(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(196, 238, 205, 205),
                Color.fromARGB(178, 217, 173, 194)
              ])),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            height: MediaQuery.of(context).size.height * .47,
            width: double.infinity,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            height: 120,
                            child: Image.network(
                                Api.imageListApi + Images.friends)),
                        Text(
                          'Item $index',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 17, 17, 17),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget category4Card(String imagePath, String title, String subtitle) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.green[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryCard5withTitle(
      String imagePath, String title, String subtitle) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget categoryCard6withBgTitle(
      String imagePath, String title, String subtitle) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 2),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              width: double.infinity,
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget category7GridView(String imagePath, String title, String subtitle) {
    return SizedBox(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget category8BuildGridTile(String imageName, String title) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 4,
          child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.blueAccent,
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(58, 216, 218, 226),
                  Color.fromRGBO(232, 237, 242, 0.612),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(width: 74, child: Image.network(imageName))),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
        )
      ],
    );
  }

  Widget category9BuildGridTile(String imageName, String title) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black26, width: 1)),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(width: 74, child: Image.network(imageName))),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
