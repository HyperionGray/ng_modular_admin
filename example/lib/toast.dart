import 'package:angular/angular.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';
import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Top navigation component.
@Component(
    selector: 'toast',
    templateUrl: 'toast.html',
    directives: const [MA_DIRECTIVES, FA_DIRECTIVES]
)
class ToastComponent {
    /// Toast (a.k.a. pop-up notification) service.
    ToastService toastService;

    DocumentService _doc;

    /// Constructor.
    ToastComponent(this._doc, this.toastService) {
        this._doc.title = 'Toast';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Components', icon: 'gears'),
            new Breadcrumb(name: 'Toast'),
        ];
    }

    /// Create a toast with the specified theme.
    void createToast(String type) {
        this.toastService.add(type, 'Toast Title.', 'This is a toast message.');
    }

    /// Create a custom toast.
    void createCustomToast() {
        this.toastService.add(
            'primary',
            'Custom Toast.',
            'This toast lasts for 10 seconds.',
            icon: 'cube',
            durationSeconds: 10
        );
    }
}
