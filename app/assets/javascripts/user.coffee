$ ->
  $("#user_skill_tokens").tokenInput "/skills.json",
    prePopulate: $("#user_skill_tokens").data("load")
    preventDuplicates: true
    crossDomain: false
    tokenValue: 'name'
    theme: "facebook"
