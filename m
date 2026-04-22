Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C75F9EDE4
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:22:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83810.1776867775834202294
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wZOMfesG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0BE94C5C3CC
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37D845FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C097104609C6;
	Wed, 22 Apr 2026 16:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O6ckvffa+LCbUaKIro7kuie7nMxCl4TgbFc1hGESM9Y=;
	b=wZOMfesGN17tS/XnDj0/WGFVO6BbpEBhZPNc/WiPeyc0I5ZAM/D83X+0dYkV3dq0XEHzJN
	lRYGMFie9OZeZgAUYtLxDVy7vDh47eAgb/2l40evqhuSs+F7MiWlf+8LJGZjyaabIKbErC
	3KCBwIrxqgeGF0LuxiwMcVHo6ISWrvqUFjSGgTOLAivLX3+9RHw7pp3X7S+ZcCE+mcpY+K
	Zc2Oc/jxYE6dABO2QFNfMLrUOouLTNs2TQskZTiHMlwbG19rPhF2F8TmrKWSeRO8znzjuu
	szhhxysPa0H81sXOB7iXjiztVpIBwLEL3Xs3me77LaLJLPHFS9JGHJRSY9VndQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:34 +0200
Subject: [PATCH 01/16] conf.py: add a :yocto_bug: role
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-1-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LxribSozarWQvOeJGL5XUBnkbKKqypE6riNsa6hLax0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm34BunwrER4BpHMfJyeB3DKkLucY96jTnpg
 Ky83ngg5iyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZtwAKCRDRgEFAKaOo
 Nl17EACP1ChcWPHfnTLL48GrV8eEvt7U/XBkONiKPa4P3gSTnou4zn7N1h7gPqcoZKRJZpd6uyi
 U0rYKgUCSoSbVEzW1SOIDwADIMtrXxUonU89284OQ+YFvFWJOdRm2OnkBwtdMy/oI5OL6nP93OZ
 TtT0xXcHVrzZ0RKUvJmQfDw6emJv0sbHagF45eqY+Sgc44JoAr7nCS2w2Vu4s2/oB4t8LI7igT0
 Mu9DHF12rC2jg34o8bJzwZgqWHLvp8tDCuetmLmbZB4Ff4jW3Dg/5fJ1iuKMOo6lwbZzq9YyJUW
 8y30H5TEbliryOIWY8ayfUCrwG/t8pBQcE/4UavioC6ZCzYKIzzIDo1z5ErnCphyI0LMspXWIXP
 uWYNkSQtb4Xv/DYS2qrzmqYLaCxljEv3PVCkHqdq7GA7nUGjtmGc3Qa5lyfpQ4pwJUbRO5/7uLB
 HYRfbXICoQl6AwaEniibddCsW/76xeNImVLvpi+C8l4G5jOKd6NTlR16HAq58V8Wh75rTcFP254
 2x/5tdlx9AG3AGwOZMJWt63J6MWNWdaK6Xz5TMH/Xc+8IkAYujGztZKXKVkefXfl1yyaXd8mdst
 FdOsXD/YLMT0MkoFATqxuy+X8b7wlna0TL19G//EXcL4AGG6zrob2egz2FERrEi/99TBPtj/wxN
 COWGPg+gfT7ZJZQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9311

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


