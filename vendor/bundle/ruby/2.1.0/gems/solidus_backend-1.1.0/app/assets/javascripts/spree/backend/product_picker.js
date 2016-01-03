$.fn.productAutocomplete = function (options) {
  'use strict';

  // Default options
  options = options || {}
  var multiple = typeof(options['multiple']) !== 'undefined' ? options['multiple'] : true

  this.select2({
    minimumInputLength: 3,
    multiple: multiple,
    initSelection: function (element, callback) {
      $.get(Spree.routes.admin_product_search, {
        ids: element.val().split(','),
        token: Spree.api_key
      }, function (data) {
        callback(multiple ? data.products : data.products[0]);
      });
    },
    ajax: {
      url: Spree.routes.admin_product_search,
      datatype: 'json',
      params: { "headers": { "X-Spree-Token": Spree.api_key } },
      data: function (term, page) {
        return {
          q: {
            name_cont: term,
            sku_cont: term
          },
          m: 'OR',
          token: Spree.api_key,
          page: page
        };
      },
      results: function (data, page) {
        var products = data.products ? data.products : [];
        return {
          results: products,
          more: (data.current_page * data.per_page) < data.total_count
        };
      }
    },
    formatResult: function (product) {
      return product.name;
    },
    formatSelection: function (product) {
      return product.name;
    }
  });
};

$(document).ready(function () {
  $('.product_picker').productAutocomplete();
});
