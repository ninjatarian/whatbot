use inc::Module::Install;

# Define metadata
name     'Whatbot-Command-Bitcoin';
all_from 'lib/Whatbot/Command/Bitcoin.pm';
author   'Nicholas Melnick <nick@abstractwankery.com>';
license  'perl';

# Specific dependencies
requires      'Whatbot'              => 0.2;
requires      'Moose'                => 2.04;
requires      'namespace::autoclean' => 0;
requires      'JSON'                 => 0;
test_requires 'Test::More'           => 0;

WriteAll;
