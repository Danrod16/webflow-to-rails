require_relative 'views/command_line_view'

class FilesSetup
    def initialize
        @view = CommandLineView.new
    end

    def call
        folder = @view.ask_for_folder_name
        add_html(folder)
    end

    def add_html(folder)
        if Kernel.const_defined? 'Rails'
            html = File.open(File.join(Rails.root, folder, 'index.html'))
        else
            raise 'I need Rails to run!'
        end
        p html
        new_html = File.rename(html, "home.html.erb")
        p new_html
        system "mv #{Rails.root}/app/webflow-import/#{folder}/#{new_html} #{Rails.root}/app/views/pages"   
     end

     def add_css
     end
end

p FilesSetup.new.call