import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Layout component.
@Component(
    selector: 'overlay',
    styles: const ['''
        ul {list-style: none;}
        ma-overlay ma-card {
            width: 50%;
            margin-left: auto;
            margin-right: auto;
        }
    '''],
    templateUrl: 'overlay.html',
    directives: const [CORE_DIRECTIVES, formDirectives, MA_DIRECTIVES]
)
class OverlayComponent {
    bool overlayIsVisible = false;
    bool overlayIsOpaque = false;

    DocumentService _doc;

    OverlayComponent(this._doc) {
        this._doc.title = 'Overlay';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Components', icon: 'gears'),
            new Breadcrumb(name: 'Overlay'),
        ];
    }
}
