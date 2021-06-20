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
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: kMainColor,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  // color: Color(popularBookModel.color),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: GestureDetector(
                          onTap: () {},
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
                          width: 225,
                          height: 172,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/img_popular_book1.png'),

                          ),
                          borderRadius: BorderRadius.circular(10),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(delegate: SliverChildListDelegate(
                [Padding(padding: EdgeInsets.only(top: 24,left: 25),
                child: Text('You\'r A Miracle ',style: GoogleFonts.openSans(
                  fontSize: 27,
                  color: kBlackColor,
                  fontWeight: FontWeight.w600,

                ),),
                
                
                ),


                Padding(padding: EdgeInsets.only(top: 24,left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                  Text('\$ ',style: GoogleFonts.openSans(
                  fontSize: 27,
                  color: kMainColor,
                  fontWeight: FontWeight.w600,

                ),),



                Text('20 ',style: GoogleFonts.openSans(
                  fontSize: 32,
                  color: kMainColor,
                  fontWeight: FontWeight.w600,

                ),),


                ],
                ),
                
                
                ),
                Container( 
                  height: 28,
                  margin: EdgeInsets.only(top: 23,bottom: 36),
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

                
                
                ]
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
