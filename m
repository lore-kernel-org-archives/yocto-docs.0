Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2240C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:58:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47563.1784725108589844108
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 05:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jwgGhme+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C0DC34E40ECC
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9695E60388
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07B6611BD1E93;
	Wed, 22 Jul 2026 14:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7Z13VE1DoJfhjr9Ib2V+1mBLxayxqP2gUh28KIYQJ9U=;
	b=jwgGhme+zjcvxRRBEn+AryRRQeF2CHCfTbfe0qorU+udW2BDVQNvLUEJDLyHXdeYJdHQRv
	ZWVlWKQSvGtJUuZhr/5gk8Qo8mumxgLp3H+fKuXBpr04k73TSrD3lC1kg9e6NI5r/mu036
	4AHQLxerXz0ic68nHEpqH9Lskh8fc4L1Lbhn+Ci6TQPpVmGB7f2VfDlRszlx6yeyRKwe2Y
	/y6e3gqzYH2tO5Yn9qex400jVOKEYq58Olg0/UUn2Io+qneNgSPojUWwe3rMOBmsRmzTAV
	SUKMaRRGvJ2qITmNte5d5TsawGsXfbSl0g3p26pHNvWlm9yEj4s66PbgpLzX/Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Jul 2026 14:58:11 +0200
Subject: [PATCH 2/5] ref-manual/variables.rst: SSTATE_MIRRORS: remove
 uninative mapping note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-sstate-mirrors-doc-v1-2-570baeb41c32@bootlin.com>
References: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
In-Reply-To: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iAToj9MmDrT+tX7Zm9C7sqTw0bc7qL1jgAEGonkXlsQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqYL5v1bJrzX4Gh2r2X/LY2dWqWlBY0QI2gF9MF
 VXS+jlB8PCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamC+bwAKCRDRgEFAKaOo
 NtHGD/0U8nkM/nUEcpHA9+Ukiw3bUrTbU4tLpWBi0xqGSoFeksyY2VXRRHEIrPaMOutVOBgQINr
 76FoTi8PmX4CTYePo/ovJ5HIcsfp0GDIe/rf8BregW4+KrTcIzIcyEnnpsH+Yxf4FF9OrMJs4Dp
 vtmlTxyunT5dw2jSdwV+SvxvBpetNw05rFYvKIA7ZMLo3w6x5vcSe6n+3EaNaXof85LHz9sjYXX
 8kPUpPT0Xro793RdOOBufHz/Ih8SuFPAyfbFWDobloie/cYe7f2apoxFx5KEfhu91bR9+N7VFor
 UzUWAa6qpYCSHK6yooQRaXi3eOmvWC6VHr96otT9B6KolSvHNjWl1NUc7EszTMtYmx7BjRVEhb7
 UJeGPOFQST+0uevWfHVg8WFF7wKyIbgEf8veaf66S6RLZwYTCL/QpKFXdYXSNNkgDI56NRR4nhJ
 OO1QTsfhGdSPDu5rL1B4oyWSHl0U35p3OT3bEEUFXQiuRiocqtS/S930HB0TIhopR/C3QkXelI8
 JNTFAOi1It/Cfv8K5OCxMOfTnkkNzS3J/z2OV2x4Y5zau9wreZ8vnN33bTFqLpBxG8c4UAenlVn
 GCFQWe4CU0Wni4seFj7lroLzojxtZvoSn5XVVxeIFcdwJ/Z7IiT8+k9utdjPv0GchM3//vIVKuv
 5bCvQUiESjx1ijA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10111

Since 552e037bf598 ("uninative/utils: Drop workarounds for gcc 4.8/4.9")
in OE-Core the uninative directory created in the shared state directory
no longer has "-4.8" or "-4.9" appended to it, and the directory is
always named "universal", so there's no need for this mapping anymore.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 394797ca3..4344b6143 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10100,16 +10100,6 @@ system and gives an overview of their function and contents.
       cache (sstate-cache) results from previous builds. The sstate-cache
       you point to can also be from builds on other machines.
 
-      When pointing to sstate build artifacts on another machine that uses
-      a different GCC version for native builds, you must configure
-      :term:`SSTATE_MIRRORS` with a regular expression that maps local search
-      paths to server paths. The paths need to take into account
-      :term:`NATIVELSBSTRING` set by the :ref:`ref-classes-uninative` class.
-      For example, the following maps the local search path ``universal-4.9``
-      to the server-provided path server_url_sstate_path::
-
-         SSTATE_MIRRORS ?= "file://universal-4.9/(.*) https://server_url_sstate_path/universal-4.8/\1"
-
       If a mirror uses the same structure as
       :term:`SSTATE_DIR`, you need to add "PATH" at the
       end as shown in the examples below. The build system substitutes the

-- 
2.55.0


