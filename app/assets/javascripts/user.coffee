#jQuery ->
#  $('#user_tag_list').tokenInput '/skills.json' 
#  theme: 'facebook'
#  prePopulate: $('#user_skill_list').data('load')
#  propertyToSearch: 'title'
#  noResultsText:     "No results, needs to be created."


$ ->
  $("#user_skill_list").tokenInput "/skills.json",
    prePopulate: $("#user_skill_list").data("load")
    preventDuplicates: true
    crossDomain: false
    propertyToSearch: 'title'
    theme: "facebook"

  
