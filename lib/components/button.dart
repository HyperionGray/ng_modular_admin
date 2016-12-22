import 'package:angular2/core.dart';

/// A push button.
@Component(
    selector: 'ma-button',
    templateUrl: 'button.html',
    styleUrls: const ['button.css']
)
class MaButton {
    /// If true, the button becomes a 100% width block element.
    @Input()
    bool block = false;

    /// If true, the button is drawn as an outline with transparent background
    /// instead of a solid color. Default: false
    @Input()
    bool outline = false;

    /// Button size: small, medium, or large. Default: medium.
    @Input()
    String size = 'medium';

    /// Round the corners of the left side or right side (or both).
    @Input()
    String pill;

    /// The type of button (primary, secondary, success, info, warning, danger,
    /// or link). Default: primary
    @Input()
    String type = 'primary';

    /// A click event emitter.
    @Output()
    final click = new EventEmitter<MouseEvent>();
}
