import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Layout component.
@Component(
    selector: 'sign-up',
    styles: const ['''
        h1 {
            text-align: center;
            border-bottom: 1px solid var(--ma-primary-color);
            color: var(--ma-secondary-color);
            margin: 0;
            padding: 20px;
        }
        .content {
            padding: 20px;
        }
        .input-label {
            min-width: 5em;
            text-align: right;
        }
    '''],
    templateUrl: 'sign-up.html',
    directives: const [formDirectives, MA_DIRECTIVES, ROUTER_DIRECTIVES]
)
class SignUpComponent {
    /// Router instance.
    Router router;

    /// Form controls
    Control usernameControl, password1Control, password2Control;
    ControlGroup requiredFields;

    /// Constructor.
    SignUpComponent(this.router) {
        this.usernameControl = new Control('', Validators.required);
        this.password1Control = new Control('', Validators.required);
        this.password2Control = new Control('', Validators.required);
        this.requiredFields = new ControlGroup({
            'username': this.usernameControl,
            'password1': this.password1Control,
            'password2': this.password2Control,
        });
    }

    /// Handle form submission
    void register() {
        router.navigate(['About']);
    }
}
