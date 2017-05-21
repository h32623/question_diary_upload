
(function(global) {
  var brand = document.querySelector('.brand'),
      brand_text = document.querySelector('.brand + p'),
      demo_title = document.querySelector('.demo__title'),
      demo_list = document.querySelector('.demo__list'),
      copyright = document.querySelector('.copyright'),
      tl = new TimelineLite();

  // TimelineLite
  tl
    .from(brand, 0.7, { opacity: 0, y: -10 })
    .from(brand_text, 0.5, { opacity: 0, y: -10, }, '-=0.3')
    .from(demo_title, 0.5, { opacity: 0, y: -10, }, '-=0.3')
    .from(demo_list, 0.5, { opacity: 0, y: -10, }, '-=0.3')
    .from(copyright, 1.5, { opacity: 0 }, '-=0.15');
})(window);