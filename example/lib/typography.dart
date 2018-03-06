import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Typography component.
@Component(
    selector: 'typography',
    templateUrl: 'typography.html',
    directives: const [MA_DIRECTIVES, FaIcon]
)
class TypographyComponent {
    DocumentService _doc;

    TypographyComponent(this._doc) {
        this._doc.title = 'Typography';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Typography', icon: 'font'),
        ];
    }
}
