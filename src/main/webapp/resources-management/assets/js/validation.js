

function Validator(options) {
    function validate(selectElement, rule) {
        var errormessage = rule.test(selectElement.value);
        var errorElement = selectElement.parentElement.querySelector('.form-message');
        if (errormessage) {
            errorElement.innerText = errormessage;
            return errormessage;
        } else {
            errorElement.innerText = '';
        }
    }
    var formElement = document.querySelector(options.form);
    if (formElement) {
        options.rules.forEach(function (rule) {
            var selectElement = formElement.querySelector(rule.selector);

            if (selectElement) {
                selectElement.onblur = function () {
                    validate(selectElement, rule);
                };
                selectElement.onchange = function () {
                    validate(selectElement, rule);
                };

                selectElement.oninput = function () {
                    validate(selectElement, rule);
                };

            }

        });

        formElement.onsubmit = function (event) {
            check = true;
            options.rules.forEach(function (rule) {

                var selectElement = formElement.querySelector(rule.selector);

                if (validate(selectElement, rule)) {
                    check = false;
                    return;
                }

            });
            if (!check) {
                event.preventDefault();
            }
        };

    }
}
;


            



//Validation Airports
Validator.isName = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please fill in this field!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isCity = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please select a city!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isStatus = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please select status!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isImage = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please select image!';
            } else {
                return undefined;
            }
        }
    };
};

//Validation aircrafts 
Validator.isNumber = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please fill in this field!!';
            } else {
                return undefined;
            }
        }
    };
};


Validator.isRoww = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please fill in this field!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isColumn = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please fill in this field!';
            } else {
                return undefined;
            }
        }
    };
};


//Validate flight-routes
Validator.isDeparture = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please select departure!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isDestination = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please select destination!';
            } else {
                return undefined;
            }
        }
    };
};


Validator.isDistance = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please fill in this field!';
            } else {
                return undefined;
            }
        }
    };
};


///VALIDATION FLIGHTS

Validator.isAircrafts = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please select aircrafts!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isFlightRoutes = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please select flight routes!';
            } else {
                return undefined;
            }
        }
    };
};


Validator.isOperation = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please select operation!';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isDepart = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please fill in this field!!';
            } else {
                return undefined;
            }
        }
    };
};



Validator.isArrival = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please fill in this field!!';
            } else {
                return undefined;
            }
        }
    };
};



Validator.isCreateDate = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Please fill in this field!!';
            } else {
                return undefined;
            }
        }
    };
};

















