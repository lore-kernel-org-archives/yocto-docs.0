Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7837C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 10:06:41 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.17923.1693908397660629066
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 03:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OVjZR6qz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52933240007;
	Tue,  5 Sep 2023 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693908395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2CO0Jst/JyNa9V72uysscPBKS0745RtSAYTndo39TzA=;
	b=OVjZR6qzSZJglkQglh8FdNqko2tFwOkdsltDgn1fNJj70limQSM8Xr3BSOnXP0bPAbC4DY
	qB9BPYn9AlT/yLNl5ECd1wJzf3HHibiDVoOh12tmyOXJgsr1MIeKfrexzI4emoJrIb5T5S
	XfIaK7+o4mZ2vThApPeT5nnCcym1RjF7pNNRDZEYKYiPssoYRmVF3LfqveLF1kjzb3d1em
	0zx50Qb8YSJes5W3F4HouDfAZTssGITOZFjW7EPGp40SX6ejXD4H9xNz7WHLOfrTMMLS7h
	7vlwognaIjO/btg+b/xEoJ9QBpK/n9OrQVamcTnlMKufpOm5I3maakbHsnLrmA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH] ref-manual: system-requirements: update supported distros
Date: Tue,  5 Sep 2023 12:06:32 +0200
Message-Id: <20230905100632.92761-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Sep 2023 10:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4190

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Update according to changes in SANITY_TESTED_DISTROS
  (meta-poky/conf/distro/poky.conf)

- No longer declare as "Supported" the distributions versions
  which are End of Life for their vendors, as some of them
  (Ubuntu for example) ship updates to subscribers only,
  which the Yocto Project has no access to.

- List distribution versions which were previously tested
  for the branch of the Yocto Project being considered.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../ref-manual/system-requirements.rst        | 35 ++++++++++++++-----
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 060a5dde02..83e9ea0f43 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -34,15 +34,38 @@ and conceptual information in the :doc:`/overview-manual/index`.
 Supported Linux Distributions
 =============================
 
-Currently, the Yocto Project is supported on the following
-distributions:
-
--  Ubuntu 18.04 (LTS)
+Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
+supported on the following distributions:
 
 -  Ubuntu 20.04 (LTS)
 
 -  Ubuntu 22.04 (LTS)
 
+-  Fedora 37
+
+-  Debian GNU/Linux 11.x (Bullseye)
+
+-  AlmaLinux 8.8
+
+The following distribution versions are still tested (being listed
+in :term:`SANITY_TESTED_DISTROS`), even though the organizations
+publishing them no longer make updates publicly available:
+
+-  Ubuntu 18.04 (LTS)
+
+-  OpenSUSE Leap 15.3
+
+Note that the Yocto Project doesn't have access to private updates
+that some of these versions may have. Therefore, our testing has
+limited value if you have access to such updates.
+
+Finally, here are the distribution versions which were previously
+tested on former revisions of "&DISTRO_NAME;", but no longer are:
+
+-  Ubuntu 16.04 (LTS)
+
+-  Ubuntu 21.10
+
 -  Fedora 34
 
 -  Fedora 35
@@ -61,10 +84,6 @@ distributions:
 
 -  Debian GNU/Linux 10.x (Buster)
 
--  Debian GNU/Linux 11.x (Bullseye)
-
--  OpenSUSE Leap 15.3
-
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.34.1


