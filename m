Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF1ACDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7579.1782380030627707187
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RY9F2ozD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EBDB54E408D2
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2A9E5FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17137106F07AB;
	Thu, 25 Jun 2026 11:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380028; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=trQgZ1SyL6OKhyWJIrqSq0e8z7SfEQp/adz7SJORYpI=;
	b=RY9F2ozDeR9i2j4F9GRB6hwwPey3x5beZpkBPV+WT2Uxssk5uKA6wrpii9O+LNe9FftG2l
	EVoCaJgzhyM3vH/g2C9vdDNpkPZjCSHLaJQpVkl3OjsGUScplrP0TqkMUC+XQg5aoCDcdA
	5c6Nwl3IYBkeTQCcvoC9apHyaRzPgzMnB6zXrGO89hesUMABaI3IIjyqEkfR6jT9Glalbo
	TNIGV6VuVfwj5p4fF0nHHaotyKGsxu4+DruACd5xj8rfCw8wEu0TBcVJQ3+46tRyo/cR++
	qgtvAFSDTyh3f8JFQHJd2lAgv2TJCT/VUeXP+g/yWAQirkJLIJTEPndq8WWPNQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:35 +0200
Subject: [PATCH 08/11] dev-manual/wic.rst: add a requirement to use wic
 from the build system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-8-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4dYePi6a/D5t8NFFm/7MxFbMm7PFSl6BP8wSMM14P/A=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX1NKxo8Eylhe/NOfLwDRPYEiGCK/v3qj7Ol
 GavuslKYFSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19QAKCRDRgEFAKaOo
 NkXGD/9YnGa1YtwJ5Sll528RIFA4wB0YjVCxUIu8jxrj5BkQ+CXQqhj060xyCCDw3PoMRU6oh2n
 y2DIA3tIRF6uWuwAF70Tv5OLM0rXjgciHQygNk6AI396jA1TCzMNw04axrCbAclEb3daUKTzzBJ
 JbO9mDlvyPGOn9O4IyEPwBuYBwAEbhIFvAX/SH/rqrXGNAPpsrfoBaOZVKMHZbUBnjCUGeAo9VH
 i2YZHXWwZxXY7bfPrW8LO+VtXXVILmyLCgpSKwuIidtMDHEx2LAgsefPD5d+/zDdBeE1zoPwL9j
 1rUogJIknHosjGB5JMg0nLe9uAiw9UuHcCOKQWQ1nqZl6emYcsnxJ7UI7OBY6p+XLT4bbNhUDA7
 +lruZdFzuw7jY0p5MGDq6Ma71IwoYaloj/ZAYfOHOJeU+Bg02P39CUIy0+S4OnSchARczA9ofiB
 siIA0FVnrFYrPzBgau4oJ1OkB2tJhYxYyU8/cLF3iAWMqwPq2U9qJyi8nKu1DGWwLi6yyTlV0Jj
 nqBz+3TSELghLf18L1iBCoxL3H5hVt78rePSyJf2kAnvUirTy6DL43jfbv6QHXSTd0M0pChgTLa
 W6NibBqdDR0OfZzdrp+iHHhRbWkhWF2kholMXgMuLW3UdXi1jdOUoOuD2Fz14MgW60QIiTfmtzP
 ZFb9GrINiwzsldw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9891

Since wic is no longer part of OE-Core since [1], we have to use wic
from the build system instead, which can be done by following few steps,
finally creating an alias, so that the commands from this document
remain valid.

[1]: https://git.openembedded.org/openembedded-core/commit/?id=25ca1cb46dd6d0c57f61f2dc3b649601dc81b50c

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wic.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 5fc7759f8..980f5197c 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -75,6 +75,29 @@ system needs to meet the following requirements:
    going to run ``bitbake`` commands. See :ref:`dev-manual/start:Initializing
    the Build Environment` for more details.
 
+-  Make the ``wic`` command-line tool available in your shell:
+
+   #. Run the following command first:
+
+      .. code-block:: console
+
+         $ bitbake wic-native -c addto_recipe_sysroot
+
+   #. Check if you can use the ``wic`` utility using ``oe-run-native``:
+
+      .. code-block:: console
+
+         $ oe-run-native wic-native wic --help
+
+   #. Define a local alias for the above command:
+
+      .. code-block:: console
+
+         $ alias wic="oe-run-native wic-native wic"
+
+      This will make it possible to use ``wic`` from the :term:`OpenEmbedded
+      Build System` transparently below.
+
 -  You need to have the build artifacts already available, which
    typically means that you must have already created an image using the
    OpenEmbedded build system (e.g. ``core-image-minimal``). While it

-- 
2.54.0


