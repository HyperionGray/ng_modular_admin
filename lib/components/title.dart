import 'package:angular2/core.dart';

/// A title/subtitle component.
@Component(
    selector: 'ma-title',
    templateUrl: 'title.html',
    styleUrls: const ['title.css']
)
class MaTitle {
    /// A title to display.
    @Input('title-text')
    String title = 'Title';

    /// A subtitle to display. (Optional)
    @Input('subtitle-text')
    String subtitle = '';
}
