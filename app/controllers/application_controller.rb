class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes 
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end
  get '/bakeries/:id' do
   bake=Bakery.find(params[:id])
   bake.to_json(include: :baked_goods)
  end
  get '/baked_goods/by_price' do
      baked=BakedGood.all.order(price: :desc)
      baked.to_json
    end
    get '/baked_goods/most_expensive' do
       baked=BakedGood.all.order(price: :desc).limit(1)
       baked.as_json
      end
end
