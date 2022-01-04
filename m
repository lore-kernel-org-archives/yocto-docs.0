Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C45C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 10:25:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.4974.1641291945892612307
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 02:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5E75D2000C;
	Tue,  4 Jan 2022 10:25:41 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Max Krummenacher <max.oss.09@gmail.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [honister][PATCH] ref-manual: fix patch documentation
Date: Tue,  4 Jan 2022 11:25:39 +0100
Message-Id: <20220104102539.56493-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Jan 2022 10:25:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2342

From: Max Krummenacher <max.oss.09@gmail.com>

The do_patch implementation does not apply patches from an entry in
SRC_URI pointing to a directory.
Remove the claim that this is implemented.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 documentation/ref-manual/tasks.rst | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 4edae33392..2438c023b4 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -326,21 +326,19 @@ file as a patch file::
        file://file;apply=yes \
        "
 
-Conversely, if you have a directory full of patch files and you want to
-exclude some so that the ``do_patch`` task does not apply them during
-the patch phase, you can use the "apply=no" parameter with the
+Conversely, if you have a file whose file type is ``.patch`` or ``.diff``
+and you want to exclude it so that the ``do_patch`` task does not apply
+it during the patch phase, you can use the "apply=no" parameter with the
 :term:`SRC_URI` statement::
 
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
 ":ref:`overview-manual/concepts:patching`" section in
-- 
2.25.1


