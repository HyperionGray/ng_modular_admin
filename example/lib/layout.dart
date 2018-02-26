import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Layout component.
@Component(
    selector: 'layout',
    templateUrl: 'layout.html',
    directives: const [MA_DIRECTIVES, RouterLink]
)
class LayoutComponent {}

/// Maintains state related to application layout.
@Injectable()
class LayoutService {
    bool hasTopNav = true;
    bool topNavIsFixed = true;
    bool hasSideNav = true;
    bool sideNavIsFixed = true;
    bool hasFooter = true;
    bool footerIsFixed = true;
}
