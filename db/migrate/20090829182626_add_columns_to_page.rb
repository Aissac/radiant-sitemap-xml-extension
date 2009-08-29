class AddColumnsToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :sitemap, :boolean
    add_column :pages, :change_frequency, :string
    add_column :pages, :priority, :string
    
    Page.reset_column_information
    Page.all.each do |page|
      page.update_attributes({:sitemap => true, :change_frequency => "weekly", :priority => "0.5"})
    end
  end

  def self.down
    remove_column :pages, :priority
    remove_column :pages, :change_frequency
    remove_column :pages, :sitemap
  end
end