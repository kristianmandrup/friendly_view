# Define your coffeescript code for the Property::Cost widget
namespace "Widget.property.Cost"
  Cost:
    class Cost
      constructor : (@widget_id = widget_id) ->

      # add custom widget function here
      toggleActive: (options) ->
