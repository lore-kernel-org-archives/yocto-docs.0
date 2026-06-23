Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A942CD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:41:59 +0000 (UTC)
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21545.1782222111512156667
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 06:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=N8dwVkxc;
 spf=pass (domain: 0leil.net, ip: 83.166.143.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gl5p46YsYzMX4;
	Tue, 23 Jun 2026 15:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1782222108;
	bh=vnYr1wsFE88CnZhn8cOgjd1aKNYNOzaaf+8qPnZbAQM=;
	h=From:Date:Subject:To:Cc:From;
	b=N8dwVkxct8JwUohdmUdo4jUFGSoqoz3zlS3ZW0/9j06ZJjNbeHn/JkMDmzC3O+67o
	 g9FCAPjUKp72WyM9cpVUv4euRoFK8vNrTOWk7v12otjGTgc/pbSStu2+6KE+WQdjab
	 LFmh69rShP+gBS6qR2jMrnOfumqac4G+sxqocemVdHTXRWDXbDEyk4lUW0Hl+ljm15
	 zhw9iTcbORs0OmiDBUlg0jsf4VpWYT9pM2eyxUEqzEO1MRw7XpvDyuFwQkQqqBZoDE
	 sneNf8tecMonZqpndvN61nXz52X+D7rbZp6hG8WNBJUgdVERYi5/700iwdUKTYhlXo
	 Qt2+zpqeHixwA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gl5p4116vzYfq;
	Tue, 23 Jun 2026 15:41:47 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 23 Jun 2026 15:41:39 +0200
Subject: [PATCH] poky.yaml.in: bump min git version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-min-git-bump-v1-1-a634b0ec8a77@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1hNo41DBq8gsWo0awSqtFUG8u
 3VcvsX/J0QOwhHq4oTAu0RZfIb+FNCO1g+M0mUDKTLKUImzeBxkQ5fmFTVR76y2plJfyMkauJf
 jv2t+r2NyE7fb84DrugEmn7x1cAAAAA==
X-Change-ID: 20260623-min-git-bump-122fba1a6704
To: docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 13:41:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9841

From: Quentin Schulz <quentin.schulz@cherry.de>

Since commit 3cccfa036a35 ("lib/bb: Further shell=True cleanups") in
BitBake, we depend on git >= 2.22.0 according to a mail on the ML[1] so
update the minimum required version listed in the docs to match.

[1] https://lore.kernel.org/bitbake-devel/3ed53ffdad2597c633e5664ae4f7752c12432362.camel@linuxfoundation.org/

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/poky.yaml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 56123495a..3e74dd7e7 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -37,7 +37,7 @@ YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 MIN_PYTHON_VERSION : "3.9.0"
 MIN_TAR_VERSION : "1.28"
-MIN_GIT_VERSION : "1.8.3.1"
+MIN_GIT_VERSION : "2.22.0"
 MIN_GCC_VERSION : "10.1"
 MIN_MAKE_VERSION : "4.0"
 # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato image with poky distro on Ubuntu 22.04 (x86-64), rounded up from 133

---
base-commit: 104b7a1e8dc14648f55a0099fd48ec5d3474e169
change-id: 20260623-min-git-bump-122fba1a6704

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


