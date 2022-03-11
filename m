Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9BBC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:35:52 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.8311.1647020151477408330
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 09:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EnCdUIWP;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 43BFE240004;
	Fri, 11 Mar 2022 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647020149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtcGwpwx3CQ59gtM7YaLIgs4lrOXNWIPCwOphgT2Cbk=;
	b=EnCdUIWP0fCWdnbRC70kDpO9orIZfVF6odt8gWJIWN8WtnJIR7EP8xGxg12eAMKGB64GHP
	RroxscQ+8T1FYNv1X0VBb+MmHEhQxqU5D4cz8TTmfsonzz9NnU6y4pYvqHqM+stRngbClP
	hdtD2gI0qY5VMQg90Vu3gOiGzakKbUAoNDNr+uOMAz8KfJjvZfrNsbSM/k7j5lYYk+oLmd
	XKop9rVo3Qj1IQk+1hRaHgbl8tomgj7fRVhtFcMU3xQF5RU/ETdPwrR8brY1N4i8b8wW8o
	TXJtxBx8GSR/O1UT6gdkA4agOYgrHPWa2aASELJYvn8mrG87b0PVHdu3AHvP+Q==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Steve Sakoman <steve@sakoman.com>,
	Christian Eggers <ceggers@arri.de>
Subject: [PATCH] docs: ref-system-requirements.rst: update list of supported
 distros
Date: Fri, 11 Mar 2022 18:35:46 +0100
Message-Id: <20220311173546.69090-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16DB63DD72FFB73C.30380@lists.yoctoproject.org>
References: <16DB63DD72FFB73C.30380@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 17:35:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2599

Add AlmaLinux 8.5, Fedora 35, and OpenSUSE Leap 15.3
Remove Fedora 33, Debian 8, OpenSUSE Leap 15.1 and 15.2

Removing distros that were recently removed from SANITY_TESTED_DISTROS
in meta-poky/conf/distro/poky.conf

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Steve Sakoman <steve@sakoman.com>
Reported-by: Christian Eggers <ceggers@arri.de>
---
 documentation/ref-manual/system-requirements.rst | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 30294cb27a..04f9efaa23 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -41,15 +41,15 @@ distributions:
 
 -  Ubuntu 20.04 (LTS)
 
--  Fedora 33
-
 -  Fedora 34
 
+-  Fedora 35
+
 -  CentOS 7.x
 
 -  CentOS 8.x
 
--  Debian GNU/Linux 8.x (Jessie)
+-  AlmaLinux 8.5
 
 -  Debian GNU/Linux 9.x (Stretch)
 
@@ -57,9 +57,7 @@ distributions:
 
 -  Debian GNU/Linux 11.x (Bullseye)
 
--  OpenSUSE Leap 15.1
-
--  OpenSUSE Leap 15.2
+-  OpenSUSE Leap 15.3
 
 .. note::
 
-- 
2.25.1


