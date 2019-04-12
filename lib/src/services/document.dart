import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';

/// An enumeration of Bootstrap viewport sizes.
enum BootstrapSize {xs, sm, md, lg, xl}

/// A service that exposes document state.
@Injectable()
class DocumentService {
    List<Breadcrumb> breadcrumbs;
    String siteName = 'Modular Admin';

    BootstrapSize _bootstrapSize;
    StreamController<BootstrapSize> _bootstrapSizeController;
    String _title;

    /// Getter: bootstrap size.
    BootstrapSize get bootstrapSize => this._bootstrapSize;

    /// Setter: deduplicate bootstrap size and publish to event stream.
    void set bootstrapSize(BootstrapSize bootstrapSize) {
        if (bootstrapSize != this._bootstrapSize) {
            this._bootstrapSize = bootstrapSize;
            this._bootstrapSizeController.add(bootstrapSize);
        }
    }

    /// Getter: document title.
    String get title => this._title;

    /// Setter: append site name to document title.
    void set title(String t) {
        /// Dart analyzer needs some help with window.document: it thinks it
        /// doesn't have a title property, but it actually does.
        (window.document as HtmlDocument).title = '$t — ${this.siteName}';
    }

    /// Bootstrap size event stream.
    Stream<BootstrapSize> get onBootstrapSize => this._bootstrapSizeController.stream;

    /// Constructor.
    DocumentService() {
        this.title = 'Loading…';
        this.breadcrumbs = [];
        this._bootstrapSizeController = new StreamController<BootstrapSize>();
    }
}

/// A breadcrumb for navigation.
class Breadcrumb {
    String icon;
    String name;
    String link;
    Breadcrumb({this.icon, this.name, this.link});
}
