# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
	$('.datepicker').datepicker()

	$("li.flag[title]").tooltip()

	console.log country_code
	selector = "li.flag[data-cc=" + country_code.toLowerCase() + "]"

	$(selector).css('border', '2px solid black')

	$("select.slider.price").selectToUISlider({
		labels: 4,
		animate: true,
		tooltip: true,
		sliderOptions:
			change: (e, ui) -> 
				from = $('select#price_from option').eq(ui.values[0]).text()
				to 	 = $('select#price_to option').eq(ui.values[1]).text()
				$("#price").val(from + " - " + to)
			
	})
	left 	= $("select.slider#price_from").val()
	right = $("select.slider#price_to").val()
	
	$("#price_input").val(left + " - " +  right)

	$("select.slider.rooms").selectToUISlider({
			labels: 3,
			tooltip: true,
			animate: true,
			sliderOptions:
				change: (e, ui) -> 
					from = $('select#rooms_from option').eq(ui.values[0]).text()
					to 	 = $('select#rooms_to option').eq(ui.values[1]).text()
					$("#rooms_input").val(from + " - " + to)
	})
	
	left 	= $("select.slider#rooms_from").val()
	right = $("select.slider#rooms_to").val()
	
	$("#rooms_input").val(left + " - " +  right)

	$("select.slider.sqm").selectToUISlider({
			labels: 3,
			animate: true,
			tooltip: true,
			sliderOptions:
				change: (e, ui) -> 
					from = $('select.slider#sqm_from option').eq(ui.values[0]).text()
					to 	 = $('select.slider#sqm_to option').eq(ui.values[1]).text()
					$("#sqm").val(from + " - " + to)
	})

	left 	= $("select.slider#sqm_from").val()
	right = $("select.slider#sqm_to").val()
	
	$("#sqm").val(left + " - " +  right)
