ECTS::Application.routes.draw do

  devise_for :users, :path => "", :path_names => { :sign_in => "login", :sign_out => "logout", :password => "user/passwd", :registration => "user/account" }
  root "root#index"
  
  scope module: 'course' do
    resources :masters, :as => "course", path: '/course' do
      resources :events, :as => "event", :only => [:index, :new]
    end
    resources :events, path: '/course_event', :except => [:index, :new] do
      resources :event_candidates, :as => "candidate", path: '/candidate', :only => [:index, :new]
    end
    resources :event_candidates, path: '/course_event_candidates', :only => [:create, :destroy, :show, :edit, :update]
  end

  scope module: 'person' do
    resources :masters, :as => "people", path: '/people'
    namespace 'candidate' do
      get 'search', action: 'search'
    end
  end

end
