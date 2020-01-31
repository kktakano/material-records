require 'rails_helper'

describe MaterialsController do
  # テスト中利用するインスタンスを定義
  let(:user) { create(:user) }
  # describe '#index' do
  #   context 'log in' do
  #     before do
  #       login user
  #       get :index, params: { material_id: material.id }
  #     end
  #   end

  #   context 'not log in' do
      
  #   end
  # end

  describe 'GET #new' do
    context 'log in' do
      before do
        login user
        get :new
      end
      it 'assigns @material' do
        expect(assigns(:material)).to be_a_new(Material)
      end
      it "render the :new template" do
        get :new
        expect(response).to render_template :new
      end    
    end
    context 'not log in' do
      before do
        get :new
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end