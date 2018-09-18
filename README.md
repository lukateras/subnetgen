# subnetgen

Tool to generate IPv4 and IPv6 subnetworks.

Rationale is to make sure networks are composable, allowing to use more than
one network while keeping every peer addressable.

IPv6 subnetworks are [RFC 4193][] ULA conformant.

[RFC 4193]: https://tools.ietf.org/html/rfc4193

Randomness is taken from `getentropy(3)`. At the moment of writing,
this API is only natively supported in Fuchsia, Linux and OpenBSD.

| Network | Flag | N, 50% collision chance |     Network capacity |
| ------- | ---- | ----------------------- | -------------------- |
| IPv4    | `-4` |                     300 |                  254 |
| IPv6    | `-6` |               1 230 000 | more than septillion |

As you can see, generated IPv4 networks provide very limited capacity. You can
trade some uniqueness for more peers by decrementing CIDR prefix: refer to
[CIDR.xyz](https://cidr.xyz).

Flags are processed in order and can be repeated. For example, `subnetgen -44664`
will print two IPv4 subnets, then two IPv6 subnets, and then one more IPv4 subnet,
in that order, each on separate line.

If you want to calculate chance of collision, refer to [birthday problem][].

[birthday problem]: https://en.wikipedia.org/wiki/Birthday_problem
