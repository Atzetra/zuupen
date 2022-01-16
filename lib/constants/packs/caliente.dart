import '../../enums/enums.dart';
import '../../models/game_card.dart';

List<GameCard> caliente = [
  GameCard(
      firstLine:
          '{{0}}, pretend you are having an orgasm for 10 seconds or finish your drink.',
      cardType: CardType.rule,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          "If you've had sex with someone more than 5 years younger than you, {{drink}}.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, make up your mind: Who do you think had sex for longer when they last did it, {{1}} or {{2}}? This person {{drink}}.',
      cardType: CardType.rule,
      players: 3,
      elements: 1),
  GameCard(
      firstLine:
          'You can spin the bottle as escape! Instead of drinking, spin the bottle and kiss the targeted player. Refuser has to drink double the sips.',
      secondLine: 'No more spin the bottle for you!',
      cardType: CardType.virus,
      players: 0,
      elements: 0),
  GameCard(
      firstLine:
          '{{0}}, mime a sexual position with {{1}}. {[0]} sips in case of refusal.',
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, flash your boobs for to seconds to the room. 3 sips in case of refusal.',
      cardType: CardType.rule,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          '{{0}}, make up your mind: Who do you think that likes anal sex more, {{1}} or {{2}}? This person {{drink}}.',
      cardType: CardType.rule,
      players: 3,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, finish your drink and nibble/lick the ear of the most attractive person in the room.',
      cardType: CardType.caliente,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          "{{0}}, if you've ever masturbated before going on a date, drink {[0]} sips.",
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          'What is your favorite sexual position? If you have the same answer as someone else, you both can give out {[0]} sips.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '"Super hot female singers", first person to repeat or can\'t think of anything drinks {[0]} times. {{0}} starts.',
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}} and {{1}}, give out 6 sips if you went to bed with the same person.',
      cardType: CardType.rule,
      players: 2,
      elements: 0),
  GameCard(
      firstLine:
          'Whoever has the biggest hands between {{0}} and {{1}} {{drink}}.',
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          '{{drink}} if the person you had sex with last was the best screw of your life.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          'Point to the most attractive person in the room. The choosen one {{drink}}.',
      cardType: CardType.game,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          "{{0}} give out {[0]} sips to someone older than you. If it's impossible drink them.",
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: "{{drink}} if you've given oral last week.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}} give out {[0]} sips if you can name 3 One Direction songs. Otherwise drink them.',
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: "{{0}}, lick {{1}}'s lips or drink {[0]} times.",
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}} choose a letter. All players who have slept with a person whose first name starts with this letter, drink {[0]} times.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '{{drink}} if you like giving or being given a slap on the ass.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          'Give 2 sips to each person around the table you had erotic fantasies about. Drink 6 if you refuse to tell.',
      cardType: CardType.rule,
      players: 0,
      elements: 0),
  GameCard(
      firstLine:
          "{{0}}, {{drink}} to a player younger than you. Drink if it's impossible.",
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          "Drink {[0]} sips if you've ever mastrubated a few hours before meeting someone to delay orgasm.",
      cardType: CardType.game,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, choose a player to motor boat {{1}}. Refuser drinks {[0]} time.',
      cardType: CardType.game,
      players: 2,
      elements: 1),
  GameCard(
      firstLine: "{{drink}} if you've fallen asleep during sex.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine: "{{drink}} if you have a sextape of yourself.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, choose someone to show you one of their private parts. {[0]} sips in case of refusal.',
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: "{{0}}, if sex with {{1}} wouldn't bother you, {{drink}}.",
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          'Would you rather give the first 95% of a blowjob or the last 5%? Losers drink {[0]} time.',
      cardType: CardType.game,
      players: 0,
      elements: 1),
  GameCard(
      firstLine: '{{drink}} if you had an orgasm in less than 3 minutes.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          'Play one round of spin the bottle. 4 sips in case of refusal. {{0}} starts.',
      cardType: CardType.game,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          '{{0}}, unhook the bra of {{1}}. 3 sips in case of refusal. In case of no bra, both drink {[0]} time.',
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}} and {{1}} eskimo kiss. Drink 2 times in case of refusal.',
      cardType: CardType.rule,
      players: 2,
      elements: 0),
  GameCard(
      firstLine: '{{0}}, give out as many sips as you have sex toys.',
      cardType: CardType.rule,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          "{{0}}, finish your drink and touch someone's genitals for 5 seconds. And yes, underneath their underwear.",
      cardType: CardType.caliente,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          "{{0}}, tell the most adventurous place you've had sex. Give out 4 sips if no one can one-up you.",
      cardType: CardType.rule,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          "{{0}}, if you've ever made love in the shower, drink {[0]} sips. Otherwise give them out.",
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: '{{0}}, let someone lick your nipples or drink {[0]} times.',
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: "If you've never had sex in a car, {{drink}}.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          "{{drink}} if you've ever broken your bed or a piece of furniture while having sex.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '"Places to have a guy cum on". First person to run out of ideas drinks {[0]} times. {{0}} starts.',
      cardType: CardType.game,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, name an accessory (belt, watch, necklace etc). Everyone wearing this accessory {[0]}.',
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          "{{0}}, take off a piece of cloathing, socks don't count. Drink {[0]} time when you refuse.",
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          'Drink {[0]} times if you like the idea of fucking while watching porn.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '"Sexual positions". First one to run out of ideas drinks {[0]} time. {{0}} starts.',
      cardType: CardType.game,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: "{{0}}, touch someone's boobs. {[0]} sips in case of refusal.",
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          "Let's convince the jury! {{0}} and {{1}} tell about their worst sexual experience, then the other players vote for the worst one! The winner {{drink}}.",
      cardType: CardType.game,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, choose between kissing someone or drinking {[0]} time.',
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, if you kiss {{1}} on the cheek, everyone else has to take {[0]} sips.',
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          'Smart game! Each time {{0}} touches a glass, {{1}} must mime an extreme orgasm. 2 sips for each miss.',
      secondLine: 'No more orgasms when someone touches a glass.',
      cardType: CardType.virus,
      players: 2,
      elements: 0),
  GameCard(
      firstLine:
          'Stand up! The last player to stand up has to drink {[0]} time.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, make up your mind: Who do you think wants less to sleep with the other person. {{1}} or {{2}}. This person must drink {[0]} time.',
      cardType: CardType.rule,
      players: 3,
      elements: 1),
  GameCard(
      firstLine:
          'New rule! Everytime you take a sip you must pinch your nipples. 3 sips for each miss.',
      secondLine: 'You can leave your nipples alone.',
      cardType: CardType.virus,
      players: 0,
      elements: 0),
  GameCard(
      firstLine:
          '{{0}}, finish your drink and use your glass to play spin the bottle. Whoever you get, french kiss them.',
      cardType: CardType.caliente,
      players: 1,
      elements: 0),
  GameCard(
      firstLine: "{{0}}, nibble on someone's ear or drink {[0]} time.",
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: 'Everyone with brown hair {{drink}}.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          'Drink {[0]} times if several people in this room are attractive according to you.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          "{{0}}, make up your mind: Who has slept with people they weren't attracted to more, {{1}} or {{2}}? This person {{drink}}.",
      cardType: CardType.rule,
      players: 3,
      elements: 1),
  GameCard(
      firstLine:
          '{{drink}} if you think you can make the neighbor to your right cum within 10 minutes.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          "Let's get sensual! Go around the room and touch the chest of the person to your right or drink {[0]} times.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          "{{0}}, make up your mind: Who do you think would be more capable of spitting on their partner's private parts? {{1}} or {{2}}? This person must {{drink}}.",
      cardType: CardType.rule,
      players: 3,
      elements: 1),
  GameCard(
      firstLine:
          '"Sex toys", the first to run out of ideas drinks {[0]} times. {{0}} begins.',
      cardType: CardType.game,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          'Male underwear contest! Girls are the jury. The loser drinks {[0]} sip.',
      cardType: CardType.game,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          "{{0}}, put your hand in someone's underwear. {[0]} sips in case of refusal.",
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: '{{0}} and {{1}} must agree to give one person {[0]} sips.',
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, for 150.000 euros, would you sleep with {{1}}? Yes: give out {[0]} sips. No: drink them.',
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          "{{drink}} sips if you've ever masturbated in front of your partner.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          'Drink {[0]} time if you ever regreted going to bed with someone.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}} and {{1}} romantically hold hands, until told otherwise!',
      secondLine: "You can let go of each others hands. If you want of course.",
      cardType: CardType.virus,
      players: 2,
      elements: 0),
  GameCard(
      firstLine:
          'Would you rather have a steamy night with Emma Watson or Margot Robbie? Vote at the same time, losers drink {[0]} times.',
      cardType: CardType.game,
      players: 0,
      elements: 1),
  GameCard(
      firstLine: "{{0}}, if you've ever seen {{1}} genitals, {{drink}}.",
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          "Bra contest! Guys you're the jury. The winner gives out {[0]} sips.",
      cardType: CardType.game,
      players: 0,
      elements: 1),
  GameCard(
      firstLine: '{{drink}} if the last movie you saw was romantic.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, get your crotch sensually touched by {{1}} or drink 3 times.',
      cardType: CardType.rule,
      players: 2,
      elements: 0),
  GameCard(
      firstLine:
          '{{0}} give a hickey to someone of your choice or drink {[0]} time.',
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine: "{{0}}, sit on {{1}}'s lap.",
      secondLine: "You can dismount from his/her lap.",
      cardType: CardType.virus,
      players: 2,
      elements: 0),
  GameCard(
      firstLine: "{{0}}, lick {{1}} tongue or drink 4 times.",
      cardType: CardType.rule,
      players: 2,
      elements: 0),
  GameCard(
      firstLine:
          '{{0}}, choose 2 players that have to mime a sexual position and drink {[0]} sip at the same time.',
      cardType: CardType.rule,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          '"Celebrities with leakes sex tapes", first person to run out of ideas drinks {[0]} time. {{0}} starts.',
      cardType: CardType.game,
      players: 1,
      elements: 1),
  GameCard(
      firstLine:
          'Everyone reads out the first message displayed when you type "blowjob" in the search bar. Whoever passes, drinks {[0]} time.',
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          'Giving or receiving? Everyone votes at the same time, losers drink {[0]} time.',
      cardType: CardType.game,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          'What was your longest dry spell for sex? Each person answers. {{0}} and {{1}} give out as many sips as the number of months.',
      cardType: CardType.rule,
      players: 2,
      elements: 0),
  GameCard(
      firstLine:
          '{{0}}, make up your mind: Who has masturbated in the more unusual place? {{1}} or {{2}}? This person must {{drink}}.',
      cardType: CardType.rule,
      players: 3,
      elements: 1),
  GameCard(
      firstLine: '{{0}}, get your finger sucked by {{1}} or drink {[0]} time.',
      cardType: CardType.rule,
      players: 2,
      elements: 1),
  GameCard(
      firstLine:
          '{{0}}, down the drink of the player you want to end up with tonight...',
      cardType: CardType.caliente,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          "Tricky question! Take turns and ask someone about a naughty thing. If the person doesn't want to answer, they have to drink 4 times. {{0}} starts.",
      cardType: CardType.game,
      players: 1,
      elements: 0),
  GameCard(
      firstLine:
          "{{drink}} if you've had sex with someone the night you met them.",
      cardType: CardType.rule,
      players: 0,
      elements: 1),
  GameCard(
      firstLine:
          'Those who went at it for longer than 5 hours give out 6 sips.',
      cardType: CardType.rule,
      players: 0,
      elements: 0),
];
