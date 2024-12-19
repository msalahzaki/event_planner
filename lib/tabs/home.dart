import 'package:event_planner/tabs/home_page/home_page.dart';
import 'package:event_planner/tabs/love/favorite_page.dart';
import 'package:event_planner/tabs/map/map_page.dart';
import 'package:event_planner/tabs/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current_index = 0;
  List<Widget> tab = [const HomePage(), const FavoritePage(), const MapPage(), const ProfilePage()];
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          currentIndex: current_index,
          items: [
            item(Icon(current_index != 0 ? Icons.home_outlined : Icons.home),
                local.home),
            item(
                Icon(current_index != 1
                    ? Icons.location_on_outlined
                    : Icons.location_on),
                local.map),
            item(
                Icon(current_index != 2
                    ? Icons.favorite_border
                    : Icons.favorite),
                local.love),
            item(
                Icon(current_index != 3
                    ? Icons.person_2_outlined
                    : Icons.person_2),
                local.profile),
          ],
          onTap: (value) {
            current_index = value;
            setState(() {});
          },
        ),
      ),
      body: tab[current_index],
    );
  }

  BottomNavigationBarItem item(Icon unselectedItem, String label) {
    return BottomNavigationBarItem(icon: unselectedItem, label: label);
  }
}
