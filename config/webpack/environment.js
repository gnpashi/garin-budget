const { environment } = require('@rails/webpacker')
// var $  = require( 'jquery');
// var dt = require( 'datatables.net' )( window, $ );

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
	  jquery: 'jquery',
	  'window.jQuery': 'jquery',
		Popper: ['popper.js', 'default'],
		// DataTable: 'datatables.net-bs4'
		// 'jszip': 'jszip',
		// 'pdfmake': 'pdfmake',
		// 'datatables.net-bs4': 'datatables.net-bs4',
		// 'window.dataTable': 'datatables.net-bs4',
		// 'datatables.net-buttons-bs4': 'datatables.net-buttons-bs4',
		// 'datatables.net-buttons/js/buttons.colVis.js': 'datatables.net-buttons/js/buttons.colVis.js',
		// 'datatables.net-buttons/js/buttons.html5.js': 'datatables.net-buttons/js/buttons.html5.js',
		// 'datatables.net-buttons/js/buttons.print.js': 'datatables.net-buttons/js/buttons.print.js',
		// 'datatables.net-colreorder-bs4': 'datatables.net-colreorder-bs4',
		// 'datatables.net-fixedcolumns-bs4': 'datatables.net-fixedcolumns-bs4',
		// 'datatables.net-fixedheader-bs4': 'datatables.net-fixedheader-bs4',
		// 'datatables.net-responsive-bs4': 'datatables.net-responsive-bs4',
		// 'datatables.net-searchpanes-bs4': 'datatables.net-searchpanes-bs4'

  })
)
// var DataTable = require( 'datatables.net-bs4' );

 
module.exports = environment
