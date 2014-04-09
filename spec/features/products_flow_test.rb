require 'spec_helper'

feature "ProductsFlows" do
    include AuthenticationHelpers

    before(:each) do
        @user = FactoryGirl.create(:user)
        @product = FactoryGirl.create(:product)
        login @user
    end

    scenario "listing products" do
        visit mechanize_store.products_path

        page.should have_content(@product.name)
        page.should have_content(@product.price)
        page.should have_content(@product.width)
        page.should have_content(@product.height)
        page.should have_content(@product.length)
    end

    scenario "creating a product" do
        visit mechanize_store.products_path

        click_link I18n.t(:new_product)

        fill_in I18n.t(:name, scope: "activerecord.attributes.product"), with: "Product Name"
        fill_in I18n.t(:price, scope: "activerecord.attributes.product"), with: 1.0
        fill_in I18n.t(:short_description, scope: "activerecord.attributes.product"), with: "Product short description"
        fill_in I18n.t(:description, scope: "activerecord.attributes.product"), with: "Product description"
        fill_in I18n.t(:weight, scope: "activerecord.attributes.product"), with: 5.0
        fill_in I18n.t(:height, scope: "activerecord.attributes.product"), with: 1.0
        fill_in I18n.t(:length, scope: "activerecord.attributes.product"), with: 1.0

        click_button I18n.t(:create, model: I18n.t(:product, scope: "activerecord.models"), scope: "helpers.submit")

        page.should have_content("Product Name")
        page.should have_content("1.0")
        page.should have_content("Product short description")
        page.should have_content("Product description")
        page.should have_content(5.0)
        page.should have_content(1.0)
        page.should have_content(1.0)
    end

    scenario "editing a product" do
        visit mechanize_store.products_path

        click_link I18n.t(:edit)

        fill_in I18n.t(:name, scope: "activerecord.attributes.product"), with: "Another Product Name"

        click_button I18n.t(:update, model: I18n.t(:product, scope: "activerecord.models"), scope: "helpers.submit")

        page.should have_content("Another Product Name")
    end

    scenario "removing a product" do
        # page.driver.accept_js_confirms!

        visit mechanize_store.products_path

        click_link I18n.t(:remove)

        page.should have_content(I18n.t(:deleted, model: I18n.t(:product, scope: "activerecord.models")))
    end

end
