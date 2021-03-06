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
      # 保存に成功した場合
      context 'can save' do
        subject {
          post :create,
          params: params
        }
        it 'count up material' do
          expect{subject}.to change(Material, :count).by(1)
        end
        it 'redirects to materials_path' do
          subject
          expect(response).to redirect_to(materials_path)
        end
      end
      # 保存に失敗した場合
      context 'can not save' do
        let(:invalid_params) {{user_id: user.id, material:attributes_for(:material, name: nil)}}
        subject {
          post :create,
          params: invalid_params
        }
        it 'does not count up' do
          expect{subject}.not_to change(Material, :count)
        end
        it 'redirect to edit_material_path' do
          subject
          expect(response).to redirect_to(new_material_path)
        end
      end
    end
    context 'not log in' do
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
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