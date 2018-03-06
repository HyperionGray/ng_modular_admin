import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

import 'layout.dart';

/// Top navigation component.
@Component(
    selector: 'top-nav',
    styles: const ['''
        ul {list-style: none;}
        .tall {height: 50em;}
    '''],
    templateUrl: 'top-nav.html',
    directives: const [formDirectives, MA_DIRECTIVES]
)
class TopNavComponent {
    /// A service that contains application state.
    LayoutService layoutService;

    DocumentService _doc;

    /// Constructor.
    TopNavComponent(this._doc, this.layoutService) {
        this._doc.title = 'Top Navigation';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Navigation', icon: 'map-signs'),
            new Breadcrumb(name: 'Top Navigation'),
        ];
    }
}
