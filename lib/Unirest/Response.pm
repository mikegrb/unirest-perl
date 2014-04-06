package Unirest::Response;

use Moose;

use Try::Tiny;
use JSON;

has code     => ( is => 'ro', isa     => 'Int' );
has headers  => ( is => 'ro', isa     => 'ArrayRef' );
has body     => ( is => 'ro', builder => '_build_body', lazy => 1 );
has raw_body => ( is => 'ro', isa     => 'Str' );

sub _build_body {
    my $self = shift;

    my $data;
    try {
        $data = decode_json( $self->raw_body );
    }
    catch {
        return if $_ =~ m/malformed JSON string/;
    };
    return $data;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;

__END__

=encoding utf-8

=head1 NAME

Unirest::Response - Unirest response object

=head1 METHODS

=head2 code

Returns HTTP response code.

=head2 headers

Returns an arrayref of [ [ Header1, Value1 ], [Header2], [Value2] ] .

=head2 body

Returns parsed body of the response.  For example, JSON is decoded.

=head2 raw_body

Returns the raw body of the response.

=head1 AUTHOR

Mike Greb E<lt>michael@thegrebs.comE<gt>

=head1 COPYRIGHT

Copyright 2014- Mike Greb

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Unirest>

=cut
