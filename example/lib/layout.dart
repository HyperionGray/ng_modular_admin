import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Layout component.
@Component(
    selector: 'layout',
    templateUrl: 'layout.html',
    directives: const [formDirectives, MA_DIRECTIVES, RouterLink]
)
class LayoutComponent {
    DocumentService documentService;

    LayoutComponent(this.documentService) {
        this.documentService.title = 'Layout';
        this.documentService.breadcrumbs = [
            new Breadcrumb(name: 'Layout', icon: 'th'),
        ];
    }
}

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
