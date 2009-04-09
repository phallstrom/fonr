// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function about() {
  if (Element.empty('about-content')) {
    new Ajax.Updater('about-content', 'rails/info/properties', {
      method:     'get',
      onFailure:  function() {Element.classNames('about-content').add('failure')},
      onComplete: function() {new Effect.BlindDown('about-content', {duration: 0.25})}
    });
  } else {
    new Effect[Element.visible('about-content') ? 
      'BlindUp' : 'BlindDown']('about-content', {duration: 0.25});
  }
}
