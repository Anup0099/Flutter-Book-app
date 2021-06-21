import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterbookapp/constants/color_constant.dart';
import 'package:flutterbookapp/models/popularbook_model.dart';
import 'package:flutterbookapp/screens/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_tabindicator.dart';

class SelectedBookScreen extends StatelessWidget {
  final PopularBookModel popularBookModel;
  SelectedBookScreen({Key key, @required this.popularBookModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: kMainColor,
        child: FlatButton(
          onPressed: () {},
          child: Text(
            'Add to library',
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: kWhiteColor,
            ),
          ),

          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: kMainColor,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                   color: Color(popularBookModel.color),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 25,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "./homeScreen");
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kWhiteColor,
                            ),
                            child: SvgPicture.asset(
                                'assets/icons/icon_back_arrow.svg'),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 62),
                          width: 172,
                          height: 225,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  popularBookModel.image),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Text(
                      popularBookModel.title,
                      style: GoogleFonts.openSans(
                        fontSize: 27,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Padding(
                  padding: EdgeInsets.only(top: 7, left: 25),
                  child: Text(
                    popularBookModel.author,
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: kGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),

                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '\$ ',
                          style: GoogleFonts.openSans(
                            fontSize: 27,
                            color: kMainColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          popularBookModel.price,
                          style: GoogleFonts.openSans(
                            fontSize: 32,
                            color: kMainColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 28,
                    margin: EdgeInsets.only(top: 23, bottom: 36),
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
                              margin: EdgeInsets.only(right: 39),
                              child: Text('New'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(right: 39),
                              child: Text('Trending'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(right: 39),
                              child: Text('BestSeller'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.\n\nAll the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kGreyColor,
                        letterSpacing: 1.5,
                        height: 2,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
