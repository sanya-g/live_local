import 'package:flutter/material.dart';
import 'package:local_lifestyle/Components/swipableFeeds.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoder/geocoder.dart';

const kGoogleApiKey = "";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

final pageController = PageController(
  initialPage: 0,
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List businesses = [
    {
      "name": "Hotville Chicken & Chops LA",
      "address": "4070 Marlton Ave, Los Angeles, CA 90008",
      "description":
          "Casual, family-style eatery specializing in spicy fried chicken & Southern sides.",
      "link": "https://www.hotvillechicken.com/",
      "yelp": "https://www.yelp.com/biz/hotville-chicken-los-angeles-2",
      "image": "https://i.imgur.com/DECOJdq.jpg",
      "isStared": false,
      "index": -1,
      "tags": [
        "Fried Chicken",
        "Southern",
        "Sandwich",
        "Hot Chicken",
        "Black-owned",
        "Crenshaw",
        "Small Business"
      ],
      "posts": [
        {
          "image": "https://i.imgur.com/HPYMGIn.png",
          "title": "Spicy Fried Chicken Sandwich",
          "description":
              "The 'Shaw: a spicy fried chicken sandwich between toasted brioche buns, topped with pickles",
        },
        {
          "image": "https://i.imgur.com/vhlmNnb.png",
          "title": "Stack of Chicken Sandwiches",
          "description": "Stack of The 'Shaw Nashville Hot Chicken Sandwiches",
        },
        {
          "image": "https://i.imgur.com/PRFkp9J.jpg",
          "title": "Spicy Fried Chicken",
          "description":
              "Juicy chicken brined, floured, and fried in a secret blend of spices",
        },
        {
          "image": "https://i.imgur.com/uMagHA9.jpg",
          "title": "Hotville Chicken Sides",
          "description":
              "Hotville Chicken's Cayenne Hot Sauce and bag of chips",
        },
      ],
    },
    {
      "name": "ri-ri-ku",
      "address": "177 W Olympic Blvd Los Angeles, CA 90015",
      "description": "Women's clothing, cosmetics, and accessories",
      "link": "https://www.shopririku.com/",
      "yelp":
          "https://www.yelp.com/biz/ri-ri-ku-los-angeles?osq=Women+Owned+Businesses",
      "image": "https://i.imgur.com/MO0gTCk.jpg",
      "isStared": false,
      "index": -1,
      "tags": [
        "Women's CLothing",
        "Cosmetics",
        "Beauty",
        "Boutique",
        "Women-owned Business",
        "Accessories",
        "Small Business"
      ],
      "posts": [
        {
          "image": "https://i.imgur.com/PWemnjr.jpg",
          "title": "Trendy pastel-colored dresses",
          "description": "Beautiful pastel-colored dresses for sale in store",
        },
        {
          "image": "https://i.imgur.com/GDvyuiv.jpg",
          "title": "Body Suits",
          "description": "Range of body suits and undergarments available",
        },
        {
          "image": "https://i.imgur.com/BOeEH48.jpg",
          "title": "Minimalist room decorations",
          "description": "Cups, bowls, and neutral-toned room decorations",
        },
        {
          "image": "https://i.imgur.com/Gy73Vxj.jpg",
          "title": "Accessories and Knick-Knacks",
          "description":
              "Handbags, headbands, books, and more to elevate your style",
        },
      ],
    },
    {
      "name": "Coffee and Plants",
      "address": "62 W Union St Unit 2 Pasadena, CA",
      "description":
          "Coffee shop serving baked goods, decorated with aesthetic flowers",
      "link": "https://www.coffeeandplantsla.com/",
      "yelp":
          "https://www.yelp.com/biz/coffee-and-plants-pasadena?osq=black+owned",
      "image": "https://i.imgur.com/4eoBjxu.png",
      "isStared": false,
      "index": -1,
      "tags": [
        "Coffee",
        "Bakery",
        "Flowers",
        "Cafe",
        "Black-owned Business",
        "Brunch",
        "Tea",
        "Small Business"
      ],
      "posts": [
        {
          "image": "https://i.imgur.com/fXxaAOd.png",
          "title": "Drink from Coffee and Plants",
          "description": "Blue Lavender Latte",
        },
        {
          "image": "https://i.imgur.com/gaT0HbX.png",
          "title": "Tea Time at Coffee and Plants",
          "description": "Chocolate chip cookies, iced cofee, and a latte",
        },
        {
          "image": "https://i.imgur.com/NfYSdHW.png",
          "title": "Coffee from Coffee and Plants",
          "description": "Hot and iced coffee surrounded by flowers",
        },
        {
          "image": "https://i.imgur.com/N5zn0bE.png",
          "title": "Coffee and Plants-themed merchandise",
          "description": "T-shirts, plants, books, and hats for purchase",
        },
      ],
    },
    {
      "name": "Stuzo Clothing",
      "address": "4751 W. Washington Blvd Los Angeles, CA 90016",
      "description":
          "Stuzo CLothing is a gender-free clothing store. All clothes are made in Los Angeles, with the mission of embracing body positivity and de-gendering the fashion industry.",
      "link": "https://www.stuzoclothing.com/",
      "yelp": "https://www.yelp.com/biz/stuzo-clothing-los-angeles",
      "image": "https://i.imgur.com/6CKxSPl.png",
      "isStared": false,
      "index": -1,
      "tags": [
        "Clothing",
        "Accessories",
        "Women-owned Business",
        "Black-owned Business",
        "Queer-owned Business",
        "Small Business"
      ],
      "posts": [
        {
          "image": "https://i.imgur.com/u3gUUl9.png",
          "title": "Model Wearing Stuzo Clothing Graphic Tee",
          "description":
              "Model wearing Stuzo Clothing's \"Yup, still gay\" shirt.",
        },
        {
          "image": "https://i.imgur.com/3RCxvhs.png",
          "title": "Models Wearing Stuzo Clothing Graphic Tee",
          "description":
              "Models wearing Stuzo Clothing's \"Black Magic\" shirt.",
        },
        {
          "image": "https://i.imgur.com/pePLicp.png",
          "title": "Model Wearing Stuzo Clothing Patterned Tee",
          "description":
              "Model wearing Stuzo Clothing's Mola button-down shirt.",
        },
        {
          "image": "https://i.imgur.com/bKFIsPn.png",
          "title": "Model Wearing Stuzo Clothing Graphic Tee",
          "description": "Model wearing Stuzo Clothing \"Woman Up\" tee",
        },
      ],
    },
    {
      "name": "Tamtak Jewelry",
      "address": "",
      "description": "Online store selling hand-crafted jewelry",
      "link": "https://tamtakjewelry.com/pages/about-us",
      "yelp": "",
      "image": "https://i.imgur.com/SOLRCIA.png",
      "isStared": false,
      "index": -1,
      "tags": [
        "Necklaces",
        "Accessories",
        "Women-owned Business",
        "Asian-owned Business",
        "Small Business"
      ],
      "posts": [
        {
          "image": "https://i.imgur.com/91aC0LW.png",
          "title": "Handmade Charm Necklaces",
          "description":
              "Set of necklaces with butterfly and heart-shaped pendants",
        },
        {
          "image": "https://i.imgur.com/7AKDYZy.png",
          "title": "Stack of Rhinestone Rings",
          "description": "Butterfly rhinestone rings",
        },
        {
          "image": "https://i.imgur.com/MO5BL4y.png",
          "title": "Handmade Name Necklace",
          "description": "Customized, handmade name necklace",
        },
        {
          "image": "https://i.imgur.com/DNoa5F8.png",
          "title": "Handmade Name Necklace",
          "description": "Customized, handmade name necklace",
        },
      ],
    },
    {
      "name": "Light My Fire",
      "address": "6333 W 3rd St Ste 230 Los Angeles, CA 90036",
      "description":
          "Novelty Store selling over 1,000 spicy products at the Original Farmers Market",
      "link": "https://farmersmarketla.com/merchants/21/Light-My-Fire-",
      "yelp": "",
      "image": "https://i.imgur.com/ORJw0PP.png",
      "isStared": false,
      "index": -1,
      "tags": ["Food", "Novelty", "Small Business", "Hot Sauce"],
      "posts": [
        {
          "image": "https://i.imgur.com/WbnbUgN.png",
          "title": "Hot Sauce Bottle",
          "description": "Handyman Chipotle Sauce",
        },
        {
          "image": "https://i.imgur.com/J480x0D.png",
          "title": "Hot Sauce Bottle",
          "description": "Da Bomb Ghost Pepper Sauce",
        },
        {
          "image": "https://i.imgur.com/4JvptBp.png",
          "title": "Hot Sauce Bottle",
          "description": "Dia de los Muertos Hot Sauce",
        },
        {
          "image": "https://i.imgur.com/XbQLtsK.png",
          "title": "Seasoning Bottles",
          "description": "Range of food seasonings",
        },
      ],
    }
  ];

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int screen = 0;

  void setScreen(int currentScreen) {
    setState(() {
      screen = currentScreen;
    });
  }

  String city = "";

  void setCity(String newCity) {
    setState(() {
      city = newCity;
    });
  }

  void setStared(int index) {
    setState(() {
      businesses[index]['isStared'] = !businesses[index]['isStared'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.indigo,
          child: BottomAppBarContents(
            screen: screen,
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.filter_alt,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
          title: Container(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () async {
                  // show input autocomplete with selected mode
                  // then get the Prediction selected
                  Prediction p = await PlacesAutocomplete.show(
                      context: context, apiKey: kGoogleApiKey);
                  displayPrediction(p);
                },
                child: Text(
                  (city == "") ? 'Set Location' : city,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.indigo[300],
              )),
          // title: Container(
          //   child: TextField(
          //     controller: _controller,
          //     onTap: () async {
          //       // placeholder for our places search later
          //     },

          //     // with some styling
          //     decoration: InputDecoration(
          //       hintText: "Current Location",
          //       filled: true,
          //       fillColor: Color(0x4DFFFFFF),
          //       hintStyle: TextStyle(
          //           color: Colors.white,
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold),
          //     ),
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
          centerTitle: true,
        ),
        body: SwipableFeeds(
          businesses: businesses,
          staredBusinesses: businesses,
          setScreen: setScreen,
          pageController: pageController,
          setStar: setStared,
        ));
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);

      setCity(detail.result.formattedAddress);

      // var placeId = p.placeId;
      // double lat = detail.result.geometry.location.lat;
      // double lng = detail.result.geometry.location.lng;

      // var address = await Geocoder.local.findAddressesFromQuery(p.description);

      // // print(lat);
      // // print(lng);
    }
  }
}

class BottomAppBarContents extends StatelessWidget {
  final int screen;

  BottomAppBarContents({this.screen});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        Container(
          child: GestureDetector(
            child: Icon(
              Icons.view_module,
              color: Colors.white,
            ),
            onTap: () {
              pageController.animateToPage(0,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          ),
          decoration: BoxDecoration(
              color: Color((screen == 0) ? 0x4DFFFFFF : 0x00FFFFFF),
              shape: BoxShape.circle),
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        ),
        Container(
          child: GestureDetector(
            child: Icon(
              Icons.star,
              color: Colors.white,
            ),
            onTap: () {
              pageController.animateToPage(1,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
          ),
          decoration: BoxDecoration(
              color: Color((screen == 1) ? 0x4DFFFFFF : 0x00FFFFFF),
              shape: BoxShape.circle),
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        )
      ],
      alignment: MainAxisAlignment.spaceAround,
    );
  }
}
