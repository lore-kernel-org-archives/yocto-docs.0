Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332EFC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:11:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41850.1789139492369599227
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nf4TrVqW;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B12591A01ED
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D400601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBB6A11C7AFAD;
	Fri, 11 Sep 2026 17:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JlIKjxK7wIcLiNyNP1E9D+447813tfZFcYkuTI2KBBU=;
	b=nf4TrVqWUB/WTrhfmTrF1siJicZb6UTlFmx5sLk14fUZYuiLQmMD7irBQCSAWrdhgV6K4J
	oYzzZxmXF6OJqxoNPHpU03Zz9qmCFdrponV7M6xrdeBamrEmYE42d/qUfjqWaYZLaTiy5G
	jmmgnTebNHfi9b5PmRM2p5tjKKaGJLputtJpquUUHmXwHS/IoIQAlc2kef3XLrvgeInXZv
	4XpCYlM7JG64vScoiCxd2KTSdD+OXewZUcrNvWrCpNQcMBypdSDDPvpomlnTbyqVboktTU
	5xdB8tWq22DYNCACPW2DpIy/Sf1jLLq6CzQxk/q2mlVPGILeXxUT2pW075mvWw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 17:11:07 +0200
Subject: [PATCH 1/8] ref-manual/terms.rst: Configuration File: precise
 machine conf files location
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-remove-local-conf-refs-v1-1-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EhEqGO5TOiZxkHHpm6A6OlUJZxdOsMxELPqL2zSV46M=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoVsxm6/m9rhmHFaWyYjHvdz7na79EtB/x+R
 rrRkjrfSASJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaFQAKCRDRgEFAKaOo
 NmuBD/0SDvgKKjEkIXDFd1TbzID7fX44grMAMtJvCMrMlF9wG0nQToc5/U1wq8F+Lh2TrrhEeHC
 pygVd2zMtolt+OVDAUEWgwIX0eWDgzvF8wd3Du343/f2vLm3o3k8skaGTIoRI010B0wKgaXLRs5
 FrO/cDH6dG1KCuPqzD0NBTIOgi+Sp3rEOgTfSbmHmOmsVoFz0t1AH3UflBlIXsMXeXGQreMViIU
 e3HtNBd1pZdnMr2rvoY6kJhj0vx1M2eFxc7CIt5ltaeeCKbCsrdZSn+MWEvkeesi7GySAKab9iG
 El5XSlcVTIBmLt53/pjmloVPGOFEsXfOPGho5btmmXJeD/5t/j4Wg7NUMML15KQWFHpDlsQAhPp
 jepctuwfxHuryFRCFF2Sn5oFKXhRIXaf/I6Gk9gAjlHq+MuGIIqvAbC3JEpcwArbshKu8gyCtad
 uvR2tr2Ewp485YFHK5WirMuNQnzaXHXdUlUtKK71vxMFdY3t1+4v6fzTT1ylcKPSjsdCKjJ0Bz5
 CbnmfOBQVErfkF7n19E6+Vm1++lEG0Jb5SU6R1mG5tcSLdjQwBV47KmPfi2pcgTjYKG5rGf9gs0
 yf6wdUD7AgbCKHl4/D9RG5YogJTPUsTXplwl2V8BlagrcC52p+Sq4uU+3z6FKJVvzdsVHyv6INh
 YatfA6mJzWjfkJQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10470

Machine configuration file are usually found in BSP layers, so let's say
that.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/terms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 022185f83..22cbc8002 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -200,8 +200,8 @@ universal, the list includes them just in case:
       contains user-defined variables that affect every build. The
       :file:`meta-poky/conf/distro/poky.conf` configuration file defines Yocto
       "distro" configuration variables used only when building with this
-      policy. Machine configuration files, which are located throughout the
-      :term:`Source Directory`, define variables for specific hardware and are
+      policy. Machine configuration files, which are located
+      :ref:`bsp-manual/bsp:BSP Layers>, define variables for specific hardware and are
       only used when building for that target (e.g. the
       :file:`machine/beaglebone.conf` configuration file defines variables for
       the Texas Instruments ARM Cortex-A8 development board).

-- 
2.55.0


