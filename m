Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D6ECA6CB8
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6060.1769501989179240084
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VZd9zLJ7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AEA971A2A6B
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 85FB3606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2D51119A8685;
	Tue, 27 Jan 2026 09:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oyjzWFwxOFwXDJCyHWuSLkynDOU/YQHZZGmDhz6J+ls=;
	b=VZd9zLJ74lvp86AnLuqyGBPpub969sCcRmN5PjFfgwAkrF9c+JnpOrHmFYa3NQa1DZx/yQ
	TLMoy2lsc/RyoowL0cdcoRTxTMRKoYKqqMz+MdP7aTCBrUEPWWXDjSoC5vzhNfS4bq6DgK
	eI8iUNRf9sOeAfTlX73KT1nFQqon5gwwQiTCNFDsMd5xCuGchj84j3+naKFWIiumPKi02u
	Xo6uxjqsKsJRqrBC3Hb4d6Op7I+7bRZP4OXfX5BZ7Ar1xOYe/ACreCHbSU4OLS5YX3Bxah
	8YUja/NnnDxxzuWbpwhs6J6Bp1L7QFMIMwc23pK+WOHbW0gZ6/V5QwUJln9+Hg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:32 +0100
Subject: [PATCH v2 37/56]
 dev-manual/custom-template-configuration-directory.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-37-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fHbzqqSx0z6x0a+wmezvdHMmGxUQ+QlxRKc0x+UPFCk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUEx+E5gCF5uBW1wQMyLjwwOZ9C8lXiPzH59
 9FdHmSunXeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BAAKCRDRgEFAKaOo
 Np6lD/9BJbBJwJSO7u9u/Bp9gcrw8j+OfFLlyOxi3H7f8RmdZeXazDRmp4A/zlxCrf03yd9i/QC
 lgwYw7GKVMmtH+JdBZdi20HnXDulqe56fkudV5qL/fkJeIHKyE6mLGfAwJnrTGX1c0U+X5nsxc/
 6j1Rp+/COeCGJjcUdeEqf8jn3ydS99+cUdZKf+sc4uapOfx1Uki7OMKkuSEazZqTFugccbTkRHH
 sbxHVazzFQIkf/hn35CXH0X3dMEOkdFDRp7Goqp6p+ASqCFTtSiSImCqR1jp3Q7N4d8XpYY3P5a
 vg1mWGxU/nguVYNVu6FtoF8jrd5yAk2MwDlDGSjAdwMT+6K62ergWyCsvCo40RSjp+0B7/mHXl/
 HRLnx9hiSVzYG761461pyH2HNfxVvRUgUth5pPFB6uZad/+6g7EAiKnneDLcrqAneeVKgarsnkI
 Yb9H1QfC+iuZON3fM+qyznaahiOcic9N7SKwjPF7hCpBIDG/pXM3SsYaz3ly3J9eRxqqt1fqHMu
 2Xpb9abANUgd1XtFI+3qZuY7G0B+APepgao01wfFAkJzby9HPfWRaaiczkGI2D155DuJi7G356C
 YlXQo1DwpM42Bvfsu2+VBTDhj6oK/u/5SMbbb99gGON+9EQ2bLjg9K+j4Q+sqCMDWuoe6oQY6N9
 6s5ytcpLewFLfSw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8698

Refresh the document now that the Poky repository is obsolete. Adapt
paths to match to encouraged Source Directory layout.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../dev-manual/custom-template-configuration-directory.rst        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/custom-template-configuration-directory.rst b/documentation/dev-manual/custom-template-configuration-directory.rst
index 06fcada822..8bf763569d 100644
--- a/documentation/dev-manual/custom-template-configuration-directory.rst
+++ b/documentation/dev-manual/custom-template-configuration-directory.rst
@@ -15,10 +15,10 @@ This can be done by using ``bitbake-layers save-build-conf``::
 
    $ bitbake-layers save-build-conf ../../meta-alex/ test-1
    NOTE: Starting bitbake server...
-   NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
-   Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
+   NOTE: Configuration template placed into /srv/bitbake-builds/layers/meta-alex/conf/templates/test-1
+   Please review the files in there, and particularly provide a configuration description in /srv/bitbake-builds/meta-alex/conf/templates/test-1/conf-notes.txt
    You can try out the configuration with
-   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
+   TEMPLATECONF=/srv/bitbake-builds/layers/meta-alex/conf/templates/test-1 . /srv/bitbake-builds/layers/openembedded-core/oe-init-build-env build-try-test-1
 
 The above command takes the config files from the currently active :term:`Build Directory` under ``conf``,
 replaces site-specific paths in ``bblayers.conf`` with ``##OECORE##``-relative paths, and copies
@@ -27,7 +27,7 @@ the config files into a specified layer under a specified template name.
 To use those saved templates as a starting point for a build, users should point
 to one of them with :term:`TEMPLATECONF` environment variable::
 
-   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
+   TEMPLATECONF=/srv/bitbake-builds/layers/meta-alex/conf/templates/test-1 . /srv/bitbake-builds/layers/openembedded-core/oe-init-build-env build-try-test-1
 
 The OpenEmbedded build system uses the environment variable
 :term:`TEMPLATECONF` to locate the directory from which it gathers

-- 
2.52.0


