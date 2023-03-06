import 'package:blazon/constants/ui_constants.dart';
import 'package:blazon/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final List _cover = [
    'images/hamilton-disney-plus-675x424.jpg',
    'images/avengers.jpg',
    'images/toy-story.jpg',
    'images/the-incredibles-675x380.jpg',
  ];

  final List _recommmended = [
    'images/p_disneyplus_magicofdisneysanimalkingdomv2_19833_9f8803e9.png',
    'images/p_blackbeauty_disneyplus_v2_20374_4ae962ea.jpg',
    'images/p_folklore_disneyplus_v3_20383_d065b2e2.jpg',
    'images/p_fyc_togo_4bc503bd.jpg',
    'images/p_godmothered_disneyplus_v2_20382_498360a2.jpg',
    'images/p_hsmtmths_20381_b1b678ae.jpg',
    'images/p_marvel616_disneyplus_v2_19740_1c1870b4.jpg',
    'images/p_therealrightstuff_disneyplus_v2_20312_143c8738.jpg',
  ];

  final List _hit = [
    'images/best-kids-movies-2020-call-of-the-wild-1579042974.jpg',
    'images/mulan.jpg',
    'images/dolittle.jpg',
    'images/best-movies-for-kids-2020-my-spy-1571173555.jpg',
    'images/best-movies-for-kids-2020-disney-artemis-fowl-1571177691.jpg',
    'images/onward.jpg',
    'images/star-wars.jpg',
    'images/best-kids-movies-2020-secret-garden-1579043478.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilmAppBar(
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(),
            height: 200.0,
            child: ListView.builder(
              itemCount: _cover.length,
              itemBuilder: (context, index) => Container(
                height: 180,
                width: screenWidth! - 24.0,
                child: Card(
                  margin: EdgeInsets.all(4.0),
                  child: Image.asset(
                    _cover[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
          verticalSpaceTiny,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Recommended for you'),
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              itemCount: _recommmended.length,
              itemBuilder: (context, index) => Container(
                height: 200,
                width: 135,
                child: Card(
                  margin: EdgeInsets.all(8.0),
                  child: Image.asset(
                    _recommmended[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
          verticalSpaceTiny,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Hit Movies'),
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              itemCount: _hit.length,
              itemBuilder: (context, index) => Container(
                height: 200,
                width: 135,
                child: Card(
                  margin: EdgeInsets.all(8.0),
                  child: Image.asset(
                    _hit[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
