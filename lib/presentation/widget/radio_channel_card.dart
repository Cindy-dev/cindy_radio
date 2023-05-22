import '../../app.dart';

Widget radioChannelCard({
  required String imgUrl,
  required Size size,
}) {
  return Card(
    color: scaffoldBGColor.withOpacity(0.4),
    elevation: 3,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.grey,
        width: 0.2,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, string, progress) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green[400],
                ),
              );
            },
            imageBuilder: (context, imageProvider) {
              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ),
        ListTile(
          title: Text(
            'Cirque Noir',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Dub Fire',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        )
      ],
    ),
  );
}
