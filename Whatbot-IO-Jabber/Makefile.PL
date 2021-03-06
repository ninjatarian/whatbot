use inc::Module::Install;

# Define metadata
name     'Whatbot-IO-Jabber';
all_from 'lib/Whatbot/IO/Jabber.pm';
author   'Brian Phillips <bphillips@cpan.org>';
license  'perl';

# Specific dependencies
requires      'Whatbot'              => 0.2;
requires      'Moose'                => 2.04;
requires      'namespace::autoclean' => 0;
requires      'Moops'                => 0.034;
requires      'MooX::HandlesVia'     => 0;
requires      'AnyEvent::XMPP'       => 0;
requires      'XML::Twig'            => 0;
test_requires 'Test::More'           => 0;

WriteAll;
