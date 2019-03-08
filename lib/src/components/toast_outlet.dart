import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

import '../services/toast.dart';

/// Top navigation component.
@Component(
    selector: 'ma-toast-outlet',
    templateUrl: 'toast_outlet.html',
    styleUrls: const ['toast_outlet.css'],
    directives: const [coreDirectives, FaIcon]
)
class ToastOutlet {
    @Input()
    ToastService service;

    /// Produce a CSS style for the `top` property.
    String styleTop(int i) {
        return (i * 110).toString() + "px";
    }
}
