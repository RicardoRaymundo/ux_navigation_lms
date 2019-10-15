import 'package:flutter/material.dart';
import 'package:ux_navigation/page/page_downloads.dart';
import 'package:ux_navigation/page/page_gallery.dart';
import 'package:ux_navigation/page/page_home.dart';
import 'package:ux_navigation/page/page_more.dart';
import 'package:ux_navigation/page/page_search.dart';
import 'package:ux_navigation/resource/custom_fab/fab_bottom_app_bar.dart';
import 'package:ux_navigation/ui/ui_custom_icons.dart';

class PageMain extends StatefulWidget {
  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain>
    with SingleTickerProviderStateMixin {

  /// Reconfigura as configurações de UI Overlay
  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  int currentTabIndex = 0;
  int currentFabIndex = 0;
  bool isTab = true;
  bool isLogged = true;

  /// Listas de Widgets que a bottombar exibirá. Tanto pelos filhos do botao central, quanto
  /// os filhos da bottombar
  final List<Widget> listPage = [
    PageHome(),
    PageSearch(),
    PageDownloads(),
    PageMore(),
  ];

  final Widget fabItem = PageGallery();


  /// Método que altera o valor de index da battombar, quando um de seus filhos
  /// é clicado
  void _selectedTab(int index) {
    setState(() {
      currentTabIndex = index;
      print(index);
      isTab = true;
    });
  }

  /// Método que altera o valor de index do botão central, quando um de seus filhos
  /// é clicado
  /// TODO:: concertar a lógica do botão central
  void _selectedFab() {
    setState(() {
      print('AAAAAA');
      isTab = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Opacity(
      opacity:

          /// Verifica a orientação do celular, certificando-se de que seja
          /// mantida a orientação portrait
          MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 0,
      child: WillPopScope(

        // TODO :: re-avaliar método de willPop
        onWillPop: xxx,
        child: Scaffold(

          /// Widget que será exibido atravez da seleção da bottombar
          body: this.isTab ? this.listPage[currentTabIndex] : this.fabItem,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffb2208c),
            onPressed: this._selectedFab,
            child: Icon(CustomIcons.trophy),
            elevation: 5.0,
          ),
          bottomNavigationBar: FABBottomAppBar(
            backgroundColor: Color(0xff222222),
            iconSize: 20,
            centerItemText: 'Galeria',
            color: Colors.white54,
            selectedColor: Colors.white,
            notchedShape: CircularNotchedRectangle(),
            onTabSelected: this._selectedTab,
            items: [
              FABBottomAppBarItem(iconData: CustomIcons.download, text: 'Início'),
              FABBottomAppBarItem(iconData: CustomIcons.loupe, text: 'Buscas'),
              FABBottomAppBarItem(iconData: CustomIcons.download, text: 'Downloads'),
              FABBottomAppBarItem(iconData: CustomIcons.menu, text: 'Mais'),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> xxx() {
    return new Future.value(false);
  }
}
