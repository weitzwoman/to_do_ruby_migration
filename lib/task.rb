class Task
  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
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
      list_id = task.fetch("list_id").to_i()
      # Creates a new Task object with the given description
        # Pushes the new Task object into the tasks array
      tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
    # Returns the task array
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id});")
  end

  # define_singleton_method(:clear) do
  #   @@all_tasks = []
  # end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
  end

end
