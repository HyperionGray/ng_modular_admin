import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_fontawesome/ng_fontawesome.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Buttons demo.
@Component(
    selector: 'buttons',
    templateUrl: 'buttons.html',
    directives: const [CORE_DIRECTIVES, FaIcon, formDirectives, MA_DIRECTIVES]
)
class ButtonsComponent {
    bool disabledDemo = false;
    bool busyDemo = false;

    DocumentService _doc;

    ButtonsComponent(this._doc) {
        this._doc.title = 'Buttons';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Components', icon: 'gears'),
            new Breadcrumb(name: 'Buttons'),
        ];
    }

    /// A sample action for responding to a button click.
    void showClickAlert(ButtonClick click) {
        String description = (click.event.currentTarget as Element).text.trim();
        window.console.log('You clicked on $description.');
        click.button.busy = true;
        new Timer(new Duration(seconds:1), () => click.button.busy = false);
    }

    /// The sample action for the busy/disabled demos.
    void showClickAlertNoBusy(ButtonClick click) {
        String description = (click.event.currentTarget as Element).text.trim();
        window.console.log('You clicked on $description.');
    }
}
