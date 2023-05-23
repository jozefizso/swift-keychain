// Copyright 2023 Cisco Systems, Inc.
// Licensed under MIT-style license (see LICENSE.txt file).

import PackageDescription

let package = Package(
    name: "AcmeDemo",
    dependencies: [
        .Package(url: "../../", majorVersion: 1),
    ]
)
