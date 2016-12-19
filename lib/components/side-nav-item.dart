import 'dart:html'; // TODO

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

/// Side navigation component.
@Component(
    selector: 'ma-side-nav-item',
    templateUrl: 'side-nav-item.html',
    styleUrls: const ['side-nav-item.css'],
    directives: const [ROUTER_DIRECTIVES]
)
class MaSideNavItem implements OnInit {
    @Input()
    List routerLink;

    void ngOnInit() {
        window.console.log(routerLink);
    }
}
