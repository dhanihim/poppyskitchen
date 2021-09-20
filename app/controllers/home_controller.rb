class HomeController < ApplicationController
  def index
    @schedules = Schedule.where("dateopen <= ? AND dateclose >= ?", DateTime.now, DateTime.now).order(dateopen: :asc).limit(1)

    @dateopen = "No Preorder"
    @id = -1;
    @schedules.each do |schedule| 
      @dateopen = schedule.datedelivery.to_formatted_s(:rfc822)
      @id = schedule.id
    end

    @scheduled_product = ScheduledProduct.where("schedule_id = ?", @id)
  end

  def register
    @visitor = Visitor.new
  end
end
