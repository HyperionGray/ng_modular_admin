import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

/// About component.
@Component(
    selector: 'about',
    templateUrl: 'about.html',
    directives: const [ROUTER_DIRECTIVES, MA_DIRECTIVES]
)
class AboutComponent {
    DocumentService _doc;

    AboutComponent(this._doc) {
        this._doc.title = 'About';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'About', icon: 'info-circle'),
        ];
    }
}
