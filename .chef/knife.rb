# -*- coding: utf-8 -*-
cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
encrypted_data_bag_secret "data_bags/data_bag_key"
knife[:berkshelf_path] = "cookbooks"
ssl_verify_mode  :verify_peer
