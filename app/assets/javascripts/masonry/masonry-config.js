// Expected layout
// #properties
//   .property
//   .property
//   .property

var $masonry_container = $('#properties');

// http://masonry.desandro.com/docs/intro.html
// If your content contains any images, you’ll want to ensure that Masonry is 
// triggered after all the images your content has loaded. 
// The included imagesLoaded plugin makes this easy

// $masonry_container.imagesLoaded(function(){
//   $masonry_container.masonry({
//     itemSelector : '.property',
//     // http://masonry.desandro.com/demos/fluid.html
//     // set columnWidth a fraction of the container width
//     columnWidth: function( containerWidth ) {
//       return containerWidth / 5;
//     }
//   });
// });
