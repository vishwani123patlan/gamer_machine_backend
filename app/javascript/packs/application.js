// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery';
import jQuery from 'jquery';

window.jQuery = $;
window.$ = $;

require('jquery')
Rails.start()
Turbolinks.start()
ActiveStorage.start()
global.$ = jQuery;
require("@popperjs/core")
import "bootstrap"
import { Tooltip, Popover } from "bootstrap"

// The stylesheet location we created earlier

require("../stylesheets/application.scss")
require('admin/datatable')
//SIDE BAR JS
$(document).ready(function(){
	// Sidebar Toggle s
    console.log("hello")
	$(document).on('click', '#menu-btn', function(){
		var sidebar = $("#sidebar");
		var container = $(".my-container");
		sidebar.toggleClass("active-nav");
  		container.toggleClass("active-cont");
	})
})
