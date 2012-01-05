use inc::Module::Install;
name 'DateTimeFactory';
all_from 'lib/DateTimeFactory.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
