import 'package:flutter/material.dart';
import 'package:signs/main.dart';

class Standards extends StatefulWidget {
  const Standards({Key? key}) : super(key: key);

  @override
  State<Standards> createState() => _StandardsState();
}

class _StandardsState extends State<Standards> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: const Color(0xff1062C2),
          title: Text(
            appName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          centerTitle: true,
          floating: true,
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
                child: RichText(
                    text: const TextSpan(
                        text:
                            'Here are some signs that a person would likely make a great relationship partner.',
                        style: TextStyle(
                            height: 1,
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 1.0,
                            letterSpacing: 1.0))))),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          sliver: SliverToBoxAdapter(
            child: RichText(
                text: const TextSpan(
                    text:
                        "1. They speak positively about potentially having a family.\n\n2. They are direct about their desire to have a long-term relationship.\n\n3. They make decisions that are motivated by achieving long term goals.\n\n4. They have an orbit of stable friends and family members that impact them positively.\n\n5. They are not afraid to stand up for their values and principles.\n\n6. They are not conflict avoidant and seek to fairly settle disputes.\n\n7. They do not have too always be right.\n\n8. They would be described as a kind person.\n\n9. They do not regularly make impulsive decisions.\n\n10. They take responsibilities for their life choices.\n\n",
                    style: TextStyle(
                        height: 1,
                        fontSize: 14,
                        color: Colors.black,
                        wordSpacing: 1.0,
                        letterSpacing: 1.0))),
          ),
        ),
      ],
    );
  }
}
