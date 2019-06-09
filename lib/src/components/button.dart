import 'dart:html';

import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

/// A push button.
@Component(
    selector: 'ma-button',
    templateUrl: 'button.html',
    styleUrls: const ['button.css'],
    directives: const [coreDirectives, fontAwesomeDirectives])
class Button implements AfterViewInit {
  /// If true, the button becomes a 100% width block element.
  @Input()
  bool block = false;

  /// If true, the button content is hidden a spinner is displayed.
  @Input()
  bool busy = false;

  /// If true, the button color is faded out, and the button does not emit
  /// click events.
  @Input()
  bool disabled = false;

  /// If set, a button click will trigger navigation
  @Input()
  String href;

  /// If true, the button is drawn as an outline with transparent background
  /// instead of a solid color. Default: false
  @Input()
  bool outline = false;

  /// Round the corners of the left side or right side (or both).
  @Input()
  String pill;

  /// Button size: small, medium, or large. Default: medium.
  @Input()
  String size = 'medium';

  /// If true, make this a form submit button. If false, it's a normal button.
  @Input()
  bool submit = false;

  /// The type of button (primary, secondary, success, info, warning, danger,
  /// or link). Default: primary
  @Input()
  String type = 'primary';

  /// Reference to the host element.
  Element host;

  /// Constructor.
  Button(this.host);

  /// Return a map of classes to apply for this element.
  Map<String, bool> get classes => {
        type: true,
        size: true,
        'block': block,
        'outline': outline,
        'pill-left': pill == 'left' || pill == 'both',
        'pill-right': pill == 'right' || pill == 'both',
      };

  /// Bind to click event.
  ///
  /// We use this method instead of `HostListener` so that we can set
  /// `useCapture` to true.
  void ngAfterViewInit() {
    this.host.addEventListener('click', this.onClick, true);
  }

  /// Prevent click events for busy and disabled buttons. Handle href buttons.
  void onClick(Event event) {
    if (this.busy || this.disabled) {
      event.stopPropagation();
    } else if (this.href != null) {
      window.location.replace(this.href);
      event.stopPropagation();
    }
  }
}
