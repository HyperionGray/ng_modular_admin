import 'dart:html';
import 'dart:math';

import 'package:angular2/core.dart';
import 'package:ng2_fontawesome/ng2_fontawesome.dart';

/// A container for a label and an input.
@Component(
    selector: 'ma-radio-group',
    templateUrl: 'radio-group.html',
    styleUrls: const ['radio-group.css'],
    directives: const [FontAwesomeIconComponent]
)
class MaRadioGroup implements AfterContentInit {
    /// If true, the radio buttons and labels are displayed inline.
    @HostBinding('class.inline')
    @Input()
    bool inline = false;

    /// Reference to the host element.
    ElementRef host;

    /// Constructor.
    MaRadioGroup(this.host);

    /// Implementation of OnContentInit.
    void ngAfterContentInit() {
        // Wire the labels and radios together (if the user didn't do it).
        var hostEl = this.host.nativeElement;
        var labels = hostEl.querySelectorAll('label');
        var inputs = hostEl.querySelectorAll('input[type=radio]');

        if (labels.length != inputs.length + 1) {
            var msg = '<ma-radio-group> requires at least 1 radio button';
            throw new Exception(msg);
        }

        var groupName = 'ma-name-' + _randomName(8);

        for (var input in inputs) {
            if (input.attributes['name'] == null) {
                input.attributes['name'] = groupName;
            }

            if (input.attributes.containsKey('disabled') &&
                input.parent.tagName == 'LABEL') {
                input.parent.classes.add('disabled');
            }
        }
    }

    /// Create a random name for an input element.
    String _randomName(int length) {
        var rand = new Random();
        var chars = new List.generate(length, (i) => rand.nextInt(26) + 97);
        return new String.fromCharCodes(chars);
    }
}
