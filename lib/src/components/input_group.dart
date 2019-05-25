import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';
import 'package:ng_modular_admin/util.dart';

const INPUT_SEL = 'input[type=text],input[type=password],select,textarea';

/// A container for a label and an input.
@Component(
    selector: 'ma-input-group',
    templateUrl: 'input_group.html',
    styleUrls: const ['input_group.css'],
    directives: const [coreDirectives, FaIcon])
class InputGroup implements AfterContentInit, DoCheck {
  /// A form control for validating the element contained herein.
  @Input()
  Control control;

  /// True if the input fails validation after dirtying.
  @HostBinding('class.danger')
  bool danger = false;

  /// If true, display the input inline with the label.
  @HostBinding('class.inline')
  @Input()
  bool inline = false;

  /// True if the input passes validation after dirtying.
  @HostBinding('class.success')
  bool success = false;

  /// True if the input fails validation after touching (before dirtying).
  @HostBinding('class.warning')
  bool warning = false;

  /// Reference to the host element.
  Element host;

  /// Constructor.
  InputGroup(this.host);

  /// Implementation of OnContentInit.
  void ngAfterContentInit() {
    var inputs = this.host.querySelectorAll(INPUT_SEL);

    if (inputs.length != 1) {
      var msg = '<ma-input-group> requires exactly one'
          ' text/password/select/textarea input';
      window.console.log(this.host);
      throw new Exception(msg);
    }

    var input = inputs[0];
    var inputId;

    // Wire the label to the form, if not already wired.
    if (input.attributes['id'] == null) {
      inputId = 'ma-input-' + randomElementName(8);
      input.attributes['id'] = inputId;
    } else {
      inputId = input.attributes['id'];
    }

    var label = this.host.querySelector('label');
    if (label != null && !label.attributes.containsKey('for')) {
      label.attributes['for'] = inputId;
    }
  }

  /// Implementation of DoCheck.
  void ngDoCheck() {
    this._updateValidity();
  }

  // /// Update validity properties from control status.
  void _updateValidity() {
    this.danger = false;
    this.success = false;
    this.warning = false;

    if (control != null) {
      if (control.valid) {
        if (control.dirty && control.value.trim().isNotEmpty) {
          this.success = true;
        }
      } else {
        if (control.touched) {
          this.danger = true;
        } else if (control.dirty) {
          this.warning = true;
        }
      }
    }
  }
}
