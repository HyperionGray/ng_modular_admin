import 'dart:async';

import 'package:angular2/core.dart';

import 'package:ng2_modular_admin/components/side_nav_menu.dart';

/// A service that manages toasts that should be displayed.
@Injectable()
class ToastService {
    /// A list of toasts that should be displayed.
    List<Toast> toasts;

    /// Constructor.
    ToastService() {
        this.toasts = [];
    }

    /// Display a toast.
    void add(String type, String title, String message,
             {String icon, num durationSeconds}) {

        var toast = new Toast(type, title, message, icon, durationSeconds);
        this.toasts.insert(0, toast);
        // How to get size of each toast?
        new Timer(new Duration(seconds: (0.3 + toast.durationSeconds) as num), () {
            toast.toBeDeleted = true;
            new Timer(new Duration(seconds: 0.3 as num), () {
                this.toasts.remove(toast);
            });
        });
    }
}

/// Data model for a toast, a.k.a. pop-up notification.
class Toast {
    /// The type (color) of this toast.
    String type;

    /// The title to display (optional).
    String title;

    /// The message to diplay.
    String message;

    /// The icon to display. If not specified, an icon is selected automatically
    /// based on `type`.
    String icon;

    /// How long to display the toast before removing it.
    num durationSeconds;

    /// Duration as a CSS property string.
    String cssDuration;

    /// Set to true before the item is deleted. This allows time to fade the
    /// item out.
    bool toBeDeleted = false;

    /// Constructor
    Toast(this.type, this.title, this.message, this.icon, this.durationSeconds) {
        if (this.durationSeconds == null) {
            this.durationSeconds = 3;
        }

        this.cssDuration = '${durationSeconds}s';

        if (icon == null) {
            if (type == 'success') {
                icon = 'check';
            } else if (type == 'info') {
                icon = 'info';
            } else if (type == 'warning') {
                icon = 'exclamation';
            } else if (type == 'danger') {
                icon = 'times';
            } else {
                icon = 'bullhorn';
            }
        }
    }
}
