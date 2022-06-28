Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3E7C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 17:40:18 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.1309.1656438013214408696
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jun 2022 10:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XwJ4Zo2c;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 33F3A240005;
	Tue, 28 Jun 2022 17:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656438011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YOI3lJvRH1h6cugWuelJ22+pNafgIuDVUhFl7jhraV4=;
	b=XwJ4Zo2cHM98NgJCV7jQYIXwb7TgDeVntcwGPgsdUEJF3mcg6Uhgm1BwG5M1QfutuX6Ojf
	Ykhx//cP7QvtrhNoyvqDf/6u2iPg9kneKMUN9T52gJGmTRBHwb2o+860zFYe+8owYp0x9P
	pNwFbZ+3nG6FOlHQVlm1nLmdBqH/U2Q/2dMIrJYNQ6jY563M5aP59OrMuB4JW9amU4wJRB
	gcXeTk3QPR5eLs9eQf5vB2bxrso9c67Yz3EhNpuSvRjBmoU2c6iGEC8yqHe0vn0YWMUj/A
	oCHmoQP2+qGWeFp32ui6wFcYFY4A36+W6WwgCMpUOzMgAVm51gCaKSHIm4sK2g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] dev-manual: update section about creating NPM packages
Date: Tue, 28 Jun 2022 19:40:04 +0200
Message-Id: <20220628174005.3295836-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jun 2022 17:40:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3037

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From running the instructions using Poky master

In particular, update command output and the contents
of generated files.

The "cute-files" example application can now directly be run,
without having to run it through "node".

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 49 +++++++++++++++--------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 01dac39c6f..8be3c7c0e8 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -7614,6 +7614,11 @@ The
 fetch URI to download each dependency and capture license details where
 possible. The result is a generated recipe.
 
+After running for quite a long time, in particular building the
+``nodejs-native`` package, the command should end as follows::
+
+   INFO: Recipe /home/.../build/workspace/recipes/cute-files/cute-files_1.0.2.bb has been automatically created; further editing may be required to make it fully functional
+
 The recipe file is fairly simple and contains every license that
 ``recipetool`` finds and includes the licenses in the recipe's
 :term:`LIC_FILES_CHKSUM`
@@ -7636,18 +7641,38 @@ runs.
 The ``devtool edit-recipe`` command lets you take a look at the recipe::
 
    $ devtool edit-recipe cute-files
+   # Recipe created by recipetool
+   # This is the basis of a recipe and may need further editing in order to be fully functional.
+   # (Feel free to remove these comments when editing.)
+
+   SUMMARY = "Turn any folder on your computer into a cute file browser, available on the local network."
+   # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
+   # your responsibility to verify that the values are complete and correct.
+   #
+   # NOTE: multiple licenses have been detected; they have been separated with &
+   # in the LICENSE value for now since it is a reasonable assumption that all
+   # of the licenses apply. If instead there is a choice between the multiple
+   # licenses then you should change the value to separate the licenses with |
+   # instead of &. If there is any doubt, check the accompanying documentation
+   # to determine which situation is applicable.
+
    SUMMARY = "Turn any folder on your computer into a cute file browser, available on the local network."
-   LICENSE = "MIT & ISC & Unknown"
+   LICENSE = "BSD-3-Clause & ISC & MIT"
    LIC_FILES_CHKSUM = "file://LICENSE;md5=71d98c0a1db42956787b1909c74a86ca \
-       file://node_modules/toidentifier/LICENSE;md5=1a261071a044d02eb6f2bb47f51a3502 \
-       file://node_modules/debug/LICENSE;md5=ddd815a475e7338b0be7a14d8ee35a99 \
-       ...
+                       file://node_modules/accepts/LICENSE;md5=bf1f9ad1e2e1d507aef4883fff7103de \
+                       file://node_modules/array-flatten/LICENSE;md5=44088ba57cb871a58add36ce51b8de08 \
+   ...
+                       file://node_modules/cookie-signature/Readme.md;md5=57ae8b42de3dd0c1f22d5f4cf191e15a"
+
    SRC_URI = " \
        npm://registry.npmjs.org/;package=cute-files;version=${PV} \
        npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
        "
+
    S = "${WORKDIR}/npm"
+
    inherit npm
+
    LICENSE:${PN} = "MIT"
    LICENSE:${PN}-accepts = "MIT"
    LICENSE:${PN}-array-flatten = "MIT"
@@ -7680,17 +7705,10 @@ command to deploy your package::
    $ devtool deploy-target -s cute-files root@192.168.7.2
 
 Once the package is installed on the target, you can
-test the application:
-
-.. note::
-
-   Because of a known issue, you cannot simply run ``cute-files`` as you would
-   if you had run ``npm install``.
-
-::
+test the application to show the contents of any directory::
 
   $ cd /usr/lib/node_modules/cute-files
-  $ node cute-files.js
+  $ cute-files
 
 On a browser,
 go to ``http://192.168.7.2:3000`` and you see the following:
@@ -7718,12 +7736,11 @@ command::
 
    $ devtool add https://github.com/martinaglv/cute-files.git
 
-The
-recipe this command generates is very similar to the recipe created in
+The recipe this command generates is very similar to the recipe created in
 the previous section. However, the :term:`SRC_URI` looks like the following::
 
    SRC_URI = " \
-       git://github.com/martinaglv/cute-files.git;protocol=https \
+       git://github.com/martinaglv/cute-files.git;protocol=https;branch=master \
        npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
        "
 
-- 
2.34.1


