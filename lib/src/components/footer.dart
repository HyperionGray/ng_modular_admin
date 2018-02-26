import 'package:angular/angular.dart';

/// Top navigation component.
@Component(
    selector: 'ma-footer',
    templateUrl: 'footer.html',
    styleUrls: const ['footer.css']
)
class Footer {
    /// If true, the footer will have fixed positioning.
    @HostBinding('class.fixed')
    @Input()
    bool fixed = true;
}
