Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAD5CDE006
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7574.1782380026862136789
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I3YYtm4n;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3368C4E408D2
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A0B55FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 377BE106F07AA;
	Thu, 25 Jun 2026 11:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z28uj0hW8y78401kLPdFwuwPNsZATbDkC78y0yiY+bw=;
	b=I3YYtm4nkdXL02Huo9HxaXIMR96hwBqRv1W0hZ4urKHRWwQIhCbqn9c2SEzv5YLo0XMO2o
	lfONIdoZuKI4z2QLHu67LnZZA919Z/HmNc3maT3CWYXl+Nx6aHHgkktW/91yH4cozXhkhW
	c/DXrV81d5fp9tdruBSW7u/9xSKbTzJaCTemzOgZsv7IfkkBzMvq7lC+upTZvSIbalIf//
	n4RZgpiTl6Xoe4axVsrbiqAn5NSgduxkwaJaeNjRllgg2AfnpHYXr+bYeU4xA+/wj0VaxM
	LKzb0lIFLl+ccS94q4BbV+UB0y+UX3D+tCibT0mKDRxd+TXaPUVCjjpgRzig2w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:29 +0200
Subject: [PATCH 02/11] ref-manual/classes.rst: replace deprecated wks
 directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-2-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Ox4Of5nFOXB6P7R5F26dHgjCYVKMlU+haaROXV1nTpU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX0guO79psDHkWf5iZE2jN3M4phlRmUsv2Q1
 IuF2iWZBXGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19AAKCRDRgEFAKaOo
 Nk6PD/0ekH6zHxNmg8cxzYh3pIiJZZVqXiLdXrlMhZ8vehoFyunBFnm0sL408y917/1Jh5Jcfxs
 bEQEwVa/ubT2iGlkYdxdjRMwYWQQGE353HBy9bgPmiOO7ZNj5MdaWcyGkUP7CjSfy4DCwrIgD+m
 2W1BNdFcvgvH1ndPpIsP2YMfw/chL3I8pOGHbDHyhFOknKc3RC3f9aSQy3welHqc9/cGQjl+d6k
 Le4nxGF0aWy4+mY8gciy9F9qG5AG8Amny3CE4h9adDiaaL/9H6aoXjkti9dYTY8RLOy7RbAj2ZV
 B9DoXiqnOn0cUJLeUKzGLzBTn6rEXDH4gBO4R9K/aZj2L+RcRq0Pf46AsZRtMaKEIDtc/28qDsT
 HRe+rsaUT06nV0bGk4NV2yfeOyH1zBAk8itNg8Olv+JdDl2i1pvaU6Oa6gvYgsqnvARYnJ48p1e
 l71QEjxoMuUlh+8zn1/BpwKOazvMoZ2hXrqLJOLAKHO2sc4IPBlZQPsTtA2a+Bdzh009mVDWnVc
 3MOJghhRmOW16OHN7c/hZfWDXVEvWbMKyzA1l4DuIxF4F3pqzqZ2cGutfomuf0+XZ0Z9P6j+gMj
 yO0pej53Ah1nH7j0hNVfyVASzhZZPHHTQ+1u2UidWf+l5tjboP0ocbkW/WZjcSIgQi9UwcPdV7Q
 ZdhW49pJHLr5lBg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9886

Since Yocto 6.0, wks and wks.in files must be placed under files/wic/
inside a layer. Update the link to the efi-uki-bootdisk.wks.in file.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 56a8e7e98..b69e10e74 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3534,8 +3534,7 @@ by rootfs image recipes. The build configuration should also use an
 on target hardware. Using ``systemd`` as init is recommended. Image builds
 should create an ESP partition for UEFI firmware and copy ``systemd-boot`` and
 UKI files there. Sample configuration for Wic images is provided in
-:oe_git:`scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
-</openembedded-core/tree/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in>`.
+:oecore_path:`meta/files/wic/efi-uki-bootdisk.wks.in`
 UKIs are generated using ``systemd`` reference implementation `ukify
 <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__.
 This class uses a number of variables but tries to find sensible defaults for

-- 
2.54.0


