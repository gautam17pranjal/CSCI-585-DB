var canvas = document.getElementById('canvas');

if(canvas.getContext){
    var ctx = canvas.getContext('2d');
    ctx.beginPath();
    var R=8, r=1, a=4;
    var x0=R+r-a, y0=0;
    ctx.moveTo(150+10*x0, 150+10*y0)
    
    var cos=Math.cos, sin=Math.sin, pi=Math.PI, nRev=16;    
    var arr = ""

    for(var t=0.0;t<(pi*nRev);t+= 0.01){
        var x=((R+r)*cos((r/R)*t)-a*cos((1+r/R)*t));
        var y=((R+r)*sin((r/R)*t)-a*sin((1+r/R)*t));
        yc = -118.28544579547469+(y/10000);  
        xc = 34.0205742794349+(x/10000); 
        arr += yc+","+xc+"\n";
    }
    ctx.stroke();
}

// tommy trojan: -118.28544579547469, 34.0205742794349
