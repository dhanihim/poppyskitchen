class HomeController < ApplicationController
  def index
    @schedules = Schedule.where("dateclose > ?", DateTime.now).order(dateopen: :asc).limit(1)

    @dateopen = "No Preorder"
    @id = 1;
    @schedules.each do |schedule| 
      @dateopen = schedule.dateopen.to_formatted_s(:rfc822)
      @id = schedule.id
    end

    @scheduled_product = ScheduledProduct.where("schedule_id = ?", @id)
  end

  def page1
    @visitor = Visitor.new
  end
end
