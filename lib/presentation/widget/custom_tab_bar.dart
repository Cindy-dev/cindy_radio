
import '../../app.dart';

Card customTabBar({
  required ThemeData theme,
  required BuildContext context,
  required List<Widget> tabs,
}) {
  return Card(
    color: Color(0xff1f2029),
    elevation: 4,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 0.2,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: TabBar(
      isScrollable: false,
      indicatorColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 4),
      labelStyle: GoogleFonts.dmSans(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        letterSpacing: 1.2,
      ),
      indicatorWeight: 4,
      // labelPadding: EdgeInsets.zero,
      indicatorPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).indicatorColor.withOpacity(0.1),
        border: Border.all(color: Colors.grey),
      ),
      splashBorderRadius: BorderRadius.circular(40),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (states) =>
            states.contains(MaterialState.selected) ? null : Colors.transparent,
      ),
      // onTap: (value) {
      //   log(value.toString());
      // },
      tabs: tabs,
    ),
  );
}
