import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

import 'layout.dart';

/// Side navigation component.
@Component(
    selector: 'side-nav',
    styles: const ['''
        ul {list-style: none;}
        .tall {height: 50em;}
    '''],
    templateUrl: 'side-nav.html',
    directives: const [CORE_DIRECTIVES, formDirectives, MA_DIRECTIVES]
)
class SideNavComponent {
    /// A service that contains layout state.
    LayoutService layoutService;

    /// Constructor.
    SideNavComponent(this.layoutService);
}
