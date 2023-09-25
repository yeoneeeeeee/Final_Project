var jb1 = jQuery.noConflict();

jb1(document).ready(function(){
  jb1(".toggle-button").click(function(){
      jb1(this).next(".more-options").slideToggle(250);
  });

  jb1(document).mouseup(function(e){
      var container = jb1(".more-options");
      var buttons = jb1(".toggle-button");
      if (!container.is(e.target) && container.has(e.target).length === 0
          && !buttons.is(e.target) && buttons.has(e.target).length === 0) {
          container.slideUp(250);
      }
  });

  jb1(".modal-toggle-button").click(function(){
      jb1(this).next(".modal-more-options").slideToggle(250);
  });

  jb1(document).mouseup(function(e){
      var container = jb1(".modal-more-options");
      var buttons = jb1(".modal-toggle-button");
      if (!container.is(e.target) && container.has(e.target).length === 0
          && !buttons.is(e.target) && buttons.has(e.target).length === 0) {
          container.slideUp(250);
      }
  });



  var heartSVG =
  '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart  animate__animated animate__rubberBand" viewBox="0 0 16 16">' +
  '    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>' +
  '</svg>';

  var heartFillSVG =
      '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart-fill animate__animated animate__rubberBand" viewBox="0 0 16 16">' +
      '    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>' +
      '</svg>';

  var storeSVG =
      `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
      fill="currentColor" class="bi bi-plus-square animate__animated animate__flipInY"
      viewBox="0 0 16 16">
      <path
          d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
      <path
          d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
      </svg>`;

  var storeFillSVG =
      `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-check-square-fill animate__animated animate__flipInY" viewBox="0 0 16 16">
          <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"/>
      </svg>`;


  jb1(".clickable-svg").click(function() {
      var jb1this = jb1(this);
      var currentHeartSVG = jb1this.find("svg");
      var currentBoxSVG = jb1this.find("svg");
      
      if (currentHeartSVG.hasClass("bi-heart")) {
          currentHeartSVG.replaceWith(heartFillSVG);
      } else if (currentHeartSVG.hasClass("bi-heart-fill")) {
          currentHeartSVG.replaceWith(heartSVG);
      }

      if(currentBoxSVG.hasClass("bi-plus-square")) {
          currentBoxSVG.replaceWith(storeFillSVG);
      } else if(currentBoxSVG.hasClass("bi-check-square-fill")) {
          currentBoxSVG.replaceWith(storeSVG);
      }
  });
  
	
});
	   $(document).ready(function(){
 
        const file1 = jb1("#feedFiles1");
        const file2 = jb1("#feedFiles2");
        const file3 = jb1("#feedFiles3");
        const file4 = jb1("#feedFiles4");
        const file5 = jb1("#feedFiles5");
        const deleteFile1 = jb1("#deleteFiles1");
        const deleteFile2 = jb1("#deleteFiles2");
        const deleteFile3 = jb1("#deleteFiles3");
        const deleteFile4 = jb1("#deleteFiles4");
        const deleteFile5 = jb1("#deleteFiles5");
        file2.css('display','none');
        deleteFile2.css('display','none');
        file3.css('display','none');
        deleteFile3.css('display','none');
        file4.css('display','none');
        deleteFile4.css('display','none');
        file5.css('display','none');
        deleteFile5.css('display','none');
        
        file1.blur(()=>{
            if(file1.val() != ""){
                file2.css('display','block');
                deleteFile2.css('display','block');
            }else{
                file2.val("");
                file2.css('display','none');
                deleteFile2.css('display','none');
                file3.val("");
                file3.css('display','none');
                deleteFile3.css('display','none');
                file4.val("");
                file4.css('display','none');
                deleteFile4.css('display','none');
                file5.val("");
                file5.css('display','none');
                deleteFile5.css('display','none');
            }
        });
        file2.blur(()=>{
            if(file2.val() != ""){
                file3.css('display','block');
                deleteFile3.css('display','block');
            }else{
                file3.val("");
                file3.css('display','none');
                deleteFile3.css('display','none');
                file4.val("");
                file4.css('display','none');
                deleteFile4.css('display','none');
                file5.val("");
                file5.css('display','none');
                deleteFile5.css('display','none');
            }
        });
        file3.blur(()=>{
            if(file3.val() != ""){
                file4.css('display','block');
                deleteFile4.css('display','block');
            }else{
                file4.val("");
                file4.css('display','none');
                deleteFile4.css('display','none');
                file5.val("");
                file5.css('display','none');
                deleteFile5.css('display','none');
            }
        });
        file4.blur(()=>{
            if(file4.val() != ""){
                file5.css('display','block');
                deleteFile5.css('display','block');
            }else{
                file5.val("");
                file5.css('display','none');
                deleteFile5.css('display','none');
            }
        });
        deleteFile1.click(()=>{
            file1.val("");
            file2.val("");
            file2.css('display','none');
            deleteFile2.css('display','none');
            file3.val("");
            file3.css('display','none');
            deleteFile3.css('display','none');
            file4.val("");
            file4.css('display','none');
            deleteFile4.css('display','none');
            file5.val("");
            file5.css('display','none');
            deleteFile5.css('display','none');
        });
        deleteFile2.click(()=>{
            file2.val("");
            file3.val("");
            file3.css('display','none');
            deleteFile3.css('display','none');
            file4.val("");
            file4.css('display','none');
            deleteFile4.css('display','none');
            file5.val("");
            file5.css('display','none');
            deleteFile5.css('display','none');
        });
        deleteFile3.click(()=>{
            file3.val("");
            file4.val("");
            file4.css('display','none');
            deleteFile4.css('display','none');
            file5.val("");
            file5.css('display','none');
            deleteFile5.css('display','none');
        });
        deleteFile4.click(()=>{
            file4.val("");
            file5.val("");
            file5.css('display','none');
            deleteFile5.css('display','none');
        });
        deleteFile1.click(()=>{         
            file5.val("");
        });


  	         });