#!/usr/bin/env perl

use Test2::V0;
plan 10;

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

ok is_Octave(4), 'is Octave';
is 4, assert_Octave(4), 'assert Octave';

ok is_Key('C#'), 'is Key';
is 'C#', assert_Key('C#'), 'assert Key';

ok is_Named_Note('Bb'), 'is Named_Note';
is 'Bb', assert_Named_Note('Bb'), 'assert Named_Note';

ok is_Named_Note_Octave('C4'), 'is Named_Note_Octave';
is 'C4', assert_Named_Note_Octave('C4'), 'assert Named_Note_Octave';
