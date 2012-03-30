authorization do
  role :guest do
  end

  role :administrator do
    has_permission_on [:admin_users, :roles], :to => [:index, :show, :edit, :create,
      :update, :destroy]
  end

  role :member do
    has_permission_on :admin_users, :to => :index
  end
end