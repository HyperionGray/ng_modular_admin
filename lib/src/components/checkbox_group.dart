import 'dart:html';

import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

/// A container for a label and an input.
@Component(
    selector: 'ma-checkbox-group',
    templateUrl: 'checkbox_group.html',
    styleUrls: const ['checkbox_group.css'],
    directives: const [FaIcon]
)
class CheckboxGroup implements AfterContentInit {
    /// If true, the radio buttons and labels are displayed inline.
    @HostBinding('class.inline')
    @Input()
    bool inline = false;

    /// Reference to the host element.
    ElementRef host;

    /// Constructor.
    CheckboxGroup(this.host);

    /// Implementation of OnContentInit.
    void ngAfterContentInit() {
        // Wire the labels and radios together (if the user didn't do it).
        var hostEl = this.host.nativeElement;
        var inputs = hostEl.querySelectorAll('input[type=checkbox]');

        if (inputs.length == 0) {
            var msg = '<ma-checkbox-group> requires at least 1 checkbox';
            window.console.log(this.host.nativeElement);
            throw new Exception(msg);
        }

        for (var input in inputs) {
            if (input.attributes.containsKey('disabled') &&
                input.parent.tagName == 'LABEL') {
                input.parent.classes.add('disabled');
            }
        }
    }
}
