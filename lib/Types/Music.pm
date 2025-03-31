package Types::Music;

# ABSTRACT: Type Library for Music Programming

our $AUTHORITY = 'cpan:GENE';

our $VERSION = '0.0100';

use 5.016;
use strict;
use warnings;

use Types::Standard qw(StrMatch);

use Type::Library 2.000000
    -extends => [qw(
        Types::Common::Numeric
    )],
    -declare => qw(
        Octave
        Key
        Named_Note
        Named_Note_Octave
    );
use Type::Utils 2.000000 -all;

declare Octave,
    as PositiveOrZeroNum;

declare Key,
    as StrMatch[ qr/^[A-G][#b]?$/ ];

declare Named_Note,
    as StrMatch[ qr/^[A-G][#b]?$/ ];

declare Named_Note_Octave,
    as StrMatch[ qr/^[A-G][#b]?\d$/ ];

1;

__END__

=encoding UTF-8

=head1 SYNOPSIS

    use Moo;
    use Types::Music -all;

    has named_note => (
        is      => 'ro',
        isa     => Named_Note_Octave,
        default => 'C4',
    );

=head1 DESCRIPTION

This is a type constraint library for developing music software.

=head1 USAGE

=over

=item C<use Types::Music qw(:types);>

Exports all types by name.

=item C<use Types::Music qw(:is);>

Exports all C<is_>I<TypeName> functions.

=item C<use Types::Music qw(:assert);>

Exports all C<assert_>I<TypeName> functions.

=item C<use Types::Music qw(:to);>

Exports all C<to_>I<TypeName> functions.

=item C<use Types::Music qw(+>I<TypeName>C<);>

Exports I<TypeName> and all related functions.

=item C<use Types::Music qw(:all);>

Exports everything.

=back

=head1 TYPES

=head2 Octave

A numeric octave.

=head2 Named_Note_Octave

A named note with octave, like C<C4>, C<C#5>, C<Bb2>, etc.

=head1 FUNCTIONS

=head2 is_Octave

Returns true if the passed value can be used as an L</Octave>.

=head2 assert_Octave

Returns the passed value if and only if it can be used as an
L</Octave>, otherwise an exception is thrown.

=head2 is_Named_Note_Octave

Returns true if the passed value can be used as a L</Named_Note_Octave>.

=head2 assert_Named_Note_Octave

Returns the passed value if and only if it can be used as a
L</Named_Note_Octave>, otherwise an exception is thrown.

=head1 SEE ALSO

L<Exporter::Tiny>

=cut
