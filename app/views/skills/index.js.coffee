if $('#mastery_skill_id').length > 0
  skill_selector = $('#mastery_skill_id')
else
  skill_selector = $('#skills')

skill_selector.empty()
  .append("<%= j(render partial: @skills) %>")
