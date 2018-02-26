import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';
import 'package:ng_modular_admin/validators.dart' as MaValidators;

/// Forms component.
@Component(
    selector: 'forms',
    templateUrl: 'forms.html',
    styles: const ['''
        form {
            max-width: 30em;
        }
    '''],
    directives: const [CORE_DIRECTIVES, FaIcon, formDirectives, MA_DIRECTIVES]
)
class FormsComponent {
    String age = '', name = '';

    ControlGroup demoForm;
    Control ageControl, nameControl;

    FormsComponent() {
        this.ageControl = new Control('', MaValidators.integer(min: 0));
        this.nameControl = new Control('', MaValidators.required());
        this.demoForm = new ControlGroup({
            'age': this.ageControl,
            'name': this.nameControl,
        });
    }

    void handleSubmit() {
        window.alert('You submitted name="$name", age="$age".');
    }
}
