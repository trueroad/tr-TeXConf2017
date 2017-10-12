upper = \relative
{
  \clef treble
  \key c \major
  \time 4/4
  \tempo "Allegro" 4 = 96

  r16_\mf c'( d e  f d e c g'8) c b^\prall c |
  d16 g,( a b c a b g d'8) g f^\prall g |
  e16 a g f e g f a g f e d c e d f |
}

lower = \relative
{
  \clef bass
  \key c \major
  \time 4/4

  r2 r16 c( d e f d e c |
  g'8) g, r4 r16 g'( a b c a b g |
  c8) b( c d e) g,( a b) |
}

\score
{
  \new PianoStaff
  <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout {}
  %\midi {}
}
