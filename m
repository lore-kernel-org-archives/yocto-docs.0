Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D32C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:59:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.9807.1741701546674330376
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 06:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vc2xynDZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 254FA44359;
	Tue, 11 Mar 2025 13:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741701544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/N8ktk+boVrbPNmmATJYHxEcPMxHm/7vzJK7dfKwmvo=;
	b=Vc2xynDZfOee2Z1NVoSFmEwdccrNFN6WMtfUT8GtpR8/QOMSct1WmQN3i94MELf3uHzOtY
	SEP1xsDeko78Gdte46vtLjyCSp3QrXlUIceyCOK1vM/h++PFBEWe7Fpwo80CBW1/DKMlhb
	v269WOlPIb8sWuFKcDoMfHzwzvrFfGKtw8YE8ZU8GUMBJ9xSnc1ZHL8KPb9UZ7Ya0XpkpZ
	A9238kVRwh/eAft5E2d4ZF0let2Me6PcpfbPdoojUpici3K1sKgiC3CEqPs9Q56tMaaKDt
	1WSbNXGKutYIrGxQJkqchd8s1UQLtW4/DnHGxjtyUx+0IOBsSAqH/m5xSYVTIw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 11 Mar 2025 14:58:56 +0100
Subject: [PATCH v2] migration-guides/release-notes-5.2: add known issue on
 stalled NVD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJ9B0GcC/23MQQ6CMBCF4auQWTuGaYOCK+9hWCAzyCTYmpY0G
 tK7W1m7/F/yvg2iBJUIl2qDIEmjelfCHCoY58E9BJVLg6lNU1sidIkxrsOyCKNw15y7tpO6GaA
 8XkEmfe/arS89a1x9+Ox4ot/630mEhJNtLfM4WUun6937dVF3HP0T+pzzF3g4eWioAAAA
X-Change-ID: 20250311-nvd-stalled-ed957989e05a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VwhVN9rHGM5Ir0DDwrr5EN8tb6nZ6rUlEjFB6v+Nn0I=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0EGnrsrhtZWf8/ypH18EqmHW9gAthN+g4nIdj
 GDzMDUIc9WJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9BBpwAKCRDRgEFAKaOo
 NsB4D/4mc9ue/M/5xvWomn2Mn7V4Zcv4wAvULFHIF3NbyFPWG6jRw1edJ8uCkzga1s+dSya2w3B
 Y+Kr6JL9tMSaW+6UJbUmFTOa3vXHK/ACbDTf9mF7+NVhdHKen6zFTD75FPMFEkOOwc4o8qRJk3G
 j3vnwoioqzu8oBNJvEFkkIKEvUNPH0RBcIBqn2mhQuN3mr4rLLKQsi/MTzGUU0yqz6j2wnLvcQQ
 q4PBstjWnEOb3o/mwlZjUR4qvj4/39GAap36Pxqa6Mlpg5RPWQ8kA4ZG+vjdgbAbo2unOnmpxJe
 VMQBEoZwGn8EjjfGZABrUYl6gwjpjSnqSXA33/cVa0fR6iNzzPT/zE2g6rVrvMeJ1bIvzfvR1jm
 VedOP1qLgeqYZM9F7ukeRsMWK3k84TLw8tQx4jrtGTnA51MGKA2TDhGPB7CGPQqp2rWBWIeU+N5
 bZqAq8CzZffh6+4IgEhuLBsLeib+bb60GYUkGCqaGePTBEQt81X1eC3RZvzRzQjE90b5EvLKSw2
 9z4l2By51ihY2neek3+DUuPGZDRI3qhpGnv9EPupp09ZD5DRjMSH3SC7lazV43Y5OOAWWKM5gdX
 UguGDvxwdmWiFSFYzoxA383gG+1huEnMvyBhAs2ssvFQYoFEEgkCk/PUnofN7AqzY09dZ4+/TdV
 9Idfh9v2CUS7dPQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -106
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqiedmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedukefhudeihedtleeifeetvdefgeetgefgveduieelfeegfeeigeeutdejkefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpnhhishhtrdhgohhvpdhgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrn
 hhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 13:59:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6542

From: Antonin Godard <antonin.godard@bootlin.com>

Add an entry to the known issue as the NVD is not up-to-date, the
impact on current CVE reports and future plans for the Yocto Project.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Typos and suggestions from Quentin Schulz (thank you!)
- Link to v1: https://lore.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com
---
 .../migration-guides/release-notes-5.2.rst      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 417b202cd..ca681ce2f 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+-  The :ref:`ref-classes-cve-check` class is based on the `National
+   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). As some are aware
+   of, the NVD database has now been stalling since beginning of 2024 and CVE
+   entries are missing the necessary information (:wikipedia:`CPEs
+   <Common_Platform_Enumeration>`) for the :ref:`ref-classes-cve-check` to
+   properly account for them. As a result, the current CVE reports may look good
+   but the reality is that some vulnerabilities are just not accounted for.
+
+   The Yocto Project team is working on a solution for the next release (October
+   2025). This solution should be based on SPDX version 3, which is already
+   implemented in the Yocto Project with the :ref:`ref-classes-create-spdx`
+   class.
+
+   The `CVE Project <https://github.com/CVEProject>`__ has been working on
+   catching up with the missing CPEs and is therefore a candidate for being a
+   new input for enumerating and classifying CVEs.
+
 Recipe License changes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
change-id: 20250311-nvd-stalled-ed957989e05a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


