Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAB9CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 14:38:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12731.1712155094506829891
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 07:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b9oBcNgn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0510A1C0009;
	Wed,  3 Apr 2024 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712155093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGCZkV5PcNSB3p5iHCpjvCLrRhaUhIlZWnc+SAmKjw0=;
	b=b9oBcNgnQ1fke4VqEUoAN5Lp11AoxQj8fTQ+baCh5puVMm+1k2LZzclutv7/i3oQrOFEP2
	JmDMOhJAxy+r50skFfzPOAV8l3Ak22cmu/PcUOXbpxPAP6lJpfbH620bh+LhRb7JFfDJH/
	1t46x8Q6aG8f90gS65tD1P1d9OkZ2I0vGCyQyKY3YTobLNpy1qZe8Nqo2I91HT2HL8R0NS
	3sA6TalB0MK+1UC6kWxq5ZWc51QmEXNWYuYHXyBsmsjLMyuLyEkrTgRKT6t4wj2kfqo5IU
	AhyjFpa1K6hSUPbg9esA/oBNyeAUXmbBbtwq4fmVRYSmeGVVhOuD4YxPtJvKrA==
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 1/5] migration-guides: list removed recipes
Date: Wed,  3 Apr 2024 16:37:20 +0200
Message-ID: <20240403143724.1956838-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
References: <20240403143724.1956838-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Apr 2024 14:38:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5051

Fill the 'Removed recipes' section for the upcoming release 5.0

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index 227b21ba7..f7d817176 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -94,6 +94,11 @@ Removed recipes
 
 The following recipes have been removed in this release:
 
+- ``libcroco``: deprecated and archived by the Gnome Project.
+- ``linux-yocto``: version 6.1 (version 6.6 provided instead).
+- ``zvariant``: fails to build with newer Rust
+- ``systemtap-uprobes``: obsolete.
+
 .. _migration-5.0-removed-classes:
 
 Removed classes
-- 
2.43.0


