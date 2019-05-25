import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';

import '../services/side_nav.dart';
import 'side_nav_item.dart';
import 'side_nav_menu_header.dart';

/// A menu in the sidenav.
@Component(
    selector: 'ma-side-nav-menu',
    templateUrl: 'side_nav_menu.html',
    styleUrls: const ['side_nav_menu.css'])
class SideNavMenu implements AfterContentInit {
  @ContentChild(SideNavMenuHeader)
  SideNavMenuHeader header;

  @ContentChildren(SideNavItem)
  List<SideNavItem> items;

  @HostBinding('class.open')
  bool isOpen = false;

  @HostBinding('class.is-menu')
  bool isMenu = true;

  DivElement _div;
  Element _element;
  num _height;
  SideNavService _sideNav;

  /// Constructor.
  SideNavMenu(this._element, this._sideNav) {
    this._sideNav.register(this);
  }

  /// Close this menu.
  void close() {
    this._div.style.height = "0";
    this.isOpen = false;
    this.header.isOpen = false;
  }

  /// Implementation of AfterContentInit.
  void ngAfterContentInit() {
    // Listen for clicks on the menu header.
    header.onClick.listen((event) {
      if (this.isOpen) {
        this.close();
      } else {
        this.open();
        this._sideNav.closeAllExcept(this);
      }
    });

    // Wait one VM turn for DOM to settle.
    new Future(() {
      // Store div's actual height so we can expand it later.
      this._div = this._element.querySelector('div');
      this._height = this._div.clientHeight;
      this._div.style.height = '0';

      // If an active item is inside this menu, open this menu.
      var ne = this._element;
      if (ne.querySelector('.router-link-active') != null) {
        this.open();
      }
    });
  }

  /// Open this menu.
  void open() {
    this._div.style.height = "${this._height}px";
    this.isOpen = true;
    this.header.isOpen = true;
  }
}
