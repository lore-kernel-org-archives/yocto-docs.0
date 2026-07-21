Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A4CC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 12:18:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21228.1784636288851625595
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 05:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oxPLdVZP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 375701A1136
	for <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D3D160368
	for <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06AE511BD0ADC;
	Tue, 21 Jul 2026 14:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784636286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UhjmS1vGwrrIrJOhl+4m37DRJC7JagoCSFbyY2zugiE=;
	b=oxPLdVZPbd/5bhghZRG3/hCIEIp96MpVPVlpOkllZlcIJzzAxak70SMj8z/l714ylTNBS4
	zcfOlrOitqDdzJ7Kl5zlPVdY1NmVzZ6IvQm4zR1jLc9NeW86OyxqMJ5ZxSTJxSBN6aB6gi
	omnIlWDpMgMOTPT92vfwTdVRIKFYogEwshSACpJ9VpiwBiykKxdK0u/GAIy5YfcPyqCkDV
	sKOWIop6KL/XPFJeur2vdQrr8lX0MakbgGgjznrivkwIiLf3+ldwHsY6hctAL3B72fT3H4
	nckrHcWyQZ/qtMyZPm07drpV915qkMtsQv5Q71cfCaAaMtX/iQehvv637IH3jQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 21 Jul 2026 14:17:53 +0200
Subject: [PATCH v2 1/3] conf.py: add linkcheck builder exclusions for
 frequent links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-linkcheck-v2-1-32d93e054c50@bootlin.com>
References: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
In-Reply-To: <20260721-linkcheck-v2-0-32d93e054c50@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2733;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5pE9xZtaN4PE2ayjPQMt1ajcTPK9KL5rTKaVDsElORA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqX2N8ZMvZ2KXkT3tlfGbJwOEgq+7BV6DSwbVEg
 rZo3GSSVLyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCal9jfAAKCRDRgEFAKaOo
 NvSbD/4gPH6RFO1EqIEm/eRTp9jmErma3FlxV/kuGQkjjEhkcmDSkVKnWDUq5gPFlS8/uoYYZpW
 K0tkkSdFUXhc5SyY8RQnu+6XiqJu38xRATx9JxqTW+PadjDWd+lWVWrRe7nQE1j67m3srssXGLK
 6nfDZWGM2E0IvNhnfeFPMq0m17kV8IoCy3MH360IshqApRTTqeXSm0a7mZZdzRDje7cTgfXROmw
 i5+WJlTkzc5hpGAg7GCjK9MkYFj6sGCQxMmgogFskDKY3kDuu70aL9dCBZY2CI0PdrdLQ7y/C4t
 /7M0lIqzm3jIr8kuPvWtaDQjWZuIWDBfx6uMbfFjq64Ce9ivAe3Akn0yup0MVBKdrLiOpvczcA4
 /ZOXDyMy84ENakRwyLDFlHWbJqNmv+CcFSzuGGWF9LCQjxTFicM+L60A+9Eg+kcv5TgsViomUQA
 JWyY2s3yQKCsWQmX24kzY4Sc5bVpgOtbdus+Ip2tqwS+ZG2s4nP9vxw56BYWgzLRTXeppzjxdX2
 nkqChWIBsNvz/8vqolZ+XCa0HKbLQvN1HR5NyOghbBdhSHaxV5YR4wb2SKbEGsof9iebMMZBrKj
 Gj9xEG5kd8QZ+LTC454yamCUzEyTRDvQiQGA4ubcyfu2yHryOXlU2u0+zHH6JCNa5hGvV4uCrZV
 nE4DhKobVvr80LQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 12:18:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10102

The linkcheck builder can be used to scout for broken links. By looking at
the output of:

  grep -E -r --no-filename -o 'href="http.://[^/"]+' | sort | uniq -c | sort -nr

from the HTML output directory, exclude links that are too frequent.

Remove docs.yoctoproject.org links are those should already be
validated when building the documentation, and add a LINKCHECK_NOT_NICE
env variable that can be set to check for those links anyway.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/README  | 14 ++++++++++++++
 documentation/conf.py | 17 +++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/documentation/README b/documentation/README
index 326930932..39835f014 100644
--- a/documentation/README
+++ b/documentation/README
@@ -163,6 +163,20 @@ or directories:
   $ make sphinx-lint SPHINXLINTDOCS="<file1> <file2>"
   $ make sphinx-lint SPHINXLINTDOCS=<dir>
 
+Checking for broken links in the Yocto Project documentation
+============================================================
+
+To scout for broken links, the "linkcheck" builder from Sphinx can be used with
+the following command:
+
+  $ make linkcheck
+
+The builder is already configured in conf.py to exclude the links that are too
+frequent in the documentation. You can enable linkcheck for these links by
+setting the LINKCHECK_NOT_NICE environment variable to "1":
+
+  $ LINKCHECK_NOT_NICE=1 make linkcheck
+
 Sphinx theme and CSS customization
 ==================================
 
diff --git a/documentation/conf.py b/documentation/conf.py
index 7b201ebd6..8b50656bf 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -143,6 +143,23 @@ suppress_warnings = ['epub.unknown_project_files']
 # sphinx-copybutton configuration
 copybutton_prompt_text = "$ "
 
+# Don't check self-references to yocto-docs since they are already
+# checked when building.
+linkcheck_ignore = [r'https?://docs\.yoctoproject\.org.*']
+
+# When using the linkcheck builder, ignore the following links which are too
+# frequent in the docs, unless the LINKCHECK_NOT_NICE environment variable is set
+# to 1.
+if os.environ.get('LINKCHECK_NOT_NICE') != "1":
+    linkcheck_ignore.extend([
+        r'https?://nvd\.nist\.gov.*',
+        r'https?://git\.yoctoproject\.org.*',
+        r'https?://git\.openembedded\.org.*',
+        r'https?://downloads\.yoctoproject\.org.*',
+        r'https?://mirrors\.kernel\.org.*',
+        r'https?://mirrors\.edge\.kernel\.org.*',
+    ])
+
 # -- Options for HTML output -------------------------------------------------
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for

-- 
2.55.0


