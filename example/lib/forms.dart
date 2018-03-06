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
    ControlGroup demoForm;

    DocumentService _doc;

    FormsComponent(this._doc) {
        this._doc.title = 'Forms';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Components', icon: 'gears'),
            new Breadcrumb(name: 'Forms'),
        ];
        final builder = new FormBuilder();
        this.demoForm = builder.group({
            'name': ['', MaValidators.required()],
            'age': ['', MaValidators.integer(min: 0)],
        });
    }

    void handleSubmit() {
        var name = this.demoForm.controls['name'].value;
        var age = this.demoForm.controls['age'].value;
        window.alert('You submitted name="$name", age="$age".');
    }
}
