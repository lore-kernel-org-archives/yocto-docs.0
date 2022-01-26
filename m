Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E65CC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 13:18:34 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.12273.1643203113058092678
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 05:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0D1B824000F;
	Wed, 26 Jan 2022 13:18:30 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: propose https for SSTATE_MIRRORS
Date: Wed, 26 Jan 2022 14:18:25 +0100
Message-Id: <20220126131825.1064950-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Jan 2022 13:18:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2445

Both http and https work, but https should raise fewer questions
from users.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst      | 4 ++--
 documentation/overview-manual/concepts.rst        | 2 +-
 documentation/ref-manual/variables.rst            | 4 ++--
 documentation/sdk-manual/appendix-customizing.rst | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index eaacde2d9a..b01fb4d40b 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -256,12 +256,12 @@ an entire Linux distribution, including the toolchain, from source.
          BB_SIGNATURE_HANDLER = "OEEquivHash"
          BB_HASHSERVE = "auto"
          BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
-         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
 
       The above settings assumed the use of Yocto Project &YOCTO_DOC_VERSION;.
       If you are using the development version instead, set :term:`SSTATE_MIRRORS` as follows::
 
-         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
 
 #. **Start the Build:** Continue with the following command to build an OS
    image for the target, which is ``core-image-sato`` in this example:
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 5698d93759..5cb5cb7127 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1904,7 +1904,7 @@ Behind the scenes, the shared state code works by looking in
 shared state files. Here is an example::
 
    SSTATE_MIRRORS ?= "\
-       file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+       file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
        file://.* file:///some/local/dir/sstate/PATH"
 
 .. note::
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adb104e202..d4f40b6929 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7196,7 +7196,7 @@ system and gives an overview of their function and contents.
       following maps the local search path ``universal-4.9`` to the
       server-provided path server_url_sstate_path::
 
-         SSTATE_MIRRORS ?= "file://universal-4.9/(.*) http://server_url_sstate_path/universal-4.8/\1 \n"
+         SSTATE_MIRRORS ?= "file://universal-4.9/(.*) https://server_url_sstate_path/universal-4.8/\1 \n"
 
       If a mirror uses the same structure as
       :term:`SSTATE_DIR`, you need to add "PATH" at the
@@ -7205,7 +7205,7 @@ system and gives an overview of their function and contents.
       ::
 
          SSTATE_MIRRORS ?= "\
-             file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+             file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
              file://.* file:///some-local-dir/sstate/PATH"
 
    :term:`SSTATE_SCAN_FILES`
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index cac199bf7a..f8e56477f3 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -264,7 +264,7 @@ source, you need to do a number of things:
    to find the configuration. The variable you need to set is
    :term:`SSTATE_MIRRORS`::
 
-      SSTATE_MIRRORS = "file://.* http://example.com/some_path/sstate-cache/PATH"
+      SSTATE_MIRRORS = "file://.* https://example.com/some_path/sstate-cache/PATH"
 
    You can set the :term:`SSTATE_MIRRORS` variable in two different places:
 
-- 
2.25.1


