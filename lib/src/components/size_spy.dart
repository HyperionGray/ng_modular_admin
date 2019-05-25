import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';

import '../services/document.dart';

/// This component creates some hidden elements that are used to figure out
/// what the bootstrap size of the current viewport is.
@Component(selector: 'ma-size-spy', template: '''
        <div #xs class='               hidden-sm-up'></div>
        <div #sm class='hidden-xs-down hidden-md-up'></div>
        <div #md class='hidden-sm-down hidden-lg-up'></div>
        <div #lg class='hidden-md-down hidden-xl-up'></div>
        <div #xl class='hidden-lg-down             '></div>
    ''')
class SizeSpy implements AfterViewInit {
  @ViewChild('xs')
  Element xs;

  @ViewChild('sm')
  Element sm;

  @ViewChild('md')
  Element md;

  @ViewChild('lg')
  Element lg;

  @ViewChild('xl')
  Element xl;

  DocumentService _doc;

  /// Constructor
  SizeSpy(this._doc);

  /// Implements AfterViewInit interface.
  void ngAfterViewInit() {
    scheduleMicrotask(this._setBootstrapSize);
    window.onResize.listen((event) => this._setBootstrapSize());
  }

  /// Return true if the element's display is set to "block".
  bool _elementVisible(Element el) {
    var style = el.getComputedStyle();
    return style.display == 'block';
  }

  /// Calcaulate the bootstrap size of the current viewport.
  void _setBootstrapSize() {
    if (this._elementVisible(this.xs)) {
      this._doc.bootstrapSize = BootstrapSize.xs;
    } else if (this._elementVisible(this.sm)) {
      this._doc.bootstrapSize = BootstrapSize.sm;
    } else if (this._elementVisible(this.md)) {
      this._doc.bootstrapSize = BootstrapSize.md;
    } else if (this._elementVisible(this.lg)) {
      this._doc.bootstrapSize = BootstrapSize.lg;
    } else if (this._elementVisible(this.xl)) {
      this._doc.bootstrapSize = BootstrapSize.xl;
    } else {
      //throw new Exception('ma-size-spy cannot determine BootstrapSize');
    }
  }
}
