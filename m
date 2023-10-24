Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02B4C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.147732.1698154053559208095
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hPBYj78I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22BC820014;
	Tue, 24 Oct 2023 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKaTDMg+diNm3bw9+UZEvtt+XDZ3VggMh9zqTOIEuzA=;
	b=hPBYj78IcIhJMQ4C2KSbzQ/LNj4FWVIIEIggcrvWOaELIPjFWxBqqvzR7sRzqNauO1y8Yt
	n9dWDaBNuQ6uKYCRDtjOJDhgVXDA94iIKPwzEa+BhoVKcGrzm6MTQ9NFNf4UVGpzVdQiin
	++1sGQVPgdCqnU8/L566PW1/T7ZfCIk+ptOWfC5YWESh7HflHvO1uKDwUaohPe6SGY9b00
	gqZ0l/tFkV61no7/SJo90GpY1AdXwXiOAg9wsx+N7TraDuwnPoFaN/ybX8dHMXHqoZ0l57
	XK6GNO2Pbsi+vO7TpMPUtqoIzee5aXbagFReK+obEVCScAa60nnyCtfVycMPPQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [kirkstone][PATCH 13/16] dev-manual: start.rst: remove obsolete reference
Date: Tue, 24 Oct 2023 15:27:09 +0200
Message-Id: <20231024132712.90600-14-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4487

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
index 8938f0d772..3bc4244595 100644
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
 5.  *Set up the Application Development Machines:* As mentioned earlier,
     application developers are creating applications on top of existing
     software stacks. Following are some best practices for setting up
-- 
2.34.1


