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
        expect(response).to render_template :new
      end    
    end
    context 'not log in' do
      it 'redirects to new_user_session_path' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' do
    let(:params) {{user_id: user.id, material:attributes_for(:material)}}

    context 'log in' do
      before do
        login user
      end
      context 'can save' do
        
      end
      context 'can not save' do
        
      end
    end
    context 'not log in' do
      before do
        login user
      end
    end
  end

  describe 'GET #edit' do
    context 'log in' do
      before do
        login user
      end
      it 'assigns the requested material to @material' do
        material = create(:material, user_id: user.id)
        get :edit, params: {id: material}
        expect(assigns(:material)).to eq material
      end
      it 'render the :new template' do
        material = create(:material, user_id: user.id)
        get :edit, params: {id: material}
        expect(response).to render_template :edit
      end
    end
    context 'not log in' do
      before do
        material = create(:material, user_id: user.id)
        get :edit, params: {id: material}  
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end