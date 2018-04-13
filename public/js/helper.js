function formPopulate(selector, data) {
    console.log(`form ${selector} populate this data > `);
    console.log(data);

    var form = $(selector);
    $.each(data, function(key, value) {
        var ctrl = $('[name='+key+']', form);
        switch(ctrl.prop("type")) {
            case "radio": case "checkbox":
                var check_val = (ctrl.prop('value') == value);

                // console.log(check_val);
                // console.log(ctrl.is(':checked'));

                if(ctrl.prop("class") == 'js-switch' && check_val != ctrl.is(':checked')){
                    $(ctrl).parent().find('.switchery').trigger('click');
                    console.log('changed');
                } else {
                    // ctrl.each(function() {
                    //     if($(this).attr('value') == value) $(this).attr("checked",value);
                    // });
                }
                break;

            case 'text':
                if(ctrl.attr('data-role') == 'tagsinput'){
                    ctrl.tagsinput('removeAll');
                    var str = value.split(',');
                    str.forEach(function(val, key){
                        ctrl.tagsinput('add', val);
                    });
                } else {
                    ctrl.val(value);
                }
                break;
            default:
                ctrl.val(value);
        }
        ctrl.trigger('change');
    });
}

function serialzeForm(selector){
    var formArray = $(selector).serializeArray(),
        dataForm = {};

    formArray.forEach(function(val, index){
        dataForm[val.name] = val.value;
    })
    return dataForm;
}
