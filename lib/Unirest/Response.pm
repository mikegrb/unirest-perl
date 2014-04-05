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
