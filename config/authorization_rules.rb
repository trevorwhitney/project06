authorization do
  role :guest do
    has_permission_on :users, :to => :index
  end

  role :admin do
    has_permission_on [:users, :roles], :to => [:index, :show, :edit, :create,
      :update, :destroy]
  end

  role :member do
    has_permission_on :users, :to => :index
  end
end