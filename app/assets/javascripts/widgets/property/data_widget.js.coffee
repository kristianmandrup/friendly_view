# Define your coffeescript code for the Property::Data widget
namespace "Widget.property.Data"
  Data:
    class Data
      constructor : (@widget_id = widget_id) ->

      # add custom widget function here
      toggleActive: (options) ->
