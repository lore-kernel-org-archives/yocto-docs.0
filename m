Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A968CC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:11:08 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.47889.1742202667065792953
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E80d5S9o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 069FD432FC;
	Mon, 17 Mar 2025 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PoiENvWL5LxH1oLEECXmoxr/Ad4XJ7qKTNOZi1KqjUM=;
	b=E80d5S9odqnX6VF63guD+zlOCFpyA8Jgw06gei1cOLmUxLW31mXa2i+Q6YnzUEKFFk3loR
	RnbviiK1On8QmCiQRDLj3/uKeaaO2efD7px0OhQU+S4JKejNb6w+SXbXKYOC687b5taFM/
	uqsMh3rM5fawS0O6M0kd0avdgLRn07xVxptoMcBWPPtC5ky6vy5j3K5sK9lW+ml8tv06F9
	Z/cAnGaHGfDqmcO0BK1keiulYp2/PAFufi6zGQVFzwwSX9rzmotD9btReSVqB0+wbtT0Kd
	wQZL4l+SQq18wbS+z775MtELDM+GKuV0bYINV3glw4fphhNa97+/9vRTCOu+Lw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:10:59 +0100
Subject: [PATCH v4] migration-guides/release-notes-5.2: add known issue on
 stalled NVD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-nvd-stalled-v4-1-2eab55aa0fc0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIACLn12cC/33MQQ7CIBRF0a0YxmKAL21x5D6MAwofS1KLgYZom
 u5d2pGNxuF7ybkTSRg9JnLaTSRi9smHoYzjfkdMp4cbUm/LJoIJyYBzOmRL06j7Hi1Fq2StGoV
 MalLEI6Lzz7V2uZbd+TSG+FrjmS/v707mlFMHDVhrHACvzm0IY++Hgwl3spSy+KPFoi00QraoH
 ePfGj41bDUUzRFVW9Va1dJs9TzPb5JcPGAkAQAA
X-Change-ID: 20250311-nvd-stalled-ed957989e05a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3015;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4QUvlbb9a/Q9It6nC/qcx+s9nIn9Ti1TUbonfIAKf80=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+cohuOUXLWmLAnpTLErlOAkJRQzi6/lVTNXU
 pRzjjE6aDmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fnKAAKCRDRgEFAKaOo
 Noy9EACQFbEdQva4GVi1IKubMml1AIP9tiUnKKsO4wPPp1o2yzXWBqr9T8LYbUU7/d3Ey3BKHxi
 libW0bVdjXPrLdhjcWpouTUPpNUkZGlswE434u8oQ2N9i1rtxR07BFYcU4jJxIuJ7jm8Jo8fk1g
 tftEefCv0hhhsaQOh0DbSylc7VdceQEMAC56omNwiA1WYhIDWu2ofmMSmJF7iZ6C1pLmc7BTA4R
 5dmpY/RLvZMqRMetpdKroGPlWheraWAgK4K8Ok/fafQ3m/+OXvl+s4NuPqNNY1krBLX31c1fbEU
 RxNYP3hMemZFDG770gVlYdM16aH2LrQ9OEjs5WL5gOl/7tCa9DVFSv9Y+VxUi8VZf3gcawR34/h
 retxqI4apQlFso4eQqsJGT+74TMYNWQlDE+af4aJ3xqjNTp/wNnf7pWM9YaF4OaUr2XJCtT5TbV
 cQp2XTBLtDCzRt6g01+lBwRLca8amwZEoJReHBCywpJEQOPiPPA1qkA9Nt2k6b8qq5GH7IbLXE1
 Z2vPVT6lyB5KGJGXxs6SbGPIU9ZoOIku4cCypvhsi6HFBiJriVKHWO+Of31HutwIOFJ2efE1bux
 Qvj/bNrj1OUT2yWGyp9GFvZAQ+/OGfREhT+yRB6GZoUS0ktysDVtcb/Pe+PGFZqcg5wG3a37h8h
 SQbh6UOf4UE1Zew==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -106
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqiedmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuedtvdffleegteffgffhvdffheekveeugfdthfegteeglefhkeeghfekgffhteegnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrdhorhhgpdhnihhsthdrghhovhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtp
 hhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:11:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6573

Add an entry to the known issue as the NVD is not up-to-date, the
impact on current CVE reports and future plans for the Yocto Project.

Follows the discussion on:
https://lists.openembedded.org/g/openembedded-core/message/212446

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v4:
- Review by Quentin Schulz (thank you!):
  - Be more precise about what solution the YP team will try to solve.
  - Remove CVE Project potential candidate.
- Link to v3: https://lore.kernel.org/r/20250313-nvd-stalled-v3-1-1ee9b67a975c@bootlin.com

Changes in v3:
- Suggested by Marta (thank you!):
  - Add what users can do at the moment.
  - Simplify the sentence regarding the CVE Project.
- Link to v2: https://lore.kernel.org/r/20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.com

Changes in v2:
- Typos and suggestions from Quentin Schulz (thank you!)
- Link to v1: https://lore.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com
---
 .../migration-guides/release-notes-5.2.rst    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 417b202cd..5b7da9f03 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -402,6 +402,27 @@ New Features / Enhancements in |yocto-ver|
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
+   During that time, users may look up the CVE database for entries concerning
+   software they use, or follow release notes of such projects closely.
+
+   Please note, that the :ref:`ref-classes-cve-check` tool has always been a
+   helper tool, and users are advised to always review the final result. Results
+   of an automatic scan may not take into account configuration options,
+   compiler options and other factors.
+
+   The Yocto Project team is working on a new solution for the next release
+   (October 2025) for enumerating CVEs. This solution should be based on SPDX
+   version 3, which is already implemented in the Yocto Project with the
+   :ref:`ref-classes-create-spdx` class.
+
 Recipe License changes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
change-id: 20250311-nvd-stalled-ed957989e05a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


