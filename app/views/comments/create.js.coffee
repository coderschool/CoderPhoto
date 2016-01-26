<% if @comment.persisted? %>
  $("#<%= dom_id @photo %> .comments").html("<%= j render 'photos/photo_comments', photo: @photo %>")
  $("#<%= dom_id @photo %> form.new_comment input:text").val('')
  window.PhotoJS.setupMasonry()
<% else %>
  $("#<%= dom_id @photo %> .comments").append("Error: #{@comment.errors.full_messages.to_sentence}")
<% end %>
