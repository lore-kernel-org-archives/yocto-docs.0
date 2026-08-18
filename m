Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6504CC5DF80
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 09:20:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4740.1787044837863127509
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 02:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NG6+UYBq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3BE0D1A16FF
	for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11DBC60355
	for <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CBB111C74AB5;
	Tue, 18 Aug 2026 11:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787044835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bJkme1E/FTAba0j8Juk/+B1Ek8eoSNDTnAntEkAWL8Y=;
	b=NG6+UYBqYxTYnHFD1lTydJBP59nIdhi6+CFVeqq2eiXhGdbOIWjNMaxv5gD3HyPd11ugmW
	ACoxgLMn4/euDE4MHyvXKFsieV1APx4uMcELbzQZ1DopDEuWfVnyLKum2k9FanHYYsjsq8
	jwu0a2v2nbFjOVIlGKKbLWuU2R0ovIBisSRRSwwNelC8pyL6IpYw0hpN8LJkyX5py0pJ4h
	KI5lwENBGrVDqmeCLWo5PmH5RzfsKZDSAonM8mRK7oCKgelipaQdhTOj6csVwC/Cu++hqW
	GZ1X7k+TnsfRio3qXkT6uIPveQgaedYZyABJiACtTFmljV9vLYIJQgjFU7dGEA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Aug 2026 11:20:29 +0200
Subject: [PATCH 2/2] ref-manual/variables.rst: document the PACKAGEFUNCS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-packagefuncs-v1-2-1f26764cbdd3@bootlin.com>
References: <20260818-packagefuncs-v1-0-1f26764cbdd3@bootlin.com>
In-Reply-To: <20260818-packagefuncs-v1-0-1f26764cbdd3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MWiuhAfIAPH5uj7acIqWiIm8jUGZOoDmgA6T4acdkVI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqhCPhPO+G0bIxLzOkxyWj/RAHdphmd0BymmaED
 ehFsLIN7c+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaoQj4QAKCRDRgEFAKaOo
 Ns2jD/9mjdsgsw/Q/ptRroiNXMWGOV3sZHZLi7mDApT/so8jHl1LfVFhPf3CJ7R9l6mw2BCAae9
 lDW+L1zwuMGxIKfe6iJsIaTmC7LpUqJG0Nx63Lri3GlMHuM6WVvJoudGEmlsdrHuUS0OzCW+kRL
 oZtrZKXb4ZeDJKFu1VCWQh6hcEWJ9Vwc7y5xVMpzMcsWo/qu4sPII9uhrrQAKC2YgQqiz2m3J3g
 eqs6e2MR58l2goLgFjJOM5DfQpXQ3pbp6NvgZ6TcdntuHp1rJLISEmX8xsqncAcOAnq4lhgV0tB
 V55kFgZd0Wc1PJamt02XNW4NVl3gyy5QdOqKPx65iw+imdWMPdBjHtBfrkt5Bj2JlSRe5Kk6idL
 1KYsib8wiCO3dA87qK6zUYdGYbJie/n3U3Vj98sjQIj+DoZz5oRkugMX+CGLYz2iIDZUEAHtYLq
 SXCahgPT+Izr5FSRuPQMjmJQ78/jBWEph95fzS1gYeYX7yIhOzvqKX/zQCQz9IRkcS2ZSiamVYp
 DUA4GwEw1fGSrBSxoXBYZ+3IOxk01KEfvz/3LD9PIsSl0uor+65qMjc+ftWdblGx6OpssmMge86
 U3BT6ITpFf+dj33G+EydOOoHKU/zQwDXPtHXousy7s2AdYHESwqE+hpKGLYj1h6gnHk3p6E0mfK
 zH2N7l0K5iiQOZw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Aug 2026 09:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10295

Added by commit 4b46c1f6e891 ("Initial population") in OE-Core. This
completes the variables used during do_package, as
PACKAGE_PREPROCESS_FUNCS and PACKAGESPLITFUNCS are already documented.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 09136803c..724293a58 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7360,6 +7360,12 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-configure` task, then you need to use
       :term:`PACKAGECONFIG_CONFARGS` appropriately.
 
+   :term:`PACKAGEFUNCS`
+      The :term:`PACKAGEFUNCS` variable holds a list of functions which are
+      executed to process metadata based on split packages found in the
+      :term:`PKGDEST` directory. These functions are executed in the
+      :ref:`ref-classes-package` class in the order found in the list.
+
    :term:`PACKAGEGROUP_DISABLE_COMPLEMENTARY`
       For recipes inheriting the :ref:`ref-classes-packagegroup` class, setting
       :term:`PACKAGEGROUP_DISABLE_COMPLEMENTARY` to "1" specifies that the

-- 
2.55.0


