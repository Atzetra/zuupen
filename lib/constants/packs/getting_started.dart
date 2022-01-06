import '../../enums/enums.dart';
import '../../models/game_card.dart';

List<GameCard> gettingStarted = [
  GameCard(
      firstLine:
          'You, who is handling the phone, choose who will down their drink.',
      cardType: CardType.bottomsUp,
      players: 0),
  GameCard(
      firstLine: '{{0}}, do what {{1}} tells you to do or drink 3 times.',
      cardType: CardType.rule,
      players: 2),
  GameCard(
      firstLine:
          'For or against calling your dog "Barack"? Everyone vote at the same time, losers drink 4 times.',
      cardType: CardType.game,
      players: 0),
  GameCard(
      firstLine: 'Anyone who is shorter than {{0}}, drink 2 times.',
      cardType: CardType.rule,
      players: 1),
  GameCard(
      firstLine: '{{0}}, give out as many sips as {{1}} has good qualities.',
      cardType: CardType.rule,
      players: 2),
  GameCard(
      firstLine: "Drink 3 times if you've said someone is ugly in their face.",
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine: 'The person with the fullest glass drinks 4 times. Catch up!',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          'Every time {{0}} speaks, {{1}} drinks once, and vice versa until further notice.',
      secondLine: "{{1}} is no longer the victim of {{0}}'s speaking.",
      cardType: CardType.virus,
      players: 2),
  GameCard(
      firstLine:
          "{{0}} you're so shy! You must not answer a single question or you get a 3-sip penalty.",
      secondLine: '{{0}} can answer questions again.',
      cardType: CardType.virus,
      players: 1),
  GameCard(
      firstLine: '{{0}} drink 2 times.', cardType: CardType.rule, players: 1),
  GameCard(
      firstLine:
          '{{0}} and {{1}} must equalize their drinks. The player who has the most filled glass, drink to have the same volume as your friend.',
      cardType: CardType.rule,
      players: 2),
  GameCard(
      firstLine: 'Do a round of Never have I Ever. {{0}} starts.',
      cardType: CardType.game,
      players: 1),
  GameCard(firstLine: '''
{{0}}, name as many people as you can that {{1}} has slept with, without being in
 a serious relationship and hand out as many sips.
  You can stop whenever you want, but you lose and have to drink 4 sips if you
   make a mistake.''', cardType: CardType.rule, players: 2),
  GameCard(firstLine: '''
Those who have watched porn together, drink 3 times. Drink 1 more if you did more
 than watch.''', cardType: CardType.rule, players: 0),
  GameCard(
      firstLine: 'Ladies, drink 3 times!', cardType: CardType.rule, players: 0),
  GameCard(
      firstLine: '''
{{0}} give a dare to {{1}}. If she or he completes it, she or he can give out 2 sips.''',
      cardType: CardType.rule,
      players: 2),
  GameCard(
      firstLine: 'Drink 4 sips if you have ever vomited out of a window.',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          '"Famous criminals", first person to repeat themselves or can\'t think of anything drinks 3 times. {{0}}. you start.',
      cardType: CardType.game,
      players: 1),
  GameCard(
      firstLine:
          '{{0}}, make up your mind: Who is the worst speller, {{1}} or {{2}}? {{3}} must drink 3 sips.',
      cardType: CardType.rule,
      players: 4),
  GameCard(
      firstLine:
          'Girls drink as many sips as there are handsome guys in the room.',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          '"Manual jobs", the first to run out of jobs drinks 3 times. {{0}} starts.',
      cardType: CardType.game,
      players: 1),
  GameCard(
      firstLine: '{{0}}, give {{1}} 2 euro or down your drink.',
      cardType: CardType.bottomsUp,
      players: 2),
  GameCard(
      firstLine:
          '{{0}}, if you stay quiet for 5 minutes you can choose someone to finish their drink.',
      cardType: CardType.rule,
      players: 1),
  GameCard(
      firstLine:
          '{{0}}, does {{1}} have a sister? Drink 2 times if wrong, give out 2 sips if right.',
      cardType: CardType.rule,
      players: 2),
  GameCard(
      firstLine:
          "Give out 3 sips if you've ever had an article written about you in a newspaper.",
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine: "Give out 2 sips if you've ever masturbated at work.",
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine: 'Guitar players drink 4 times',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine: '{{0}} give out as many sips as single people playing.',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          '"Something red and white", first person to repeat or can\'t think of anything drink 2 times. {{0}} starts.',
      cardType: CardType.game,
      players: 1),
  GameCard(
      firstLine:
          'The player who had the most relationships between {{0}} and {{1}} drinks 4 times.',
      cardType: CardType.rule,
      players: 2),
  GameCard(
      firstLine:
          '{{0}} make up your mind: Who would be the first to go run naked in the snow, {{1}} or {{2}}? Chosen one drinks 3 times.',
      cardType: CardType.rule,
      players: 3),
  GameCard(
      firstLine:
          '{{0}}, make up your mind: Who do you think would hesitate more between a fast-food meal and a salad? {{1}} or {{2}}? This person drinks 2 sips.',
      cardType: CardType.rule,
      players: 3),
  GameCard(
      firstLine:
          '{{0}}, make up your mind: Who knows Disney songs the best? {{1}} or {{2}}? This person gives out 2 sips.',
      cardType: CardType.rule,
      players: 3),
  GameCard(
      firstLine: "Give out 2 sips if you've ever given someone a bikini wax.",
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          '"Movies where an American hero walks towards the camera as something explodes behind him", the first to run out of ideas drinks 2 times. {{0}} you start.',
      cardType: CardType.game,
      players: 1),
  GameCard(
      firstLine: "Give out 5 sips if you've ever farted while kissing someone.",
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          'The person to have masturbated the most times in a day, give out 3 sips.',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          'Hands up! Last person with their hands in the air drinks 4 times.',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine: "Drink 2 times if you've ever taken someone's virginity.",
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          '{{0}} is upsetman! Each time upsetman smiles or laughs, he/she drinks 2 times.',
      secondLine: '{{0}} is no longer upsetman!',
      cardType: CardType.virus,
      players: 1),
  GameCard(
      firstLine:
          'Would you rather go to prison for 6 months or live alone for a whole year? Vote at the same time, losers drink 2 times.',
      cardType: CardType.game,
      players: 0),
  GameCard(
      firstLine: 'People who smoke, drink 3 times.',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine: 'Drink 4 times if you have nudes on your phone.',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine: "People with an M in your first name, let's down it all!",
      cardType: CardType.bottomsUp,
      players: 0),
  GameCard(
      firstLine:
          'Around the room, name someone who must take 2 sips. {{0}} you start.',
      cardType: CardType.game,
      players: 1),
  GameCard(
      firstLine:
          "{{0}}, if your feet are smaller than {{1}}'s, you drink 5 times. Otherwise give out 4 sips.",
      cardType: CardType.rule,
      players: 2),
  GameCard(
      firstLine: 'The person who has been single the longest give out 3 sips',
      cardType: CardType.rule,
      players: 0),
  GameCard(
      firstLine:
          "Drink 3 times if you think that the current song playing sucks. If there's no music, everyone drink 3 times.",
      cardType: CardType.rule,
      players: 0),
];
