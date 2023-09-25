 (
    function(){
       const display = document.getElementsByClassName("display-chatting")[0];
       
       if(display != null){
          display.scrollTop = display.scrollHeight;
       }
    }
 )();