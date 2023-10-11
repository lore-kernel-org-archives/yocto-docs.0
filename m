Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E529CD6E6E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 13:37:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.16708.1697031449614587104
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 06:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oABPTRNE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AA17FF818;
	Wed, 11 Oct 2023 13:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697031448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G070BO5iD2WinK4mUfHZoWSMlm4vI91gnOsSrl1TGbM=;
	b=oABPTRNE22ZDc2PSNkBHNaG/Y4vXkKwKOqmujCaBz1jlucPxv+0a8n+kg/iUwER1nYq+rP
	bkrDx7jjV8/fWZUEHh0jwuoOsDdjHRUSEHjAlNiNzqT4dSaepB9ty1xsSX+q+nx/Y1hv2W
	fi5OexiOCOFPT94q/OqXBxd0D3qdE/w68bQsKZad7whQv7QB1y9jXYTY6mTwGzAGRtBUnR
	WzSQ4KuR/Yj9YgPDpCDsbb2pAYYco4V7bikE1A6QD1t4YThBDsbki/x5BHCtpPX/ZAnz4F
	02LjKYc4mTvKPjg3+K6E6FCUgtEY+bwKUuntkIL2QKGvGlOWlQ5vZ5F4n8CPhA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [mickledore][PATCH 2/4] dev-manual: fix testimage usage instructions
Date: Wed, 11 Oct 2023 15:37:18 +0200
Message-Id: <20231011133720.78265-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011133720.78265-1-michael.opdenacker@bootlin.com>
References: <20231011133720.78265-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Oct 2023 13:37:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4347

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Trevor Gamblin <tgamblin@baylibre.com>

The proper way to inherit the testimage class is now

IMAGE_CLASSES += "testimage"

so change lines with 'INHERIT += "testimage"' to match. This makes the
dev-manual consistent with the migration guide, which already specifies
that the old way causes an error.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/runtime-testing.rst   | 4 ++--
 documentation/dev-manual/upgrading-recipes.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index c5c5653bef..af3fe2c1dd 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -229,7 +229,7 @@ The final thing you need to do when setting :term:`TEST_TARGET` to
    statements in your ``local.conf`` file::
 
       IMAGE_FSTYPES += "tar.gz"
-      INHERIT += "testimage"
+      IMAGE_CLASSES += "testimage"
       TEST_TARGET = "SystemdbootTarget"
       TEST_TARGET_IP = "192.168.2.3"
 
@@ -335,7 +335,7 @@ You can start the tests automatically or manually:
    inherit the :ref:`ref-classes-testimage` class by editing your
    ``local.conf`` file::
 
-      INHERIT += "testimage"
+      IMAGE_CLASSES += "testimage"
 
    Next, use BitBake to run the tests::
 
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 13133fddcf..33a7ca39dd 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -117,7 +117,7 @@ The following steps describe how to set up the AUH utility:
       class, which is optional, you need to have the following set in
       your ``conf/local.conf`` file::
 
-         INHERIT += "testimage"
+         IMAGE_CLASSES += "testimage"
 
       .. note::
 
-- 
2.34.1


