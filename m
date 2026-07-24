Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F372AC53219
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:25:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19197.1784899519110229588
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ileOhb0r;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 756E71A11E7
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40C3760395
	for <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 208C511C124E7;
	Fri, 24 Jul 2026 15:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bsHY7Ot9guhzC0i5ZGMMVq1T1UY/eosmNLIb5NxLquk=;
	b=ileOhb0rtLvhW5e4eKVyihdnpxtTHG5+NUNcYHOeXLKzJGErh8RNj+s1axUfbC4OhkgWFV
	y+dDCPfimVfCKwJwUI/efJMeW/cZ44ueM9rm1zuwAQlR6fJm1ncaJAGq4VwJ/J7ou9zTKc
	oC7aL/ROilgRiVYfz1qVZXLiNQELiJt8vhOzFb4GXI9k6LYzAsYSjozk8c7sgbPPGEmKnA
	wKbqtLzqSt1rEYC+i1fPcFFL9A2Y8C32TPkIyIO8XogEZI8ZIXEi1xOFMN0JOZ2z+ca4Lg
	p1W65yNezwQo5i02H46L3C7Vx3mlzHhpDbfswgZhizDBj56lOSZG0VK6hwgudQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Jul 2026 15:25:06 +0200
Subject: [PATCH 9/9] index.rst: move release notes in their own section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rework-welcome-page-v1-9-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8WLfurY243bEnw/LAw3bpBjNczo2SE7CPKo1Mn3S9qw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqY2ez6EjEioZLnphYwfhv7znW0Lhhm3l5YwMK6
 n20XY49bYKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamNnswAKCRDRgEFAKaOo
 NviqD/9r+5RxwdIwN8VatinzsqlhegyzB0An5FvUtNvSYeInsKIvxkKiIORQMQ4/4RYzeEMlS8m
 2hMR4//o+dTzllpcZhpg26c2uIy2MP12Q70tOo48Z8hXG/MgrqbMcyB4f81GnyDklrHtcYuXJFw
 ZqhAROYrca7XrVcZLgrL/hCgv7r8zAFXuVtXa1thq8pr55gD8WcJog6JmSe2lkDz7wfXLCHjaoS
 Z3kw/ETAucSJmFnd+u1XoLOMNBCiiSaGRqREbwa33J+vJAsLfgoz7rId7azzPQ6RXt799yupweF
 84my1yeePVK9PfsFgQbdzO4qNgGe7H8x8JeG/IbqRNlB1d1VVcfZzSqsiDJrSI7sac3jETDHgo0
 tfJmsng9IVYxadxzxI1mwhcCanwcn6bAji7fQ4m2JYFI8L7YhySVjUmOzuAtsFVRwdGDyf/L/d0
 gYdWA2NU8CTtuiBTHQ/Krpys0JcE0xfxak9ej5/EipmNqPo5dWC+3ntueIgZgc4uj5I0tRam7id
 jhscDNIIIQtpJN37wYL4OguXYSjml3xEYM8HIfm3FakPXQywpRwYL14wsEeIk/yt8p9S0gBUVQV
 rrx8u05Mz6yo72W5Qf/AVsnMLrTmGzoPkIeZvOAFOoHnopWRRHN5VJtfmQLBSBYnO0MU/Ak7pRy
 DYWXHwGmvynKD5g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:25:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10137

The release notes are currently hidden in the welcome page, under the
"Release Manuals" section, but these changelogs/migration guides are not
release manuals per say. Move them out of the "Release Manuals" section
under their own "Release Information" section, and make them appear as a
"Release Notes and Migration Guides" section in the welcome page.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/documentation/index.rst b/documentation/index.rst
index c1b577fa2..afabb6615 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -83,12 +83,22 @@ Security-related processes and contact information for vulnerability reporting.
 
    Yocto Project Security Reference <security-reference/index>
 
+Release Information
+===================
+
+Release notes and migration guides for the different Yocto Project releases.
+
+.. toctree::
+   :maxdepth: 2
+   :caption: Release Information
+
+   Release Notes and Migration Guides <migration-guides/index>
+
 .. toctree::
    :maxdepth: 1
    :caption: Release Manuals
    :hidden:
 
-   Release Information <migration-guides/index>
    releases
 
 .. toctree::

-- 
2.55.0


