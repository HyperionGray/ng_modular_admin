library ng2_modular_admin;

import "package:angular2/di.dart" show Provider;

import 'components/app.dart' show App;
export 'components/app.dart' show App;
import 'components/button.dart' show Button;
export 'components/button.dart' show Button;
import 'components/button_group.dart' show ButtonGroup;
export 'components/button_group.dart' show ButtonGroup;
import 'components/card.dart' show Card;
export 'components/card.dart' show Card;
import 'components/checkbox_group.dart' show CheckboxGroup;
export 'components/checkbox_group.dart' show CheckboxGroup;
import 'components/content.dart' show Content;
export 'components/content.dart' show Content;
import 'components/footer.dart' show Footer;
export 'components/footer.dart' show Footer;
import 'components/input_group.dart' show InputGroup;
export 'components/input_group.dart' show InputGroup;
import 'components/logo.dart' show Logo;
export 'components/logo.dart' show Logo;
import 'components/overlay.dart' show Overlay;
export 'components/overlay.dart' show Overlay;
import 'components/pager.dart' show Pager;
export 'components/pager.dart' show Pager;
import 'components/radio_group.dart' show RadioGroup;
export 'components/radio_group.dart' show RadioGroup;
import 'components/side_nav.dart' show SideNav;
export 'components/side_nav.dart' show SideNav;
import 'components/side_nav_header.dart' show SideNavHeader;
export 'components/side_nav_header.dart' show SideNavHeader;
import 'components/side_nav_item.dart' show SideNavItem;
export 'components/side_nav_item.dart' show SideNavItem;
import 'components/side_nav_menu.dart' show SideNavMenu;
export 'components/side_nav_menu.dart' show SideNavMenu;
import 'components/side_nav_menu_header.dart' show SideNavMenuHeader;
export 'components/side_nav_menu_header.dart' show SideNavMenuHeader;
import 'components/tag.dart' show Tag;
export 'components/tag.dart' show Tag;
import 'components/title.dart' show Title;
export 'components/title.dart' show Title;
import 'components/top_nav.dart' show TopNav;
export 'components/top_nav.dart' show TopNav;
import 'services/side_nav.dart' show SideNavService;
export 'services/side_nav.dart' show SideNavService;

const List<dynamic> MA_DIRECTIVES = const [
    App,
    Button,
    ButtonGroup,
    Card,
    CheckboxGroup,
    Content,
    Footer,
    InputGroup,
    Logo,
    Overlay,
    Pager,
    RadioGroup,
    SideNav,
    SideNavHeader,
    SideNavItem,
    SideNavMenu,
    SideNavMenuHeader,
    Tag,
    Title,
    TopNav,
];

const List<dynamic> MA_PROVIDERS = const [
    SideNavService,
];
