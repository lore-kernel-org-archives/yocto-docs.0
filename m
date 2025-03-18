Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E9CC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 14:39:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.13620.1742308763505581640
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 07:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mN3z1pt8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27D56442CA;
	Tue, 18 Mar 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742308761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QViCRFxKrclhievBhfCMTdBm0rSNesao8ZmAZk1jpwM=;
	b=mN3z1pt8P2JTN+p1I5qT+Mt1PXoR00Cr7g0Kozprv7mvoLv7yQd2u5XMieqaFySAcku9nO
	BQki8nHYYKPobs1MjUgtKXPpJcBX5JSfRQShAT8IGUBipLznGPDXh3TCrg3WqPyNM6iODc
	Zsj+u6+N48c+7+9i/r0IGuv0mlv74VWK3BVg7IUhXiJGNXoEmCTTac1ugPhTye2kbqyQd1
	8ErB2d+XmepEyJL6M0C/gj/g29Q76M1Yir0HEknEbuxVOpWpU4RN44UH47lD7vDv6o8c6A
	+XvwR7h6jGMyB5+pdbzcV2JjsOjshJVZ5pslCejbuu2dDTtw+uz8iENfFw9OTg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Mar 2025 15:39:13 +0100
Subject: [PATCH v5] migration-guides/release-notes-5.2: add known issue on
 stalled NVD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-nvd-stalled-v5-1-49a981fe421a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJCF2WcC/33M0Q6CIBiG4VtxHEcD/lDpqPtoHSD8JJtJE8dqz
 XsPPdLZOvy+7Xk/JOLgMZJz8SEDJh996POQh4KYVvd3pN7mTQQTkgHntE+WxlF3HVqKVslK1Qq
 Z1CSL54DOv5ba9ZZ36+MYhvcST3x+f3cSp5w6qMFa4wB4eWlCGDvfH014kLmUxB8tZm2hFrJB7
 Rjfa1hr2GrImiOqpqy0qqTZ69NaV1t9ylqgbqTUmjnDtnqapi+1dwzgYgEAAA==
X-Change-ID: 20250311-nvd-stalled-ed957989e05a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Marta Rybczynska <rybczynska@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=INQ+WwqRs/88Xam3fW8VbD+sOZRzpMHgGbJllAZQdeY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2YWYvC8++kprhZ49gMcRh/AsT8bNjOolzcg9G
 d/idN5r+IKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9mFmAAKCRDRgEFAKaOo
 NlERD/46GCHlHvk9Y0bfBCVxqmMBxdjFpi0fNik1CF34q//mUCZ8eTj68iOxl+s9jNID2ClFNuQ
 RS3FW/9+XufdbUdSHfqIs4fDto0J1yty9cWuMDI3da8kL+JVzypvZ6wIAvZrNgSElCuGCajop0D
 ebWmxKG0uPDMpfOolyBy4SphPSWGBEm+fWGm8qrH+fdJKtw1uNKdlF2ortNzv/see5y7r1TJfbT
 SvXrWon6nEK7xHeD7v6guCNXduK7su56EI0Js+hgW64vPzlvsoO/qYguqGLNogg9NREQ+RcYpZs
 kh8cdFLMg3TS8h6VLwvRpymie+/V3222/zp3MKiOdQ1z7+CBGaTD2CAHWajErsQcEoEEMOr5Ikp
 sGs+UAji1PRgDJDo6EMeDCJnwHVL1toa5df0hE6mNfAahrD+A1JD8O5zgyy1B3dZvGyNUtl+Q9Q
 Idx5nuLGM0TnpxEjaU33MWuHNbVrymW9TD6nI94VK5il0HIsRV8yvT3cb1Yfrnh8mIf/5pmp0iP
 dqmuMM9wFkBlBOxO6qkAanX3nP1qv0uDXM8TfJxjimnP5RVAJ8/7xMveykWcsugDcp7hl3VDG4z
 4GaCy9rraBJDEtKIzoXr6kdxSmUl7HK/jIvg22xeucOPbLkjcQXitL7S7u6B+DTWBWVBj+PJj9a
 DzZhFgU7UagraNQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -106
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqiedmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveektdejffdtgfefuedvfeevhfeiffdtjeejvdetgedtjeekteegledtkefguddvnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrdhorhhgpdhnihhsthdrghhovhdptghvvgdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehrhigstgiihihnshhkrgesghhmrghilhdrtghomhdprhgtp
 hhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 14:39:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6594

Add an entry to the known issue as the NVD is not up-to-date, the
impact on current CVE reports and future plans for the Yocto Project.

Follows the discussion on:
https://lists.openembedded.org/g/openembedded-core/message/212446

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v5:
- Rephrase first paragraph to be more precise on what exactly the
  problem is with the NVD database.
- Reviews by Marta (thank you!):
  - Rephrase the second paragraph.
  - Remove the last one.
- Link to v4: https://lore.kernel.org/r/20250317-nvd-stalled-v4-1-2eab55aa0fc0@bootlin.com

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
 .../migration-guides/release-notes-5.2.rst      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 417b202cd..d7115230d 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+-  The :ref:`ref-classes-cve-check` class is based on the `National
+   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). Since the beginning
+   of 2024, the maintainers of this database have stopped annotating CVEs with
+   the affected CPEs. This prevents the :ref:`ref-classes-cve-check` class to
+   properly report CVEs as CPEs are used to match Yocto recipes with CVEs
+   affecting them. As a result, the current CVE reports may look good but the
+   reality is that some vulnerabilities are just not reported.
+
+   During that time, users may look up the 'CVE database
+   <https://www.cve.org/>'__ for entries concerning software they use, or follow
+   release notes of such projects closely.
+
+   Please note, that the :ref:`ref-classes-cve-check` tool has always been a
+   helper tool, and users are advised to always review the final result. Results
+   of an automatic scan may not take into account configuration options,
+   compiler options and other factors.
+
 Recipe License changes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
change-id: 20250311-nvd-stalled-ed957989e05a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


