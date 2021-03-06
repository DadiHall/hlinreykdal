ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    section 'Recent Orders' do
        table_for Order.order('created_at DESC').limit(10) do
            column :name
            column :total_price_usd do |order|
                number_to_currency(order.total_price_usd, :unit => "€ " , :precision => 0) 
            end
                column :total_price_isl do |order|
                number_to_currency(order.total_price_isl, :unit => "ISK " , :precision => 0)
            end
        
        column :created_at do |order|
            time_ago_in_words order.created_at
        end   
      end
      strong {link_to 'View All Orders', admin_orders_path}
    end
  end # content
end
