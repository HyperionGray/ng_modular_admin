import 'dart:html';
import 'dart:math';

import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:ng2_fontawesome/ng2_fontawesome.dart';

/// A container for a label and an input.
@Component(
    selector: 'ma-form-group',
    templateUrl: 'form-group.html',
    styleUrls: const ['form-group.css'],
    directives: const [FORM_DIRECTIVES, FontAwesomeIconComponent]
)
class MaFormGroup implements AfterContentInit, DoCheck {
    /// A form control for validating the element contained herein.
    @Input()
    Control control;

    /// True if the input passes validation after dirtying.
    @HostBinding('class.success')
    bool success = false;

    /// True if the input fails validation after dirtying.
    @HostBinding('class.danger')
    bool danger = false;

    /// Reference to the host element.
    ElementRef host;

    /// Reference to the label element.
    LabelElement label;

    /// Name of icon to display.
    String iconName;

    /// Reference to the input element, e.g. <input>, <textarea>, etc.
    HtmlElement input;

    /// Constructor.
    MaFormGroup(this.host);

    /// Implementation of OnContentInit.
    void ngAfterContentInit() {
        // Wire the label and input together (if the user didn't do it).
        this.label = this.host.nativeElement.querySelector('label');
        this.input = this.host.nativeElement.querySelector(
            'input,textarea'
        );

        if (this.label == null) {
            var msg = '<ma-form-group> requires a label';
            throw new Exception(msg);
        }

        if (this.input == null) {
            var msg = '<ma-form-group> requires an input/textarea';
            throw new Exception(msg);
        }

        var inputId = this.input.attributes['id'];

        if (inputId == null) {
            inputId = 'ma-' + this._randomName(8);
            this.input.attributes['id'] = inputId;
        }

        if (this.label.attributes['for'] == null) {
            this.label.attributes['for'] = inputId;
        }
    }

    /// Implementation of DoCheck.
    void ngDoCheck() {
        this._updateValidity();
    }

    /// Create a random name for an input element.
    String _randomName(int length) {
        var rand = new Random();
        var chars = new List.generate(length, (i) => rand.nextInt(26) + 97);
        return new String.fromCharCodes(chars);
    }

    /// Update validity properties from control status.
    void _updateValidity () {
        this.iconName = null;
        this.success = false;
        this.danger = false;

        if (control != null && control.dirty) {
            if (control.valid) {
                this.success = true;
                this.iconName = 'check';
            } else if (control.errors != null) {
                this.danger = true;
                this.iconName = 'exclamation-triangle';
            }
        }
    }
}
