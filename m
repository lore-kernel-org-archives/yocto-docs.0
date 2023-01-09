Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C39C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 18:05:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.79947.1673287501196488245
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 10:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F+Q9hR+l;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5CB9C1BF203;
	Mon,  9 Jan 2023 18:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673287498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wn2BvhlAL28u5806tzM+qoK7nGNKpoowfiHP4+L9kEY=;
	b=F+Q9hR+lRgdXPfyYNu33k3EuRxjzDlrk8n4NZiOiYKKxG4lQemzELxeynX83QrboDYXl2k
	uagoMFzPxRJroZUOkR0q5BQCWvOGNqeh/77nvQxrC9XVXJp27alIYVLbcY53Fpnn+N13Ol
	LVIk0LYDstzcb03ObjSd87bkANIm+RSiC615SSgALZWW1RJhZHq12nYBW8CM1Yrvhf7Bp2
	o+k+hCBtnyIzsG6+DwzfUyvh8XLx9bkw1aKXxAprkNugtS8eid3yH853PdH6/DXltDlR9Z
	ivSjYDLOza+zXXxiGrvL3fTNF+Nkvm928kUd+iKdLyoHfKhwXqNUl+cmGfuZ9w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] manuals: document SPDX_PRETTY variable
Date: Mon,  9 Jan 2023 19:04:55 +0100
Message-Id: <20230109180455.12209-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Jan 2023 18:05:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3602

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Now that it has been backported to Kirkstone
https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=99483cff5c358d847ceb077349321eb57d5143e4

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 13 +++++++------
 documentation/ref-manual/classes.rst      |  4 ++--
 documentation/ref-manual/variables.rst    | 11 +++++++++++
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 1b91ada0a1..ce7eb6c9dd 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -11713,12 +11713,13 @@ containing an index of JSON :term:`SPDX` files for individual recipes, together
 with an ``IMAGE-MACHINE.spdx.tar.zst`` compressed archive containing all such
 files.
 
-The :ref:`create-spdx <ref-classes-create-spdx>` class offers options to include
-more information in the output :term:`SPDX` data, such as adding compressed
-archives of the files in the generated target packages
-(:term:`SPDX_ARCHIVE_PACKAGED`), adding a description of the source files
-handled by the target recipes (:term:`SPDX_INCLUDE_SOURCES`) and adding archives
-of these source files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
+The :ref:`ref-classes-create-spdx` class offers options to include
+more information in the output :term:`SPDX` data, such as making the generated
+files more human readable (:term:`SPDX_PRETTY`), adding compressed archives of
+the files in the generated target packages (:term:`SPDX_ARCHIVE_PACKAGED`),
+adding a description of the source files used to generate host tools and target
+packages (:term:`SPDX_INCLUDE_SOURCES`) and adding archives of these source
+files themselves (:term:`SPDX_ARCHIVE_SOURCES`).
 
 Though the toplevel :term:`SPDX` output is available in
 ``tmp/deploy/images/MACHINE/`` inside the :term:`Build Directory`, ancillary
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6e73c5d4fb..6ee0d33451 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -380,8 +380,8 @@ The toplevel :term:`SPDX` output file is generated in JSON format as a
 as well as in ``tmp/deploy/spdx``.
 
 The exact behaviour of this class, and the amount of output can be controlled
-by the :term:`SPDX_ARCHIVE_PACKAGED`, :term:`SPDX_ARCHIVE_SOURCES` and
-:term:`SPDX_INCLUDE_SOURCES` variables.
+by the :term:`SPDX_PRETTY`, :term:`SPDX_ARCHIVE_PACKAGED`,
+:term:`SPDX_ARCHIVE_SOURCES` and :term:`SPDX_INCLUDE_SOURCES` variables.
 
 See the description of these variables and the
 ":ref:`dev-manual/common-tasks:creating a software bill of materials`"
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c182478a31..061b1c28d8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7165,6 +7165,17 @@ system and gives an overview of their function and contents.
       image), compared to just using the
       :ref:`create-spdx <ref-classes-create-spdx>` class with no option.
 
+   :term:`SPDX_PRETTY`
+      This option makes the SPDX output more human-readable, using
+      identation and newlines, instead of the default output in a
+      single line::
+
+         SPDX_PRETTY = "1"
+
+      The generated SPDX files are approximately 20% bigger, but
+      this option is recommended if you want to inspect the SPDX
+      output files with a text editor.
+
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
       ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
-- 
2.37.2


