import 'package:angular2/core.dart';

/// Top navigation component.
@Component(
    selector: 'ma-top-nav',
    templateUrl: 'top-nav.html',
    styleUrls: const ['top-nav.css']
)
class MaTopNav {
    /// Work around for a bug in angular2 (it doesn't support
    /// `:host-context(element)`).
    @HostBinding('class.is-top-nav')
    bool isTopNav = true;
}
