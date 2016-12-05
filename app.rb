require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')
require('pg')
require('./lib/list')
require('pry')

DB = PG.connect({:dbname => "to_do"})

get('/') do
  @returned_lists = List.all()
  puts "looking for lists: ", @returned_lists
  erb(:index)
end

get('/new_list') do
  erb(:index)
end

post('/new_list') do
  name = params.fetch('name')
  List.new({:name => name, :id => nil}).save()
  erb(:success)
end

get('/list/:id') do
  id = (params.fetch('id').to_i)
  list = List.find(id)
  @current_list_name = list.first().fetch('name')
  @current_list_id = list.first().fetch('id')
  @current_tasks = Task.find(id)
  erb(:list)
end

post('/tasks-form/:id') do
  description = params.fetch('description')
  due_date = params.fetch('due_date')
  list_id = params.fetch('id').to_i
  Task.new({:description => description, :due_date => due_date, :status_done => 'f', :list_id => list_id}).save()
  erb(:success)
end

# post('/new_task') do
#   description = params.fetch('description')
#   due_date = params.fetch('due_date')
#   task = Task.new({:description => description, :due_date => due_date, :status_done => 'f' })
#   task.save()
#   erb(:success)
# end



#                 tasks
# description|due_date timestamp|list_id|status_done|
# "Mow the Lawn"|1992-10-09|    | 2     |
# "Do math"     |1992-10-09|    | 1     |
#
#                   lists
# name          |id|
# "Homework"|1|
# "Yardwork"|2|
