import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

/// Side navigation component.
@Component(
    selector: 'ma-side-nav-item',
    templateUrl: 'side_nav_item.html',
    styleUrls: const ['side_nav_item.css'],
    directives: const [ROUTER_DIRECTIVES]
)
class SideNavItem {
    @Input()
    List route;

    @HostBinding('class.inside-menu')
    bool insideMenu = false;
}
