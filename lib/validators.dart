import 'package:angular_forms/angular_forms.dart';

/// Form value is either blank or can be parsed as an int, with optional min
/// and max values (inclusive).
ValidatorFn integer({num min, num max}) {
    return (AbstractControl control) {
        var parsed;
        Map<String, dynamic> errors = {};
        if (control.value.trim().isNotEmpty) {
            try {
                parsed = int.parse(control.value, radix: 10);
            } catch (exc) {
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

/// Validates that a control's value matches the value of another control, e.g.
/// two password fields on a registration form.
ValidatorFn matches(Control other, String error) {
    return (AbstractControl control) {
        Map<String, dynamic> errors = {};
        if (control.value != other.value) {
            errors[error] = '';
        }
        return errors.length > 0 ? errors : null;
    };
}

/// Form value is either blank or can be parsed as a float, with optional min
/// and max values (inclusive).
ValidatorFn number({num min, num max}) {
    return (AbstractControl control) {
        var parsed;
        Map<String, dynamic> errors = {};
        if (control.value.trim().isNotEmpty) {
            try {
                parsed = double.parse(control.value);
            } catch (exc) {
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
