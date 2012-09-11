# Define your coffeescript code for the TopBar::Form widget
namespace "Widget.topBar"
  Form:
    class Form
      constructor : (@widget_id = widget_id) ->

      search: (@search = search) ->        
      # add custom widget function here
      # pass in the id of the property
      show: (options) ->
        $('select#rooms_from, select#rooms_to').selectToUISlider labels :5, scaleAndTics: false, hideSlider: true
        $('select#size_from, select#size_to').selectToUISlider labels:3, scaleAndTics: false, hideSlider: true
        $('select#cost_from, select#cost_to').selectToUISlider labels:3, scaleAndTics: false, hideSlider: true

$ ->
  Widgets.topBar.form = new Widget.topBar.Form()

