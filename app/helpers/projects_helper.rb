module ProjectsHelper
  def collaborator_list(project)
    users = project.collaborators + [project.user]
    lis = users.map{|user| content_tag(:li, user.name)}.join.html_safe
    content_tag(:ul, lis, :class => "collaborators") 
  end
end
