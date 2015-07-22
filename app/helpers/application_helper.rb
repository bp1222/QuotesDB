module ApplicationHelper
  def get_nav_elements
    nav = [
      {
        label: 'Quotes',
        href: quotes_path,
        css_class: params[:controller] == 'quotes' ? 'active' : ''
      },
      {
        label: 'Users',
        href: has_right?('admin') ? admin_users_path : users_path,
        css_class: (params[:controller] == 'users' && params[:action] != 'register') ? 'active' : ''
      }
    ]

    if has_right?('admin')
      nav.push({
        label: 'Roles',
        href: admin_roles_path,
        css_class: params[:controller] == 'roles' ? 'active' : ''
      })
    end

    return nav
  end

  def get_account_nav_elements
    if authorized?
      nav = [
        {
          label: 'Logout',
          href: logout_path,
          css_class: nil
        }
      ]
    else
      nav = [
        {
          label: 'Login',
          href: login_path,
          css_class: params[:controller] == 'sessions' ? 'active' : ''
        },
        {
          label: 'Register',
          href: register_path,
          css_class: (params[:controller] == 'users' && params[:action] == 'register') ? 'active' : ''
        }
      ]
    end
  end

  def get_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def authorized?
    get_current_user != nil
  end
end
