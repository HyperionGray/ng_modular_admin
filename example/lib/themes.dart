import 'dart:async';
import 'dart:js';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:ng_modular_admin/ng_modular_admin.dart';

/// Themes component.
@Component(
    selector: 'themes',
    styles: const ['''
        span.label {
            margin-left: 1em;
        }
        div.palette {
            display: inline-block;
            height: 1em;
            width: 1em;
            position: relative;
            top: 3px;
        }
        .lighter {
            background-color: var(--ma-primary-color-lighter);
        }
        .light {
            background-color: var(--ma-primary-color-light);
        }
        .primary {
            background-color: var(--ma-primary-color);
        }
        .dark {
            background-color: var(--ma-primary-color-dark);
        }
        .darker {
            background-color: var(--ma-primary-color-darker);
        }
    '''],
    templateUrl: 'themes.html',
    directives: const [CORE_DIRECTIVES, formDirectives, MA_DIRECTIVES]
)
class ThemesComponent implements AfterContentInit {
    String cardPadding = '';
    String contentPadding = '';
    String gutterWidth = '';
    ElementRef host;
    Timer updateTimer;
    List<String> themes = ['blue', 'red', 'orange', 'purple', 'seagreen'];

    DocumentService _doc;

    /// Constructor.
    ThemesComponent(this._doc, this.host) {
        this._doc.title = 'Themes';
        this._doc.breadcrumbs = [
            new Breadcrumb(name: 'Themes', icon: 'paint-brush'),
        ];
    }

    /// Apply a theme to the <ma-app> element.
    void applyTheme(String theme) {
        var appEl = document.querySelector('ma-app');
        appEl.classes.removeWhere((c) => c.endsWith('-theme'));
        if (theme != null) {
            appEl.classes.add('$theme-theme');
        }
    }

    /// Populate the CSS inputs.
    void ngAfterContentInit() {
        // I used JS interop because the core API getPropertyValue() is buggy.
        var appEl = document.querySelector('ma-app');
        var style = context.callMethod('getComputedStyle', [appEl]);
        var getProp = (name) => style.callMethod('getPropertyValue', [name]);
        this.cardPadding = getProp('--ma-card-padding').trim();
        this.contentPadding = getProp('--ma-content-padding').trim();
        this.gutterWidth = getProp('--ma-gutter-width').trim();
    }

    /// Handle a CSS custom property change.
    void onPropChange(var prop, var event) {
        if (updateTimer != null && updateTimer.isActive) {
            updateTimer.cancel();
        }

        updateTimer = new Timer(new Duration(seconds: 1), () {
            // I used JS interop because the core API setProperty() is buggy.
            var appEl = window.document.querySelector('ma-app');
            var style = (new JsObject.fromBrowserObject(appEl))['style'];
            style.callMethod('setProperty', [prop, event]);
        });
    }
}
