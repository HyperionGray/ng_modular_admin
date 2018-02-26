import 'package:angular/angular.dart';

/// Top navigation component.
@Component(
    selector: 'ma-top-nav',
    templateUrl: 'top_nav.html',
    styleUrls: const ['top_nav.css']
)
class TopNav {
    /// Work around for a bug in angular2 (it doesn't support
    /// `:host-context(element)`).
    @HostBinding('class.is-top-nav')
    bool isTopNav = true;

    /// If true, the top nav will have fixed positioning.
    @HostBinding('class.fixed')
    @Input()
    bool fixed = true;
}
