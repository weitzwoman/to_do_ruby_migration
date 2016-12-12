class Task < ActiveRecord::Base
  belongs_to(:lists)
  scope(:not_done, -> do
    where({:done => false})
  end)
end
