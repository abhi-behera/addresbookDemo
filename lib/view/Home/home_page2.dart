import 'package:carousel_slider/carousel_slider.dart';
import 'package:dumyapp1/model/menu_model.dart';
import 'package:dumyapp1/provider/menu_item_provider.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/Addressbook/address_list_page.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:dumyapp1/view/Home/eventsDetailsPage.dart';
// import 'package:dumyapp1/view/MovieList/movies.dart';
import 'package:dumyapp1/view/Home/single_forum.dart';
import 'package:dumyapp1/view/MovieList/movies_2.dart';
import 'package:dumyapp1/view/UserProfile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:carousel_slider/carousel_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int activeIndex = 0;
  final titleImage = ['high-five.png', 'quill-pen.png', 'customer-service.png'];
  final popularPeopleimages = [
    'https://www.mediabistro.com/wp-content/uploads/2014/09/best-selling-author.jpg',
    'https://assets.aboutamazon.com/dims4/default/4c677cb/2147483647/strip/true/crop/2000x1074+0+130/resize/1440x773!/format/webp/quality/90/?url=https%3A%2F%2Famazon-blogs-brightspot.s3.amazonaws.com%2F56%2F01%2F834aa61747c19ef723f0b48ec134%2F20180517nealthompsonauthor-js-11.jpg',
    'https://s26162.pcdn.co/wp-content/uploads/2021/01/glasses-on-bible-fuji-x-10.jpg',
    'https://c.tadst.com/gfx/750x500/authors-day-fun.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final controller = CarouselSliderController();
    final controller1 = CarouselSliderController();
    final controller2 = CarouselSliderController();

    final urlImages = [
      'https://thumbs.dreamstime.com/b/wooden-merry-christmas-sign-blue-wood-background-wooden-letters-spelling-merry-christmas-blue-painted-wood-background-326423704.jpg',
      'https://www.ibabs.com/wp-content/uploads/2021/05/3.jpeg',
      'https://burbity.com/wp-content/uploads/2022/04/run-successful-business-meeting.jpg',
    ];

    final textOverImage = ["Christmas Eve", "Office", "Meetings"];
    final popularPeopleCardTitle = ['Friends', 'Professor', 'Support'];
    final LMSTitle = ['Flutter Course', 'Web Devlopment', 'Course 3'];
    final meetupcount = ['3,028', '1,740', '208'];
    void animateToSlide(int index) => controller.animateToPage(index);

    Widget buildIndicator() => AnimatedSmoothIndicator(
          onDotClicked: animateToSlide,
          // effect: const ExpandingDotsEffect(dotHeight: 6, dotWidth: 7, activeDotColor: Colors.black87),
          effect: const WormEffect(spacing: 4, dotHeight: 6, dotWidth: 6),
          activeIndex: activeIndex,
          count: urlImages.length,
        );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar('NEW UI'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Events Gallery",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // eventsCarousel
              eventCarouselBuilder(
                  context, controller, urlImages, textOverImage),
              // dots code
              buildIndicator(),
              Container(
                padding: const EdgeInsets.only(left: 50, top: 20, bottom: 10),
                child: const Row(
                  children: [
                    Text(
                      "Menu",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.80, // Set the desired width
                height: 220, // Set the desired height
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Colors.black26, width: 1), // Optional border
                ),
                child: Consumer<MenuItemProvider>(
                  builder: (context, items, child) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                      ),
                      itemCount: items.menuItemList?.length,
                      itemBuilder: (context, index) {
                        if (items.isLoading) {
                          const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final menuItem = items.menuItemList?[index];
                          return GestureDetector(
                            onTap: () {
                              switch (menuItem?.fieldRoute) {
                                case MenuUtill.singleEntry:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SingleForumPage()),
                                  );
                                  break;
                                case MenuUtill.moviesList:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MoviesPage2()),
                                  );
                                  break;
                                case MenuUtill.userProfile:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const USerProfile()),
                                  );
                                  break;
                                case MenuUtill.addressBook:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddressListPage()),
                                  );
                                  break;
                                default:
                                  debugPrint(
                                      "Encountered a invalid menu item \nPlease added the route to ${menuItem?.fieldRoute}");
                                  break;
                              }
                            },
                            child: BlueWidgets(menuItem: menuItem),
                          );
                        }
                        return null;
                      },
                    );
                  },
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 28.0, left: 46),
                    child: Text("People at your aid",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              // peopleCarousel
              peopleCarouselBuilder(
                  controller1, meetupcount, popularPeopleCardTitle),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 28.0, left: 46),
                    child: Text(
                      "Keep Learning",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              LMSCardBuilder(controller2, meetupcount, LMSTitle),
            ],
          ),
        ));
  }

  CarouselSlider LMSCardBuilder(CarouselSliderController controller2,
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
          height: 290,
          enableInfiniteScroll: false,
        ));
  }

  Widget builMeetingCard(
          String urlImage, int index, String text, String count) =>
      Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: SizedBox(
                height: 190,
                child: Image.network(
                    'https://static-cse.canva.com/blob/1145749/educationisimportant.9078455a.avif')),
          ),
        ),
        Positioned(
            bottom: 64,
            left: 215,
            child: Container(
                padding: const EdgeInsets.only(left: 8, bottom: 5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Text(
                  '0${index + 1}',
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.w600),
                ))),
        Positioned(
          bottom: 90,
          left: 13,
          right: 10,
          child: Row(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.transparent,
                            Color.fromARGB(69, 0, 0, 0),
                            Colors.black26,
                            Color.fromARGB(0, 0, 0, 0)
                          ])),
                  height: 100,
                  width: 200,
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
      ]);

  CarouselSlider peopleCarouselBuilder(CarouselSliderController controller1,
      List<String> meetupcount, List<String> popularPeopleCardTitle) {
    return CarouselSlider.builder(
      carouselController: controller1,
      itemCount: meetupcount.length,
      itemBuilder: (context, index, realIndex) {
        final images = popularPeopleimages[index];
        final text = popularPeopleCardTitle[index];
        final count = meetupcount[index];
        return peopleCarousel(images, index, text, count);
      },
      options: CarouselOptions(
        height: 180,
        enableInfiniteScroll: false,
      ),
    );
  }

  Widget peopleCarousel(
          String urlImage, int index, String text, String count) =>
      Container(
        margin: const EdgeInsets.only(top: 10, left: 0, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black26, width: 1)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                          // margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                          width: 50,
                          height: 40,
                          child: Image.asset(
                            'images/${titleImage[index]}',
                            fit: BoxFit.contain,
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(text,
                              style: const TextStyle(
                                  color: Color.fromARGB(1000, 26, 46, 95),
                                  fontWeight: FontWeight.w700)),
                          Text("$count Members",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                    height: 10, width: 280, child: Divider(indent: 0)),
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            // margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(1000, 26, 46, 95)),
                            child: Image.network(
                              popularPeopleimages[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // bottom: 0,
                      left: 48,
                      // right: 220,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            // margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(1000, 26, 46, 95)),
                            child: Image.network(
                              popularPeopleimages[1],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // bottom: 0,
                      left: 96,
                      // right: 10,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(1000, 26, 46, 95)),
                            child: Image.network(
                              popularPeopleimages[2],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 144,
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(1000, 26, 46, 95)),
                            child: Image.network(
                              popularPeopleimages[3],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      width: 0,
                      height: 60,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(1000, 26, 46, 95)),
                    ),
                  ]),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, bottom: 10),
                    height: 25,
                    width: 80,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Color.fromARGB(1000, 57, 101, 150),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  4))), // foregroundColor: colorScheme.onError,
                          // backgroundColor: Color.fromARGB(1000, 57, 101, 150),
                        ),
                        child: const Text("See More",
                            style: TextStyle(color: Colors.white, fontSize: 8)),
                      ),
                    ),
                  ),
                ]),
              ],
            )),
      );

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
            enableInfiniteScroll: false,
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
}

class BlueWidgets extends StatelessWidget {
  const BlueWidgets({
    super.key,
    required this.menuItem,
  });

  final MenuItem? menuItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(98, 135, 158, 210),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              height: 54,
              width: 54,
              child: Image.asset('assets/menu_icons/${menuItem?.fieldIcon}')),
          SizedBox(
            height: 16,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                child: Text(
                  menuItem!.fieldName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
