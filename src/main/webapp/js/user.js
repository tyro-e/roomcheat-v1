$(window).load(function (){
  percentageComplete();
});

function percentageComplete(){
  var bar = new ProgressBar.Line(percentage, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 500,
    color: '#ffffff',
    trailColor: '#eee',
    trailWidth: 1.5,
    svgStyle: {width: '100%', height: '100%'},
    text: {
      style: {
        // Text color.
        // Default: same as stroke color (options.color)
        color: '#999',
        position: 'absolute',
        right: '0',
        top: '30px',
        padding: 0,
        margin: 0,
        transform: null
      },
      autoStyleContainer: false
    },
    from: {color: '#ffffff'},
    to: {color: '#ED6A5A'},
    step: (state, bar) => {
      bar.setText(Math.round(bar.value() * 100) + ' %');
    }
  });

  var button1 = $('#scroll-one');
  var button2 = $('#scroll-two');
  var button2_2 = $('.scroll-two')
  var button3 = $('#scroll-three');

  button1.click(function() {
    bar.animate(0.0);  
  });

  button2.click(function() {
    bar.animate(0.5);  
  });

  button2_2.click(function() {
    bar.animate(0.5);  
  });  

  button3.click(function() {
    bar.animate(1.0);  
  });

}