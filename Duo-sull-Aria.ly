\version "2.18.0"
#(set-global-staff-size 18)
#(set-default-paper-size "a4")

tr = \trill

\header {
    title = "Duo sull Aria"
    subtitle = "Extrait de \"Les noces de Figaro\""
    composer = \markup \bold \center-column { "W.A.Mozart (1756 - 1791)" }
    meter = \markup { \bold \fontsize #4 "N° 21 - Duettino"   }
    instrument = "Fagotto I"
    %\vspace = #2
    tagline = \markup { \fontsize # -2 "Partition gravée avec LilyPond, un logiciel gratuit et libre (http://lilypond.org)"}

}

date = #(strftime "%d %m %y" (localtime (current-time)))

\paper {
	oddFooterMarkup = \markup {\fill-line {
       \column { \fontsize # 0 { \fromproperty #'header:title }}
       \column { \fromproperty #'header:tagline }
       \column { \line {JJG le \date }}
       } }

last-bottom-spacing = #'((basic-distance . 4)
			(padding . 14) % distance à partir du bas de page
			(stretchability .1))
	ragged-last-bottom = ##f %pour justifier les pages
	ragged-bottom=##f
}
resetBarnum = \context Score \applyContext % pour la numérotation des mesures
  #(set-bar-number-visibility 3)

Duettino = \relative c' {
         \set Score.skipBars = ##t
   %     \set Staff.printKeyCancellation = ##t  %(barre horizontale pour les multi-mesures)

         \set Staff.midiInstrument = "bassoon"
         \set Staff.printKeyCancellation = ##f
         \set baseMoment =#(ly:make-moment 1 4)
         %\set Timing.baseMoment = #(ly:make-moment 1 4)
  \override Staff.VerticalAxisGroup.minimum-Y-extent = #'(-6 . 6)
  \override TextScript.padding = #2.0
  \override MultiMeasureRest.expand-limit = 1

         \time 6/8
         \key bes \major
         \clef bass
         \tempo "Allegretto"

         bes4.\p (c) | d8 (bes f'es c a) |bes d bes f4. | R2.*3 | c'8 (es c) f,4. |
         f'8 (d f) d4. | c8 r r bes r r |
%10
    a4 r8 r4 r8 | R2. *3 |  g4.~ g8 (a bes) | c (f a,) bes r r | a r r g r r |
    f f f f (g a) | bes4 r8 r4 r8  | R2.*2 |
%21
    r4 r8  d (es e) | f4.~ f8 (d bes) | es (g es d bes d) | c8 r r bes r r |
    a r r r c (d) | es4.~ es8 (f g) | f4 (d8) c (es g) |
%28
    f8 (d bes) f (g a) | bes4 r8 r4 r8 | R2. | bes4. (c) | bes (a) |
    bes8 bes, (d f) bes-. d-. | R2.*3 | bes4. (c) | d8 (bes f' es c a) |
%39
    bes8 (d bes) f4. | R2.*3 | r4 r8 c'4. ( |  bes a) | bes4 r8 r4 r8 |
    R2. | bes4. (c | bes a | bes c) | bes2. ( | bes8) r r r4 r8 |
%52
    R2. | r8 bes bes bes4.~ | bes (es8) r r | R2. | f2.~ f~

    f~ f~ f8 r r r4 r8 |
    r4 r8 f4.\fermata ( \bar "||" bes,8) r r
    \bar "||"

}







\score { \header  { piece = "" }
  \new Voice <<
     \include "/commun/améliorations.ly"
    \Duettino >>
  \layout {\set restNumberThreshold = #0
  %%- écrire le nom de la gamme

  \override SpacingSpanner #'common-shortest-duration
= #(ly:make-moment 1 16)
}
   \midi { }

}




