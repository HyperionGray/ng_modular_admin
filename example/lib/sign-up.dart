import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';
import 'package:ng_modular_admin/validators.dart' as MaValidators;

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
    ControlGroup signupForm;

    DocumentService _doc;

    /// Constructor.
    SignUpComponent(this._doc, this.router) {
        this._doc.title = 'Sign Up';
        final builder = new FormBuilder();
        this.signupForm = builder.group({
            'username': ['', MaValidators.required()],
            'password1': ['', MaValidators.required()],
            'password2': ['', null],
        });
        this.signupForm.find('password2').validator = composeValidators([
            MaValidators.required(),
            MaValidators.matches(
                this.signupForm.find('password1'),
                'The two passwords must match.'
            )
        ]);
    }

    /// Handle form submission
    void register() {
        router.navigate(['About']);
    }
}
