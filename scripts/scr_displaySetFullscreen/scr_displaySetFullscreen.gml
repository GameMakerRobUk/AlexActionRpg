function scr_displaySetFullscreen(){
    if (fullScreen = false) {
        window_set_fullscreen(true);
        fullScreen = true;
    }
    else {
        window_set_fullscreen(false);
        fullScreen = false;
    } 
}
