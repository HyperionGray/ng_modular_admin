import 'package:angular2/core.dart';

/// Side navigation component.
@Component(
    selector: 'ma-side-nav',
    templateUrl: 'side-nav.html',
    styleUrls: const ['side-nav.css']
)
class MaSideNav {
    /// If true, the side nav will have a fixed position.
    @HostBinding('class.fixed')
    @Input()
    bool fixed = true;
}
