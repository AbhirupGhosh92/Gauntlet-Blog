import 'package:flutter/material.dart';

import 'GlowingCardsLayout.dart';

class TutorialCardsView extends StatelessWidget {
  TutorialCardsView({final key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GlowingCardsLayout(
          imageUrl: "images/svg/test.svg",
          headerText: "Mobile\nDevelopment",
          subText: "72.7% of all devices run Android in one form or the other. This makes android one of the most sought after mobile platforms for business\n\n" +
              "With technologies like ract native and flutter we can generate multiple apps for different platforms using a single code base.\n\n" +
              "So our mobile phones are soon becoming the centre of our lives and having the ability to control the centre is really fruitful.",
          logo: "",
          margin: EdgeInsets.only(top: 100, left: 50, right: 10, bottom: 100),
        ),
        GlowingCardsLayout(
          imageUrl: "images/svg/artificial-intelligence.svg",
          headerText: "Artificial\nIntelligence",
          subText: "AI and ML are the two new buzz words in town and almost all businesses are fighting to have a piece of the cake. Its predicted that within the next couple of decades, AI will outpace the human mind.\n\n" +
              "It must be adopted as soon as possible. The rate at which things are being innovated in this field is mindboggling.\n\n" +
              "So it is very important that we can get hold of AI/ML and use it in our business practices.",
          logo: "",
          margin: EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 100),
        ),
        GlowingCardsLayout(
          imageUrl: "images/svg/data-complexity.svg",
          headerText: "System\nDesign",
          subText: "Building complex systems involves not only technical knowhow, but also a sense of scale and anticipation. So its important for a solutions architect to be farsighted and having a sense of scale.\n\n" +
              "With the plethora of platforms and technologies at our disposal, we must cautiously choose our tech stack.\n\n" +
              "In the age of the cloud revolution is an enthralling and adventurous journey.",
          logo: "",
          margin: EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 100),
        ),
        GlowingCardsLayout(
            imageUrl: "images/svg/web-programming.svg",
            headerText: "Web\nDevelopment",
            subText: "Ah... the good old web, ancient yet immortal, it has been and will be there to slently smirk at the new tech stacks popping up every now and then.\n\n" +
                "Todays web is a lot different from its ancestor. Infact todays web doenot need to be coded in the old ways anymore.\n\n" +
                "Any business will require a robust web site to before even openeing its first office. The good old web developers will always be omnipresent.",
            logo: "",
            margin:
                EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 100)),
        GlowingCardsLayout(
            imageUrl: "images/svg/projectManagement.svg",
            headerText: "Project\nManagement",
            subText: "A ship is as good as its captain. With that said, any business can't do much with all the technological muscle power and brilliant minds if it has a sloppy manager.\n\n" +
                "So its essential that there is a strong leadership which can manage as well as motivate the brilliant minds to produce extarordinary things.\n\n" +
                "Hence good project management is essential when it comes to any sucessful business which believe in innovation.",
            logo: "",
            margin:
                EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 100)),
        GlowingCardsLayout(
            imageUrl: "images/svg/communication.svg",
            headerText: "Soft\nSkills",
            subText: "When life gives you lemons , make lemonade out of it. Well its easier said than done even though there are so many techniques floating around.\n\n" +
                "Technical knowledge takes us just far enough but to go beyond we must know how to communicate, present and stimulate and also to deal with uneasy situations.\n\n" +
                "So for certified success in someones career, Soft skills and good communication are more important than technical skills .",
            logo: "",
            margin: EdgeInsets.only(left: 10, right: 50, top: 100, bottom: 100))
      ],
    ));
  }
}
