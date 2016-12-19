library ng2_modular_admin;

import 'components/app.dart' show MaApp;
export 'components/app.dart' show MaApp;
import 'components/logo.dart' show MaLogo;
export 'components/logo.dart' show MaLogo;
import 'components/side-nav.dart' show MaSideNav;
export 'components/side-nav.dart' show MaSideNav;
import 'components/side-nav-header.dart' show MaSideNavHeader;
export 'components/side-nav-header.dart' show MaSideNavHeader;
import 'components/side-nav-item.dart' show MaSideNavItem;
export 'components/side-nav-item.dart' show MaSideNavItem;

const List<dynamic> MA_DIRECTIVES = const [
    MaApp,
    MaLogo,
    MaSideNav,
    MaSideNavHeader,
    MaSideNavItem
];
