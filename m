Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF35C624C2
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:38:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157025.1772444282015027846
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nbide9cD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 785DD4E424DA
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 468FE5FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:38:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8123E10369511;
	Mon,  2 Mar 2026 10:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772444279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HAE4y66lDSnIOuhAe5qO+E36bdOJzdLqHheqKzZCC1U=;
	b=nbide9cDobiuwwhlFNnxMkDz8HApcpqGJCknMb5CjWL/WiyATTEMjOsBweMyaDjM93N+xe
	X/hWskfFdoDyozOX5zmI7NXgVzzwxqmgVWLeAMKHCgibZQTXVH479xP+g6Rvy95RtDkxJP
	C/C1IXr85EkBL6bpXCtX8qivmGsTd3hu+DyCOh916+Z1IQWxZcSSf+9BAx3/RSyvdVeT8D
	1dKrjarrR0/v9Xihy7lUiEVrHxItjCtbZFOvhDQ7KBvsDysBj9nLAI9h5sjwQZDgRUDXWl
	d367RkDqfbT3RC5AStX4ckJv9xmSeVv926qU4bC7THEeOkWuhJwSBZXZl/APcQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Mar 2026 10:37:48 +0100
Subject: [PATCH 1/8] conf.py: define new {oecore,bitbake,meta_yocto}_rev
 roles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-release-notes-6-0-v1-1-9662dee58591@bootlin.com>
References: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
In-Reply-To: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WARAdrNx78pCI7jH/XtLTcGeP3B/Fa8n7gq6x6ey61E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppVp1GI2T+BE3unEOzgrnw/TGHsVLFjbFCNfXr
 YYdbVah7POJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaVadQAKCRDRgEFAKaOo
 NgxsEACYCYXMwc9mqA37LwbuZ+8KYQ35RJtg75A6nXRdkAV88rm6eGQB0lciHAJpiDt+JNQjENi
 nPq3Y3BMMyuNVkVfksjBDRPZFepxHsZ93WwyukXKT1MNJU/F+b/YKJwQt/hZYB7yBn6LqFTeL7+
 5tjZIkCQ90xV1qEr1uZmvAvPQDXAKzTWWF/A/+Wc//kAM1XkdMrAZbPmUndG6zKwPGzyK2JPx1c
 h1ird3In9YrPnyxxsKdub8Ruthm/rZr503/zjKGYay5GDxX42rOa0rUGXvD383AXvnp8+0jGqpo
 jILGaPjCcK55lVkqY3hZ0R2JOAnML+nBy8kcPPk11zLMwEtJjHW1Nl6Z3jp0Zo59S1n7iEQt8Kl
 ZutmHO3BfXwWLa7oBK5Me07nCyuiRPuGDMf6V8Kr4d3pSZcwHG3IoeJXIPsK/eU+t7Hy+fd/BcW
 tk+CGp9i8OVLxVOStzn7YRe4swXrrW8FxVuKb3dBoAmPzRHqXRK1XqsObis6gy+2xbWKVxW+2zC
 RaL8Pghh+Hbrn36ehhO5yEOduQL1/478/fWSx0+95fmk5E0NlNOUKr+WY8eLvOkAUl/3ApFkrS6
 JutsUxLATrnEg+WgceJCbkNl7fqbIrpKJrePrBsHQGbb6IQYixIkD0WzjdWaxh5VyRJwucselkv
 1186Sc/zSTN3s0Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:38:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9017

Use the extlinks extension to create new roles to quickly reference a
commit from openembedded-core, bitbake, or meta-yocto.

For example, use as: :oecore_rev:`437e0419608e`.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 5a69977cf..f3234b241 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -91,9 +91,17 @@ rst_prolog = """
 .. |author| replace:: %s
 """ % (project, copyright, author)
 
+# base url definitions
+oe_git_baseurl = "https://git.openembedded.org"
+oecore_git_baseurl = f"{oe_git_baseurl}/openembedded-core"
+bitbake_git_baseurl = f"{oe_git_baseurl}/bitbake"
+yocto_git_baseurl = "https://git.openembedded.org"
+meta_yocto_baseurl = f"{yocto_git_baseurl}/meta-yocto"
+
 # external links and substitutions
 extlinks = {
-    'bitbake_git': ('https://git.openembedded.org/bitbake%s', None),
+    'bitbake_git': (f'{bitbake_git_baseurl}%s', None),
+    'bitbake_rev': (f'{bitbake_git_baseurl}/commit/?id=%s', '%s'),
     'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
@@ -103,11 +111,13 @@ extlinks = {
     'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
     'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
     'yocto_docs': ('https://docs.yoctoproject.org%s', None),
-    'yocto_git': ('https://git.yoctoproject.org%s', None),
+    'yocto_git': (f'{yocto_git_baseurl}%s', None),
+    'meta_yocto_rev': (f'{meta_yocto_baseurl}/commit/?id=%s', '%s'),
     'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
-    'oe_git': ('https://git.openembedded.org%s', None),
+    'oe_git': (f'{oe_git_baseurl}%s', None),
+    'oecore_rev': (f'{oecore_git_baseurl}/commit/?id=%s', '%s'),
     'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
     'oe_layerindex': ('https://layers.openembedded.org%s', None),
     'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),

-- 
2.52.0


