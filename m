Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA36FB44CF
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16686.1777019332614222874
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FMX5SN9Y;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9903A4E42AE9
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70A22604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B144310720735;
	Fri, 24 Apr 2026 10:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019330; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O6ckvffa+LCbUaKIro7kuie7nMxCl4TgbFc1hGESM9Y=;
	b=FMX5SN9YbDucEX9FM/8yZCwCqjB4PoVB32WpWZCeCyp20i3Mg9+D2kGPU6TqRlXBNkcKOc
	c0z8o8/8/cXUOWLF9C6wyfGA8LwiCdADTzcoWGDweOP3t9N7goaKTdfy7AMCY/eFhMmeyx
	NOPDm9MdlYzrVRyezdLLYBEWEfH1MPO6ZZtNAdtoUFwFlYCRWGlEmUSPevJyvJdxsAuJNe
	MrWwiyFYy7LstK9F7BuctsdxJTWxvD72lTI5y/d8vlrxFVGyZX8nULZTNaDyMvvYgQzclR
	rI25LFjzSNF6Cd7d7bkYMMllSDa3X11buWf5X2ih55KuLa9GDwUCHfFgcvOhyA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:29 +0200
Subject: [PATCH v2 01/18] conf.py: add a :yocto_bug: role
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-1-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LxribSozarWQvOeJGL5XUBnkbKKqypE6riNsa6hLax0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym9Wn5vfINGJDGlWDTpV7WYDQP/Oi4tmOiTh
 KNHt9li4RaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvQAKCRDRgEFAKaOo
 NiC3D/9Dvmps+2obNT0AkDy7cKqnv5lV7Ql/2oOD7IIi+0kmjFxoqxWhyeQb8Gz7IgQQOkNa640
 40ckeuE289Zt+XHbR6iphhPbHRoZBjhDcGCw36/e6vn+pRWxaCLWbW0bh56b2sVjn3pgshI7zUF
 /SPDZ4qZsE/UaFdVgiB/485TolzfpHiFOF0g82HMAujcJhxFVhh7G0XGNY8/D5TmNd4XH8e68hS
 MWZ77nPrg6J4e4Dwua1kvn3+hymA8ckoeur2Yj9XYTE0jpuBdb11nSVMweYf4PnHwLEzbmXtUP8
 eJbmyqOA/Re1O/sZ9E+wMK0MJApScFtLGNzgIEEracsfhBZqqfWByFmzvqdzrs7O8MW2J41dy/b
 kTY6HXClmSHsx7LRLGSP524brKvm4KH5iyZWIKwH7Sa6PslAmpU46TUK9hm+rBcIgoPaQG7Bq73
 cM9ZDTxWWQsb+YpSKaOan+GdtH7GqzCHD5PG1c1yK5ZLsqMGSw2H2cU4vgyK5ktcLV6gWS2dGQQ
 7DoyuAke2alo3x+OziVi01rnNHJb6IhlhQx17eXWnDbDWkYWJI9lRNbPSFeeVDpV411gJkXbWuT
 POsPLj4R5aTV0EUAN7QMVDIiT60MtIDzwIllcawtQCkbctYYwOGWrmOT7xN6EpsxoU3fc2mWDNK
 RKh7n15ykADelhw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9338

Similar to :yocto_bugs: but directly create a hyperlink to the bug
displayed with its identifier. Use as :yocto_bug:`12345`.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 58c6406f1..7b201ebd6 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -97,6 +97,7 @@ oecore_git = f"{oe_git_server}/openembedded-core"
 bitbake_git = f"{oe_git_server}/bitbake"
 yocto_git_server = "https://git.yoctoproject.org"
 meta_yocto_git = f"{yocto_git_server}/meta-yocto"
+bugzilla_server = "https://bugzilla.yoctoproject.org"
 
 # external links and substitutions
 extlinks = {
@@ -109,7 +110,8 @@ extlinks = {
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
     'yocto_lists': ('https://lists.yoctoproject.org%s', None),
-    'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
+    'yocto_bugs': (f'{bugzilla_server}%s', None),
+    'yocto_bug': (f'{bugzilla_server}/show_bug.cgi?id=%s', '%s'),
     'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
     'yocto_git': (f'{yocto_git_server}%s', None),

-- 
2.53.0


