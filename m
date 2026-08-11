Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DB0C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:56:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50818.1786442169726421573
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 02:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1zgAnCDo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 104A74E411B4
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:56:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB0BF6033C
	for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:56:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E24511C4BE0E;
	Tue, 11 Aug 2026 11:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786442163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KyZH51o/j09IlCoWY+B+/H9fFtxx6Ll0f3Z5NLc0mj8=;
	b=1zgAnCDoTvGD3dpWpnR6rIq5nW9HX+rI39/OyNxIBTzVfzYbDsU6hDbp8lDxKHJ5AieXQK
	GsUspQ7c568ILBl2ZwykJrd1HS2GiFGn9AL58RA/kcazeKnBWCjTC0UDlv3OoA7k9S7Nc5
	vgA7D68t36zY5HCO2DRlZxMTphid87oxobOJ0MAvXoBwq2Pf/2UdIPPnK9HxypVkNQ9m+w
	wgQo2Y6YpFcfND6oRH6nW6egGDCby1+brf7qhXWlLx2mfHAyoSEVyyvAqxbjB1yP44IF45
	IkhKtVKWWntPhD1V1aVQO85yUpgHOf8HeKN8vo8kqgg9stk3iEa8SdVVSo3Cag==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Aug 2026 11:55:44 +0200
Subject: [PATCH 2/2] brief-yoctoprojectqs/index.rst: fix a replacement typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-bitbake-setup-pip-v1-2-0c8b350017e4@bootlin.com>
References: <20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com>
In-Reply-To: <20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=221m3/z+TQQNyyAthKrKVFl8y8TwTZqVoW8FBJvfZqs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqevGpENdQQG+smmk2/Pufn3oWpAxSDDkNDdX5f
 /yaoiqta82JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanrxqQAKCRDRgEFAKaOo
 NsmHEACIBVW7B62qKGWvtDdG3e59Bak81mnqElk/AClrlJgmV2//y2Irl6qg4LTIkebRq4bpdM/
 EhlsZAF3MPez1rT6+YiLL98wBQMDPgecuQBkD59PYl1pKOkzFlZRyNNkS5pG+Oy0DAJ5CGqZfTe
 c+1aOnuOZREjEOjD+xH9XIAeIimOnTud7e32zoFizyjZrfPcXwjkZq2qGpCwpvs72mgiUfFO8fk
 qc4z2cGmnyg9H/cwYUvyxb16YZMVYk7Yju+zq2CmG2xsM+sHjYF0B3j+m6/MPNZBH9Edowj2TVg
 uxif75NqdBOxFNHBW/qtxB65eISG0WzEZTVRs5X3iwbDt6yk995ugxSKd5j4qkl/lU+YlKAY27Q
 IZ8q8LUJuCeRRSkVBsSoZ6T5x3muZozzcjMvZct8WhZRjhhAqD/gz2pI1WPatqsLzIPJTkGJmgB
 T8tmBVc7UYvPqgNu4F8tL5bcRz7Ess2kavt8eg0ZZ4CPbSoauAA01sCZVvkAqEi5mED1N5BcGtI
 hPra2jnKYXmNYBkj8Sm3tsufrWxd3MNocSj7zYfG2OngsUTVrVMZhktHX/VaWlDBTvDZ+eSNbXw
 deC/3NpnywK9HwAkG9oicwc/52j2Z5M+V54Sj4jZAEl7qnGrLtnF07SY3EmrVEAjJbsuKb/ZkOe
 pS1ZGROZbHHbcbg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:56:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10259

These two replacements were missing the leading ";" which made them
appear with their name instead of resolved value.

Fixes: 34eafb89b1e4 ("brief-yoctoprojectqs/index.rst: refresh bitbake-setup outputs")
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 5ecc11791..9af18d744 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -138,9 +138,9 @@ differ from the examples below.
 
       Available Configuration Templates:
       1. oe-nodistro-master   OpenEmbedded - 'nodistro' basic configuration
-      2. oe-nodistro-&DISTRO_NAME_NO_CAP  OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
+      2. oe-nodistro-&DISTRO_NAME_NO_CAP;  OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
       3. poky-master          Poky - The Yocto Project testing distribution configurations and hardware test platforms
-      4. poky-&DISTRO_NAME_NO_CAP         Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
+      4. poky-&DISTRO_NAME_NO_CAP;         Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
 
       Please select one of the above configurations by its number: 3
 

-- 
2.55.0


