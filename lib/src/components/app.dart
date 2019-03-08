import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'footer.dart';
import 'side_nav.dart';
import 'top_nav.dart';

/// The top-level component for a Modular Admin application.
@Component(
    selector: 'ma-app',
    templateUrl: 'app.html',
    styleUrls: const ['app.css']
)
class App implements OnDestroy {
    /// A reference to the top navigation (if there is one).
    @ContentChildren(TopNav)
    set topNav(List<TopNav> topNav) => this.hasTopNav = topNav.length > 0;

    /// True if this application has a top nav.
    @HostBinding('class.has-top-nav')
    @Input()
    bool hasTopNav = true;

    /// A reference to the side navigation (if there is one).
    @ContentChildren(SideNav)
    set sideNav(List<SideNav> sideNav) => this.hasSideNav = sideNav.length > 0;

    /// True if this application has a side nav.
    @HostBinding('class.has-side-nav')
    @Input()
    bool hasSideNav = false;

    /// A reference to the footer (if there is one).
    @ContentChildren(Footer)
    set footer(List<Footer> footer) => this.hasFooter = footer.length > 0;

    /// True if this application has a footer.
    @HostBinding('class.has-footer')
    @Input()
    bool hasFooter = false;

    StreamSubscription routerStream;

    /// Constructor
    App(Router router) {
        this.routerStream = router.onRouteActivated.listen((_) {
            window.scrollTo(0, 0);
        });
    }

    /// Implementation of OnDestroy.
    void ngOnDestroy() {
        this.routerStream.cancel();
    }
}
