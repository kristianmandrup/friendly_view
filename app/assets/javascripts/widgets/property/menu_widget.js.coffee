# Define your coffeescript code for the Property::Menu widget
namespace "Widget.property.Menu"
  Menu:
    class Menu
      constructor : (@widget_id = widget_id) ->
        @defaultTab = 'photos'
      # add custom widget function here
      # pass in the id of the property
      show: (options) ->
        @id = options.id
        @baseURL = 'property/#{@id}/'
        
        # load content for first tab and initialize
        tabContentElem = $("#property .tab-content ##{defaultTab}")

        @defaultPath = baseURL + @defaultTab

        tabContentElem.load @defaultPath, ->
            tabContentElem.tab() # initialize tabs
        
        tabContentElem.bind 'show', (e) ->
          # use regex to get anchor(==selector)
          pattern = /#.+/gi 
          # get anchor         
          contentId = e.target.toString().match(pattern)[0] 
          
          # don't load if html already loaded for tab
          return if $(contentId).innerHtml()

          path = baseURL + contentId.replace '#',''

          tabContentElem = $(contentId)

          tabContentElem.html "Loading..."
          # load content for selected tab
          tabContentElem.load path, ->
            propertyTab.tab() # reinitialize tabs
