#!/usr/bin/env perl

use Test2::V0;
plan 4;

use Types::Music;

can_ok 'Types::Music', [
    map { ( $_, "is_$_", "assert_$_", "to_$_" ) } qw(
        Named_Note_Octave
    )
], 'type functions';

no Types::Music;
use Types::Music -all;

imported_ok
    map { ( $_, "is_$_", "assert_$_", "to_$_" ) } qw(
        Named_Note_Octave
    );

ok is_Named_Note_Octave('C4'), 'is Named_Note_Octave';
is 'C4', assert_Named_Note_Octave('C4'), 'assert Named_Note_Octave';
