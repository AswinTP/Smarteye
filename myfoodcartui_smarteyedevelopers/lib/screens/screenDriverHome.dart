import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myfoodcartui_smarteyedevelopers/Utilities/colors.dart'
    as appcolors;
import 'package:myfoodcartui_smarteyedevelopers/Utilities/size.dart';
import 'package:readmore/readmore.dart';

class ScreenDriverHome extends StatefulWidget {
  //const ScreenHome({Key? key}) : super(key: key);
  final driverData;
  ScreenDriverHome({Key? key, @required this.driverData}) : super(key: key) {}

  @override
  State<ScreenDriverHome> createState() => _ScreenDriverHomeState(driverData);
}

class _ScreenDriverHomeState extends State<ScreenDriverHome> {
  final driverData;
  String deliveryPointValue = 'One';
  TextEditingController searchTextController = TextEditingController();
  final CarouselController sliderImagecontroller = CarouselController();
  bool btnStarterFlag = false;
  bool btnMealsFlag = false;
  bool btnDesertsFlag = false;
  bool btnBeveragesFlag = false;
  bool cartAddPopupFlag = false;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  bool viewOrHideAddRemoveButton = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _ScreenDriverHomeState(this.driverData) {}
  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: appcolors.greyWhite,
        /*drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: CircleAvatar(
                  child: Image.asset('assets/images/foodcartlogo.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                title: const Text('Attendance'),
                onTap: () {},
                leading: CircleAvatar(
                  child: Image.asset('assets/images/foodcartlogo.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                title: const Text('Leave'),
                onTap: () {},
                leading: CircleAvatar(
                  child: Image.asset('assets/images/foodcartlogo.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Reports'),
                onTap: () {},
                leading: CircleAvatar(
                  child: Image.asset('assets/images/foodcartlogo.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Change Password'),
                onTap: () {},
                leading: CircleAvatar(
                  child: Image.asset('assets/images/foodcartlogo.png'),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                title: Text('About'),
                onTap: () {},
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  // Update the state of the app
                  //signOut(context);
                  // Then close the drawer
                  // Navigator.pop(context);
                },
                leading: CircleAvatar(
                  child: Icon(Icons.logout),
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),*/
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: !cartAddPopupFlag
            ? null
            : Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appcolors.orange_deep),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 55,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ITEM',
                                    style: TextStyle(
                                        fontSize: SizeConfig.small,
                                        color: appcolors.white),
                                  ),
                                  Text('Price',
                                      style: TextStyle(
                                          fontSize: SizeConfig.small,
                                          color: appcolors.white))
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 55,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                child: Text('Proceed',
                                    style: TextStyle(
                                        fontSize: SizeConfig.small_medium,
                                        color: appcolors.white)),
                                onPressed: () {},
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
        /*Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: appcolors.orange_deep,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('Hi THere'),
                ),
              )
            ],
          ),
        )*/
        ,
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.home),
                  backgroundColor: Colors.green),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.shopping_cart),
                  backgroundColor: Colors.yellow),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.timer_rounded),
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(Icons.person),
                backgroundColor: Colors.blue,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: appcolors.orange,
            iconSize: 40,
            onTap: _onItemTapped,
            elevation: 5),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            child: Column(
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    color: appcolors.orange,
                                  ),
                                ),
                                hint: const Text('Delivery Point'),
                                items: <String>['A', 'B', 'C', 'D']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              ),
                            ),
                            const Text(
                              'Deluivery to here',
                              style: TextStyle(
                                  color: appcolors.orange, fontSize: 15),
                            )
                          ],
                        )),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: CircleAvatar(
                            child: Icon(Icons.person_2_rounded),
                            backgroundColor: appcolors.orange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),

                /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
                /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
                child: AnimSearchBar(
                  width: 400,
                  autoFocus: true,
                  textController: searchTextController,
                  onSuffixTap: () async {
                    setState(() {
                      searchTextController.clear();
                    });
                  },
                  onSubmitted: (String) {},
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  scrollDirection: Axis.vertical,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        cardViewHotel(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Great Deals',
                                style: TextStyle(
                                    fontSize: SizeConfig.big,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        populateCarolslider(context),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Products',
                                style: TextStyle(
                                    fontSize: SizeConfig.big,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: appcolors.white),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 100,
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .white, //button's fill color
                                          //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
                                          disabledForegroundColor: Color.fromARGB(
                                              255,
                                              175,
                                              175,
                                              175), //specify the button's disabled text, icon, and fill color
                                          shadowColor: Colors
                                              .black, //specify the button's elevation color
                                          elevation:
                                              4.0, //buttons Material shadow
                                          textStyle: TextStyle(
                                              fontFamily:
                                                  'roboto'), //specify the button's text TextStyle
                                          padding: const EdgeInsets.only(
                                              top: 4.0,
                                              bottom: 4.0,
                                              right: 8.0,
                                              left:
                                                  8.0), //specify the button's Padding
                                          minimumSize: Size(20,
                                              40), //specify the button's first: width and second: height
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              width: 2.0,
                                              style: BorderStyle
                                                  .solid), //set border for the button
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  35.0)), // set the buttons shape. Make its birders rounded etc
                                          enabledMouseCursor: MouseCursor
                                              .defer, //used to construct ButtonStyle.mouseCursor
                                          disabledMouseCursor: MouseCursor
                                              .uncontrolled, //used to construct ButtonStyle.mouseCursor
                                          visualDensity: VisualDensity(
                                              horizontal: 0.0,
                                              vertical:
                                                  0.0), //set the button's visual density
                                          tapTargetSize: MaterialTapTargetSize
                                              .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
                                          animationDuration: Duration(
                                              milliseconds:
                                                  100), //the buttons animations duration
                                          enableFeedback:
                                              true, //to set the feedback to true or false
                                          alignment: Alignment
                                              .bottomCenter, //set the button's child Alignment
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ImageIcon(
                                                  AssetImage(
                                                      "assets/images/veg.png"),
                                                  color: appcolors
                                                      .vegitarian_ic_color),
                                              Text("Veg",
                                                  style: TextStyle(
                                                      color: appcolors.black)),
                                            ],
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 100,
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .white, //button's fill color
                                          //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
                                          disabledForegroundColor: Color.fromARGB(
                                              255,
                                              175,
                                              175,
                                              175), //specify the button's disabled text, icon, and fill color
                                          shadowColor: Colors
                                              .black, //specify the button's elevation color
                                          elevation:
                                              4.0, //buttons Material shadow
                                          textStyle: TextStyle(
                                              fontFamily:
                                                  'roboto'), //specify the button's text TextStyle
                                          padding: const EdgeInsets.only(
                                              top: 4.0,
                                              bottom: 4.0,
                                              right: 8.0,
                                              left:
                                                  8.0), //specify the button's Padding
                                          minimumSize: Size(20,
                                              40), //specify the button's first: width and second: height
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 244, 244, 244),
                                              width: 2.0,
                                              style: BorderStyle
                                                  .solid), //set border for the button
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  35.0)), // set the buttons shape. Make its birders rounded etc
                                          enabledMouseCursor: MouseCursor
                                              .defer, //used to construct ButtonStyle.mouseCursor
                                          disabledMouseCursor: MouseCursor
                                              .uncontrolled, //used to construct ButtonStyle.mouseCursor
                                          visualDensity: VisualDensity(
                                              horizontal: 0.0,
                                              vertical:
                                                  0.0), //set the button's visual density
                                          tapTargetSize: MaterialTapTargetSize
                                              .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
                                          animationDuration: Duration(
                                              milliseconds:
                                                  100), //the buttons animations duration
                                          enableFeedback:
                                              true, //to set the feedback to true or false
                                          alignment: Alignment
                                              .bottomCenter, //set the button's child Alignment
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ImageIcon(
                                                  AssetImage(
                                                      "assets/images/nonveg.png"),
                                                  color: appcolors
                                                      .nonveg_ic_color),
                                              Text("Non-Veg",
                                                  style: TextStyle(
                                                      color: appcolors.black)),
                                            ],
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  roundedEdgeButton(
                                      'Starter', context, btnStarterFlag),
                                  roundedEdgeButton(
                                      'Meals', context, btnMealsFlag),
                                  roundedEdgeButton(
                                      'Deserts', context, btnDesertsFlag),
                                  roundedEdgeButton(
                                      'Beverages', context, btnBeveragesFlag),
                                ],
                              ),
                              Divider(color: appcolors.button_gray),
                              /*populateItemCard(
                                  context,
                                  'non',
                                  "assets/images/food1.png",
                                  'Title',
                                  'Test desc',
                                  1000.00),*/
                              /*itemCard(
                                  context,
                                  'non',
                                  "assets/images/food1.png",
                                  'Title',
                                  'Test desc',
                                  1000.00),
                              getFinalListView(),*/
                              /*ListView.separated(
                                itemCount: generateItemList().length,
                                itemBuilder: (context, index) {
                                  return Text('hi$index');
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        Divider(
                                  thickness: 2,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                physics: BouncingScrollPhysics(),
                              ),*/
                              ListView.builder(
                                itemCount: generateItemList().length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return generateItemList().elementAt(i);
                                },
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ));
  }

  Widget cardViewHotel() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: const EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 5, right: 5, left: 5),
            child: Image.asset('assets/images/foodcartlogo.png',
                fit: BoxFit.scaleDown),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MainText',
                          style: TextStyle(
                              fontSize: SizeConfig.medium,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('SUb')
                      ]),
                  SizedBox(
                      height: 20,
                      width: 50,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: Text('4.3 *',
                            style: TextStyle(
                                fontSize: SizeConfig.small,
                                fontWeight: FontWeight.normal,
                                color: appcolors.white)),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget roundedEdgeButton(
      var buttonLabel, BuildContext context, bool isSelected) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? appcolors.orange : Colors.white, //button's fill color
        //specify the color of the button's text and icons as well as the overlay colors used to indicate the hover, focus, and pressed states
        disabledForegroundColor: appcolors
            .button_gray, //specify the button's disabled text, icon, and fill color
        shadowColor: Colors.black, //specify the button's elevation color
        elevation: 4.0, //buttons Material shadow
        textStyle: TextStyle(
            fontFamily: 'roboto'), //specify the button's text TextStyle
        padding: const EdgeInsets.only(
            top: 4.0,
            bottom: 4.0,
            right: 8.0,
            left: 8.0), //specify the button's Padding
        minimumSize:
            Size(20, 40), //specify the button's first: width and second: height
        side: BorderSide(
            color: appcolors.white_light,
            width: 2.0,
            style: BorderStyle.solid), //set border for the button
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                35.0)), // set the buttons shape. Make its birders rounded etc
        enabledMouseCursor:
            MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
        disabledMouseCursor: MouseCursor
            .uncontrolled, //used to construct ButtonStyle.mouseCursor
        visualDensity: VisualDensity(
            horizontal: 0.0, vertical: 0.0), //set the button's visual density
        tapTargetSize: MaterialTapTargetSize
            .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
        animationDuration:
            Duration(milliseconds: 100), //the buttons animations duration
        enableFeedback: true, //to set the feedback to true or false
        alignment: Alignment.center, //set the button's child Alignment
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              '$buttonLabel',
              style: TextStyle(
                  color: isSelected ? appcolors.white : appcolors.black,
                  fontSize: SizeConfig.small,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onPressed: () {
        print('Clicked on $buttonLabel');
        setState(() {
          toggleFoodCategorySelection(buttonLabel);
        });
      },
    );
  }

  toggleFoodCategorySelection(var selectedItem) {
    btnBeveragesFlag = false;
    btnDesertsFlag = false;
    btnMealsFlag = false;
    btnStarterFlag = false;
    if (selectedItem == 'Starter') btnStarterFlag = true;
    if (selectedItem == 'Beverages') btnBeveragesFlag = true;
    if (selectedItem == 'Meals') btnMealsFlag = true;
    if (selectedItem == 'Deserts') btnDesertsFlag = true;
  }

  Widget populateItemCard(BuildContext contex, var category, var imgUri,
      var title, var desc, double price) {
    var categoryIcon = category == 'non'
        ? 'assets/images/nonveg.png'
        : 'assets/images/veg.png';
    Color icColor = category == 'non'
        ? appcolors.nonveg_ic_color
        : appcolors.vegitarian_ic_color;
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                // margin: EdgeInsets.only(right: 10),// not here
                color: Colors.red,
                child: Image.asset(
                  // post.thumb,
                  imgUri,
                  // fit: BoxFit.fitHeight,
                  height: 120,
                ),
              ),
            ),
            Text('gsdfghsafjj'),
            Expanded(
              child: ReadMoreText(
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
        /*Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                // margin: EdgeInsets.only(right: 10),// not here
                color: Colors.red,
                child: Image.asset(
                  // post.thumb,
                  imgUri,
                  // fit: BoxFit.fitHeight,
                  height: 120,
                ),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 30,
                      width: 100,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ImageIcon(
                          AssetImage(categoryIcon),
                          color: icColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Text(title, textAlign: TextAlign.left)),
                  Expanded(flex: 1, child: Text('$price')),
                  Expanded(
                    flex: 1,
                    child: ReadMoreText(
                      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )*/
          ],
        ),*/
        /* Expanded(
          child: ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        )*/
      ],
    );
  }

  Widget populateCarolslider(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,

        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Clicked on --$i');
                    },
                    child: Image.network(
                      i,
                      fit: BoxFit.contain,
                    ),
                  ) /*Text(
                                        'text $i',
                                        style: TextStyle(fontSize: 16.0),
                                      )*/
                  ),
            );
          },
        );
      }).toList(),
      carouselController: sliderImagecontroller,
    );
    /* Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 10,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          height: SizeConfig.getScreenSize(context, 'H')/ 5,
          width: SizeConfig.getScreenSize(context, 'W') / 1.2,
          child: CarouselSlider(
            images: [
              NetworkImage(
                  'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
              NetworkImage(
                  'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
              NetworkImage(
                  'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg')
            ],
            showIndicator: false,
            borderRadius: false,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
            overlayShadow: true,
            overlayShadowColors: Color(0xff0D6EFD),
            overlayShadowSize: 0.7,
            radius: Radius.circular(30.0),
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 10,
      ),
    ]);*/
  }

  Widget itemCard(BuildContext contex, var category, var imgUri, var title,
      var desc, double price) {
    var categoryIcon = category == 'non'
        ? 'assets/images/nonveg.png'
        : 'assets/images/veg.png';
    Color icColor = category == 'non'
        ? appcolors.nonveg_ic_color
        : appcolors.vegitarian_ic_color;
    int totalItem = 1;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                // margin: EdgeInsets.only(right: 10),// not here
                color: Colors.red,
                child: Image.asset(
                  // post.thumb,
                  imgUri,
                  // fit: BoxFit.fitHeight,
                  height: 120,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 100,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: ImageIcon(
                          AssetImage(categoryIcon),
                          color: icColor,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        viewOrHideAddRemoveButton
                            ? Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: appcolors.orange_deep),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          print(
                                              'Clicked on Add button of$title');
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          color: appcolors.white,
                                          size: SizeConfig.small_medium,
                                        )),
                                    Text(
                                      '$totalItem',
                                      style: TextStyle(
                                          color: appcolors.white,
                                          fontSize: SizeConfig.small_medium),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          print('Clicked on + button of$title');
                                          setState(() {
                                            viewOrHideAddRemoveButton = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: appcolors.white,
                                          size: SizeConfig.small_medium,
                                        ))
                                  ],
                                ),
                              )
                            : Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: appcolors.orange),
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        viewOrHideAddRemoveButton = true;
                                        print('Clicked on Add button of$title');
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Add',
                                          style:
                                              TextStyle(color: appcolors.white),
                                        )
                                      ],
                                    )))
                      ],
                    )
                  ],
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('$price'),
                ReadMoreText(
                  'Test Description having multiple words .',
                  trimLines: 2,
                  preDataText: "Desc",
                  preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
                  style: TextStyle(color: Colors.black),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...read more',
                  trimExpandedText: ' less',
                ),
                Divider(
                  color: const Color(0xFF167F67),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getFinalListView() {
    return ListView.builder(
      itemCount: 1,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Container(
          height: 40,
          width: 70,
          child: Text('$i'),
        );
      },
    );
  }

  List<Widget> generateItemList() {
    List<Widget> itemElements = [];
    itemElements.add(itemCard(context, 'non', "assets/images/food1.png",
        'Title', 'Test desc', 1000.00));
    itemElements.add(itemCard(context, 'veg', "assets/images/food1.png",
        'Title1', 'Test desc2', 1200.00));
    return itemElements;
  }
}
