Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA777CCD183
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 07:34:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.2409.1759476855486057141
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 00:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Uizr6QFf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E3DA81A10C3
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 07:34:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFF1B60683
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 07:34:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0748E102F1C2F;
	Fri,  3 Oct 2025 09:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759476853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Es2Un7RtslQEXJZpVF7sB4nbHxhxHWOOY55f8kIRR7k=;
	b=Uizr6QFfmY496o25eiZWXjtbBwp2Zptu354gHNMfg3TpCAqscozFfVmhA0Qx8ozrimn9dY
	wNRjWEg3cOTBk4vHvMkoWndJGttZDuNgtCC/oUgOw4Sr3YfmRzrPJNMjnufpjKT/hFyQFg
	h+Hpr6KMDDBD6tEw6NZQMLfaAuSGYBuG0cd/EkL723CiTwVbZDzSsRswVjOoK4PtJm0cfi
	hzGIaf+/rYuR6hkvaY1VcHH2kqIWVT3Gs8OWhCHUqgl3lRmPp6hqBD0wgyCJBYEc9b6F2R
	L8zWejqnRQCEFeKDJcawrv0BtWLWut7Rnhpcd27IGEaLXR9lfkYrCKXMnjPlOg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Oct 2025 09:33:24 +0200
Subject: [PATCH 1/4] ref-manual/system-requirements.rst: update supported
 distributions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-update-tested-distros-v1-1-240e2da1af5e@bootlin.com>
References: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
In-Reply-To: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1403;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iudgpFOC9IYbjLg/czNGIJhE7AKUYEUKoW8pKt1soVs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo33xuYK7N7jGa0gRE0wMepGPGrFwNOZWyKjJUF
 jBBVDidcj+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaN98bgAKCRDRgEFAKaOo
 NhSvD/4jbBEKX/8bDbvEM4UxACdZgXynfSfg03BRhX8rNUEmsbF4Cfg344c8iSyV/nZS9ihtqrN
 0lnLu3dtJB34WNC5sI5IfEHgvWrTVOI7YEKqQ5sJoAAIWZRgxQjmYNimIDvIsTK36zRhvJMoNXt
 Lbcm0JvCpeOkjHLnVWmQ7DJCRtvJ5cVm7u3C5Nu0wK2bhoM71V0AgFnvVnqr7PPnJWvJCCKr34S
 UxvuCZEb7y6WgJz4QyanJn6AtzvE5LaPVtX+v5htD+v5q8pTryjIHhx0202u085Fj++fkl+29q5
 6mDD9UuDlcKGAkkpP69kmsYaeL836a8bzmg279M1WgwsnlOMTkKkyAq+3bydAs9DdHiYMyLqZZU
 pPqiMM6H6V9W7OGVs+bOF/dM8O55DRCAvNYV2v/e6drqcWmIl5LKckREVzFpjdxhTcYdiNTQ6dD
 onOg1b2fw7FGSBNp/JvGmZ6awk4lUrmWO366n808n2WfXkDrUk89K5ZLAHrmtp+UlElQl5Vif1q
 M/Cv0SrHijAbPgEi82sFIFB/UwaGXANRO/E9zVIuzhwmdiDbQmhx/lop686hl6BPtgl+0CIqyFo
 3QkDgPM55Urxc38rzJXWqWOV/FUIRr56mkBDFOn9oNMKJT89ycN32gzynVynEVfrq3147Otf/sQ
 f72Os8kcq2onO8A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 07:34:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7633

After 837a650aac17 ("poky: Update SANITY_TESTED_DISTROS") in meta-yocto.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0ea52ae95..fcefd6c7a 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -67,16 +67,18 @@ supported on the following distributions:
 -  CentOS Stream 9
 -  Debian GNU/Linux 11 (Bullseye)
 -  Debian GNU/Linux 12 (Bookworm)
+-  Debian GNU/Linux 13 (Trixie)
 -  Fedora 39
 -  Fedora 40
 -  Fedora 41
+-  Fedora 42
 -  OpenSUSE Leap 15.5
 -  OpenSUSE Leap 15.6
 -  Rocky Linux 8
 -  Rocky Linux 9
 -  Ubuntu 22.04 (LTS)
 -  Ubuntu 24.04 (LTS)
--  Ubuntu 24.10
+-  Ubuntu 25.04
 
 The following distribution versions are still tested, even though the
 organizations publishing them no longer make updates publicly available:
@@ -89,7 +91,6 @@ organizations publishing them no longer make updates publicly available:
 -  Fedora 39
 -  Fedora 40
 -  OpenSUSE Leap 15.5
--  Ubuntu 24.10
 
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has

-- 
2.51.0


