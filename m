Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBB3F9EDE7
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83717.1776867782830688669
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rDhr2HTg;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B4F0FC5C3CC
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0EEE5FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07A44104609BF;
	Wed, 22 Apr 2026 16:22:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XU8Qs5XWV/JREQahezDlQlytkDCKzj+QOrmRbTiXYZ8=;
	b=rDhr2HTgIF1gHszy9twOyrZBvGtHc+e4xlHuNZFcud9je9Jjt5zzCppNS6vmybJpGWrzje
	3peB1sVXmeOKjieV6eqH422z0+ot2YeZ4aq6tv4k7XbpaT0tGYGSCRSmaEc8OZcpUbhpuH
	zoQn6696SSANPuf7wrdCbxT8gJRx72uGcV2nLKr/KQlK1QCTu9UmYaKImnwgN33dj038F7
	DiogU2S0UEbylSmJXSpRaDMicvSM56a9jrOXhmoc143yAnog43D/nX7njY++yL15bxVJ91
	BnJn7llrWSybIiJ6wmgfN3gQJ+rMFiUfbO5vqe4F7nkgRSCdPYCcLtG5XzaixA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:45 +0200
Subject: [PATCH 12/16] migration-guides/release-notes-6.0.rst: add license
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-12-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1996;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3zLyMX3uyWzuGHr9edvy5AbFf/HnkrdT8ddr5CKQ5nk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm6OS4zu5zT73hFLb+STtbJLCQVhUqQD30Kb
 J4kAvj43oqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZugAKCRDRgEFAKaOo
 NgcXD/92ONjIP/eiTMiy+2ftBM9ZLKK22zS8KI0Gjphb1mORJN5qxClj0wss0wBS7BmR4FjCEIZ
 2qm9X+OMkPZGgH2W5yAQQIjswZHem02iUcjb799TJhzscNF9tPowzpzQclw9Snw6PVue6FgTf7Z
 heMz5qOmBG0e1YVMCWzEkj9IqQhkG3If1K7vLoI017oBAI+ZhgwK06tWYkdGca2Z8AGZ1F1XRNv
 FU4hmnbhA9ZLhrTMqyM7Heu+3orvfcgfNPi1RTSq3RL327OG8SrUNNcIkay5wrrmdTFnlwqS+lY
 L30wAjP9PHKlc3M4oKy/R3LdOk/kviud1LFJRsFWrvUcZDJ8vsO7ljqBk3T17yEYpOBEN2aZtzE
 2e1/mNpnKLjPXR3fJ4s6ueA5CZWiTbQH1bGjjYaZAOBPeOSo7YFHEX51loXsizjaLI+w7crDfSy
 MMfp5Ln0jSyAGp8hOc9nWiLGZuOa9aIcgvSHiQYagPzS7tW7s52pLS3/0jHNe0o8Gj0JPJUEkYj
 /KWvurGEmzDMrDTWYIt+iJVVmXgtbbRnHdiz2FdbsfS2Cr7sStoH0Q0DK9RkjaYd5HVhTMEx7NE
 VTivVyIJoOOi4ObSZ4MaZAhJcGwK4ycPUg4lLmmA5nMNcMaGV7QUXjQI4DXAFI0pVzj8bRFsh6W
 n6ou5eo+92mwC2A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9320

Add license changes between yocto-5.3 and 9a83f0878b6b ("busybox: fix
for CVE-2026-26157, CVE-2026-26158") on OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.0.rst         | 30 +++++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index c8b2c94cd..d8efd2e86 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -748,18 +748,40 @@ Known Issues in |yocto-ver|
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


