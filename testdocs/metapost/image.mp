% Example from: http://tex.loria.fr/prod-graph/zoonekynd/metapost/metapost.html
beginfig(0)
  pair A, B, C;
  A:=(0,0); B:=(1cm,0); C:=(0,1cm);
  draw A--B--C--cycle;
  label.bot(btex $1$ etex, 1/2[A,B]);
  label.lft(btex $1$ etex, 1/2[A,C]);
  label.urt(btex $\sqrt 2$ etex, 1/2[B,C]);
endfig;
bye;

