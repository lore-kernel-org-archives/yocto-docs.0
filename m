Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6408F459EE
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158224.1775832229405458385
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XhRCN0Rq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81204C5C1AD
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC4DE60497
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CDC410450070;
	Fri, 10 Apr 2026 16:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H7CS7oKv+1NmBZx8djrRp0h9RErt/tme0DQJT64cxCA=;
	b=XhRCN0RqvR6WU/EDk33pkDtB62Qh/NhiQwwftrVDb4tzpo4oQlJuExtVctuy7C/mXrG28X
	wJk08p6k5PIeaujIdlMRsPbAw8xc2nu8BV23JM6TlV4gobXlCm9lFOkBCt6fhDaCqPTcU0
	3pwwqibfG59FK+iZ2hBtxaN1SZN3Q7TsuMxau9AcK+FvylGoRQ1YPTgi8Wgn3yrgXUpgps
	0JUwPsUWTVcKJh9qpwrMBIYDGvX9rDCDavxUO8P2KzUMqwv6Owv7ryMRMpPElZ7Nt4Q32/
	Tkmd3UGzd6l7+jcvu5epjH02ldS5a5/MPYJD4GVjSdNUKAxl5WbAbHpKdzms3w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:33 +0200
Subject: [PATCH 09/18] ref-manual/variables.rst: document the
 SPDX_GIT_PURL_MAPPINGS variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-9-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wri/3TafWqXO7625lttO5db/gfpHec1JwyNIuitx9L8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyXIouqOkItKEdc1fYcDAKGcS9TTdGumGlSg
 LrdePlLQJmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlwAKCRDRgEFAKaOo
 NqVjD/9TTrNVLKyiqrYV7b8mCf8Jkpsq+CS1cmWmks7AVJCPtRoiKFccghOyxnrAigVr1SkwNYG
 BRWJwQV4hNLZv7lVBCHcT3Sn5BoUKBUOSTMqltFFGBuN/k2FRSJR4upQ4VF98XsJ5wI0BONPONw
 FQfbmxsGAlgPSk78eDDEVkars9xo2k5lKvpRtPgBI+VioCRDEeZJP4M0aOORx7QzEo/QNzrzgH4
 3xiSFNZh2PnJQL7/tTe42unaqfLbpbUSNYDi5wHihX9GbMFNaMXstjTdmDw7RPESWMcyGAXr3aa
 pj/NN7HeFGANqEbdpanMXVoBmJUdMQP1cyubAtjGouBIa7VcP5T+/PTBLCVqdNTy4/PYyr5ktIA
 f+q88/IhPM+rMBJPORU/rdBqUAXGuD389aUBL+o/wqcyGEmNBI+G9YJ00BsBIVyi0PbfFdfqjbD
 Drcn3YkjbWIH36y91S+gQFiwtEBRgI6RJZ6FUm/kkIgK50PMwHJnddgCSL5yNpYAYaV2AVMSSkg
 PZoY+Q9B9wU98QDsaeWq5HtfcOaHDWokn8X/570ztHsTtq+7N3LeDvT8SoRkbaDkjsCML3uUBWG
 1/cKN/ispk853/cs2MFJurXtEX0fFEwDlNXOkBEHh39Euao3emU3PWHpNCnQhkVJ8c35++ugEZA
 mgwPxpYlI5gB7yA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9244

Added by commit 9f1825e74d0f ("spdx30: Add Git version and PURL to
source downloads") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6c3f62d9f..653bdb1b4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9396,6 +9396,17 @@ system and gives an overview of their function and contents.
 
       See also :term:`SPDX_INCLUDE_SOURCES`.
 
+   :term:`SPDX_GIT_PURL_MAPPINGS`
+      A space separated list of ``domain:purl_type`` mappings to configure PURL
+      (Package URLs) generation for Git source downloads.
+
+      For example, adding ``gitlab.example.com:pkg:gitlab`` to this variable
+      will map repositories hosted on "gitlab.example.com" to the ``pkg:gitlab``
+      PURL type.
+
+      See also the :term:`SPDX_PACKAGE_URLS` variable for more information on
+      PURLs.
+
    :term:`SPDX_IMAGE_SUPPLIER`
       The name of an agent variable prefix describing the organization or
       person who supplies the image SBOM. When set, the supplier is attached

-- 
2.53.0


