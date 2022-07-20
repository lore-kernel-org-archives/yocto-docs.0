Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C395C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:53:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.51720.1658307179395558792
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 01:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LvAhPPjZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 391351BF204;
	Wed, 20 Jul 2022 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658307177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cq+xC3kgqQ65iS4jMhxNR4i9xDmSClFAP0ml7Gbo5HU=;
	b=LvAhPPjZbgdHqv/+zYyS0lJTv7+iQrXXrQrJWwmShHwEX946S6mza+CDfuTuKtPxLo1V85
	Rsr6y/H/ISsx599bxQcPQn+AavQG09e/ufQoobq4csT9K+DZUEAvKd9HHUdWuWxFm0Cj6h
	tzipPLtTdw6L+srZB8Ju+xtVLWc2LNHEOglKzRR6gQwEsP+dWQWFWGrzWwCxp5O63nFXit
	l9QKj6o9OKE8+73FWiaMqXxFvhwtr/L5t8xNuhdBfoVeK5ykBXiIyk8zKdVI6WXpraJ6Ny
	JuXqm3meFW5uoAweNr68QUuunKvPQ56hhzTwZ5ronTDEYctvAkiI34fl3Tuu7g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] docs: BB_HASHSERVE_UPSTREAM: update to new host
Date: Wed, 20 Jul 2022 10:52:54 +0200
Message-Id: <20220720085254.541286-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Jul 2022 08:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3074

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst         | 2 +-
 documentation/migration-guides/release-notes-4.0.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7ba05c78a0..a982eae207 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -255,7 +255,7 @@ an entire Linux distribution, including the toolchain, from source.
 
          BB_SIGNATURE_HANDLER = "OEEquivHash"
          BB_HASHSERVE = "auto"
-         BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
+         BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
          SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 #. **Start the Build:** Continue with the following command to build an OS
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index 4bf680db5d..b675cae217 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -22,7 +22,7 @@ New Features / Enhancements in 4.0
 
      BB_SIGNATURE_HANDLER = "OEEquivHash"
      BB_HASHSERVE = "auto"
-     BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
+     BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
      SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
 - The Python package build process is now based on `wheels <https://pythonwheels.com/>`__
-- 
2.34.1


