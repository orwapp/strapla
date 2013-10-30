$ ->
  $("#user_skill_list").tokenInput "/skills.json",
    prePopulate: $("#user_skill_list").data("load")
    preventDuplicates: true
    crossDomain: false
    tokenValue: 'name'
    theme: "facebook"
