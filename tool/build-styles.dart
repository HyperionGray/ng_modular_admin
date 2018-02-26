import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;

/// Build stylesheets for this package.
main (List<String> rawArgs) {
    ArgResults args = _parseArgs(rawArgs);
    buildComponentStyles(args['debug']);
    buildSharedStyles(args['debug']);
}

/// Build a stylesheet for each component.
buildComponentStyles(bool debug) {
    print('Building component stylesheets…');
    var componentPath = _getPath('lib/src/components');
    var componentDir = new Directory(componentPath);
    var includeDir = _getPath('lib/src');
    var sourcePaths = new List<String>();

    for (FileSystemEntity entity in componentDir.listSync()) {
        String basename = path.basename(entity.path);

        if (!basename.endsWith('.scss')) {
            continue;
        }

        sourcePaths.add(entity.path);
    }

    sourcePaths.sort();

    for (String sourcePath in sourcePaths) {
        String basename = path.basename(sourcePath);
        String component = basename.substring(0, basename.length - 5);
        String destName = component + '.css';
        String destPath = path.join(componentPath, destName);
        bool cached = _styleSheetIsCurrent(sourcePath, destPath);

        print(' * lib/src/components/' + basename +
              ' → lib/src/components/' + destName +
              (cached ? ' (cached)' : ''));

        if (cached) {
            continue;
        }

        var sasscArgs = ['-I', includeDir];

        if (!debug) {
            sasscArgs.addAll(['-t', 'compressed']);
        }

        sasscArgs.addAll([sourcePath, destPath]);
        var result = Process.runSync('sassc', sasscArgs);
        if (result.exitCode != 0) {
            print('ERROR: Failed to compile ' + sourcePath);
            print(result.stderr);
            exit(1);
        }
    }
}

/// Build a stylesheet for each theme.
buildSharedStyles(bool debug) {
    print('Building shared stylesheets…');
    var themeDir = new Directory(_getPath('lib/src/modular-admin'));
    var cssDir = _getPath('lib/css');
    var includeDir = _getPath('lib/src');
    var sourcePaths = new List<String>();

    for (FileSystemEntity entity in themeDir.listSync()) {
        String basename = path.basename(entity.path);
        String extension = path.extension(entity.path);

        if (basename.startsWith('_') || extension != '.scss') {
            continue;
        }

        sourcePaths.add(entity.path);
    }

    sourcePaths.sort();

    for (String sourcePath in sourcePaths) {
        String basename = path.basename(sourcePath);
        String themeName = basename.substring(0, basename.length - 5);
        String destName = themeName + '.css';
        String destPath = path.join(cssDir, themeName + '.css');

        // TODO temporary hack, always build theme:
        bool cached = false;//_styleSheetIsCurrent(sourcePath, destPath);

        print(' * lib/src/modular-admin/' + basename +
              ' → lib/css/' + destName +
              (cached ? ' (cached)' : ''));

        if (cached) {
            continue;
        }

        var sasscArgs = ['-I', includeDir];

        if (!debug) {
            sasscArgs.addAll(['-t', 'compressed']);
        }

        sasscArgs.addAll([sourcePath, destPath]);
        var result = Process.runSync('sassc', sasscArgs);
        if (result.exitCode != 0) {
            print('ERROR: Failed to compile ' + sourcePath);
            print(result.stderr);
            exit(1);
        }
    }
}

/// Construct a full path from a path relative to the project toot.
String _getPath(String relPath) {
    var scriptPath = Platform.script.toFilePath();
    var projectRoot = path.dirname(path.dirname(scriptPath));
    return path.join(projectRoot, relPath);
}

/// Parse command line arguments.
ArgResults _parseArgs(List<String> rawArgs) {
    var parser = new ArgParser();

    parser.addFlag(
        'debug',
        defaultsTo: false,
        help: 'Debug mode, e.g. don\'t minify assets.'
    );

    try {
        return parser.parse(rawArgs);
    } on FormatException catch(fe) {
        print('Usage:');
        print(parser.usage);
        exit(1);
    }
}

/// Return true if the file at `destPath` exists and has a last-modified
/// greater than or equal to the file at `sourcePath`.
bool _styleSheetIsCurrent(sourcePath, destPath) {
    var source = FileStat.statSync(sourcePath);
    var dest = FileStat.statSync(destPath);
    return dest.type != FileSystemEntityType.NOT_FOUND &&
           dest.modified.isAfter(source.modified);
}
