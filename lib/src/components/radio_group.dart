import 'dart:html';

import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';
import 'package:ng_modular_admin/util.dart';

/// A container for a label and an input.
@Component(
    selector: 'ma-radio-group',
    templateUrl: 'radio_group.html',
    styleUrls: const ['radio_group.css'],
    directives: const [FaIcon])
class RadioGroup implements AfterContentInit {
  /// If true, the radio buttons and labels are displayed inline.
  @HostBinding('class.inline')
  @Input()
  bool inline = false;

  /// Reference to the host element.
  Element host;

  /// Constructor.
  RadioGroup(this.host);

  /// Implementation of OnContentInit.
  void ngAfterContentInit() {
    // Wire the labels and radios together (if the user didn't do it).
    var hostEl = this.host;
    var inputs = hostEl.querySelectorAll('input[type=radio]');

    if (inputs.length == 0) {
      var msg = '<ma-radio-group> requires at least 1 radio button';
      window.console.log(this.host);
      throw new Exception(msg);
    }

    var groupName = 'ma-name-' + randomElementName(8);

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
}
