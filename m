Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CE1C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:29:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.52018.1711373374441396540
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 06:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PbJbeuZx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E18F02000D;
	Mon, 25 Mar 2024 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711373373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCiG1e7FE/4ivifXdJ8SCFge1hLxSW5+DtpC4zs8tAo=;
	b=PbJbeuZxafaaL+Fs3JuNKJtQpyH/0nnJSPIwsgV+uvcvv3v7KYax3UK2cGIFSI23UhrLPZ
	i+NWr5PG7D6pnV4i3IvJqkadx6syrGW88VNwRd3GKT2C7V7wavLyZHMk32zPaRqRGh7jCT
	fvkOkGziQafUr6MVKCeH9Ti92MuxS0LxzQM+nUFUubiUQOKx+PlBNPkeEom/3hsJZthzG6
	jdMf2wVuXTElCevuuwhehfmKn5Lr/LGsUuuqY1VJ3cVRIA/8zN29QMRBy19lblc1Asj6nQ
	2N/izfJOG9ifPlTmDyh0mHa4alpe5esIDCC2OUSSjA2Mh20JOljbsZqAdTMSbw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [nanbield][PATCH 10/11] sdk-manual: correctly describe separate build-sysroots tasks in direct sdk workflows
Date: Mon, 25 Mar 2024 14:29:25 +0100
Message-Id: <20240325132926.3018186-11-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
References: <20240325132926.3018186-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Mar 2024 13:29:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5018

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

They were separated in
https://git.yoctoproject.org/poky/commit/?id=63e53fb8b60d38315015844bd3357fa1649cd639

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/sdk-manual/extensible.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 355c6cb0e4..d335e78623 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -74,7 +74,7 @@ Setting up the Extensible SDK environment directly in a Yocto build
       $ bitbake meta-ide-support
       $ bitbake -c populate_sysroot gtk+3
       # or any other target or native item that the application developer would need
-      $ bitbake build-sysroots
+      $ bitbake build-sysroots -c build_native_sysroot && bitbake build-sysroots -c build_target_sysroot
 
 Setting up the Extensible SDK from a standalone installer
 ---------------------------------------------------------
@@ -1226,8 +1226,12 @@ In this scenario, the Yocto build tooling, e.g. ``bitbake``
 is directly accessible to build additional items, and it
 can simply be executed directly::
 
+   $ bitbake curl-native
+   # Add newly built native items to native sysroot
+   $ bitbake build-sysroots -c build_native_sysroot
    $ bitbake mesa
-   $ bitbake build-sysroots
+   # Add newly built target items to target sysroot
+   $ bitbake build-sysroots -c build_target_sysroot
 
 When using a standalone installer for the Extensible SDK
 --------------------------------------------------------
-- 
2.34.1


