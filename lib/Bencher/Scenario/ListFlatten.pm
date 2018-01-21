package Bencher::Scenario::ListFlatten;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark various List::Flatten implementaitons',
    participants => [
        {
            fcall_template => 'List::Flatten::flat(@{<data>})',
            result_is_list => 1,
        },
        {
            fcall_template => 'List::Flatten::XS::flatten(<data>)',
        },
    ],
    datasets => [
        {name => '10_1_1', args => {data=>[1, 2, 3, 4, [5], 6, 7, 8, 9, 10]}},
        {name => '10_10_1', args => {data=>[[1], [2], [3], [4], [5], [6], [7], [8], [9], [10]]}},
        {name => '10_1_10', args => {data=>[1, 2, 3, 4, [5, 2..10], 6, 7, 8, 9, 10]}},
        {name => '10_1_100', args => {data=>[1, 2, 3, 4, [5, 2..100], 6, 7, 8, 9, 10]}},

        {name => '100_1_1', args => {data=>[1..49, [50], 51..100]}},

        {name => '1000_1_1', args => {data=>[1..499, [500], 501..1000]}},
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

In general, from the provided benchmark datasets, I don't see the advantage of
using the XS implementation.
