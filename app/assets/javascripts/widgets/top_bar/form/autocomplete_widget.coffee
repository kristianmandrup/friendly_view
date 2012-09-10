$ ->
  # See http://gerger.co/blog/2011/02/17/google-maps-api-v3-location-search-with-jquery-autocomplete-plugin/
  # new search.AutoComplete(41.06000, 28.98700).config(2)    
  gmapsOptions = {debugOn: true, inputField: '#search_location'}

  console.log 'gmapsOptions', gmapsOptions
  GmapsAutoComplete.init(gmapsOptions);
  GmapsAutoComplete.autoCompleteInit(region: 'DK', country: 'Denmark');

