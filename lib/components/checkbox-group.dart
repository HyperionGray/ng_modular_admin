import 'dart:html';
import 'dart:math';

import 'package:angular2/core.dart';
import 'package:ng2_fontawesome/ng2_fontawesome.dart';

/// A container for a label and an input.
@Component(
    selector: 'ma-checkbox-group',
    templateUrl: 'checkbox-group.html',
    styleUrls: const ['checkbox-group.css'],
    directives: const [FontAwesomeIconComponent]
)
class MaCheckboxGroup implements AfterContentInit {
    /// If true, the radio buttons and labels are displayed inline.
    @HostBinding('class.inline')
    @Input()
    bool inline = false;

    /// Reference to the host element.
    ElementRef host;

    /// Constructor.
    MaCheckboxGroup(this.host);

    /// Implementation of OnContentInit.
    void ngAfterContentInit() {
        // Wire the labels and radios together (if the user didn't do it).
        var hostEl = this.host.nativeElement;
        var inputs = hostEl.querySelectorAll('input[type=checkbox]');

        if (inputs.length == 0) {
            var msg = '<ma-checkbox-group> requires at least 1 checkbox';
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
