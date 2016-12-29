library ng2_modular_admin;

import "package:angular2/di.dart" show Provider;

import 'components/app.dart' show MaApp;
export 'components/app.dart' show MaApp;
import 'components/button.dart' show MaButton;
export 'components/button.dart' show MaButton;
import 'components/button-group.dart' show MaButtonGroup;
export 'components/button-group.dart' show MaButtonGroup;
import 'components/card.dart' show MaCard;
export 'components/card.dart' show MaCard;
import 'components/content.dart' show MaContent;
export 'components/content.dart' show MaContent;
import 'components/footer.dart' show MaFooter;
export 'components/footer.dart' show MaFooter;
import 'components/logo.dart' show MaLogo;
export 'components/logo.dart' show MaLogo;
import 'components/side-nav.dart' show MaSideNav;
export 'components/side-nav.dart' show MaSideNav;
import 'components/side-nav-header.dart' show MaSideNavHeader;
export 'components/side-nav-header.dart' show MaSideNavHeader;
import 'components/side-nav-item.dart' show MaSideNavItem;
export 'components/side-nav-item.dart' show MaSideNavItem;
import 'components/side-nav-menu.dart' show MaSideNavMenu;
export 'components/side-nav-menu.dart' show MaSideNavMenu;
import 'components/side-nav-menu-header.dart' show MaSideNavMenuHeader;
export 'components/side-nav-menu-header.dart' show MaSideNavMenuHeader;
import 'components/title.dart' show MaTitle;
export 'components/title.dart' show MaTitle;
import 'components/top-nav.dart' show MaTopNav;
export 'components/top-nav.dart' show MaTopNav;
import 'services/side-nav.dart' show MaSideNavService;
export 'services/side-nav.dart' show MaSideNavService;

const List<dynamic> MA_DIRECTIVES = const [
    MaApp,
    MaButton,
    MaButtonGroup,
    MaCard,
    MaContent,
    MaFooter,
    MaLogo,
    MaSideNav,
    MaSideNavHeader,
    MaSideNavItem,
    MaSideNavMenu,
    MaSideNavMenuHeader,
    MaTitle,
    MaTopNav,
];

const List<dynamic> MA_PROVIDERS = const [
    MaSideNavService,
];
