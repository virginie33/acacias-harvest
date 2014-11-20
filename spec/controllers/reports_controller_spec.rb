require 'rails_helper'

RSpec.describe "Edit a report", :type => :routing do
  it "routes /reports/2/edit to reports#show " do
    expect(:get => "/reports/2/edit").to route_to(
      :action=>"edit",
      :controller=>"reports",
      :id=>"2"
    )
  end
end
