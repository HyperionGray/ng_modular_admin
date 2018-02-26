import 'package:angular/angular.dart';

/// A push button.
@Component(
    selector: 'ma-dropdown',
    templateUrl: 'dropdown.html',
    styleUrls: const ['dropdown.css']
)
class Dropdown {
    /// Workaround for broken :host-context() selector.
    // @HostBinding('class.is-button-group')
    // bool isButtonGroup = true;
}
