import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

/// Side navigation component.
@Component(
    selector: 'ma-side-nav-item',
    templateUrl: 'side_nav_item.html',
    styleUrls: const ['side_nav_item.css'],
    directives: const [routerDirectives]
)
class SideNavItem {
    @Input()
    String route;

    @HostBinding('class.inside-menu')
    bool insideMenu = false;
}
