import 'package:angular2/core.dart';
import 'package:angular2/common.dart';

/// Form value is either blank or can be parsed as an int, with optional min
/// and max values (inclusive).
ValidatorFn integer({num min, num max}) {
    return (AbstractControl control) {
        var parsed;
        var errors = {};
        if (control.value.trim().isNotEmpty) {
            try {
                parsed = int.parse(control.value, radix: 10);
            } catch (exc, stack) {
                print(exc);
                errors['Must be an integer'] = true;
            }
        }
        if (parsed != null) {
            var rangeError = false;
            if ((min != null && parsed < min) ||
                (max != null && parsed > max)) {
                rangeError = true;
            }
            if (rangeError) {
                if (min != null && max != null) {
                    errors['Must be ≥$min and ≤$max'] = true;
                } else if (min != null) {
                    errors['Must be ≥$min'] = true;
                } else {
                    errors['Must be ≤$max'] = true;
                }
            }
        }
        return errors.length > 0 ? errors : null;
    };
}

/// Form value is either blank or can be parsed as a float, with optional min
/// and max values (inclusive).
ValidatorFn number({num min, num max}) {
    return (AbstractControl control) {
        var parsed;
        var errors = {};
        if (control.value.trim().isNotEmpty) {
            try {
                parsed = double.parse(control.value);
            } catch (exc, stack) {
                errors['Must be a decimal number'] = true;
            }
        }
        if (parsed != null) {
            var rangeError = false;
            if ((min != null && parsed < min) ||
                (max != null && parsed > max)) {
                rangeError = true;
            }
            if (rangeError) {
                if (min != null && max != null) {
                    errors['Must be ≥$min and ≤$max'] = true;
                } else if (min != null) {
                    errors['Must be ≥$min'] = true;
                } else {
                    errors['Must be ≤$max'] = true;
                }
            }
        }
        return errors.length > 0 ? errors : null;
    };
}

/// Form value is not a blank string.
ValidatorFn required() {
    return (AbstractControl control) {
        if (control.value != null && control.value.trim().isNotEmpty) {
            return null;
        } else {
            return {'Required': true};
        }
    };
}
