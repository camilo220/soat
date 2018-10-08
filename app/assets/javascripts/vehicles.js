jQuery(function() {
  return $('#vehicle_category').change(function() {
    let category, sub_category,options;
    category = $('#vehicle_category :selected').text();
    
    options = gon.sub_category[category];
    filter_sub_categories = 
      options.map(function(option) {
        return '<option value="'+option+'">'+option+'</option>';
     });

     $('#vehicle_sub_category').html(filter_sub_categories);
     
     sub_category = $('#vehicle_sub_category :selected').text();
     unit_of_measurement = gon.unit_of_measurement[sub_category];
     $('#vehicle_unit_of_measurement').val(unit_of_measurement);
     console.log(sub_category);
     console.log(unit_of_measurement);
    // console.log(category);
    // console.log(filter_sub_categories);
  });
});


jQuery(function() {
  return $('#vehicle_sub_category').change(function() {
    let sub_category;
    sub_category = $('#vehicle_sub_category :selected').text();
    unit_of_measurement = gon.unit_of_measurement[sub_category];
    $('#vehicle_unit_of_measurement').val(unit_of_measurement);
    console.log(sub_category);
    console.log(unit_of_measurement);
  });
});