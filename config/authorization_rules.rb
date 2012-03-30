authorization do
  role :guest do
  end

  role :administrator do
    has_permission_on [:admin_users, :roles], 
      :to => [:index, :show, :edit, :create, :update, :destroy, :new]
  end

  role :member do
    has_permission_on :members_games,
      :to => [:index, :show, :edit, :create, :update, :destroy, :new]
    has_permission_on :members_users,
      :to => [:show, :edit, :update]
  end

end