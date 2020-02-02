require 'rails_helper'

describe MaterialsController do
  # テスト中利用するインスタンスを定義
  let(:user) { create(:user) }
  describe 'GET #index' do
    context 'log in' do
      before do
        login user
        get :index
      end
      it 'populates an array of materials ordered by created_at DESC' do
        materials = create_list(:material, 5, user_id: user.id)
        get :index
        expect(assigns(:materials)).to match(materials.sort{ |a, b| b.created_at <=> a.created_at })
      end
      it 'render the :index template' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

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