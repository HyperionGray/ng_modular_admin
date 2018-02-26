import 'dart:html';

import 'package:angular/angular.dart';

/// Overlay.
///
/// An overlay covers the viewport so that content (such as a modal)
/// may be displayed on top.
@Component(
    selector: 'ma-overlay',
    templateUrl: 'overlay.html',
    styleUrls: const ['overlay.css']
)
class Overlay implements OnInit, OnDestroy {
    /// A work around for a bug in :host-context().
    @HostBinding('class.is-overlay')
    bool isOverlay = true;

    /// If true, the background is opaque. Otherwise, the background is
    /// a bit transparent.
    @Input()
    bool opaque = false;

    /// Implementation of OnInit: disable document's scrollbar
    void ngOnInit() {
        window.document.documentElement.style.overflow = 'hidden';
    }

    /// Implementation of OnDestroy: re-enable document's scrollbar
    void ngOnDestroy() {
        window.document.documentElement.style.overflow = 'auto';
    }
}
