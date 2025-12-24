Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926E2E776E8
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123186.1766593915138630602
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2rhUsIlz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A341C1A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 745AA6073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE9FF10AB1372;
	Wed, 24 Dec 2025 17:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hKe1eKOgd4ZxF012XKNjxP+1ZsA/T6hlxtkiQFicYrQ=;
	b=2rhUsIlzwR4bf9GlRaa3h2FJHx6uRY8xwfROOG9A2hPyWMV3JakPevvrbrvGGwhDdHtS/k
	949xbW7UmaoER4oYMQfJJr7ZfhVN7+3QCctJUqJ89cjtz2kL/p0286RdD0jRtnG6J7+w+M
	JhUA1N2ZB+6A0+n18i9/0kBDIcD65uhMO+NdZyJpU7OTJQfVan5YDeucDezewfFktTd431
	wZEIVfVRjlB8dQYC5cl8qqzIOs6PSfdjO8co9vZIDABLgMiE6Wd19qsxW0UmkrpMB/Ngtf
	LZaV7mRclsPklh5jUAz0U5NHX4ZnXknNbjMLuvQMo+/0Mk6kgMeB5JP9lPHaQw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:36 +0100
Subject: [PATCH 10/53] dev-manual/external-toolchain.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-10-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ydswT1KflFqZ+IoyWWLYD+stQ5zbFL2iOwCQImwD1nA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVoRfgiwCFq+OZUoMD+wNCReVh3Wvn3YqqCL
 FFXPaQQWTOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaAAKCRDRgEFAKaOo
 NtfQEACScl1UFemSvJv68LmePOeZ6NGY/3t/Fnhq723bFYi0q+xOIz8W+rNZKaJW8a5o01p/+/E
 g8TNkOovVE5jEtpmMHWXQ61dOVzQ+TDYehuHAnFrQKOx8bzfS4v+jjh8v269NIjl+dlkd5SIOCY
 FY46akevrAOwQmjGFSIMv6mNZ519gzK9SW6zvspZiP+q7Sme31fmjhPsPbuZ+e8xZu7e66Sh27I
 Po43B8jbcekXTbn4owladzhonFaX2cgqzb77gbCOPVBDBgawIPI8LL9/tKRRao3pv78wMgCn+yd
 kRtiLS3lNqlzQ2xo0Io7Jp5WEuCJPZMLGGzVJubrZPKO/b7DovDJ52N/S7jzjOzRc0phUlKYNK8
 UHHYd/1Bx8443CYK9s94zXo1zAxGVt8tC8S5ib3OtQRwMk6LV07ChFyYRKEGJw75DqxgdFaRieC
 xqQrNqnlmEGlfEoaloRW/p8i976DqvYIf+dlX3lfQj6DaqhpgVJhL6z+0pOOa/mbYk86Xt8XvKe
 CNGqzsT77glBWulgmOco4oWmUjzw79mqjIE6HW7ojDISuZiAFkNMYDcScDoqQeclCDnMTT4RaOY
 CLF604qk0A5q45OTea1IvUVHn7/Ge9kePozNt/upQWWZwa9S4rSjdDzZ4K6HI4/Y7Jucv5CZyy/
 cUGOqdkQo6mcDEg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8339

Remove the single poky repository reference in this document, after the
poky repository was obsoleted.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/external-toolchain.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/external-toolchain.rst b/documentation/dev-manual/external-toolchain.rst
index 238f8cf467..29459ea120 100644
--- a/documentation/dev-manual/external-toolchain.rst
+++ b/documentation/dev-manual/external-toolchain.rst
@@ -21,7 +21,7 @@ follows:
 The toolchain configuration is very flexible and customizable. It
 is primarily controlled with the :term:`TCMODE` variable. This variable
 controls which ``tcmode-*.inc`` file to include from the
-``meta/conf/distro/include`` directory within the :term:`Source Directory`.
+``meta/conf/distro/include`` directory within :term:`OpenEmbedded-Core (OE-Core)`.
 
 The default value of :term:`TCMODE` is "default", which tells the
 OpenEmbedded build system to use its internally built toolchain (i.e.

-- 
2.51.0


