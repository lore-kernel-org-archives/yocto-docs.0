Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA577E83062
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 08:25:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12102.1770107135864653829
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 00:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QGcqXnde;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A953C4E423DE
	for <docs@lists.yoctoproject.org>; Tue,  3 Feb 2026 08:25:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8031060767
	for <docs@lists.yoctoproject.org>; Tue,  3 Feb 2026 08:25:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B218F119A8891;
	Tue,  3 Feb 2026 09:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770107133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/mAHQDjQizn6JTqV/ci1AtWZy+8C7HWJr5qllflk6Co=;
	b=QGcqXndey4/bUB7pvDX1TnMcsedtlFnjb3FazJx2fQ5EuJHMSHYFNBSdrP0GWL35ld11kh
	+kS5DboTbHjlTOB5pXCLKkGdDJ8ZZ50t3zSy/WXfglPS7a4zeXe4l9sr2YX+G+JPVXbNT6
	yianYad0Hgr0YHebL6zeJy3g7joC0v+RAjTgfxIwd60E3xLXgZ3aIYfKzPuaFG70+VjClm
	nL8BwdyeHcSh8iAtWQTviKThbh+zTMKG7FlCriIy8dLUbUcpn7C9JMqePodVG4EY66Dyxq
	5w0DJFRqWW/6UHUHo49/aSvPJqkkz3zo2uQ3ZzTKSuDWReqnKKik37EzSyC7gA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 03 Feb 2026 09:25:25 +0100
Subject: [PATCH] set_versions.py: check that we build from the git
 repository
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-building-from-tarballs-v1-1-40e353ca4085@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdtkgA7jqxgO6yhYM4dpwZgQ3
 t2px+/w/xsYq7DBpdpA+SUmcy6oDxXEW8gTowzF0LjGu9p5pFXSIHnCUecHLkEppGTYOWpP8Uz
 HrvVQ4qfyKO/f+Nr/bSvdOS7fG+z7B0beZqt6AAAA
X-Change-ID: 20260106-building-from-tarballs-70b35c8b4736
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dqJo2HWvYe63QmPdOsCBo8Cdt4WMy/YMM+mXPr9v72g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpgbD65gi9/5DThHDv7wy38sXQeA4h+IxRON9uT
 WWwijsza+OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaYGw+gAKCRDRgEFAKaOo
 NpLKD/wL+OPShsAyXxAdv4hyPEmCi6BJ0CQMXawZQpQSyxEki8dZlikiCEhHKurYNt6N4rD2olG
 Oc1u85YZXnpwtpNHgTOaU4+l4iWZi35FwNilV9C7467S4RQDRahO0Wya8qk9hRnQ7zICK4JMtQ5
 Uk8A15d9OOv4thx3p4dYSswFEOdRBYLnZdehJL4an9U47Fn2O33IotP28aG8Yl+m/DrRVQXCsQv
 XDRIFa+naMGWcDYDSzNroF3SY2735zi0rAFLWrgDy0lIw+t8L50EHHwAxuIcwT0KM/B4/RINOaa
 vKKrRmyhqMEcGhreDeMq1WwT0LFCzb/Cej4zXEdgs9dtdAx+MLOkFjfQJJAsO7sZpJWvaXYvB3+
 d1kQe5Y/xsaxvW3vYHCrkyDG6naQWzia5vydiftRan0j+lYBKECNnqZPUlIbk5l2v2552D1YoAW
 IlxcGNVK0Ar9S/NRWh7tn+pIDPUYh1agJHVJwAF5s9hckeUz0s5Dlx2sOgC1vVT6GMfUodYfzYK
 bbXy+oQyb4nTmes8uEW+j2gfara5MArIIpd+AEKZlBMP1NAWP+nWt+xzCPJ9RgfNnE/QSwEi98g
 eLhzpq/dW3kaaC2VWMa+ofI75L23EujWVmeK3feKU0BnkU1OUr7dJtjcOY2i1FpYmL3KDoSbkRL
 o4mfsREZaE+rDDA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Feb 2026 08:25:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8857

Check that we are building from a Git clone of yocto-docs, not a bare
directory, which is not supported as we need to tags to be fetched.
Inform the user how to clone the documentation too.

Fixes [YOCTO #15834]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 78d0518c1..eec0302f8 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -101,6 +101,14 @@ ourbranch = None
 bitbakeversion = None
 docconfver = None
 
+# Test that we are building from a Git repository
+try:
+    subprocess.run(["git", "rev-parse", "--is-inside-work-tree"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
+except subprocess.CalledProcessError:
+    sys.exit("Building yocto-docs must be done from its Git repository.\n"
+             "Clone the documentation repository with the following command:\n"
+             "git clone https://git.yoctoproject.org/yocto-docs ")
+
 # Test tags exist and inform the user to fetch if not
 try:
     subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)

---
base-commit: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4
change-id: 20260106-building-from-tarballs-70b35c8b4736


