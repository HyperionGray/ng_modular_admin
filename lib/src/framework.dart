import 'components/app.dart' show App;
import 'components/button.dart' show Button;
import 'components/button_group.dart' show ButtonGroup;
import 'components/card.dart' show Card;
import 'components/checkbox_group.dart' show CheckboxGroup;
import 'components/content.dart' show Content;
import 'components/footer.dart' show Footer;
import 'components/input_group.dart' show InputGroup;
import 'components/logo.dart' show Logo;
import 'components/overlay.dart' show Overlay;
import 'components/pager.dart' show Pager;
import 'components/radio_group.dart' show RadioGroup;
import 'components/side_nav.dart' show SideNav;
import 'components/side_nav_header.dart' show SideNavHeader;
import 'components/side_nav_item.dart' show SideNavItem;
import 'components/side_nav_menu.dart' show SideNavMenu;
import 'components/side_nav_menu_header.dart' show SideNavMenuHeader;
import 'components/tag.dart' show Tag;
import 'components/toast_outlet.dart' show ToastOutlet;
import 'components/top_nav.dart' show TopNav;
import 'services/side_nav.dart' show SideNavService;
import 'services/toast.dart' show ToastService;

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
    ToastOutlet,
    TopNav,
];

const List<dynamic> MA_PROVIDERS = const [
    SideNavService,
    ToastService,
];
