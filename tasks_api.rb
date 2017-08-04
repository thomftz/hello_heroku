require 'sinatra'
require_relative 'models/task'

get '/api/tasks' do
  status = params[:status]
  if status == 'true'
    tasks = Task.where('status = true')
  elsif status == 'false'
    tasks = Task.where('status = false')
  else
    tasks = Task.all
  end

  priority = params[:priority]
  unless priority.blank?
    tasks = tasks.where("priority = #{priority}")
  end
  tasks.order(priority: :asc).to_json
end

get '/api/tasks/:id' do |id|
  task = Task.find_by_id(id)
  if task.blank?
    halt 404
  end
  task.to_json
end

post '/api/tasks' do
  task = Task.create(params)
  if task.id.blank?
    halt 404
  end
  [201, task.to_json]
end

patch '/api/tasks/:id/:priority/:status' do |id, priority, status|
  task = Task.find_by_id(id)
  if task.blank?
    status 404
  end
  task.update(priority: params[:priority], status: params[:status])
  task.to_json
end

put '/api/tasks/:id' do |id|
  task = Task.find_by_id(id)
  if task.blank?
    status 404
  end

  params.delete('splat')
  params.delete('splat')

  task.update(params)
  [200, task.to_json]
end

delete '/api/tasks/:id' do |id|
  task = Task.find_by_id(id)
  if task.blank?
    halt 404
  end
  Task.destroy(id)
  status 200
end
