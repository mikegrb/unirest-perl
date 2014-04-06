use strict;
use Test::More;
use Unirest::Response;

my $response = Unirest::Response->new( raw_body => '{ "urmom": "yes"}' );

isa_ok( $response, 'Unirest::Response');

is_deeply( $response->body, { urmom => 'yes'}, 'body returns properly decoded JSON' );

$response = Unirest::Response->new( raw_body => "jchen's mom is rad");

is($response->body, undef, 'Reponse body undef for non JSON response');

done_testing;
