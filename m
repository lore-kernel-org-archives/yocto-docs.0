Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69485F36C58
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 08:19:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14842.1776673135097049634
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 01:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=u/kxgjwE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CAC804E42A01
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:18:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2A285FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:18:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 142C910460BDA;
	Mon, 20 Apr 2026 10:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776673132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9eTlbnxjtKIdPzBQG7CxQ1ibZhuLGLWU1rE+Tb5FpLw=;
	b=u/kxgjwE/jtM3Q0kSJjSu3KSsG7K0GXM+szp1M4tm5V5fM3+/+zyFowWUxhCP7Ra+U6Y59
	MCHOMXDvmmFhskfXf92iVqZyWzY9RkitwLLMmEPMvjcQHswHDSk5E9ddkxI61xF2zc5FfX
	SpudroIEcwSmdN1K0vA05o+sZ3sALNTHept2jFN5/u9JBbQ43ef4jvN+Ti1cKLIWRW4zK8
	OK2tXsIgRnuPlKGcZ8vG56yrbqy/l3vK2fDFT7nvfaZSzK3HAkLFEmt91P7gGTa3lugKXU
	NiqMlIY9V8zCoWEP+dOkgMThs6uF827I/VTTHrKBOfHL84KFP3lNmEX1/g+QbA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 10:18:48 +0200
Subject: [PATCH] variables: add precision about special characters in
 CVE_PRODUCT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cve-product-v1-1-812a75eba43b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw5AMBRG4a3IHWtS9YjYihhw/bgGSEsjEXtXD
 L/BORc5WIGjKrrIwouTdQlI4oh4apcRSvpgMtoUOjNasYfa7NofvKsiGUrDyHWKjkKxWQxyfre
 6+e2Obgbv74Lu+wGkieqDbwAAAA==
X-Change-ID: 20260420-cve-product-61f82ce503eb
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:19:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9279

Indicate that special characters must not be escaped in CVE_PRODUCT
starting from Wrynose.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 317b75913396..edacb6be648d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2056,6 +2056,9 @@ system and gives an overview of their function and contents.
 
          CVE_PRODUCT = "vendor:package"
 
+      Since Wrynose, special characters must not be escaped. For example,
+      ``webkitgtk+`` no longer needs to be written as ``webkitgtk\+``.
+
    :term:`CVE_STATUS`
       The CVE ID which is patched or should be ignored. Here is
       an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::

---
base-commit: 2c12ec7bf29aedeacf82970a9d2eb262fde4670e
change-id: 20260420-cve-product-61f82ce503eb

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


