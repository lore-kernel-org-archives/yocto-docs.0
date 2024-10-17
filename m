Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8D2D374A8
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 15:13:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.386.1729178007168404135
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Oct 2024 08:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=laCe5Bty;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D7651C0004;
	Thu, 17 Oct 2024 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729178005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPhsetKMQpXWouZuywrbqGLhfWjY7RW8wzNV2jGJ0RY=;
	b=laCe5Bty60jj3D9imdOugghsEqSUqR/SK9A6GeCSAxjVLbXA6oYZqPI2dJT05ecMm88yc2
	m3b0u5aTQunBkwPguq22AGyXO1hNgaLn70XuS1dXZt1lXJKeG97pYTSj+ZFcHjT1ogDTqe
	TtRT+JoEH+oZZrIgrR6jzqVFGWVodO+5DK4cdYL/TPBnlRkqYd21BQzalJNk6ydlJjEeLU
	tqq8NRCNVhTIIvQAvFlebCxRb1Z5IwMD/EbcRhrzMsbvUkI3p2vv9dai4VOWq0eP7pcpPa
	Pp63AR91ddOIJJrEFG49+JncyxEvlg7Ya4wNIb6/3n+Oi5Q5uriRxBp94u4syw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 17 Oct 2024 17:13:08 +0200
Subject: [PATCH 1/2] ref-manual: devtool-reference: refresh example outputs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-devtool-improvements-v1-1-2bacc656fe39@bootlin.com>
References: <20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com>
In-Reply-To: <20241017-devtool-improvements-v1-0-2bacc656fe39@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BjgX+8yB0roWiQh/rhTACr/qFJ0cYYEbv5ZAT00gLjw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnESmUuuB4YbR/Tfhqcl7JTnrAjHM/egHDWVBqJ
 wKwKc7lWUWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxEplAAKCRDRgEFAKaOo
 NgZXEADDFn9fqTNvnqGhksiqPHqgyWkbvB6mRIjRW7UV5NzkI9MX/bWYblEuPyhG9HK55JiZ3qp
 mmLXKMKMBsVY3IpOU9GBUduyTRfKO9Iw6gaEMGRB4/jwrIZAI9iLNnEZw/nV00m/XccwGtOVV4l
 +qLIvtIZAMfXCcLM0eppQNKFO0pRR7gb2r7PNau6c79ZMM1NKafXfVaD75njMVdDXKq1PZXVqhi
 AaDYQ4HAI6+bbqoqw5Zbp2xbiGdbPlVNDRL9pjLIqqMEJweQfS7BlS4A5iIu5zSS6DyS8I7Cc2X
 M7b3DqnXux5rf8LX9vV/5Z0UbYgb5moYHiAzR1Rl0qzi+vSl+OmgzcfSuNiYSjtb3gDMk2Anyol
 QitoYcgtdmWRoUYtrn+su9W0dye34QtP8sFwb4dcTuQHaADkFbZTWdqza+Xx9gXucStIexnbC44
 jsDmWpZVNERM5zby5jRl234Nc9FXxEUCkLNouKRQwyt+i8Iw8Jq2z9orSe1U6qzTs4CbxcCgI0y
 dUYvc7uK1D/2m/K9mea98i4+DQ1n3x3RTVWuMWZp7WtqPhk40GpZBoGCmZ5e3g+AbuwOQvIwtJw
 tlb2pURGQqV5M0SI0tiZ1Vt6IUtxq1iYVGclzl/ITIWeNGBitQ+QLm/g07KtbH+UNk6Y8rkcx/q
 LubIxPXgooiaMOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Oct 2024 15:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5528

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


