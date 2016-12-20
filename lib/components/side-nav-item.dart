import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

/// Side navigation component.
@Component(
    selector: 'ma-side-nav-item',
    templateUrl: 'side-nav-item.html',
    styleUrls: const ['side-nav-item.css'],
    directives: const [ROUTER_DIRECTIVES]
)
class MaSideNavItem {
    @Input()
    List routerLink;

    @HostBinding('class.inside-menu')
    bool insideMenu = false;
}
