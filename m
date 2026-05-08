Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154EFCD37AF
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1624.1778259581754114161
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=frZA/xME;
 spf=pass (domain: 0leil.net, ip: 83.166.143.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMc1618zDqT;
	Fri,  8 May 2026 18:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259580;
	bh=1W4LZlsBb66FBjcnZ4SbFXNOHyhx2VgpWID2111hBCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=frZA/xMEVEtn6YJ9R8BCvOwy+Yyo4lQyvZbQKNn2+/1v1UZEEpbPoPPupgJwzz/w0
	 IfsX6dM5W+FcOSZZWDlghy+Jgt2aTjESIJtWczMFNd5mPCds+Q/F10SU6O/ITgXppb
	 4NFhx9/NiguMjLfNMs8dgodDw67MeQrVhDaDprfQhf+lnIZaZI+bA2R65SGEOgJlSq
	 36PqJMnju1Qf8XOHE97pJJSTslvlxJLI7yS59pYXnXQA+bQDMZGUsK7nvZQicXFUK2
	 NzH506UKiI2672BBZvqxeSKTPt6hKzONHT1cCFljZzLM/JZfHcf/NQA/WVioB0c6kG
	 e5LLkg9/sCxPQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMb5vH1znmC;
	Fri,  8 May 2026 18:59:39 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:33 +0200
Subject: [PATCH 09/11] ref-manual: fragments: fix style inconsistencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-9-8fb61b5358cc@cherry.de>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 May 2026 16:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9414

From: Quentin Schulz <quentin.schulz@cherry.de>

Remove spurious whitespace before end-of-sentence dot.

Align conjugation at the start of each item in the list.

Fixes: 51162cd20d7a ("ref-manual: document the sbom-cve-check class, fragment, and variables")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/fragments.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index 8da14a038..3cd9af168 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -210,18 +210,18 @@ on the serial console and over SSH.
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The ``core/yocto/sbom-cve-check`` :term:`configuration fragment` can be used
-to set up the build to use the :ref:`ref-classes-sbom-cve-check` class .
+to set up the build to use the :ref:`ref-classes-sbom-cve-check` class.
 
 This configuration fragment does multiple things:
 
--  Add the :ref:`ref-classes-create-spdx` class to the list of globally
+-  Adds the :ref:`ref-classes-create-spdx` class to the list of globally
    inherited classes, as it depends on it.
 
 -  Sets the source revision (:term:`SRCREV`) of the input CVE databases to
    :term:`AUTOREV`, so these databases are automatically fetched and updated
    when starting a build.
 
--  Include the VEX statements to the input SPDX document using the
+-  Includes the VEX statements to the input SPDX document using the
    :term:`SPDX_INCLUDE_VEX` variable.
 
 Yocto Project Autobuilder Fragments

-- 
2.54.0


