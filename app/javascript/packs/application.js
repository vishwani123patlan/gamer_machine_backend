// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('jquery')
window.jQuery = $;
window.$ = $;
Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("@popperjs/core")
import "bootstrap"
import { Tooltip, Popover } from "bootstrap"

// If you're using Turbolinks. Otherwise simply use: jQuery(function () {
document.addEventListener("turbolinks:load", () => {
    // Both of these are from the Bootstrap 5 docs
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new Tooltip(tooltipTriggerEl)
    })

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new Popover(popoverTriggerEl)
    })
})


// The stylesheet location we created earlier

require("../stylesheets/application.scss")
require('admin/game')

//SIDE BAR JS
$(document).ready(function(){
	// Sidebar Toggle Code
	$(document).on('click', '#menu-btn', function(){
		var sidebar = $("#sidebar");
		var container = $(".my-container");
		sidebar.toggleClass("active-nav");
  		container.toggleClass("active-cont");
	})
})
