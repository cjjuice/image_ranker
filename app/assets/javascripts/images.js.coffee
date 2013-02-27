# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.add_image').click ->
    $(this).replaceWith('<form accept-charset="UTF-8" action="/images" class="new_image" id="new_image" method="post">
                           <div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓">
                             <input name="authenticity_token" type="hidden" value="8ma4ir42YpzeffibHPkRYeH5cCZ9nmckbTfohWPm+4k=">
                           </div>
                           <div class="input-append">
                             <div class="field">
    	                         <div class="actions">
    	                           <input class="span3" id="appendInputButton" name="image[image_url]" placeholder="Image link (.jpg/.gif/.png)" size="30" type="text">
                                 <input class="btn" id="submit" name="commit" type="submit" value="Submit">
                               </div>
                             </div>        
                           </div> 
                        </form>')