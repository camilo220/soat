jQuery(function() {
  return $('#vehicle_category').change(function() {
    var category,  options;
    category = $('#vehicle_category :selected').text();
    options = gon.sub_category[category];
    filter_sub_categories = 
      options.map(function(option) {
        return '<option value="'+option+'">'+option+'</option>';
     });
    $('#vehicle_sub_category').html(filter_sub_categories);
    // console.log(category);
    // console.log(filter_sub_categories);
  });
});