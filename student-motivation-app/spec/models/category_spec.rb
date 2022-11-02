require 'rails_helper'

RSpec.describe Category, type: :model do
    let!(:category) do
        Category.create(
            subscribe: false, 
            category_name: "DevOPs",
        )
    end

    describe "#id" do
        it 'has an id' do
            expect(category.id).not_to eq(nil)
        end
    end

    describe "#subscribe" do
        it 'returns the category\s subscription status' do
            expect(category.subscribe).to eq(false)
        end
    end

    describe "#category_name" do
        it 'returns the category\s category name' do
            expect(category.category_name).to eq("DevOPs")
        end
    end
end