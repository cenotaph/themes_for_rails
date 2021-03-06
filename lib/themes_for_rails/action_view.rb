# encoding: utf-8
module ThemesForRails
  
  module ActionView

    extend ActiveSupport::Concern

    included do
      include ThemesForRails::CommonMethods
    end

    def current_theme_stylesheet_path(asset)
      base_theme_stylesheet_path(:theme => self.theme_name, :asset => "#{asset}.css")
      #"/themes/#{self.theme_name}/stylesheets/#{asset}.css"
    end
    
    def current_theme_javascript_path(asset)
      base_theme_javascript_path(:theme => self.theme_name, :asset => "#{asset}.js")
      #"/themes/#{self.theme_name}/javascripts/#{asset}.js"
    end

    def current_theme_image_path(asset)
      base_theme_image_path(:theme => self.theme_name, :asset => asset)
      #"/themes/#{self.theme_name}/images/#{asset}"
    end

    def theme_stylesheet_path(asset, new_theme_name = self.theme_name)
      base_theme_stylesheet_path(:theme => new_theme_name, :asset => "#{asset}.css")
    end

    def theme_javascript_path(asset, new_theme_name = self.theme_name)
      base_theme_javascript_path(:theme => new_theme_name, :asset => "#{asset}.js")
    end

    def theme_image_path(asset, new_theme_name = self.theme_name)
      base_theme_image_path(:theme => new_theme_name, :asset => asset)
      #"/themes/#{new_theme_name}/images/#{asset}"
    end
    
    def theme_image_tag(source, options = {})
      image_tag(theme_image_path(source), options)
    end

    def theme_image_submit_tag(source, options = {})
      image_submit_tag(theme_image_path(source), options)
    end

    def theme_javascript_include_tag(*files)
      options = files.extract_options!
      options.merge!({ :type => "text/javascript" })
      files_with_options = files.collect {|file| theme_javascript_path(file) }
      files_with_options += [options]

      javascript_include_tag(*files_with_options)
    end

    def theme_stylesheet_link_tag(*files)
      options = files.extract_options!
      options.merge!({ :type => "text/css" })
      files_with_options = files.collect {|file| theme_stylesheet_path(file) }
      files_with_options += [options]

      stylesheet_link_tag(*files_with_options)
    end
  end
end
