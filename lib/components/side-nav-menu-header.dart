import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:ng2_fontawesome/ng2_fontawesome.dart';

import 'package:ng2_modular_admin/components/side-nav-menu.dart';
import 'package:ng2_modular_admin/components/side-nav-item.dart';

/// Header for a side nav menu.
@Component(
    selector: 'ma-side-nav-menu-header',
    templateUrl: 'side-nav-menu-header.html',
    styleUrls: const ['side-nav-menu-header.css'],
    directives: const [FontAwesomeIconComponent]
)
class MaSideNavMenuHeader {
    /// This property is controlled by the parent component.
    bool isOpen;

    /// A stream of click events.
    Stream<MouseEvent> onClick;

    StreamController<MouseEvent> _onClick;

    /// Constructor.
    MaSideNavMenuHeader() {
        this._onClick = new StreamController<MouseEvent>.broadcast();
        this.onClick = this._onClick.stream;
    }

    /// Handle a click event by toggling the menu's open state and sending
    /// the new state to subscribers.
    void handleClick(MouseEvent event) {
        this._onClick.add(event);
    }
}
