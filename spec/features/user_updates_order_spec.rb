require "spec_helper"

feature "user updates their order" do
  let!(:wing_order) do
    WingOrder.create(
      customer_name: "Gene Parmesean",
      city: "Boston",
      state: "MA",
      quantity: 100,
      ranch_dressing: true
    )
  end

  scenario "user updates successfully" do
    visit wing_orders_path

    click_on "Edit"
    expect(page).to have_content "Edit Wing Order"

    choose "50 wings"

    click_on "Place Order"
    expect(page).to have_content "Quantity: 50"
  end
end
