Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D48CFAD41C
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:29:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16698.1777019344080183100
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2A+yuCNc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7F9F14E42AE9
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 561A4604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 165D410720737;
	Fri, 24 Apr 2026 10:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019341; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W7gUeNC+KbvvNSvy1CfVIWuHUff1DPtun+4ZeK1cLoY=;
	b=2A+yuCNcc6ad5jBgwpi1v1VxOoAIpPDfvxBBiS4oUOeIwm3Q4QgCfU0jyQPlJhY1ZBS9tc
	hHmUQtBw1+4X1h16FO1DcKRZj2QBkPpc5RIzok5x19F0HsDiuOfhbwzFqe6Hg2s1cOzRFd
	MNnLZIoHyp6VsSCKqkrrgytPC1FIPScfDliZEuSyo0ztx2/FH7IJra7zwMkL5rEu60a3Eh
	NRSUlnlmj4V8zUFgRS33Pmv0TfntfymekGcPIXLRFzGme5QiPOzkDxyn7JUWKRzipcxVza
	u3dpQme/j53pQA4Bc2V+/FztpYcU+99fcgIplG6OIXWZ8l6meaYv+JNXJmW46A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:41 +0200
Subject: [PATCH v2 13/18] migration-guides/release-notes-6.0.rst: add
 license changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-13-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/K0Wf70VvUPZwv9r6jRi1Eog/oF1wSubthwWPLZmmSQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym/cynTDfdnEd5vE635ITObIPz/BdRTT1Rkm
 QJPG4/6R5eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvwAKCRDRgEFAKaOo
 NssbD/9NV1JUhlL2mr38P2C1YJK/fYKsp1RsghQcoE6Nl6xFBx1rhKkEBH3zbu311iscyXiJ+wO
 z3MN36vrq16HKPnONI3eQS8BIGXcbX05U+P5SV5XUjE6oXJ7l+8ORZDmBoQ0q0kyvzjJBwjskUa
 5qFH+TJpNqInncrEaSfz4kOn1GRYLwxiPfCVvuDuLKazwVYj1ZcdZCFKpbEbE87WV8Hh3CL/yyJ
 JgtS0RRFAD+AVnq0KtRTrAgCmINIxZ7xJ70U79MTXSHzZLHvD6BojBhieot2uBuep2lHjdDE0Ao
 e5Mr4TecE9lF9dJ9Zl3lX9znFxYkPq4NSgkH7F/aF4Yab+fZXnu53Wh3U2JRrVkn4owBZzgfkTG
 BOIMF7AF2Mhwo2HJf01tNlM6v1bNEIlwGDo/V7HNqEEMpczEXOg8dwmOL67ribqZO8/262Q7Kj0
 zHefMo5c0t8HNy3610lDYYSS72hsNIMz2MIWwI1GEtZkW59IYj64/pqh5n/3g7xuZnxso2003jj
 5NPvvgYObGWVnRj1dSUJXZwsiUQfbUA9eJJiSCa5z9LQZ+zKF0cfkHygaK7ith/JFVNJLEsPFE4
 GRhX7WlVyOR1QkdrkkhSLuMgN4gCmLMCA5x9cBmYjquE3MCsW+bUDMXldH8vN+BIImH5cedoanu
 mSjyKIkskLUNuIA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:29:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9351

Add license changes between yocto-5.3 and 8751ec834211
("build-appliance-image: Update to whinlatter head revisions") on
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.0.rst         | 30 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index 524a1a199..16cd2a8e3 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -764,18 +764,40 @@ Known Issues in |yocto-ver|
 Recipe License changes in |yocto-ver|
 -------------------------------------
 
+..
+   Going through commits on OE-Core filtered by License-Update:
+   git log -U0 --patch --grep "License-Update:" yocto-5.3..origin/master
+
 The following changes have been made to the :term:`LICENSE` values set by recipes:
 
 .. list-table::
    :widths: 20 40 40
    :header-rows: 1
 
-   * - Recipe
-     - Previous value
-     - New value
-   * - ``recipe name``
+   * - Recipe(s)
      - Previous value
      - New value
+   * - ``libxcrypt-compat``, ``libxcrypt``
+     - ``LGPL-2.1-only``
+     - ``LGPL-2.1-only & 0BSD & BSD-3-Clause``
+   * - ``libpcre2``
+     - ``BSD-3-Clause``
+     - ``BSD-3-Clause & BSD-2-Clause & MIT``
+   * - ``libtest-fatal-perl``
+     - ``Artistic-1.0 | GPL-1.0-or-later``
+     - ``Artistic-1.0-Perl | GPL-1.0-or-later``
+   * - ``python3-cffi``
+     - ``MIT``
+     - ``MIT-0``
+   * - ``icu``
+     - ``ICU``
+     - ``ICU & MIT``
+   * - ``iso-code``
+     - ``LGPL-2.1-only``
+     - ``LGPL-2.1-or-later``
+   * - ``ruby``
+     - ``Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT``
+     - ``Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT | BSL-1.0 | Apache-2.0``
 
 Security Fixes in |yocto-ver|
 -----------------------------

-- 
2.53.0


