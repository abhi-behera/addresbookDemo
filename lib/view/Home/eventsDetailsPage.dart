import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = CarouselSliderController();
  int activeIndex = 0;

  final urlImages = [
    'https://thumbs.dreamstime.com/b/surfboard-beach-holiday-sunset-sand-beach-hut-tropical-paradise-coastal-resort-surfboard-beach-holiday-sunset-sand-316451192.jpg',
    'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_380,q_auto,w_240//hotelier-images/a6/69/dd9b67c732f7b76e57491a035f4b4779ca5bf93348cbb615afdf25dde3a6.jpeg',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/499273261.jpg?k=cdfce89bc421989f98bce9fa245db273858765240ed398242157e4a65498a9a0&o=&hp=1',
    'https://symphony.cdn.tambourine.com/sandyport-beach-resort/media/Hero-home-1-mobile-new-5980fad05cd05.jpg',
  ];

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotHeight: 6, dotWidth: 7, activeDotColor: Colors.black87),
        // effect: const WormEffect(
        //     spacing: 4,
        //     dotHeight: 8,
        //     dotWidth: 8,
        //     activeDotColor: Colors.white),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(140, 183, 235, 1),
        title: const Text("Events Gallery"),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Stack(children: [
                CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                        height: 300,
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() => activeIndex = index);
                          if (kDebugMode) {
                            print(
                                "onPageChanged index: $index, active index:$activeIndex");
                          }
                        })),
                Positioned(bottom: 22, left: 155, child: buildIndicator()),
              ]),
              Positioned(
                // bottom: 0,
                top: 164,
                left: 40,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.87,
                    height: 40,
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'images/heart.png',
                              height: 20,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'images/chat.png',
                              height: 27,
                            )),
                        IconButton(
                            onPressed: () {
                              // Share.share(
                              //   'Check out this image\nhttps://thumbs.dreamstime.com/b/surfboard-beach-holiday-sunset-sand-beach-hut-tropical-paradise-coastal-resort-surfboard-beach-holiday-sunset-sand-316451192.jpg',
                              // );
                            },
                            icon: const Icon(
                              Icons.share,
                              size: 20,
                              color: Colors.black87,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.star_border_rounded,
                              size: 25,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'images/download.png',
                              height: 17,
                              color: Colors.black45,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border, size: 23)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Colors.blueAccent,
                          size: 20,
                        )),
                    const Text(
                      "1034",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'images/heart.png',
                          height: 17,
                          color: Colors.blueAccent,
                        )),
                    const Text("1034"),
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                        width: 100,
                        height: 20,
                        child: Image.asset('images/Star.png')),
                    const Text("3.2"),
                  ],
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 30.0),
                    child: Text(
                      'Abhijit Behera',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(1000, 26, 46, 95),
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 30.0),
                      child: Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      )),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 30.0),
                    child: Icon(
                      Icons.access_time_outlined,
                      size: 18,
                      color: Colors.black38,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 5.0),
                    child: Text(
                      'Duration 20 Mins',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13.0, left: 30.0),
                    child: Text(
                      '#Goa Diary',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(1000, 26, 46, 95),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86,
                child: const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                  textAlign: TextAlign.justify,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 30.0),
                    child: Text(
                      'See More',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.only(),
              height: 300.0,
              width: 312.0,
              child: Image.network(
                urlImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      );
}
