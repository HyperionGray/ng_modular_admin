import 'package:angular2/core.dart';

/// A container with a white background and drop shadow.
@Component(
    selector: 'ma-card',
    templateUrl: 'card.html',
    styleUrls: const ['card.css']
)
class Card {
    /// The title of this card  (optional)
    @Input('title-text')
    String title = '';
}
