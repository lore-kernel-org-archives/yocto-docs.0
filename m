Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC29C83003
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3.1692378645951233014
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ahDRCrwW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6800F60002;
	Fri, 18 Aug 2023 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Poysrfyzy96ViwkXZkPjr9Bj93srDygfx+XszK2JboU=;
	b=ahDRCrwWLMdoOjAVURUrPici8kFKNXEF22K9CaBSaDHsXtggRS8rIZuRDY/3G/HYZomqJD
	KUnSSvCZUnGKj4twoPre88tXi0B0pQEh8zmK1uhBQtnXr9FCIUwvRg0j24LdTCIwTVO3Nb
	heTGeAmmwnwb9uJ0/TVL1kF7qMabhGJ+4J5LTOD4lYsEjbwIoSnPiBTw3Luzy6SF9GWvxk
	ZASnzJG2WWeJrfMphSV1DZkvx2wS9p2ewLwtpwLpn99PcBjpq8vAEzabUEawp2hSlsYSzZ
	I5ItjtMf/YixK/Mtbg15WlO+haC6zV88X3PqEzAeZBU5+VLHGo8OZutB4x6VhA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 10/10] contributor-guide: submit-changes: how to request push access to repositories
Date: Fri, 18 Aug 2023 19:10:05 +0200
Message-Id: <20230818171005.92381-11-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4175

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Including content currently on
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/submit-changes.rst          | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 677885e3cf..cda2d12d25 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -502,9 +502,18 @@ have been followed:
    in the
    `Git Community Book <https://git-scm.com/book/en/v2/Distributed-Git-Distributed-Workflows>`__.
 
-#. *Push Your Commits to a "Contrib" Upstream:* If you have arranged for
-   permissions to push to an upstream contrib repository, push the
-   change to that repository::
+#. *Request Push Access to an "Upstream" Contrib Repository:* Send an email to
+   ``helpdesk@yoctoproject.org``:
+
+    -  Attach your SSH public key which usually named ``id_rsa.pub.``.
+       If you don't have one generate it by running ``ssh-keygen -t rsa -b 4096 -C "your_email@example.com"``.
+
+    -  List the repositories you're planning to contribute to.
+
+    -  Include your preferred branch prefix for ``-contrib`` repositories.
+
+#. *Push Your Commits to the "Contrib" Upstream:* Push your
+   changes to that repository::
 
       $ git push upstream_remote_repo local_branch_name
 
-- 
2.34.1


