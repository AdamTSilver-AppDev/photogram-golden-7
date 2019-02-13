class PicturesController < ApplicationController
    def index
       @photo_list = Photo.all
       
       render("pictemplates/all_photos.html.erb") 
    end
    def new_form
        
        render("pictemplates/new_photo.html.erb")
    end
    def create_row
        p = Photo.new
        
        p.source = params.fetch("the_source")
        p.caption = params.fetch("the_caption")
        
        p.save
        
        @the_new_count = Photo.count
        
        redirect_to("https://photogram-golden-7-silver0601.c9users.io/photos")
    end    
    def show_details
        the_id = params.fetch("an_id_number")
        @the_photo = Photo.find(the_id)
    
        render("pictemplates/photo_details.html.erb")
    end   
    def edit_form
        @the_id = params.fetch("some_id_number")
        @the_entry = Photo.find(@the_id)
        @the_source = @the_entry.source
        @the_caption = @the_entry.caption
        
        render("pictemplates/photo_edit.html.erb")
    end
    def update_row
        the_id = params.fetch("the_id_number")
        p = Photo.find(the_id)
        
        p.source = params.fetch("the_url")
        p.caption = params.fetch("the_caption")
        
        p.save
        
        redirect_to("https://photogram-golden-7-silver0601.c9users.io/photos/"+ the_id)
    end    
    def destroy_row
        the_id = params.fetch("bye_id_number")
        the_photo = Photo.find(the_id)
        
        the_photo.destroy
            
        redirect_to("https://photogram-golden-7-silver0601.c9users.io/photos")
    end
end