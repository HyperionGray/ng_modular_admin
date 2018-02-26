import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

/// Header for a side nav menu.
@Component(
    selector: 'ma-side-nav-menu-header',
    templateUrl: 'side_nav_menu_header.html',
    styleUrls: const ['side_nav_menu_header.css'],
    directives: const [FaIcon]
)
class SideNavMenuHeader {
    /// This property is controlled by the parent component.
    bool isOpen;

    /// A stream of click events.
    Stream<MouseEvent> onClick;

    StreamController<MouseEvent> _onClick;

    /// Constructor.
    SideNavMenuHeader() {
        this._onClick = new StreamController<MouseEvent>.broadcast();
        this.onClick = this._onClick.stream;
    }

    /// Handle a click event by forwarding the event to the subscription
    /// stream.
    @HostListener('click', const [r'$event'])
    void handleClick(MouseEvent event) {
        this._onClick.add(event);
        event.preventDefault();
    }
}
