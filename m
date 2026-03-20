Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA19108B8E9
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:09:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9396.1774001395990490113
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=loDC1CHh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0C6A4E4271E
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:09:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8142600E0;
	Fri, 20 Mar 2026 10:09:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 347D8104505AB;
	Fri, 20 Mar 2026 11:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774001393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=z1MZ36wV3zTMB30Ly6Y91P2s//rC5yK0VN3bPsiHX9s=;
	b=loDC1CHhqmFAzGV7xDkOQhceQ/hGbEnqiYIFh1q4OZq5bsWPE1orbmpuGUJf7Zpc6dEhOg
	CM4uZjWjOcV+qD24V1M3fHe2QS4uhyPBAQ1ixethwcy1j4LV6bXxAHg4x3nMGToM5SSjmd
	vFb03c2vEQHIXHUx0Kbk8wGd5wR1UpuxKENZHcXjgfvMvegOKFjWTzBbO58LLCGkQ602Bm
	1dDKRKACUIgA5IoXotBhWQ4+LP5w52/D7o/fjxrZuAr0HSftcnVwf/hrK7KezmGf2sKRjR
	F25R+Z0RGVDE0nUjS5d74zkgS+4VGE/SCkCHETE1ZpM6QuCeQrivRCvUBrscXw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:09:36 +0100
Subject: [scarthgap][PATCH RESEND] ref-manual/system-requirements.rst: add
 CentOS Stream 9 to supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-centos-stream-9-scarthgap-v1-1-601d01ce86e0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Yoann Congal <yoann.congal@smile.fr>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Y49stWCJE/xJ2Euov/NsWCCr6PzJLu5tph0flMsQup8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvRzvltbpNo374cWOffFMCuzfQ4uDeWRB2nv9e
 /qRq4bo+5aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0c7wAKCRDRgEFAKaOo
 Nqb7EAC2sOHpQOkbnjmJDLTegMPfVvFUAbN9FQXAnPbk12muz3iy6vOZO8UMeGB+/eDGb6XZR06
 N2KYgQDiyVNC4ZQPJUjOBTvZGZNVyip0CFwYNRVIHTXBcjF96O/KTNBv+98r6sIcplUQ/9jFgS3
 xHjwh5BBes3oeOrkY5aI1QRhMjxgT/36TigHubkmWIx04fcniXPYCAFAh8ltPUwdo4oT6CBdjfU
 9eisPKaHt8hpn0ZfAoG/VoWfu2WC0Ep1Hw3XOr2czJRSSWr7Y9ciOyhQ+ZQpZE+VFVa4ZxmtQ1p
 jzA+UUeA4S6t1jiHaj3ZNqAu9+3LvQfM7YrRU0FR91ulEktUXLpAjWiBkd/ewMB6Wb3jSt26gcE
 WJv8CTPFGHBMMrEHF23iX6DucFoRrtta9oI8h05xedgi280k3IoYIyzEn3S2LXbbJVbEfvrJniu
 6n5G9L6VWlJjA1TwX7Ta5ffNr1yy/LWXjJrhktyUYngC8CrxbK6hATssBoj2ioxLE53ekmKGj9C
 yi+M5Ng5WBkHTj/jSRzZVtCwfRboMABKIo9MK6I5FgW6PJ/RO9O3T230WJkXFG+OGc4+q4vuAFd
 UEnHeK0Iyl/Y0o0oYfbX5FQMs66AF/kwdZ+Gr3LbBu3iE+W/qGpb4Wo/VqLbGkm2cMPZoZEs2LF
 alRoodYR3g/zJFQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:09:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9099

Add CentOS Stream 9 to the list of supported distros, after it was added
to poky.conf with [1].

[1]: https://lore.kernel.org/r/f87e76ef6bd6745038616876af07c6a74b49f8c9.1773966064.git.yoann.congal@smile.fr

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index cb253ab2f..48b50e4be 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -64,6 +64,7 @@ supported on the following distributions:
 
 -  AlmaLinux 8
 -  AlmaLinux 9
+-  CentOS Stream 9
 -  Debian 11
 -  Debian 12
 -  Fedora 39

---
base-commit: 60b1c5e635065acc7a7cd2a22f252fc983da223f
change-id: 20260320-centos-stream-9-scarthgap-e5e54f8f1aaa
-- 


