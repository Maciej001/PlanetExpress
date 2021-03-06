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
//= require foundation
//= require underscore
//= require backbone 
//= require marionette
//= require foundation
//= require js-routes
//= require syphon
//= require spin
//= require jquery.spin  
//= require backbone-routefilter

//= require_tree ./config
//= require backbone/app

//= require_tree ./backbone/lib/controllers
//= require_tree ./backbone/lib/views
//= require_tree ./backbone/lib/entities
//= require_tree ./backbone/lib/utilities
//= require_tree ./backbone/lib/components

//= require_tree ./backbone/entities 
//= require_tree ./backbone/apps


$(function(){ 'use strict'; $(document).foundation(); });




