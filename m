Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532F4CA6C96
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5812.1769501983255501920
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IXIsLPGc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C1B941A2A6C
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98936606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7E5C119A8697;
	Tue, 27 Jan 2026 09:19:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lkEy0PxaPR+LwxpzkVpE3/ZzyribVSkVxGoLLUwCGJ8=;
	b=IXIsLPGc7BeoX90kTaNbyyOtlFuwfg1AwKN5GQc4ikkoIDxVyDhL8mUr8IQ2fTcWa5Ygyv
	v1ozN4nbJwVp4VxjCk/SWhOYxtaWrSmPhA7XICfPMY+ofwmnn0LCwy6Gd/2uiBMOV1IDbA
	LhEFf5zyUg8yIcQgw7QyTwlLi0Dm/5Z7x0EPVeBXrMnod1OhYGZ/PGOEJlyL7+mcGDoGKQ
	sTNgauVKhsg+tCa8MReOktd/2TGYprdbz4EztsyQs82GmPOo2nFwihzFMEvDUYiZdmbvP6
	3vgVMsVjozOZZ6F2hQtoDlmeK9c0VsHedJWLf+mwJ8lB/ebNCgWpaP3vCYod9Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:24 +0100
Subject: [PATCH v2 29/56] sdk-manual/appendix-obtain.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-29-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=869;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=X/BIoiTT+/GGUoOER2zxv1EWsJPMSLwH5jZVnADstus=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUCKAqa4knJaS632tunDkzHOPhFSRA2xvjC4
 NndpciWTYyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AgAKCRDRgEFAKaOo
 Nv+eD/9Ingtfh8ZkTUaJbZl/+hdeU91cD4sCve1wxu7TJi3mmuCKUTgDt8YwyRv1BFw9Pc5MdYu
 gJ0ic5B5WMWKNl0HtLufAqIXgpxtvdrMxMh9Ff29QeB/Of0sw3QBZaWLTofW2M4aTFOWuI9HxVu
 DsmDyFRWNuO/08ZrgLvWi/T2S56vTLTPOpFiOVtKzj8/RjGiPnoFy/HeRoXiX5js9HyR5Z/tDb8
 RTDCtlWWWLlrxP7ANXM+FaHkHxo1GBIVXh83ccTtFU3aQnG9cVLiVR5Ky2B4++tMc2KH/LT6rpj
 bRjTcOJgCZIH6ohiowc2sWgHaF66vIKfiOraTeUj5lfPI9waN1EPVBypAYiU03Q1vv/7Qs8vemz
 KVEIkBUISNxlIIeYI4RHE5Sqi1VPN6nYlaivAGqRxCC02Qb6Tow4bgeZKjL95BK+LIDBDS7re43
 j6qpKSoCSPuSwjCkSGgS9wCkxfNXOC1mYYQPc3aeTy8f9LO75eO/QniiBZkb1zJJ0SvjVE18Xh4
 xi1Jk4QXYQgNNMS/wDHlXazhmW9p+1UfxWmY7we76pCZgLf3fwtWHoRHb7sM8vGnpUbqMAMFx/A
 4XZVVWWQqnLtxOA392pMcr3kTPt0ezKJfGc5qavY0BoQvvTGunT9yzMUaWolwqj2ETy3tY+T2iB
 ZmDwJGAYbEbO1fA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8690

Rename the source directory to project, as specified in its new
definition in terms.rst.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/appendix-obtain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/appendix-obtain.rst b/documentation/sdk-manual/appendix-obtain.rst
index fb2326fac..a6f2da052 100644
--- a/documentation/sdk-manual/appendix-obtain.rst
+++ b/documentation/sdk-manual/appendix-obtain.rst
@@ -166,7 +166,7 @@ build the SDK installer. Follow these steps:
 
    .. code-block:: console
 
-      $ cd poky/build/tmp/deploy/sdk
+      $ cd bitbake-builds/build/tmp/deploy/sdk
       $ ./poky-glibc-x86_64-core-image-sato-core2-64-toolchain-ext-&DISTRO;.sh
 
    During execution of the script, you choose the root location for the

-- 
2.52.0


