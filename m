Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D20DC61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 09:50:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2826.1787910601210931798
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 02:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MVO2mZGp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8D0174E413FD
	for <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:49:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62F0E60537
	for <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:49:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C30CC11C78176;
	Fri, 28 Aug 2026 11:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787910595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kqu1fW6cCyqn4SKvI3SkEGEj/bUihpqJ/ZNQmhK+HME=;
	b=MVO2mZGpLKhsjxlI5YzWujJWhaOuf9UcYtU31v3iwb3YvFKUIpT3uWPJ0omtiFRmJNakaz
	1IdqOp30Hif3f2hqBXNnuEa+lufGCH+6Bb6CUTfS+Qh2R4J3bTk/3Ceoprfm2zrw/7JtTp
	8FQyXpme/5AhuPnQelaNCNNm6DZJIXf7YwAAIU3vnzT63Mf7UG+zg7owOWqwUBXNYzikIa
	20ytPBz+q/sCr3eg3qrXPKZ5b4BzxVz/Vz+r3swRCA4MbYOrpziHTX7nj73UM1BozPgxsS
	BUXTaYbRF8wbgTk0k/YQj9BepyawHHr2COJsTr/bZmm6bvO2MpzjzeikYXifNA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Aug 2026 11:49:35 +0200
Subject: [PATCH 2/3] conf.py: use importlib to check that sphinx_rtd_theme
 exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-cleanup-conf-py-v1-2-c8925e5fe1ac@bootlin.com>
References: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
In-Reply-To: <20260828-cleanup-conf-py-v1-0-c8925e5fe1ac@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=GbfJ5HSoGKKgpEC7BHDlvip7tTzMsWIVqHb+hZ5KzVY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqkVm5PN8zphW6K+oUC7oTfbD+gLnoREpKj1UAs
 gwWCJ3ILoGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCapFZuQAKCRDRgEFAKaOo
 NggREAC0IRZxMQ0rmOKrHlsgwthygsNrkHA1Bx9yrJ0ad6PVsJUzlSWPxq73G3weL+IpPP2XgQ1
 foa92v+SjOCFIycYCNQ+xuWj1sFCpOnAAxRchv/cEfmkRnnrsNZSje3kjHKC3HbD4S0bp34M09a
 O4jZtdYkdWiLbuIg+TPn4vetspl8xid5vM/QMKFG/J6zkoIsD9rtGtUrliIaTPhYQBn7heWZWsr
 PYyvTvh6zhrqc9wJAZ+mmQtBcIKL+Fn9IKEyjtkkOz1e6V2ABVtdVDfJbmvW5kx4sBKQHXUNoNf
 z1snaWeka9AN3sfCrE8mLJTrpIsmiicttazS/+Y21LQrlTspB+mA6wb+GIWwZAIf2R+AihMtEg6
 qrTCA8FqO7szIdY4vEGnhdbY8Pugc9zhVpcXxICdRr4ssjr1aum8RTc3PtqvD2XwWZywNqNHJrb
 CeZ7HA+/qc7u7CsxJ7lpKXQPfa8HdNTZvnEOh05VniUONWeTgszQKxbv9Jln8a09pYhftCfEgbX
 +A+dHKk50O57fC/V5QuzEHDBhofIpMbFnNgn+egLfUtQc9mOhPNMKRkjWvE5XpvCT9IC7sSj21a
 gzvXg/yGnpDeJcNILSyKugcWIPQAKy/jjTKtOz7+n/JuT36IKEx/h3Z8KhnnszDKLxC5fSmQdGF
 STzPqZK7/8qn5sw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Aug 2026 09:50:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10393

We don't need to import sphinx_rtd_theme in this file, only check if it
exists, so use importlib.util.find_spec() which is made for that.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 671bf537c..bd3a4e5bc 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -13,6 +13,7 @@
 # documentation root, use os.path.abspath to make it absolute, like shown here.
 
 import datetime
+import importlib.util
 import os
 import re
 import sys
@@ -169,18 +170,17 @@ if os.environ.get('LINKCHECK_NOT_NICE') != "1":
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for
 # a list of builtin themes.
-#
-try:
-    import sphinx_rtd_theme
-    html_theme = 'sphinx_rtd_theme'
-    html_theme_options = {
-        'sticky_navigation': False,
-    }
-except ImportError:
+
+if not importlib.util.find_spec('sphinx_rtd_theme'):
     sys.stderr.write("The Sphinx sphinx_rtd_theme HTML theme was not found.\
     \nPlease make sure to install the sphinx_rtd_theme Python package.\n")
     sys.exit(1)
 
+html_theme = 'sphinx_rtd_theme'
+html_theme_options = {
+    'sticky_navigation': False,
+}
+
 html_logo = 'sphinx-static/YoctoProject_Logo_RGB.jpg'
 html_favicon = 'sphinx-static/favicon.ico'
 

-- 
2.55.0


