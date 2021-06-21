import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterbookapp/constants/color_constant.dart';
import 'package:flutterbookapp/models/newbook_model.dart';
import 'package:flutterbookapp/models/popularbook_model.dart';
import 'package:flutterbookapp/widget/selected_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterbookapp/widget/custom_tabindicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Container(
            child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  children: <Widget>[
                    Text('Hi, Anup',
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kGreyColor)),
                    Text('Discover Latest Book',
                        style: GoogleFonts.openSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: kBlackColor)),
                  ],
                )),
            Container(
              height: 39,
              margin: EdgeInsets.only(left: 25, right: 25, top: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightGreyColor),
              child: Stack(
                children: <Widget>[
                  TextField(
                    maxLengthEnforced: true,
                    style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 19, right: 50, bottom: 8),
                        border: InputBorder.none,
                        hintText: 'Search Book...',
                        hintStyle: GoogleFonts.openSans(
                          fontSize: 12,
                          color: kGreyColor,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Positioned(
                    right: 0,
                    child: SvgPicture.asset('assets/svg/background_search.svg'),
                  ),
                  Positioned(
                    right: 9,
                    top: 8,
                    child: SvgPicture.asset('assets/icons/icon_search_white.svg'),
                  )
                ],
              ),
            ),
            Container(
              height: 25,
              margin: EdgeInsets.only(
                top: 10,
              ),
              padding: EdgeInsets.only(left: 25),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  labelColor: kBlackColor,
                  isScrollable: true,
                  indicatorPadding: EdgeInsets.all(0),
                  labelStyle: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                  indicator: RoundedRectangleTabIndicator(
                    width: 10,
                    weight: 2,
                    color: kBlackColor,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('New'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('Trending'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text('BestSeller'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 21),
              height: 210,
              child: ListView.builder(
                  itemCount: newbooks.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 25, right: 6),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 19),
                      height: 210,
                      width: 153,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kMainColor,
                          image: DecorationImage(
                            image: AssetImage(newbooks[index].image),
                          )),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Text('Popular',
                  style: GoogleFonts.openSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor)),
            ),
            ListView.builder(
                itemCount: populars.length,
                padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('List view tapped');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectedBookScreen(
                                  popularBookModel: populars[index])));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 19),
                      height: 81,
                      width: MediaQuery.of(context).size.width - 50,
                      color: kBackgroundColor,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 81,
                            width: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(populars[index].image),
                              ),
                              color: kMainColor,
                            ),
                          ),
                          SizedBox(
                            width: 21,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                populars[index].title,
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kBlackColor,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(populars[index].author,
                                  style: GoogleFonts.openSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: kGreyColor,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\$' + populars[index].price,
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: kBlackColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        )),
      ),
    );
  }
}
