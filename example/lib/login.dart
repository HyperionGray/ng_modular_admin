import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';
import 'package:ng_modular_admin/validators.dart' as MaValidators;

/// Layout component.
@Component(
    selector: 'login',
    styles: const ['''
        ma-card.shake {
            animation: shake .5s linear;
        }
        @keyframes shake {
            8%, 41% {
                transform: translateX(-10px);
            }
            25%, 58% {
                transform: translateX(10px);
            }
            75% {
                transform: translateX(-5px);
            }
            92% {
                transform: translateX(5px);
            }
            0%, 100% {
                transform: translateX(0);
            }
        }
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
        }
    '''],
    templateUrl: 'login.html',
    directives: const [formDirectives, MA_DIRECTIVES, ROUTER_DIRECTIVES]
)
class LoginComponent {
    /// Router location.
    Router router;

    /// Starts the shake animation.
    bool shake = false;

    ControlGroup loginForm;

    DocumentService _doc;

    /// Constructor.
    LoginComponent(this._doc, this.router) {
        this._doc.title = 'Login';
        final builder = new FormBuilder();
        this.loginForm = builder.group({
            'username': ['', MaValidators.required()],
            'password': ['', MaValidators.required()],
        });
    }

    /// Do the shake animation.
    void login() {
        var password = this.loginForm.controls['password'].value;
        if (password == 'password123') {
            this.router.navigate(['About']);
        } else {
            this.loginForm.controls['password'].setErrors({
                'The password is incorrect.': ''
            });
            this.shake = true;
            new Timer(new Duration(seconds: 1), () {
                this.shake = false;
            });
        }
    }
}
