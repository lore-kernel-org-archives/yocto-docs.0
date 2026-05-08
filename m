Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED55CD37B3
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 16:59:45 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1697.1778259580097113562
 for <docs@lists.yoctoproject.org>;
 Fri, 08 May 2026 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=a1Ca8m08;
 spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gBwMZ64qLzDCG;
	Fri,  8 May 2026 18:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1778259578;
	bh=dgvOJ5d/GajNeN7WBqty6YEhuBbHLx3fjQBnMT+K5dc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a1Ca8m08dM8U4jHK68inqpjcrUFcSG9q2XPevAURQRD3xZgLIWoOb1OHrUazno0aI
	 fiRbSnEslOLkMnP4RkiTOZQcsBA4eZ90Es3i1GJ6inmUsLWnj1uhZn9rSyavXvRjx0
	 5IiV/bLmnQgUz5fKetpcXpdv6OkYgWbYlqIDsL3/ZRDWwOtuRr/N+ytVWbexqbGHFv
	 3hJKz7gRrM0hXw+R6c/J7b+o/4/wtUYTC0M/+432FxMsJ48eD213pf5esb2D8VYY9+
	 f0S4Ipa8ExJGoLhT+HgTo3SGdn92HveXqBU6UBamEtdg1Dee17R7bOHkGdvyOECNMJ
	 YOEGEq5I8VzQQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gBwMZ3crXzlq5;
	Fri,  8 May 2026 18:59:38 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 08 May 2026 18:59:29 +0200
Subject: [PATCH 05/11] migration-guide: migration-6.0: fix typos in
 cve-check removal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-misc-typo-20260508-v1-5-8fb61b5358cc@cherry.de>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9410

From: Quentin Schulz <quentin.schulz@cherry.de>

s/annonated/annotated/

Replace "add back" with "bring back" which (to my ears/eyes) sounds
better.

Fixes: 8572a9e780f2 ("migration-guides/migration-6.0.rst: add migration notes on cve-check removal")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/migration-guides/migration-6.0.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index 793ae3301..25bcac207 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -340,11 +340,11 @@ Users currently using the ``cve-check`` class are advised to switch to
       report in the same format as the one deployed by the ``cve-check`` class.
 
    -  A file ending with ``.sbom-cve-check.spdx.json``: this is an output SPDX
-      report annonated with vulnerable CVEs.
+      report annotated with vulnerable CVEs.
 
 -  The ``cve-check`` class output summary file (deployed in the
    :term:`DEPLOY_DIR_IMAGE`) ending with ``.cve.txt`` is no longer
-   deployed by default but can be added back by adding the following statement
+   deployed by default but can be brought back by adding the following statement
    to a configuration file::
 
       SBOM_CVE_CHECK_EXPORT_VARS:append = " SBOM_CVE_CHECK_EXPORT_SUMMARY"

-- 
2.54.0


