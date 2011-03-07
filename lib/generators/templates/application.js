$(function(){
    setup_checkbox_for_selct_all()
})


function setup_checkbox_for_selct_all(){
    var trigger = $("input[name=select-all]")
    trigger.live("click", function(){
        var checked_status = this.checked;
        trigger.each(function(){
            this.checked = checked_status
        })
        $("input.select_all").each(function(){
            this.checked = checked_status;
        });
    });
}

function mark_current(target, collection){
    $(target).addClass('current')
    $(collection).not(target).removeClass('current')
}


