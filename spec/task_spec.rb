require('rspec')
require('pg')
require('task')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do

  describe('#description') do
    it("lets you give it a description") do
      test_task = Task.new({:description => 'scrub the zebra', :due_date => '2017-01-09 00:00:00', :list_id => 1, :status_done => 't'})
      test_task.save()
      expect(test_task.description()).to(eq("scrub the zebra"))
    end
  end

  describe('#due_date') do
    it("lets you give it a due_date") do
      test_task = Task.new({:description => 'Get a job by', :due_date => '2017-01-09 00:00:00', :list_id => 1, :status_done => 't'})
      test_task.save()
      expect(test_task.due_date()).to(eq('2017-01-09 00:00:00'))
    end
  end

  describe('#status_done') do
    it('returns if task is completed') do
      test_task = Task.new({:description => "learn SQL", :due_date => '2017-01-10 00:00:00', :list_id => 1, :status_done => 't'})
      test_task.save()
      expect(test_task.status_done()).to(eq('t'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a task to the array of saved tasks') do
      test_task = Task.new({:description => "wash the whale", :due_date => '2017-01-09 00:00:00', :list_id => 1, :status_done => 't'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.sort_tasks_by_date_asc') do
    it ('it sorts tasks by due date in ascending order') do
      task1 = Task.new({:description => "learn SQL", :due_date => '2017-01-10 00:00:00', :list_id => 1, :status_done => 't'})
      task2 = Task.new({:description => "learn SQL", :due_date => '2017-01-09 00:00:00', :list_id => 1, :status_done => 't'})
      task1.save()
      task2.save()
      Task.sort_tasks_by_date_asc()
      expect(Task.all()).to(eq([task2, task1]))
    end
  end

  # describe('.clear') do
  #   it('empties out all of the saved tasks') do
  #     Task.new({:description => "pay the bills"}).save()
  #     Task.clear()
  #     expect(Task.all()).to(eq([]))
  #   end
  # end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :due_date => '2017-01-09', :list_id => 1, :status_done => 't'})
      task2 = Task.new({:description => "learn SQL", :due_date => '2017-01-09', :list_id => 1, :status_done => 't'})
      expect(task1).to(eq(task2))
    end
  end

end
