import 'package:angular2/core.dart';

/// Overlay.
///
/// An overlay covers the viewport so that content (such as a modal)
/// may be displayed on top.
@Component(
    selector: 'ma-overlay',
    templateUrl: 'overlay.html',
    styleUrls: const ['overlay.css']
)
class MaOverlay {
    /// A work around for a bug in :host-context().
    @HostBinding('class.is-overlay')
    bool isOverlay = true;

    /// If true, the background is opaque. Otherwise, the background is
    /// a bit transparent.
    @Input()
    bool opaque = false;
}
