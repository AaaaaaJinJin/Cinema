            window.onload = function () {
            	playAuto();
            }


            var auto = setInterval("playNext()", 1000); clearInterval(auto);
            function playAuto() {
                var play = document.getElementById('play');
                var pause = document.getElementById('pause');

                if (this.id == 'pause') {
                    play.className = 'showButton';
                    pause.className = 'inactive';
                    clearInterval(auto);
                }
                
                if (this.id == 'play') {
                    play.className = 'inactive';
                    pause.className = 'showButton';
                    auto = setInterval("playNext()", 1000);
                }
            }

            function playPre() {
                var currentPlay = document.querySelector('.active');
                var prePlay = currentPlay.previousSibling.previousSibling;
                var currentDot = document.querySelector('.active-dot');
                var preDot = currentDot.previousSibling.previousSibling;

                if (currentPlay.id == 'firstad') {
                    prePlay = document.getElementById('lastad');
                    preDot = document.getElementById('lastdot');
                }

                currentPlay.className = "inactive";
                prePlay.className = "active";

                currentDot.className = "dot";
                preDot.className = "dot active-dot";
            }

            function playNext() {
                var currentPlay = document.querySelector('.active');
                var nextPlay = currentPlay.nextSibling.nextSibling;
                var currentDot = document.querySelector('.active-dot');
                var nextDot = currentDot.nextSibling.nextSibling;
  
                if (currentPlay.id == 'lastad') {
                    nextPlay = document.getElementById('firstad');
                    nextDot = document.getElementById('firstdot');
                }

                currentPlay.className = "inactive";
                nextPlay.className = "active";

                currentDot.className = "dot";
                nextDot.className = "dot active-dot";
            }
