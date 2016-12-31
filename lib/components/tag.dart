import 'package:angular2/core.dart';

/// A tag (a.k.a. badge) component.
@Component(
    selector: 'ma-tag',
    templateUrl: 'tag.html',
    styleUrls: const ['tag.css']
)
class MaTag {
    /// The type of tag (primary, secondary, success, info, warning, or danger).
    /// Default: primary
    @Input()
    String type;

    @Input()
    bool pill = false;
}
