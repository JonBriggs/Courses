// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require modernizr.custom
//= require material-components-web/dist/material-components-web

var addClassDialog = function(classid) {
  var dialog = new mdc.dialog.MDCDialog(document.querySelector('#course_pop_' + classid));

  dialog.listen('MDCDialog:cancel', function() {
    console.log('canceled');
  })

  document.querySelector('#course_' + classid).addEventListener('click', function (evt) {
  dialog.lastFocusedTarget = evt.target;
  dialog.show();
})
}

var addDepartmentDialog = function(depid) {
  var dialog = new mdc.dialog.MDCDialog(document.querySelector('#department_pop_' + depid));

  dialog.listen('MDCDialog:cancel', function() {
    console.log('canceled');
  })

  document.querySelector('#department_' + depid).addEventListener('click', function (evt) {
  dialog.lastFocusedTarget = evt.target;
  dialog.show();
})
}