import 'package:get/get.dart';
import 'package:hockey_live_score/models/news_model.dart';

class NewsController extends GetxController {
  final isLoading = false.obs;
  RxList<NewsModel> news = <NewsModel>[].obs;

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() {
    isLoading.value = true;
    news.add(NewsModel(
        id: 1,
        title:
            'Form, history, facts: India vs Pakistan – Asian Champions Trophy hockey',
        desc:
            'Al Jazeera’s lowdown on the sport, the tournament and the upcoming clash between the South Asian hockey powerhouses and bitter rivals.South Asian sports fans can expect a mouthwatering contest on Saturday between India and Pakistan. The contest, though, will play out on the blue artificial pitch of a hockey ground and not the grassy green cricket venues that are synonymous with India-Pakistan encounters.'));
    news.add(NewsModel(
        id: 2,
        title: 'HMD is Now FC Barcelona’s Official Smartphone Partner',
        desc:
            'Part of the deal will also allow HMD to advertise its smartphones at the Olympic Stadium, and later on at Camp Nou once the team moves there. Additionally, teams from other sports will be also be part of the deal, including basketball, futsal, handball and roller hockey. Lars Silberbauer, Global Chief Marketing Office at HMD says:When it comes to creativity and innovation in sport you simply cannot look past FC Barcelona. The club has always championed fresh thinking, beauty, and flair, and we have the same mindset when it comes to technology. And just like FC Barcelona brings people together – it’s more than a club obviously – we’re the same. Every device we make is designed to enhance people’s lives and build connectivity. I’ve been a FC Barcelona fan for a long time, ever since Michael Laudrup joined the club back in 1989. I’m still a fan, and pleased to announce HMD as a supporter too. We can’t wait to work with the club, and the culers, to do some amazing things together.'));
    news.add(NewsModel(
        id: 3,
        title:
            'Match time, form: China vs India – Asian Champions Trophy 2024 hockey final',
        desc:
            '''Record four-time champions India will face confident hosts and first-time finalists China at the Moqi Base, Hulunbuir at 10:00 GMT.India will look to win a record-extending fifth Asian Champions Trophy title when they take on hosts China in the hockey tournament’s final on Tuesday.

The men in blue brushed aside South Korea in a 4-1 win in the second semifinal on Monday, while the hosts stunned three-time champions Pakistan 2-0 in a penalty shootout after the game ended 1-1 in normal time.

India were pre-tournament favourites for the title following their podium finish at the Paris Olympics 2024, where they beat Spain to bag bronze.

However, China’s win over former hockey powerhouse Pakistan came as a surprise as the Green Shirts were left to rue a string of missed opportunities in front of goal.

First-time finalists China will relish their chances in front of a partisan home crowd in the remote northeastern city of Hulunbuir, which lies in the Inner Mongolia autonomous region. They will hope that Wang Caiyu, their formidable goalkeeper who blocked several Pakistani attempts on goal in the semifinal, will be able to thwart attacks from the Indian forward line.'''));
    news.add(NewsModel(
        id: 4,
        title: 'Belarus filmmaker pleads with Serbia not to send him back',
        desc:
            '''A Belarusian filmmaker and opposition activist, Andrei Gnyot, has made a final, passionate appeal to a court in Serbia not to extradite him to Minsk, warning that he faces "inevitable torture and inevitable death" if he is sent back.
The activist urged the panel of three judges to "please, save my life", describing Belarus under Alexander Lukashenko as a "dictatorial system which tortures and kills".
He was arrested when he flew into Belgrade last October, on an international arrest warrant issued by Belarus for alleged tax evasion.
Mr Gnyot says he is being pursued because of his politics.'''));
    news.add(NewsModel(
        id: 5,
        title:
            'Good, bad and ugly: Love them or not, the new PWHL names give teams — and fans — identities',
        desc:
            '''The Fleet, the Frost, the Victoire, the Sirens, the Charge and the Sceptres.

In a process nearly a year in the making, the Professional Women's Hockey League on Monday unveiled the nicknames and logos for each of its six franchises entering its second season.

The public, inevitably, is already expressing their opinions for and against the new branding on social media, where some people say the Toronto Sceptres is "giving Swedish royalty," the Ottawa Charge looks too similar to the Calgary Flames, while the Montreal Victoire is seen by some as "the best logo in the league."

'''));
    news.add(NewsModel(
        id: 6,
        title:
            'Lawsuit Seeks To Open NCAA Hockey To Canada’s Major Junior Players',
        desc:
            '''Amid a seismic shift in the landscape surrounding NCAA athletes across all sports, college hockey could be about to reach its day of reckoning.

On Aug. 12, attorneys for 19-year-old Rylan Masterson filed a proposed class-action lawsuit in U.S. District Court in Buffalo, N.Y. The suit lists the NCAA and 10 Division I schools as defendants. It argues that the NCAA’s bylaw which bars players who have participated in any of the Canadian Hockey League’s three major junior leagues from playing college hockey is anti-competitive, and “artificially suppresses compensation for players and artificially creates less competitive leagues,” per ESPN. “It is per se illegal under the antitrust laws, including because it constitutes a group boycott,” the suit also says.

Current NCAA bylaws deem players from the Western Hockey League, Ontario Hockey League and Quebec Maritimes Junior Hockey League to be professionals — because they receive a monthly stipend, and because players with signed NHL contracts take part in the league.

But the idea of amateurism in college sports is quickly being all-but-obliterated. When athletes were granted the opportunity to monetize their name, image and likeness in 2021, former athletes sued because they hadn’t received that same opportunity. In July of 2024, the NCAA settled that class-action lawsuit with an agreement to pay out \$2.75 billion over the next 10 years to college athletes enrolled between 2016 and 2020. The settlement, which still needs to be signed off by a federal judge, would also permit schools to make direct payments to their athletes going forward.'''));
    news.add(NewsModel(
        id: 7,
        title:
            'Will Arshad Nadeem’s Olympic gold change the course for sports in Pakistan?',
        desc:
            '''The javelin thrower returns home a hero, igniting interest in track and field in cricket-centric Pakistan. Can it last? Islamabad, Pakistan – When Arshad Nadeem, Pakistan’s first Olympic gold medallist in 40 years, arrived at Lahore airport early on August 10, he was met by a raucous crowd of thousands, chanting his name and waving the Pakistani flag.

The 27-year-old athlete was accompanied by a large convoy of people playing drums and dancing on the drive home to his village near the small city of Mian Channu in Punjab province. Once there, residents welcomed him by throwing rose petals, and his father garlanded him with flowers.'''));
    news.add(NewsModel(
        id: 8,
        title:
            'Broncos bus crash survivor Jacob Wassermann headed to Paris after meteoric rise in Para rowing',
        desc:
            '''Jacob Wassermann is only a few days from heading to Paris to represent his country at the highest level of Para sports, but it still doesn't feel real.

Whatever happens at his Para rowing event in the 2024 Paralympic Games, the 24-year-old is already feeling on top of the world. 

"The fact that I've been able to get this far and be able to go out there is a pretty big accomplishment in my book already," he said after clambering out of his boat on an early morning rowing practice at Regina's Wascana Lake.'''));

    news.add(NewsModel(
        id: 9,
        title:
            '''Adam Sandler: Chiefs' Travis Kelce to cameo in 'Happy Gilmore 2' ''',
        desc:
            '''What part will Kelce play in the movie? Will the superstar tight end be a caddie? Will Shooter McGavin hire Kelce to tackle Gilmore on the golf course? It's all on the table after Kelce recently expressed his desire to be involved with the film on his "New Heights" podcast and quickly got his wish.

"We have a nice something for Travis," Sandler said of Kelce's role. "He’s gonna come by. Very nice guy, you guys would love him in real life. What a big handsome guy. Funny and cool as hell. He’s a stud, and he’s so funny."

In the original film, Sandler plays a boisterous hockey player who emerged on the PGA Tour scene out of nowhere thanks to his towering drives off the tee box and becomes the most popular golfer in the sport, winning the tour championship and dating the tour's public relations director in the process.'''));
    news.add(NewsModel(
        id: 10,
        title:
            '''HS girls' field hockey team whose player got hurt by male opponent in 2023 forfeits game next week due to male competition''',
        desc:
            '''Three-time Super Bowl-winning Kansas City Chiefs tight end Travis Kelce has bought an ownership stake in a racehorse named Swift Delivery.

Team Valor International founder and CEO Barry Irwin announced Tuesday that Kelce and the Zoldan family recently acquired a significant share of the 3-year-old gelding.

Kelce has been dating pop star Taylor Swift for roughly a year, appearing at several of her concerts during the Eras Tour. Swift has been a prominent fan at many of Kelce's NFL games over that time.'''));

    isLoading.value = false;
  }

  // Future<void> getNews() async {
  //   isLoading.value = true;
  //   try {
  //     final result = await ApiRepo().getNews();
  //     news.value = result;
  //   } catch (e) {
  //     constants.showSnackBar(title: 'Error', msg: e.toString(), textColor: red);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
