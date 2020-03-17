import 'dart:html';

import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

import 'package:ng_modular_admin/util.dart';

/// A container for a label and a checkbox.
@Component(
    selector: 'ma-checkbox-group',
    templateUrl: 'checkbox_group.html',
    styleUrls: const ['checkbox_group.css'],
    directives: const [FaIcon]
)
class CheckboxGroup implements AfterContentInit {
    /// Reference to the host element.
    HtmlElement host;

    /// Constructor.
    CheckboxGroup(this.host);

    /// Implementation of OnContentInit.
    void ngAfterContentInit() {
        // Wire the labels and input together if the user didn't do it.
        var label = this.host.querySelector('label');
        var input = this.host.querySelector('input[type=checkbox]');

        if (input == null) {
            var msg = '<ma-checkbox-group> requires at least 1 checkbox';
            window.console.log(this.host);
            throw new Exception(msg);
        } else if (label?.attributes['for'] == null) {
            var inputId = 'ma-checkbox-' + randomElementName(8);
            input.attributes['id'] = inputId;
            label.attributes['for'] = inputId;
        }
    }
}
