Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41063C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 15:16:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.16758.1670512575551365387
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 07:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hdygs1n4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 781F01BF206;
	Thu,  8 Dec 2022 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670512573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iYmFlnZLvA/PAfkgXtgAK4B9L512py+AOO8YGnF/vUQ=;
	b=Hdygs1n4aP0AFzoh01vpkB6+XAFEWdyMFEaKzkRUtuqRQ0pOrGEOvRlBq2f6kJR0MKCMjX
	te8gk1E4vGU0FUzUbJc+Oim/RyR3/7dJQZuksTqLeArG25rVB/AQwrW+8tc89kRa4O7M53
	BZgRKga/KvKd4zugWyMpvsgoW4G1oXVk/BKf0rrQcVD68m8ZfnkGJ6wk4j6wHv66Of3RPT
	QOKwQDs+j8o8v76qvD9vBo2gGfqxTnx+THhmPJOfBGLUndJ5j3BRY0cGvpZex7haImCjJA
	rmFiKIMHwQfYiPp7o/TGA761or46Chu9CvOWFM3NNCa8d81tVEYME8lYZvlNRQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: update references to release notes
Date: Thu,  8 Dec 2022 16:16:10 +0100
Message-Id: <20221208151610.20370-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Dec 2022 15:16:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3527

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Now part of the Yocto Project manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/resources.rst |  8 +++-----
 documentation/ref-manual/variables.rst | 10 ++++------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index fd4aed0164..06644363d5 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -171,11 +171,9 @@ Here is a list of resources you might find helpful:
 -  :yocto_wiki:`FAQ </FAQ>`: A list of commonly asked
    questions and their answers.
 
--  Release Notes: Features, updates and known issues for the current
-   release of the Yocto Project. To access the Release Notes, go to the
-   :yocto_home:`Downloads </software-overview/downloads>` page on
-   the Yocto Project website and click on the "RELEASE INFORMATION" link
-   for the appropriate release.
+-  :yocto_docs:`Release Information </migration-guides/>`:
+   Migration guides, release notes, new features, updates and known issues
+   for the current and past releases of the Yocto Project.
 
 -  :yocto_bugs:`Bugzilla <>`: The bug tracking application
    the Yocto Project uses. If you find problems with the Yocto Project,
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0435f88347..776c8a2792 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8465,12 +8465,10 @@ system and gives an overview of their function and contents.
          If :term:`TCMODE` is set to a value other than "default", then it is your
          responsibility to ensure that the toolchain is compatible with the
          default toolchain. Using older or newer versions of these
-         components might cause build problems. See the Release Notes for
-         the Yocto Project release for the specific components with which
-         the toolchain must be compatible. To access the Release Notes, go
-         to the :yocto_home:`Downloads </software-overview/downloads>`
-         page on the Yocto Project website and click on the "RELEASE
-         INFORMATION" link for the appropriate release.
+         components might cause build problems. See
+         :yocto_docs:`Release Information </migration-guides/>` for your
+         version of the Yocto Project, to find the specific components with
+         which the toolchain must be compatible.
 
       The :term:`TCMODE` variable is similar to :term:`TCLIBC`,
       which controls the variant of the GNU standard C library (``libc``)
-- 
2.37.2


