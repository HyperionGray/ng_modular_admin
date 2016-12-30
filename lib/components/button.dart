import 'dart:html';
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

    /// The type of button (primary, secondary, success, info, warning, danger,
    /// or link). Default: primary
    @Input()
    String type = 'primary';

    /// Handle navigation to an href, if an href is set.
    @HostListener('click', const [r'$event'])
    void onClick(MouseEvent event) {
        if (this.href != null) {
            window.location.replace(this.href);
            event.stopPropagation();
        }
    }
}
