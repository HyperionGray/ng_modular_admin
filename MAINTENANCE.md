# Maintenance Instructions

**To upgrade Bootstrap:**

1. Change directory to `ng_modular_admin/lib`.
2. Download the [latest source
   release](https://v4-alpha.getbootstrap.com/getting-started/download/).
3. Unzip the contents into `ng_modular_admin/lib/src`.
4. Rename `bootstrap-4.*/scss` to `bootstrap`.
5. Remove the Zip file.
6. Run `dart ng_modular_admin/tool/build-styles.dart` to rebuild the
   stylesheets.

**To upgrade Open Sans:**

1. Change directory to `ng_modular_admin/lib`
2. Download Zip file from the [open-sans GitHub
   project](https://github.com/FontFaceKit/open-sans).
3. Unzip the contents.
4. Put the contents of the `/fonts` directory into
   `ng_modular_admin/lib/open-sans/fonts`.
5. Put everything else in `ng_modular_admin/lib/src/open-sans`.
6. Remove the Zip file.
7. Run `dart ng_modular_admin/tool/build-styles.dart` to rebuild the
   stylesheets.

**To upgrade Modular Admin from upstream:**

*Modular Admin itself cannot be updated from upstream!* This project
has been restructured so much from its original source that merging upstream
patches into this project is not feasible.
