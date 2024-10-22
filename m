Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDB0D1CDB8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:38:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.13578.1729586302461913343
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 01:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oZYv6Dcs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73D0C40002;
	Tue, 22 Oct 2024 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729586300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPhsetKMQpXWouZuywrbqGLhfWjY7RW8wzNV2jGJ0RY=;
	b=oZYv6DcsMqt/sPZ/n36YPyc3qAZt6HBkkTsXr0gfZqNF9zk8m9fkKnk5HYrVshNFyCBgTw
	ADnbyum6aNMMolboP9Xzri5x3YZQOozVTct7ncrA+8NIQ1v+IzxNMaUEj0df8HyRftXHCP
	8f2LxCfdh64pzl118PaZRM1LAurVZvTsI+4Ogh+efNZmnDtFBdZp1qVRZ9jGrraKDowTED
	jrL3C4ziVXrFgilcucKDKwAM1QmxrjJWe190EfPbZID8PEPQ2aWJCYzzx7fb8eW2UxgE+G
	PZ7lMjphJNauHsIMm8qqq9oTPgZJBJZnZShkl2pTPrRo0Q091rTIWPmSy3CJRw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 22 Oct 2024 10:37:56 +0200
Subject: [PATCH v2 1/2] ref-manual: devtool-reference: refresh example
 outputs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-devtool-improvements-v2-1-9d2ebf9c5311@bootlin.com>
References: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
In-Reply-To: <20241022-devtool-improvements-v2-0-9d2ebf9c5311@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BjgX+8yB0roWiQh/rhTACr/qFJ0cYYEbv5ZAT00gLjw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnF2R70CBjNV3QNOHs51HZ9A5lUuK8zf3AW5xRP
 NjUKHXmHCKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxdkewAKCRDRgEFAKaOo
 NgbuEACyAfCBGHDljBV9BkYJihRNLATN9EMysMGAhi0BrKuJgi8Ba/8UzoZ8ZIbvuzuPXpEdta/
 ProJDI8eE9nTarIFOl57NKs3h1Beg7yyMSZbhB0CcUh4aJqfEiuWl0rFLY6mxDU/Rj9pIJAwBPk
 gNHaIB0y1WUC57+eaVGuMpPdbSitaZamY+rgoquXAui+5K3PeGIpScg5seT/IYmsXQZIvfTkuK5
 MkEyRcbBky8HPakuZ2C8+vUSu4zezAoRTHUsPNGDujTFUI4HfXuEwOwb+N38kKNodBB8cfPm45C
 3zOTwsKdAhRDlegFNP8ZxK5XG1ZGLXf5eM1hLDqCn9jOcWOzL2J2jzZlYp3eyS+cNpKcPB7uqQ4
 v9LqpDezITP6zaJtqGa7FyWd29WIAkgsPW25t5PLHumKk7IjNkm2iHzlFu6RZZ8QqoPxDcibuI1
 WqN5VfMDj/LfqyiVf1j/88GoUEdDrvtF8IJ15U+pH1Vh23YueLAzRGFjbbnuqWIDCdag7yNJJJv
 As/a7eN7TpBd5fPrmA34s+rWPH2NeyVfa5fPnvukh92/GqHrJlF9vy1d3JfNL8ybn2IeoDu6mli
 qRrAqPJMubvufOLaqErMoz6SpGNqoGp2QklpUG41ajyfLCBdEnOg3vCSMIs3ZhSRKPKE4DCIaKg
 waKPFwgydxc679g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 08:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5550

Previous outputs were missing some commands and options, some others
were obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/devtool-reference.rst | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 9319addc3c611ee183ad069bf7e41d14811b33ce..9c36195c5a5a2405cf8e3a562a2a53291e97c859 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -24,7 +24,7 @@ The ``devtool`` command line is organized similarly to Git in that it
 has a number of sub-commands for each function. You can run
 ``devtool --help`` to see all the commands::
 
-   $ devtool -h
+   $ devtool --help
    NOTE: Starting bitbake server...
    usage: devtool [--basepath BASEPATH] [--bbpath BBPATH] [-d] [-q] [--color COLOR] [-h] <subcommand> ...
 
@@ -50,6 +50,7 @@ has a number of sub-commands for each function. You can run
        search                Search available recipes
      Working on a recipe in the workspace:
        build                 Build a recipe
+       ide-sdk               Setup the SDK and configure the IDE
        rename                Rename a recipe file in the workspace
        edit-recipe           Edit a recipe file
        find-recipe           Find a recipe file
@@ -63,17 +64,11 @@ has a number of sub-commands for each function. You can run
        build-image           Build image including workspace recipe packages
      Advanced:
        create-workspace      Set up workspace in an alternative location
+       import                Import exported tar archive into workspace
+       export                Export workspace into a tar archive
        extract               Extract the source for an existing recipe
        sync                  Synchronize the source tree for an existing recipe
        menuconfig            Alter build-time configuration for a recipe
-       import                Import exported tar archive into workspace
-       export                Export workspace into a tar archive
-     other:
-       selftest-reverse      Reverse value (for selftest)
-       pluginfile            Print the filename of this plugin
-       bbdir                 Print the BBPATH directory of this plugin
-       count                 How many times have this plugin been registered.
-       multiloaded           How many times have this plugin been initialized
    Use devtool <subcommand> --help to get help on a specific command
 
 As directed in the general help output, you can
@@ -82,8 +77,8 @@ using ``--help``::
 
    $ devtool add --help
    NOTE: Starting bitbake server...
-   usage: devtool add [-h] [--same-dir | --no-same-dir] [--fetch URI] [--npm-dev] [--version VERSION] [--no-git] [--srcrev SRCREV | --autorev] [--srcbranch SRCBRANCH] [--binary] [--also-native] [--src-subdir SUBDIR] [--mirrors]
-                      [--provides PROVIDES]
+   usage: devtool add [-h] [--same-dir | --no-same-dir] [--fetch URI] [--npm-dev] [--no-pypi] [--version VERSION] [--no-git] [--srcrev SRCREV | --autorev]
+                      [--srcbranch SRCBRANCH] [--binary] [--also-native] [--src-subdir SUBDIR] [--mirrors] [--provides PROVIDES]
                       [recipename] [srctree] [fetchuri]
 
    Adds a new recipe to the workspace to build a specified source tree. Can optionally fetch a remote URI and unpack it to create the source tree.
@@ -99,6 +94,7 @@ using ``--help``::
      --no-same-dir         Force build in a separate build directory
      --fetch URI, -f URI   Fetch the specified URI and extract it to create the source tree (deprecated - pass as positional argument instead)
      --npm-dev             For npm, also fetch devDependencies
+     --no-pypi             Do not inherit pypi class
      --version VERSION, -V VERSION
                            Version to use within recipe (PV)
      --no-git, -g          If fetching source, do not set up source tree as a git repository

-- 
2.46.1


