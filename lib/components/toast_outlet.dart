import 'dart:math';

import 'package:angular2/core.dart';
import 'package:ng2_fontawesome/ng2_fontawesome.dart';

import 'package:ng2_modular_admin/services/toast.dart';

/// Top navigation component.
@Component(
    selector: 'ma-toast-outlet',
    templateUrl: 'toast_outlet.html',
    styleUrls: const ['toast_outlet.css'],
    directives: const[FaIcon]
)
class ToastOutlet {
    @Input()
    ToastService service;

    /// Produce a CSS style for the `top` property.
    String styleTop(int i) {
        return (i * 110).toString() + "px";
    }
}
