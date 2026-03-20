Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C981F108B8F9
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9791.1774003590355412464
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EoM9vlVT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AD431C415B5
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51352600E0
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98F5710450B98;
	Fri, 20 Mar 2026 11:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t5a6f9ojVkCrrz/82+mQLoYeTi/gksIkhVjHkV8xpFc=;
	b=EoM9vlVTPDFr4KixxvyRDYOrmylMcYlyJZ0HQiYf2YcYVob2U0VF/aFGDLmDg2sjkTPkYC
	jgI54n++pbifgyLC6Z4ZkcpvvIphYk+9xRk5g9PkF3miU0E7HO7u6gEBYokjQ0Vtw3bLIK
	EfiHCfS1JIS/NkNPcNm9Cgkz4ocpApoBCjSwW5U1DYbZsXAXyVsIQDIeK6Mptr7cxKF+5h
	9DzCqNsMQK471RshU+s0OlZ6MksujECam9c4aZREJEifAMLkPCKEtTxq2dbjOv71/E77wR
	9cxDyXEMlbSjPXJBk0g7raBdezmSx+TlinphiCyEiHVpYywlSkwOhnUcFW+3RQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:19 +0100
Subject: [PATCH v2 1/8] conf.py: define new {oecore,bitbake,meta_yocto}_rev
 roles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-release-notes-6-0-v2-1-1bdb1eb142ae@bootlin.com>
References: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
In-Reply-To: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=lav31AhcMq1mKaDGqlScRaB+YgdtUSs4i2I/SYUEDj4=;
 b=owEBbAKT/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWBnoZ/1ArH8gTZAkeLLA3IScEYB1MWQDaJQ
 7NGEBKpfb+JAjIEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lgQAKCRDRgEFAKaOo
 NrWvD/jia5IeDRLrDgTzwbZcLJmmwRTP7jjkCMIf0O5SS+y1R+964cviAWOqlgyq8mmlWWN7n+W
 M63R6E0va1ZAovsSC7gyw9xtyn2PrVbPkKe+BJKcGPIDvlenYHwiXHLWgcvseB8h4wbZhhW9vsT
 WiTaW5nFGm6VVr0Prhyi75Vl/9EYqJ5fgz/QiyKnuIMV4XRv8KkruIYywjaMn4y8d66Yihrbj/6
 Vp07PPWHPaZl6VlNO+8WxldSXuyhPahg5rVDCAFAb+YOlEdeXC004PPMfthVBUPKW6IUp2ZKPm2
 aBu9TObC50GplPFoa2hGWHM4OgYeiI7F8vUNInkR/wLFmyV+nA0qSYMxKGqc0qzpfeGF87viTqI
 WOU8GqEoU0gCVzkW8EXa6K7T6WbU81ubSeZ6rJqoTBjFo5BKHr6FUjEsl0rNB5eV2vsp36DLhT/
 hrBWKjX/VM6gYCUtw3hraKK3fN4IjdJJaxiNUuZNCfG+GDHWFUcBd1OutOtjbOBvodgZPUFEdWX
 F5NgYxmO8Mzei/7v6yq4LjjMme973qtEjVjAruBvYKwHfdk7x+5vWHzUQhnP9ecE4nsCuM0hHEq
 vd9aSQtZi0B3KWzowZe6gZa16KWV/ASfES/Ad0b+AmH8Jd1VyDs82nOIs6QuBoM4k1Wl93XfwWu
 EmQrjiUG0PM6F
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9102

Use the extlinks extension to create new roles to quickly reference a
commit from openembedded-core, bitbake, or meta-yocto.

For example, use as: :oecore_rev:`437e0419608e`.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 5a69977cf..2b9f6e568 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -91,9 +91,17 @@ rst_prolog = """
 .. |author| replace:: %s
 """ % (project, copyright, author)
 
+# base url definitions
+oe_git_server = "https://git.openembedded.org"
+oecore_git = f"{oe_git_server}/openembedded-core"
+bitbake_git = f"{oe_git_server}/bitbake"
+yocto_git_server = "https://git.yoctoproject.org"
+meta_yocto = f"{yocto_git_server}/meta-yocto"
+
 # external links and substitutions
 extlinks = {
-    'bitbake_git': ('https://git.openembedded.org/bitbake%s', None),
+    'bitbake_git': (f'{bitbake_git}%s', None),
+    'bitbake_rev': (f'{bitbake_git}/commit/?id=%s', '%s'),
     'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
@@ -103,11 +111,13 @@ extlinks = {
     'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
     'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
-    'yocto_git': ('https://git.yoctoproject.org%s', None),
+    'yocto_git': (f'{yocto_git_server}%s', None),
+    'meta_yocto_rev': (f'{meta_yocto}/commit/?id=%s', '%s'),
     'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
-    'oe_git': ('https://git.openembedded.org%s', None),
+    'oe_git': (f'{oe_git_server}%s', None),
+    'oecore_rev': (f'{oecore_git}/commit/?id=%s', '%s'),
     'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
     'oe_layerindex': ('https://layers.openembedded.org%s', None),
     'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),

-- 
2.53.0


