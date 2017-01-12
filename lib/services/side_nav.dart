import 'dart:async';

import 'package:angular2/core.dart';

import 'package:ng2_modular_admin/components/side_nav_menu.dart';

/// A service that keeps track of the sidenav's state.
@Injectable()
class MaSideNavService {
    List<MaSideNavMenu> menus;

    /// Constructor.
    MaSideNavService() {
        this.menus = new List<MaSideNavMenu>();
    }

    /// Close all menus except the specified menu.
    void closeAllExcept(MaSideNavMenu openMenu) {
        for (var menu in this.menus) {
            if (!identical(menu, openMenu)) {
                menu.close();
            }
        }
    }

    /// Register a menu with the service.
    void register(MaSideNavMenu menu) {
        this.menus.add(menu);
    }
}
