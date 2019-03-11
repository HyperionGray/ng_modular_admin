# Modular Admin for Angular Dart

[View Demo](https://hyperiongray.github.io/ng_modular_admin_demo/)

## Overview

This project is a port of [Modular
Admin](https://github.com/modularcode/modular-admin-html) to Angular Dart.
Modular Admin is a Bootstrap 4 admin theme written with HTML, monolithic CSS,
and some JavaScript. This port focuses on converting monolithic CSS to web
components with encapsulated styles and reimplementing the JavaScript logic with
AngularDart.

## Getting Started

To use `ng_modular_admin` in your own AngularDart project, do the following:

1. Add `ng_modular_admin` as a dependency in `pubspec.yaml` (and run `pub get`).
2. Create an SCSS stylesheet in your main web directory, e.g. `web/theme.scss`
   and put `@import "package:ng_modular_admin/src/modular-admin/modular-admin";` at the top of this file.
3. You can add any customizations you want to the SCSS stylesheet you created in
   step 2. The stylesheet will be built automatically when you use `webdev
   serve` or `webdev build`.
4. For any component where you want to use Modular Admin, import
   `package:ng_modular_admin/ng_modular_admin.dart` and add
   `modularAdminDirectives` to that component's directives.
5. Look at the [Layout demo
   page](https://hyperiongray.github.io/ng_modular_admin_demo/#/layout) to see
   how to set up the application shell.

You will find more detailed usage information and examples in the demo
application.

---

[![define hyperion gray](https://hyperiongray.s3.amazonaws.com/define-hg.svg)](https://www.hyperiongray.com/?pk_campaign=github&pk_kwd=ng_modular_admin "Hyperion Gray")
