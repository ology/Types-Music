#!/usr/bin/env perl

use Test2::V0;
plan 14;

use Types::Music;

can_ok 'Types::Music', [
    map { ( $_, "is_$_", "assert_$_", "to_$_" ) } qw(
        Octave
        Named_Note_Octave
    )
], 'type functions';

no Types::Music;
use Types::Music -all;

imported_ok
    map { ( $_, "is_$_", "assert_$_", "to_$_" ) } qw(
        Octave
        Named_Note_Octave
    );

ok is_BPM(120), 'is_BPM';
is 120, assert_BPM(120), 'assert_BPM';

ok is_Octave(4), 'is_Octave';
is 4, assert_Octave(4), 'assert_Octave';

ok is_Key('C#'), 'is_Key';
is 'C#', assert_Key('C#'), 'assert_Key';

ok is_Named_Note('Bb'), 'is_Named_Note';
is 'Bb', assert_Named_Note('Bb'), 'assert_Named_Note';

ok is_Named_Note_Octave('C4'), 'is_Named_Note_Octave';
is 'C4', assert_Named_Note_Octave('C4'), 'assert_Named_Note_Octave';

ok is_Mode('ionian'), 'is_Mode';
is 'ionian', assert_Mode('ionian'), 'assert_Mode';
