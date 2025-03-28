Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B055BC3601A
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10701.1743167256428727590
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KPwI7TJu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E81A1441AA;
	Fri, 28 Mar 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8p68U75bpalhAo+de3Z4unmCFUo5tCIVcgri8vmwqEk=;
	b=KPwI7TJu9J1iLndQ9wxkzu9Xd7XIrFyEk64lpUhwlSlgWQQh+Aqh3HfnEXohcTmfseSSH4
	BUnXNJzwFP11ba/oBv3gEO1dfNqlSqTgYA1eM3oMnxacL+VttFrtqVMLjQLRjYrlcu5+AK
	IpdRBhjBaHEDWKL1qufHBIuMtdL6S1VwqcCBOc0J3VYGYWourBVbfOcdbxW9+JGE2R2CSG
	E4TsJwPORg7kCtEVDZijh5h7OHL61Qdgyn684zpEQXyxbz/Di2M7Zfm7fSlo6VIZ4JJ4NL
	AOO6d8SMrTO3X6AKy+0ZgFQBo2wTh4W9ab0gUFybyDv+V6qQ+JWNWsXPrdI5sw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:07 +0100
Subject: [PATCH 04/11] migration-guides/release-notes-5.2.rst: add security
 fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-4-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4555;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DR6ye7Y1Hd4xNnyLWZZ5//0i7wiCvkL1WRctSK5Fwik=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8VR9ZjbVsFbTZaPk/Oq9Sje0/MADz2hrmG+
 6GP42//25uJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFQAKCRDRgEFAKaOo
 NrVKD/4iRs4kiN/6pv7lNT1IJBReY/rQ5/K8uNIFTwWX2WNkxQ8R0qwhDGp4AqbTRjURh1Yqj1q
 F/XOjack5cq/e+rLKvFsu6yGbz0ILqSQPv0kFKC0VIX+0ARtY36D0j9Zyi3LapW07mhgOsV1Mu0
 qUffxIFVQxvPoLrCYZ6v+Vv7TQr0NAj8Bnb5+LlT+jMoZQLgV7467vfISxT1i3V/FmWe3SOcIpT
 t9MMdTKqA2L5gKVnV1SqfCaYH/5S6r8OrNeX2dLQiINVGePlWqTzh8vKkNTNLVMgRkaYirlDpGt
 kXchOB3udUomqm/TTV37szljXhPleGMYB+XEd8WFKKe7kDstEhoPT7OGPJQJBob/AuDQ6ZeP3w/
 Ji0YFmTA0a79MURf1YsHXGymIdzhvRgrb+Egw6vJB/XfsesBZt2+cZaYWK+X3GaMPLv9PQIoQYU
 /4Axc9sDgN90mn5QI0IbxVA+11KpwZIbfH6JwAInIYvCjdwG2vpeJmIvUdOfdWp4HOyq5VZAmI7
 ZwWr0L4uYkFEHPMZijkNkoPgvvWu0J8iRMB3v3IVRKPYVCrB5GPCxb6rXd782nWvjEx8MAj0afK
 9AH0iGDdDfasymQGg+FDB+d4mVNagJY23gmrAWu++E0PK2Xhf/fCr0uJwHXlA4T6a+brEEnkTI6
 O7DsJyIMpbKJGFA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6658

Add security fixes by going through the log between yocto-5.1 and
walnascar branch tip on Poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.2.rst         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 1e05631d9..d583f3e9d 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -765,6 +765,73 @@ The following changes have been made to the :term:`LICENSE` values set by recipe
 Security Fixes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+The following CVEs have been fixed:
+
+.. list-table::
+   :widths: 30 70
+   :header-rows: 1
+
+   * - Recipe
+     - CVE IDs
+   * - ``barebox``
+     - :cve_nist:`2025-26721`, :cve_nist:`2025-26722`, :cve_nist:`2025-26723`, :cve_nist:`2025-26724`, :cve_nist:`2025-26725`
+   * - ``binutils``
+     - :cve_nist:`2024-53589`, :cve_nist:`2025-1153`
+   * - ``curl``
+     - :cve_nist:`2024-8096`, :cve_nist:`2024-9681`, :cve_nist:`2024-11053`, :cve_nist:`2025-0167`, :cve_nist:`2025-0665`, :cve_nist:`2025-0725`
+   * - ``expat``
+     - :cve_nist:`2024-50602`, :cve_nist:`2024-8176`
+   * - ``ghostscript``
+     - :cve_nist:`2024-46951`, :cve_nist:`2024-46952`, :cve_nist:`2024-46953`, :cve_nist:`2024-46954`, :cve_nist:`2024-46955`, :cve_nist:`2024-46956`
+   * - ``gnutls``
+     - :cve_nist:`2024-12243`
+   * - ``go``
+     - :cve_nist:`2024-34155`, :cve_nist:`2024-34156`, :cve_nist:`2024-34158`, :cve_nist:`2024-45336`, :cve_nist:`2024-45341`, :cve_nist:`2025-22866`, :cve_nist:`2025-22870`
+   * - ``grub``
+     - :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, :cve_nist:`2024-56737`, :cve_nist:`2024-45780`, :cve_nist:`2024-45783`, :cve_nist:`2025-0624`, :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2025-0622`, :cve_nist:`2024-45776`, :cve_nist:`2024-45777`, :cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2024-45778`, :cve_nist:`2024-45779`, :cve_nist:`2025-0677`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve_nist:`2025-0686`, :cve_nist:`2025-0689`, :cve_nist:`2025-0678`, :cve_nist:`2025-1125`
+   * - ``libarchive``
+     - :cve_nist:`2024-57970`, :cve_nist:`2025-25724`, :cve_nist:`2025-1632`
+   * - ``libcap``
+     - :cve_nist:`2025-1390`
+   * - ``libsndfile1``
+     - :cve_nist:`2024-50612`
+   * - ``libssh2``
+     - :cve_nist:`2023-48795`
+   * - ``libtasn1``
+     - :cve_nist:`2024-12133`
+   * - ``libxml2``
+     - :cve_nist:`2025-24928`, :cve_nist:`2024-56171`
+   * - ``ofono``
+     - :cve_nist:`2024-7539`, :cve_nist:`2024-7540`, :cve_nist:`2024-7541`, :cve_nist:`2024-7542`
+   * - ``omvf``
+     - :cve_nist:`2023-45236`, :cve_nist:`2023-45237`, :cve_nist:`2024-25742`
+   * - ``openssl``
+     - :cve_nist:`2024-9143`, :cve_nist:`2024-12797`, :cve_nist:`2024-13176`
+   * - ``orc``
+     - :cve_nist:`2024-40897`
+   * - ``python3``
+     - :cve_nist:`2025-0938`, :cve_nist:`2024-12254`
+   * - ``qemu``
+     - :cve_nist:`2024-6505`
+   * - ``rsync``
+     - :cve_nist:`2024-12084`, :cve_nist:`2024-12085`, :cve_nist:`2024-12086`, :cve_nist:`2024-12087`, :cve_nist:`2024-12088`, :cve_nist:`2024-12747`
+   * - ``ruby``
+     - :cve_nist:`2024-41123`, :cve_nist:`2024-41946`
+   * - ``rust``
+     - :cve_nist:`2024-43402`
+   * - ``tiff``
+     - :cve_nist:`2023-52356`, :cve_nist:`2023-6228`, :cve_nist:`2023-6277`
+   * - ``vim``
+     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`, :cve_nist:`2025-26603`, :cve_nist:`2025-1215`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`
+   * - ``webkitgtk``
+     - :cve_nist:`2025-24143`, :cve_nist:`2025-24150`, :cve_nist:`2025-24158`, :cve_nist:`2025-24162`
+   * - ``wpa-supplicant``
+     - :cve_nist:`2024-5290`
+   * - ``xserver-xorg``
+     - :cve_nist:`2024-9632`, :cve_nist:`2025-26594`, :cve_nist:`2025-26595`, :cve_nist:`2025-26596`, :cve_nist:`2025-26597`, :cve_nist:`2025-26598`, :cve_nist:`2025-26599`, :cve_nist:`2025-26600`, :cve_nist:`2025-26601`
+   * - ``xwayland``
+     - :cve_nist:`2024-9632`, :cve_nist:`2025-26594`, :cve_nist:`2025-26595`, :cve_nist:`2025-26596`, :cve_nist:`2025-26597`, :cve_nist:`2025-26598`, :cve_nist:`2025-26599`, :cve_nist:`2025-26600`, :cve_nist:`2025-26601`
+
 Recipe Upgrades in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.47.0


