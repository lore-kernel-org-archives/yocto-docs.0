Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B23EC01B6
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 08:50:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12662.1774255824167839155
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 01:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=l1rVtuya;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B92D4E427AC
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73DE85FEF6
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D4FF103711D0;
	Mon, 23 Mar 2026 09:50:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774255821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qYbGJbhUeqlupeSKPzamgxLARSFy++8LX45g8R7LCSQ=;
	b=l1rVtuyao+CD69MwKSJ8Ro10bRBzdTB6/PkxwTjy7Zn73nQTVtU+UnjY/h0f0uQBggpvav
	F/voSdniUQMulv5sndhfNLaw+MI9FmEZh97zRZRzb2htRulOzEoZsz7YVWjYpX4fqYAkBr
	cTatz5pGkuZQs9IHHztSykvByDQK+mbneOCze5NNkNTIzH0gHGpEPTeX2vuQ/ShMwJrRzh
	4BXHMAmwDxOMFOfN70WSLUrTGQzt7Ia+sO0+FjKWVkOHEDeM50WlZl1cOL2FmgWrBlplFo
	W6DXALGYC7e4HY9z4NmbuXhgSEc/a0FjfTjlfD5eqTo+uZlUAx1u7OpD5b+5EA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Mar 2026 09:49:52 +0100
Subject: [PATCH v3 1/8] conf.py: define new {oecore,bitbake,meta_yocto}_rev
 roles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-release-notes-6-0-v3-1-844ec702f95b@bootlin.com>
References: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
In-Reply-To: <20260323-release-notes-6-0-v3-0-844ec702f95b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tEkOnNMaaRA7Y2WbjxPwOrhzLJIxMZq3x/xY4kcn0qw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpwP7KjqUsrC5JDleStL2SetHcpCXoTlFhV3ioS
 MMjRRoC0IaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCacD+ygAKCRDRgEFAKaOo
 NkGfEACH0iFxfylw1R6vdLHumqkzUURtuDz4GKC+NxNI16k8EkBK6sEBt7p5DbhvS6Nt/b+vYJa
 xE9m7o7N/z9vZLjwhGObuUpahty7oUGs06aMOFXRRmnD9AiszNOLJSuRY6VBBDvlFmpierv2jZr
 x6J5RwbsWKyEGW6qG4666CmWUN2O2BKFVitZQe53uZ0ZCMTo/VVVmG0YG2wZlj8ZFrmHwQ7SerT
 ArdkByYnrZXeaxCBcEa/BJ1LpNokfN4bCbUosEYj1/L1js9/Z5Q+tM55PwalN91vt3LTzisJTT4
 C6HhM1+lSa18yNxlfa2/LSvU1sXDqc11/YpJBtoXP3ZVnz2hqTECt8iEjiZH148J4syMQj5w9kH
 J84K6L6Ga280PSZvkxlnAF15uxSRfIJAvq88WjKzuQF6pmxeOynzilvmCUVdss7ANMGCbnLEAHA
 SoA+SM9cpfMlXT0w5LDoFVlpINcp8pM48HmcBPzoysMt8QE/JfHHGseLVAx2Uby09ZkkleadWga
 0f6ozkIqlHsFU6csicBcg1AHWGLnfFVcKV0nOUTBw1ElxCSl2huHGGICHpu6TIF0g2QNi54AU+7
 FghEk/Lu73YFUJSk887cgKXQ1Sy2Ebk/9woCYvx7qoypt+YJVCRHH/rIdRlQh17zD2Ec9MZ/fEX
 2+uVYsQ4VKiObvA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 08:50:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9113

Use the extlinks extension to create new roles to quickly reference a
commit from openembedded-core, bitbake, or meta-yocto.

For example, use as: :oecore_rev:`437e0419608e`.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 5a69977cf..31fa8346d 100644
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
+    'bitbake_rev': (f'{bitbake_git}/commit/?id=%s', '%.7s'),
     'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
@@ -103,11 +111,13 @@ extlinks = {
     'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
     'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
-    'yocto_git': ('https://git.yoctoproject.org%s', None),
+    'yocto_git': (f'{yocto_git_server}%s', None),
+    'meta_yocto_rev': (f'{meta_yocto}/commit/?id=%s', '%.7s'),
     'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
-    'oe_git': ('https://git.openembedded.org%s', None),
+    'oe_git': (f'{oe_git_server}%s', None),
+    'oecore_rev': (f'{oecore_git}/commit/?id=%s', '%.7s'),
     'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
     'oe_layerindex': ('https://layers.openembedded.org%s', None),
     'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),

-- 
2.53.0


