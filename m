Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31A9C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 10:44:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.5016.1641293083814197495
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 02:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D34FE1BF20A;
	Tue,  4 Jan 2022 10:44:41 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [dunfell][PATCH] ref-manual: fix patch documentation
Date: Tue,  4 Jan 2022 11:44:34 +0100
Message-Id: <20220104104434.57039-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Jan 2022 10:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2344

The do_patch implementation does not apply patches from an entry in
SRC_URI pointing to a directory.
Remove the claim that this is implemented.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 documentation/ref-manual/ref-tasks.rst | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index 4ed15365f3..2f1959a010 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -331,22 +331,19 @@ file as a patch file:
        file://file;apply=yes \
        "
 
-Conversely, if you have a directory full of patch files and you want to
-exclude some so that the ``do_patch`` task does not apply them during
-the patch phase, you can use the "apply=no" parameter with the
-``SRC_URI`` statement:
-::
+Conversely, if you have a file whose file type is ``.patch`` or ``.diff``
+and you want to exclude it so that the ``do_patch`` task does not apply
+it during the patch phase, you can use the "apply=no" parameter with the
+:term:`SRC_URI` statement::
 
    SRC_URI = " \
        git://path_to_repo/some_package \
-       file://path_to_lots_of_patch_files \
-       file://path_to_lots_of_patch_files/patch_file5;apply=no \
+       file://file1.patch \
+       file://file2.patch;apply=no \
        "
 
-In the
-previous example, assuming all the files in the directory holding the
-patch files end with either ``.patch`` or ``.diff``, every file would be
-applied as a patch by default except for the ``patch_file5`` patch.
+In the previous example ``file1.patch`` would be applied as a patch by default
+while ``file2.patch`` would not be applied.
 
 You can find out more about the patching process in the
 ":ref:`patching-dev-environment`" section in
-- 
2.25.1


