import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

import 'layout.dart';

/// Footer component.
@Component(
    selector: 'footer',
    styles: const ['''
        ul {list-style: none;}
        .tall {height: 50em;}
    '''],
    templateUrl: 'footer.html',
    directives: const [CORE_DIRECTIVES, formDirectives, MA_DIRECTIVES]
)
class FooterComponent {
    /// A service that contains layout state.
    LayoutService layoutService;

    DocumentService _doc;

    /// Constructor.
    FooterComponent(this._doc, this.layoutService) {
        this._doc.title = 'Footer';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Navigation', icon: 'map-signs'),
            new Breadcrumb(name: 'Footer'),
        ];
    }
}
