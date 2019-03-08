# Modular Admin for Angular Dart

[View Demo](https://hyperiongray.github.io/ng_modular_admin_demo/)

## Overview

This project is a port of [Modular
Admin](https://github.com/modularcode/modular-admin-html) to Angular Dart.
Modular Admin is a Bootstrap 4 admin theme written with HTML, monolithic CSS,
and some JavaScript. This port focuses on converting monolithic CSS to web
components with encapsulated styles and reimplementing the JavaScript logic with
AngularDart.

## Building

Before building styles, you need `dart` and `sassc` installed, and you need to
run `pub get`. The current version of C++ sassc (3.5.0) has [a bug that breaks
Modular Admin](https://github.com/sass/sassc/issues/248). Use sassc 3.4.5
instead.

To build styles, run `dart tool/build-styles.dart`.

---

[![define hyperion gray](https://hyperiongray.s3.amazonaws.com/define-hg.svg)](https://hyperiongray.com/?pk_campaign=github&pk_kwd=ng_modular_admin "Hyperion Gray")
