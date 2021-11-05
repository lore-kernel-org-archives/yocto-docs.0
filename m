Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6264C433FE
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 15:12:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.6907.1636125127269090567
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 08:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 85551FF80F;
	Fri,  5 Nov 2021 15:12:05 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 2/3] ref-manual: move TMPDIR to BitBake's documentation
Date: Fri,  5 Nov 2021 16:11:58 +0100
Message-Id: <20211105151159.28541-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105151159.28541-1-michael.opdenacker@bootlin.com>
References: <20211105151159.28541-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Nov 2021 15:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2091

As it is not specific to OE / Yocto Project

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 441a10929e..44fccd5322 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8022,27 +8022,6 @@ system and gives an overview of their function and contents.
       and second (HMS) format (e.g. "140159" for one minute and fifty-nine
       seconds past 1400 hours).
 
-   :term:`TMPDIR`
-      This variable is the base directory the OpenEmbedded build system
-      uses for all build output and intermediate files (other than the
-      shared state cache). By default, the :term:`TMPDIR` variable points to
-      ``tmp`` within the :term:`Build Directory`.
-
-      If you want to establish this directory in a location other than the
-      default, you can uncomment and edit the following statement in the
-      ``conf/local.conf`` file in the :term:`Source Directory`::
-
-         #TMPDIR = "${TOPDIR}/tmp"
-
-      An example use for this scenario is to set :term:`TMPDIR` to a local disk,
-      which does not use NFS, while having the Build Directory use NFS.
-
-      The filesystem used by :term:`TMPDIR` must have standard filesystem
-      semantics (i.e. mixed-case files are unique, POSIX file locking, and
-      persistent inodes). Due to various issues with NFS and bugs in some
-      implementations, NFS does not meet this minimum requirement.
-      Consequently, :term:`TMPDIR` cannot be on NFS.
-
    :term:`TOOLCHAIN_HOST_TASK`
       This variable lists packages the OpenEmbedded build system uses when
       building an SDK, which contains a cross-development environment. The
-- 
2.25.1


