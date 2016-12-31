import 'package:angular2/core.dart';

/// Side navigation component.
@Component(
    selector: 'ma-side-nav',
    templateUrl: 'side-nav.html',
    styleUrls: const ['side-nav.css']
)
class MaSideNav {
    /// Work-around for :host-context() bug.
    @HostBinding('class.is-side-nav')
    bool isSideNav = true;

    /// If true, the side nav will have a fixed position.
    @HostBinding('class.fixed')
    @Input()
    bool fixed = true;
}
