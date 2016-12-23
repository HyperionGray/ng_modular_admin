# Modular Admin for Angular2Dart

[View Demo](https://hyperion-gray.gitlab.io/ng2_modular_admin_demo/)

## Overview

This project is a port of Modular Admin to Angular2Dart. Modular Admin is
a Bootstrap 4 admin theme written with HTML, monolithic CSS, and some
JavaScript. This port focuses on converting monolithic CSS to web components
with encapsulated styles and reimplementing the JavaScript logic with Angular 2
and Dart.

*This project is still alpha quality. Do not use it in your production projects!*

## Maintenance Instructions

*This section is for the developers of `ng2_modular_admin`.*

**To upgrade Bootstrap:**

1. Change directory to `ng2_modular_admin/lib`.
2. Download the [latest source
   release](https://v4-alpha.getbootstrap.com/getting-started/download/).
3. Unzip the contents into `ng2_modular_admin/lib`.
4. Rename `bootstrap-4.*/scss` to `bootstrap`.
5. Remove the Zip file.
6. Run `dart ng2_modular_admin/tool/build-modular-admin.dart` to rebuild the
   stylesheets.

**To upgrade Open Sans:**

1. Change directory to `ng2_modular_admin/lib`
2. Download Zip file from the [open-sans GitHub
   project](https://github.com/FontFaceKit/open-sans).
3. Unzip the contents into `ng2_modular_admin/lib`.
4. Rename `open-sans-*` to `open-sans`.
5. Remove the Zip file.
6. Run `dart ng2_modular_admin/tool/build-modular-admin.dart` to rebuild the
   stylesheets.

**To upgrade Modular Admin from upstream:**

*Modular Admin itself cannot be updated from upstream!* The upstream project
has been restructured so much from its original sources that updating this
downstream version isn't feasible.
