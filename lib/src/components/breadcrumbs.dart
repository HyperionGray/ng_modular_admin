import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

import '../services/document.dart';

/// Displays navigation icons.
@Component(
    selector: 'ma-breadcrumbs',
    styleUrls: const ['breadcrumbs.css'],
    templateUrl: 'breadcrumbs.html',
    directives: const [CORE_DIRECTIVES, FaIcon, RouterLink]
)
class Breadcrumbs {
    DocumentService documentService;

    Breadcrumbs(this.documentService);
}
