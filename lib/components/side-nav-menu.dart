import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';

import 'package:ng2_modular_admin/components/side-nav-item.dart';
import 'package:ng2_modular_admin/components/side-nav-menu-header.dart';
import 'package:ng2_modular_admin/services/side-nav.dart';

/// A menu in the sidenav.
@Component(
    selector: 'ma-side-nav-menu',
    templateUrl: 'side-nav-menu.html',
    styleUrls: const ['side-nav-menu.css']
)
class MaSideNavMenu implements AfterContentInit {
    @ContentChild(MaSideNavMenuHeader)
    MaSideNavMenuHeader header;

    @ContentChildren(MaSideNavItem)
    List<MaSideNavItem> items;

    @HostBinding('class.open')
    bool isOpen = false;

    @HostBinding('class.is-menu')
    bool isMenu = true;

    DivElement _div;
    ElementRef _element;
    num _height;
    MaSideNavService _sideNav;

    /// Constructor.
    MaSideNavMenu(this._element, this._sideNav) {
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
            this._div = this._element.nativeElement.querySelector('div');
            this._height = this._div.clientHeight;
            this._div.style.height = '0';

            // If an active item is inside this menu, open this menu.
            var ne = this._element.nativeElement;
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
