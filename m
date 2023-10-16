Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F92C41513
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:33:00 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.127391.1697466776378499273
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 07:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YN0wf6Mm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9B252000D;
	Mon, 16 Oct 2023 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697466774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z+FWukk8gf2IqCpEMdIP6K9inxjqaIh930gBh5YhMTA=;
	b=YN0wf6Mm6n5cuLP1up9/FhhS85bjHLJVZn8XcXZr520O+irLmo28N9jb5+LMz2pzgIwOjF
	PPKpWI5IUQ6KHiPK4c+9VL54wzWVOPHCChOhBhAOk7udT+gBD5WP1+rIH47tL0CDAKaGgs
	c2dN1IG+j2pZk4dpGocBn+oXFSFovcXQl645bjqgdMhA4IJLZs+ohS52gwdi1PnkAvHpo5
	IUN+dfZYPtuE5gNxOuMPsT7iGwdwczmj4D0yz9qd0Wq7FwKvyv/gGS/XnM5i5jGs/51x7z
	MWAg+p96lcQ49QPk4wpTMYCIfVQ/41xzRhR5I+TpwkytLlIxODA93nFknbzh+Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [PATCH] dev-manual: start.rst: remove obsolete reference
Date: Mon, 16 Oct 2023 16:32:49 +0200
Message-Id: <20231016143249.199759-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:33:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4380

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Remove a reference to a web resource which is clearly marked as obsolete.
Replace the unnecessarily verbose note by just links to the mentioned tools.

[YOCTO #15233]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
 documentation/dev-manual/start.rst | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 88afa27ad5..4a556967eb 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -88,27 +88,15 @@ particular working environment and set of practices.
        For information about BitBake, see the
        :doc:`bitbake:index`.
 
-    It is relatively easy to set up Git services and create
-    infrastructure like :yocto_git:`/`, which is based on
-    server software called ``gitolite`` with ``cgit`` being used to
-    generate the web interface that lets you view the repositories. The
-    ``gitolite`` software identifies users using SSH keys and allows
+    It is relatively easy to set up Git services and create infrastructure like
+    :yocto_git:`/`, which is based on server software called
+    `Gitolite <https://gitolite.com>`__
+    with `cgit <https://git.zx2c4.com/cgit/about/>`__ being used to
+    generate the web interface that lets you view the repositories.
+    ``gitolite`` identifies users using SSH keys and allows
     branch-based access controls to repositories that you can control as
     little or as much as necessary.
 
-    .. note::
-
-       The setup of these services is beyond the scope of this manual.
-       However, here are sites describing how to perform setup:
-
-       -  `Gitolite <https://gitolite.com>`__: Information for
-          ``gitolite``.
-
-       -  `Interfaces, frontends, and
-          tools <https://git.wiki.kernel.org/index.php/Interfaces,_frontends,_and_tools>`__:
-          Documentation on how to create interfaces and frontends for
-          Git.
-
 #.  *Set up the Application Development Machines:* As mentioned earlier,
     application developers are creating applications on top of existing
     software stacks. Following are some best practices for setting up
-- 
2.34.1


