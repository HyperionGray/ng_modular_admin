import 'package:angular/angular.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

/// About component.
@Component(
    selector: 'cards',
    templateUrl: 'cards.html',
    directives: const [MA_DIRECTIVES]
)
class CardsComponent {
    DocumentService _doc;

    CardsComponent(this._doc) {
        this._doc.title = 'Cards';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Components', icon: 'gears'),
            new Breadcrumb(name: 'Cards'),
        ];
    }
}
