# Mesh-Net Switcher

# Idea:
We like to separate our mesh-network in order to keep the batman-traffic small.
First we separate our net-segments on the Gateways. Therefore every nodes fastd key is stored on our gateways in the net-segment we want the node to run in.
Our policy is so that we have hostnames with leading postcode. We think it is possible to take the first 3 numbers to separate the postcode-regions according to our net-segments.

# The traveling nodes
I think we should prevent every node with the wrong postcode to mesh in a foreign net-segment to prevent bridging.
We can do this by spanning different mesh-nets in every segment. To make the node find its correct mesh-net, we let him scan for the mesh-net he should be in according to his hostname and key. If it finds its net, the node switches to this mesh. Otherwise the node keeps its basic bootup-mesh-configuration.

My idea is, to let the node scan the wifi-area every second minute and change its setting if matching.

To make this work, one first node must be on the new mesh-net. This is triggered with the nodes having the proper uplink and switching to the right net without scanning the wifi-area first.


# todo
fastd-trigger switching
