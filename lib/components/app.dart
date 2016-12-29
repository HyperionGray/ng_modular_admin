import 'dart:async';

import 'package:angular2/core.dart';

import 'package:ng2_modular_admin/components/footer.dart';
import 'package:ng2_modular_admin/components/side-nav.dart';
import 'package:ng2_modular_admin/components/top-nav.dart';

/// The top-level component for a Modular Admin application.
@Component(
    selector: 'ma-app',
    templateUrl: 'app.html',
    styleUrls: const ['app.css']
)
class MaApp implements AfterViewInit {
    /// A reference to the top navigation (if there is one).
    @ContentChild(MaTopNav)
    MaTopNav topNav;

    /// True if this application has a top nav.
    @HostBinding('class.has-top-nav')
    @Input()
    bool hasTopNav = false;

    /// A reference to the side navigation (if there is one).
    @ContentChild(MaSideNav)
    MaSideNav sideNav;

    /// True if this application has a side nav.
    @HostBinding('class.has-side-nav')
    @Input()
    bool hasSideNav = false;

    /// A reference to the footer (if there is one).
    @ContentChild(MaFooter)
    MaFooter footer;

    /// True if this application has a footer.
    @HostBinding('class.has-footer')
    @Input()
    bool hasFooter = false;

    /// Implementation of AfterViewInit.
    void ngAfterViewInit() {
        this.updateLayout();
    }

    /// Respond to changes in the application's layout.
    @HostListener('maLayoutChanged')
    void onMaLayoutChanged() {
        // Wait a turn for theDOM to be updated.
        new Future(this.updateLayout);
    }

    /// Check which layout components exist in the DOM.
    void updateLayout() {
        this.hasTopNav = this.topNav != null;
        this.hasSideNav = this.sideNav != null;
        this.hasFooter = this.footer != null;
    }
}
