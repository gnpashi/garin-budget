// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import $ from 'jquery';
global.$ = jQuery;
window.$ = $
// var $  = require( 'jquery' );
// var dt = require( 'datatables.net' )( window, $ );

require( 'datatables.net-dt' );
require( 'datatables.net-buttons-dt' );
require( 'datatables.net-colreorder-dt' );
require( 'datatables.net-fixedcolumns-dt' );
require( 'datatables.net-fixedheader-dt' );
require( 'datatables.net-responsive-dt' );
require( 'datatables.net-rowreorder-dt' );
require( 'datatables.net-scroller-dt' );

// require(‘imports-loader?define=>false!datatables.net’)(window, $)
// require(‘imports-loader?define=>false!datatables.net-bs4’)(window, $)
// require( 'jquery' );
// require( 'jszip' );
// require( 'pdfmake' );
// var DataTable = require( 'datatables.net-bs4' );
// require( 'datatables.net-buttons-bs4' );
// require( 'datatables.net-buttons/js/buttons.colVis.js' );
// require( 'datatables.net-buttons/js/buttons.html5.js' );
// require( 'datatables.net-buttons/js/buttons.print.js' );
// require( 'datatables.net-colreorder-bs4' );
// require( 'datatables.net-fixedcolumns-bs4' );
// require( 'datatables.net-fixedheader-bs4' );
// require( 'datatables.net-responsive-bs4' );
// require( 'datatables.net-searchpanes-bs4' );

// require('datatables.net-bs4')(  );
// require('datatables.net-bs4')(window, jQuery );
// require('datatables.net-bs4')(window, $ );
// const dataTables = [];
// import $ from 'jquery';
// global.$ = jQuery;

// document.addEventListener("turbolinks:load", () => {
//   if (dataTables.length === 0 && $('.data-table').length !== 0) {
//     $('.data-table').each((_, element) => {
//       dataTables.push($(element).DataTable({
//         pageLength: 50
//       }));
//     });
//   }
// });
//
// document.addEventListener("turbolinks:before-cache", () => {
//   while (dataTables.length !== 0) {
//     dataTables.pop().destroy();
//   }
// });
// window.jQuery = $;
// window.$ = $;
// window.dataTable = 'datatables.net-bs4'

// import $ from 'jquery';
// global.$ = jQuery;
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import "stylesheets/application"
