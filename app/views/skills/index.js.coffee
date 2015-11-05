$('#mastery_skill_id').empty()
  .append("<%= j(render partial: @skills) %>")
