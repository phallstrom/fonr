// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function set_document_title() {
  try {
    document.title = $$('h1').first().innerHTML + ' - ' + document.title;
  }catch(e) {;}
}

Event.observe(window, 'load', set_document_title);

//
//  
function fb_connect_invite_friends(options) {

  if ( typeof options != 'object' ) { options = {} }  
  if ( options.title == undefined ) { options.title = "Invite your friends" }
  if ( options.type == undefined ) { options.type = window.location.hostname }
  if ( options.all_friends_invited == undefined ) { options.all_friends_invited = "<div style='padding: 10px; font-size: 1.2em;'>You've already invited all of your friends and they've accepted.</div>" }
  if ( options.invitation_copy == undefined ) { options.invitation_copy = "" }
  if ( options.invitation_choice_url == undefined ) { options.invitation_choice_url = window.location.protocol + '//' + window.location.host + '/' }
  if ( options.invitation_choice_label == undefined ) { options.invitation_choice_label = 'Accept' }
  if ( options.request_action_url == undefined ) { options.request_action_url = window.location.href }
  if ( options.request_action_text == undefined ) { options.request_action_text = options.title }
  if ( options.friend_selector_rows == undefined ) { options.friend_selector_rows = 3 }
  if ( options.friend_selector_email_invite == undefined ) { options.friend_selector_email_invite = 'true' }
  if ( options.friend_selector_bypass == undefined ) { options.friend_selector_bypass = 'cancel' }
  if ( isNaN(options.width) ) { options.width = 600 }
  if ( isNaN(options.height) ) { options.height = 510 }

  var api = FB.Facebook.apiClient
  var sequencer = new FB.BatchSequencer()
  var friends = api.friends_get(null, sequencer)
  var friends_app_users = api.friends_getAppUsers(sequencer)

  sequencer.execute(function() {

    var friend_ids = ''
    try {
      friend_ids = friends.result.sort().join(',')
    }catch(e) {;}

    var exclude_ids = ''
    try {
      exclude_ids = friends_app_users.result.sort().join(',')
    }catch(e) {;}

    var dialog = new FB.UI.FBMLPopupDialog(options.title, '')

    if ( friend_ids.length > 0 && exclude_ids.length > 0 && friend_ids == exclude_ids ) {
      var fbml = ''
      fbml += '<fb:fbml>'
      fbml += options.all_friends_invited
      fbml += '</fb:fbml>'

      dialog.setFBMLContent(fbml)
      dialog.setContentWidth(300)  
      dialog.setContentHeight(70)
    }else {
      var content = ''
      content += options.invitation_copy
      content += "<fb:req-choice url='" + options.invitation_choice_url + "' label='" + options.invitation_choice_label + "' />"

      var fbml = ''
      fbml += '<fb:fbml>'
      fbml += '<fb:request-form type="' + options.type + '" content="' + content + '" invite="true" action="' + options.request_action_url + '" method="post">'
      fbml += '<fb:multi-friend-selector'
      fbml += ' actiontext="' + options.request_action_text + '" '
      fbml += ' showborder="true" '
      fbml += ' rows="' + options.friend_selector_rows + '" '
      fbml += ' exclude_ids="' + exclude_ids + '" '
      fbml += ' bypass="' + options.friend_selector_bypass + '" '
      fbml += ' email_invite="' + options.friend_selector_email_invite + '" '
      fbml += '/>'
      fbml += '</fb:request-form>'
      fbml += '</fb:fbml>'

      dialog.setFBMLContent(fbml)
      dialog.setContentWidth(options.width)  
      dialog.setContentHeight(options.height)
    }
    dialog.show()
  })


}
