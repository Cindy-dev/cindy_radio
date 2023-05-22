import '../../app.dart';
import '../widget/radio_channel_card.dart';

class NewHomeScreen extends ConsumerWidget {
  NewHomeScreen({super.key});

  //So the imgUrl fetched from the Radio api can be passed into imageBuilder of CachedNetworkImage widget
  final List<String> imgUrl = [
    'https://cdn.pixabay.com/photo/2016/03/28/09/36/music-1285165_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/06/29/01/47/piano-3505109_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/09/19/01/05/country-946706_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/08/24/20/39/violin-1617972_1280.jpg',
  ];

  final List<String> imgUrl2 = [
    'https://cdn.pixabay.com/photo/2015/03/08/17/25/musician-664432_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/11/22/19/04/crowd-1056764_1280.jpg',
  ];
  final List<String> imgUrl3 = [
    'https://cdn.pixabay.com/photo/2015/09/19/01/05/country-946706_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/03/08/17/25/musician-664432_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/11/22/19/04/crowd-1056764_1280.jpg',
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBGColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Live Online Radio',
                textAlign: TextAlign.center,
                style: GoogleFonts.pacifico(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              customTabBar(
                theme: theme,
                context: context,
                tabs: [
                  Tab(text: 'Pop'),
                  Tab(text: 'Classical'),
                  Tab(text: 'Fuji'),
                  Tab(text: 'More')
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    RadioChannelScreen(size: size, imgUrl: imgUrl),
                    RadioChannelScreen(size: size, imgUrl: imgUrl2),
                    RadioChannelScreen(size: size, imgUrl: imgUrl3),
                    RadioChannelScreen(size: size, imgUrl: imgUrl2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RadioChannelScreen extends StatelessWidget {
  const RadioChannelScreen({
    super.key,
    required this.size,
    required this.imgUrl,
  });

  final Size size;
  final List<String> imgUrl;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      itemCount: imgUrl.length,
      itemBuilder: (context, index) {
        return radioChannelCard(
          size: size,
          imgUrl: imgUrl[index],
        );
      },
    );
  }
}
