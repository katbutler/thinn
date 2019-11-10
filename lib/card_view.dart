import 'package:flutter/material.dart';

import 'models/loyalty_card.dart';

class CardView extends StatefulWidget {
  const CardView({
    Key key,
  }) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final List<LoyaltyCard> cards = <LoyaltyCard>[
    LoyaltyCard("FarmBoy", "12345678"),
    LoyaltyCard("Movati", "2222"),
    LoyaltyCard("PC Optimum", "666"),
    LoyaltyCard("Cineplex", "MOVIES123"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        final card = cards[index];
        return ThinnCard(card: card);
      },
    );
  }
}

class ThinnCard extends StatelessWidget {
  const ThinnCard({Key key, @required this.card}) : super(key: key);

  final LoyaltyCard card;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        color: Colors.amber[300],
        child: Center(child: Text('${card.name}')),
      ),
    );
  }
}
