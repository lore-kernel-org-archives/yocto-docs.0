Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552DCD6B067
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17109.1769700269315622223
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IS7ts26B;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C2F7C1A2B09
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99822606FD;
	Thu, 29 Jan 2026 15:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE702119A8878;
	Thu, 29 Jan 2026 16:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OwUWpRWMPrgm6HVeblqHP0Oag71pbGSwTNBV37/NDZQ=;
	b=IS7ts26BfulyEeXY5i+iRhSMVaIvDOkPnS6x4mZ0YEpQiNOc+/WKMIwoAfZlSrzlsKMOSL
	FKOEPQkhThUU3p8vrphQgX/iTyQJOBDygoWV0EkP0XE+miBEU5AEgf61Uy6gEx8dcgUFPb
	mGFwrUwxzb/DszG2cv871pD4qjzRv8WAjymk1liJfM5X8STcD7VSMmucxEbPoDIfRVvny7
	3ghKEEWQsTtEI3t1u9VZaGd0JGA+Wdd1NZOrwhayhSO0GL9m/3SrzrhkvY2wFRWilq3UOa
	PAYt9lbmQgMoo2OUU8hOOkVY9hLPz4Cenx7JT8Pbm6efQGDYb57Hhb6nM3kfxw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:26 +0100
Subject: [PATCH v3 35/57] dev-manual/build-quality.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-35-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=k18j4Wg0rt7VgSRN3B60+9X3/bH0AdNYWB9NX1davUo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uOzJiwwVIpm2mDSuB1BShIMnzxX/kBSq+t0
 HJJekSGg4GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jgAKCRDRgEFAKaOo
 NskOEACB4t9U7xrh0Qh67WDTuDd3YwTwChpgY+9NVyr3DfjX2+mcg4Mf4xjweFhX9X46lNwtRv2
 Egc8SB/VOHXWltAgVXoRUKwcXQReMpc+Fan/30UF+7EHZAlSIZ32hUWM/CCDl5yMIlAVJjtwtMS
 rzfZn3eIKUxuqckSfxwhbCxkCS7J0Gp0M7AtML2IS4dE5rith4FZ4zl3TT3atwTm4iXWRyVJPCs
 fc4evSAbXStKJWSw48GVCBoO6T9FuQ+NdsvlDz/OV6OqE6rLGsXMQ0ygK2YJyizq7RMQVGv+MMf
 MQH32nAgPL70Fr/JtZEqQhMPlGVg84p4xaO0c5fNoJu2QIyY6JvK4tRVlYNb7fhpCdvAssoEAsr
 sv0Hhb8XnqIDiW7Tr+FGdasTtPXFOL66PaqAE41kAH/Z1I5jHrFbgdZDvtCXVF3rtOFzF89L0Q0
 Ie3h1IkuAT5f/gF3yjoLNxxrpzTsKzdElrO9rhVscIUM1ymjfAW0t6SJdFGHqQi9LiTSMxZUDFA
 sfJU7htxihJ23nm+ZJIdxioHbk4cTxZYd0n7oR6jdFbmXLHzZuBbZu5OxEAtiQP5s4quxMNe331
 Puow5uKySr7q7OaLn34rqIJkTu5SHhGKFvUI6FrJEg6uJszw/0rLp24dacpfRWoP5vEW4lHkr8w
 GdSBZCC872NrHqQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8821

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/build-quality.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index fbe5fb6f0..163d8832e 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -372,7 +372,7 @@ There is a command-line tool called ``buildhistory-diff``, though,
 that queries the Git repository and prints just the differences that
 might be significant in human-readable form. Here is an example::
 
-   $ poky/poky/scripts/buildhistory-diff . HEAD^
+   $ bitbake-builds/layers/openembedded-core/scripts/buildhistory-diff . HEAD^
    Changes to images/qemux86_64/glibc/core-image-minimal (files-in-image.txt):
       /etc/anotherpkg.conf was added
       /sbin/anotherpkg was added

-- 
2.52.0


