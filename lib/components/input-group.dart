import 'dart:html';
import 'dart:math';

import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:ng2_fontawesome/ng2_fontawesome.dart';

/// A container for a label and an input.
@Component(
    selector: 'ma-input-group',
    templateUrl: 'input-group.html',
    styleUrls: const ['input-group.css'],
    directives: const [FontAwesomeIconComponent]
)
class MaInputGroup implements AfterContentInit, DoCheck {
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

    /// Name of icon to display.
    String iconName;

    /// Constructor.
    MaInputGroup(this.host);

    /// Implementation of OnContentInit.
    void ngAfterContentInit() {
        var inputs = this.host.nativeElement.querySelectorAll(
            'input[type=text],input[type=password],textarea'
        );

        if (inputs.length != 1) {
            var msg = '<ma-input-group> requires exactly one'
                      ' text/password/textarea input';
            throw new Exception(msg);
        }
    }

    /// Implementation of DoCheck.
    void ngDoCheck() {
        this._updateValidity();
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
