require 'sinatra'
require_relative 'models/project'

get '/api/projects' do
  Project.all.to_json
end

get '/api/projects/:id' do |id|
  project = Project.find_by_id(id)
  if project.blank?
    halt 404
  else
    project_with_tasks = JSON.parse(project.to_json)
    project_with_tasks['tasks'] = JSON.parse(project.tasks.to_json)
    project_with_tasks.to_json
  end
end

post '/api/projects' do
  project = Project.create(name: params[:name], status: params[:status])
  if project.id.blank?
    halt 404
  else
    [201, project.to_json]
  end
end

put '/api/projects/:id' do |id|
  project = Project.find_by_id(id)
  if project.blank?
    halt 404
  else
    project.update(status: params[:status])
    [200, project.to_json]
  end
end

delete '/api/projects/:id' do |id|
  project = Project.find_by_id(id)
  if project.blank?
    halt 404
  else
    Project.destroy(id)
    status 200
  end
end
