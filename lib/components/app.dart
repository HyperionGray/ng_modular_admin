import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:ng2_modular_admin/components/footer.dart';
import 'package:ng2_modular_admin/components/side_nav.dart';
import 'package:ng2_modular_admin/components/top_nav.dart';

/// The top-level component for a Modular Admin application.
@Component(
    selector: 'ma-app',
    templateUrl: 'app.html',
    styleUrls: const ['app.css']
)
class MaApp implements AfterViewInit {
    /// A reference to the top navigation (if there is one).
    @ContentChildren(MaTopNav)
    QueryList<MaTopNav> topNav;

    /// True if this application has a top nav.
    @HostBinding('class.has-top-nav')
    @Input()
    bool hasTopNav = false;

    /// A reference to the side navigation (if there is one).
    @ContentChildren(MaSideNav)
    QueryList<MaSideNav> sideNav;

    /// True if this application has a side nav.
    @HostBinding('class.has-side-nav')
    @Input()
    bool hasSideNav = false;

    /// A reference to the footer (if there is one).
    @ContentChildren(MaFooter)
    QueryList<MaFooter> footer;

    /// True if this application has a footer.
    @HostBinding('class.has-footer')
    @Input()
    bool hasFooter = false;

    /// Constructor
    MaApp(Router router) {
        var rootRouter = router.root;

        rootRouter.subscribe((nextUrl) {
            // Angular doesn't automatically scroll to the top when the route
            // changes, so we do that explictly:
            window.scrollTo(0, 0);

            // Make sure the current route's nav item is visible in the side
            // nav.
            rootRouter.recognize(nextUrl).then((instruction) {
                // window.console.log(instruction.urlPath);
                // window.console.log(instruction.urlParams);
            });
        });
    }

    /// Implementation of AfterViewInit.
    void ngAfterViewInit() {
        this.updateLayout();
        this.topNav.changes.listen((_) => updateLayout());
        this.sideNav.changes.listen((_) => updateLayout());
        this.footer.changes.listen((_) => updateLayout());
    }

    /// Check which layout components exist in the DOM.
    void updateLayout() {
        this.hasTopNav = this.topNav.length > 0;
        this.hasSideNav = this.sideNav.length > 0;
        this.hasFooter = this.footer.length > 0;
    }
}
