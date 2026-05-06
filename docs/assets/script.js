window.addEventListener(
    "load",
    () => {
        document.querySelectorAll(".zoom-window").forEach(zoomWindow => {
            const follow = zoomWindow.querySelector(".zoom");
            const img = zoomWindow.querySelector("img");
            
            const syncHeight = () => {
              zoomWindow.style.height = img.clientHeight + "px";
            };
            
            if (img.complete) {
              syncHeight();
            } else {
              img.addEventListener("load", syncHeight);
            }
            
            window.addEventListener("resize", syncHeight);
    
            zoomWindow.addEventListener("mousemove", e => {
              const rect = zoomWindow.getBoundingClientRect();
            
              const x = (e.clientX - rect.left) / rect.width; 
              const y = (e.clientY - rect.top) / rect.height;
            
              follow.style.left = Math.max(-449, Math.min(-51, -500 * x)) + "%";
              follow.style.top = Math.max(-455, Math.min(-51, -500 * y)) + "%";
            });
        });
    },
    false
);
