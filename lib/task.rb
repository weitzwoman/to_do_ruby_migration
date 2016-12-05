class Task
  attr_reader(:description, :due_date, :list_id, :status_done)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @due_date = attributes.fetch(:due_date)
    @list_id = attributes.fetch(:list_id)
    @status_done = attributes.fetch(:status_done)
  end

  define_singleton_method(:all) do
    # PG gem runs database command in the paranthesis
      # Returns rows into an array
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    # Empty array to store the descriptions
    tasks = []
    # Iterate through the returned_tasks array
    returned_tasks.each() do |task|
      # Grabs description value from each array item
      description = task.fetch("description")
      due_date = task.fetch("due_date")
      list_id = task.fetch("list_id").to_i()
      status_done = task.fetch("status_done")
      # Creates a new Task object with the given description
        # Pushes the new Task object into the tasks array
      tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => list_id, :status_done => status_done}))
    end
    # Returns the task array
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, due_date, list_id, status_done) VALUES ('#{@description}', '#{@due_date}', #{@list_id}, '#{@status_done}');")
  end

  # Order by does not permanently change the SQL DB
  define_singleton_method(:sort_tasks_by_date_asc) do |task_key|
    # Nevermind: Pass in all parameters (separated by commas) that you want columns returned for
    DB.exec("SELECT * FROM tasks WHERE list_id = '#{task_key}' ORDER BY due_date ASC;")
  end

  define_singleton_method(:find) do |task_key|
    task_finder = DB.exec("SELECT * FROM tasks WHERE list_id = '#{task_key}';")
    task_finder
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id())).&(self.due_date().==(another_task.due_date()).&(self.status_done().==(another_task.status_done())))
  end

end
