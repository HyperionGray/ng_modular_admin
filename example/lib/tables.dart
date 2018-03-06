import 'package:angular/angular.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Tables component.
@Component(
    selector: 'tables',
    templateUrl: 'tables.html',
    directives: const [MA_DIRECTIVES]
)
class TablesComponent {
    DocumentService _doc;

    TablesComponent(this._doc) {
        this._doc.title = 'Tables';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Components', icon: 'gears'),
            new Breadcrumb(name: 'Tables'),
        ];
    }
}
