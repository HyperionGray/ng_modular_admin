library ng2_modular_admin;

import "package:angular2/di.dart" show Provider;

import 'components/app.dart' show MaApp;
export 'components/app.dart' show MaApp;
import 'components/button.dart' show MaButton;
export 'components/button.dart' show MaButton;
import 'components/button_group.dart' show MaButtonGroup;
export 'components/button_group.dart' show MaButtonGroup;
import 'components/card.dart' show MaCard;
export 'components/card.dart' show MaCard;
import 'components/checkbox_group.dart' show MaCheckboxGroup;
export 'components/checkbox_group.dart' show MaCheckboxGroup;
import 'components/content.dart' show MaContent;
export 'components/content.dart' show MaContent;
import 'components/footer.dart' show MaFooter;
export 'components/footer.dart' show MaFooter;
import 'components/input_group.dart' show MaInputGroup;
export 'components/input_group.dart' show MaInputGroup;
import 'components/logo.dart' show MaLogo;
export 'components/logo.dart' show MaLogo;
import 'components/overlay.dart' show MaOverlay;
export 'components/overlay.dart' show MaOverlay;
import 'components/pager.dart' show MaPager;
export 'components/pager.dart' show MaPager;
import 'components/radio_group.dart' show MaRadioGroup;
export 'components/radio_group.dart' show MaRadioGroup;
import 'components/side_nav.dart' show MaSideNav;
export 'components/side_nav.dart' show MaSideNav;
import 'components/side_nav_header.dart' show MaSideNavHeader;
export 'components/side_nav_header.dart' show MaSideNavHeader;
import 'components/side_nav_item.dart' show MaSideNavItem;
export 'components/side_nav_item.dart' show MaSideNavItem;
import 'components/side_nav_menu.dart' show MaSideNavMenu;
export 'components/side_nav_menu.dart' show MaSideNavMenu;
import 'components/side_nav_menu_header.dart' show MaSideNavMenuHeader;
export 'components/side_nav_menu_header.dart' show MaSideNavMenuHeader;
import 'components/tag.dart' show MaTag;
export 'components/tag.dart' show MaTag;
import 'components/title.dart' show MaTitle;
export 'components/title.dart' show MaTitle;
import 'components/top_nav.dart' show MaTopNav;
export 'components/top_nav.dart' show MaTopNav;
import 'services/side_nav.dart' show MaSideNavService;
export 'services/side_nav.dart' show MaSideNavService;

const List<dynamic> MA_DIRECTIVES = const [
    MaApp,
    MaButton,
    MaButtonGroup,
    MaCard,
    MaCheckboxGroup,
    MaContent,
    MaFooter,
    MaInputGroup,
    MaLogo,
    MaOverlay,
    MaPager,
    MaRadioGroup,
    MaSideNav,
    MaSideNavHeader,
    MaSideNavItem,
    MaSideNavMenu,
    MaSideNavMenuHeader,
    MaTag,
    MaTitle,
    MaTopNav,
];

const List<dynamic> MA_PROVIDERS = const [
    MaSideNavService,
];
