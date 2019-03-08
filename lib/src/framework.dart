import 'components/app.dart';
import 'components/breadcrumbs.dart';
import 'components/button.dart';
import 'components/button_group.dart';
import 'components/card.dart';
import 'components/checkbox_group.dart';
import 'components/content.dart';
import 'components/footer.dart';
import 'components/input_group.dart';
import 'components/logo.dart';
import 'components/overlay.dart';
import 'components/pager.dart';
import 'components/radio_group.dart';
import 'components/side_nav.dart';
import 'components/side_nav_header.dart';
import 'components/side_nav_item.dart';
import 'components/side_nav_menu.dart';
import 'components/side_nav_menu_header.dart';
import 'components/size_spy.dart';
import 'components/tag.dart';
import 'components/toast_outlet.dart';
import 'components/top_nav.dart';
import 'services/document.dart';
import 'services/side_nav.dart';
import 'services/toast.dart';

const List<Type> modularAdminDirectives = [
    App,
    Breadcrumbs,
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
    SizeSpy,
    Tag,
    ToastOutlet,
    TopNav,
];

const List<Type> modularAdminProviders = [
    DocumentService,
    SideNavService,
    ToastService,
];
