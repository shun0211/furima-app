require 'rails_helper'

describe ItemsController do

  describe 'GET #new' do
    it "new.html.erbに遷移すること" do
      # 擬似的にnewアクションを動かすリクエストを行うコード
      get :new
      # response：リクエストが行われた後の遷移先のビューの情報を持つインスタンス
      # render_templateマッチャ：引数にシンボル型でアクション名を取り、引数で指定したアクションががリクエストされたときに自動的に遷移するビューを返す
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it "index.html.erbに遷移すること" do
      # 擬似的にcreateアクションを動かすリクエストを行うコード
      item = build(:item)
      # carrierwaveを使った画像のテストにはRack::Test::UploadedFile.new()の記述が必要
      post :create, params: {item: {id: item, product_name: item.product_name, product_information: item.product_information, price: item.price, product_status: item.product_status, product_condition: item.product_condition, shipping_charge: item.shipping_charge, days_of_ship: item.days_of_ship, prefecture_id: item.prefecture_id, product_images_attributes:{"0": {image:  Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/ゴリラ.jpg") } }}}
      expect(response).to redirect_to(root_path)
    end
  end
end