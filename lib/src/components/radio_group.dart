import 'dart:html';

import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

import 'package:ng_modular_admin/util.dart';

/// A container for a label and a radio input.
@Component(
    selector: 'ma-radio-group',
    templateUrl: 'radio_group.html',
    styleUrls: const ['radio_group.css'],
    directives: const [FaIcon]
)
class RadioGroup implements AfterContentInit {
    /// Reference to the host element.
    HtmlElement host;

    /// Constructor.
    RadioGroup(this.host);

    /// Implementation of OnContentInit.
    void ngAfterContentInit() {
        // Wire the labels and input together if the user didn't do it.
        var label = this.host.querySelector('label');
        var input = this.host.querySelector('input[type=radio]');

        if (input == null) {
            var msg = '<ma-radio-group> requires at least 1 radio';
            window.console.log(this.host);
            throw new Exception(msg);
        } else if (label?.attributes['for'] == null) {
            var inputId = 'ma-radio-' + randomElementName(8);
            input.attributes['id'] = inputId;
            label.attributes['for'] = inputId;
        }
    }
}
