requires 'perl', '5.008005';
requires 'HTTP::Tiny';
requires 'Try::Tiny';
requires 'JSON', '2.0';
requires 'Moose';

on test => sub {
    requires 'Test::More', '0.88';
};
