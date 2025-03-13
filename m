Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44C4C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 09:41:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.10468.1741858907653317216
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 02:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kF7rV81m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E71C43284;
	Thu, 13 Mar 2025 09:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741858905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=njGvPuN00NOUnGQR3dEOLLXi7qwQ5P2IqFQwIxAoQ4I=;
	b=kF7rV81mMzxqEkAXLMZW3bOA/QQdyWsOWhk+fVi5Okbi7tfLFgTPAuVBmBFHeTGmUvWSLY
	tafEvzH1flRHccWel4/3SZQEg62AzVUu2XVszfX+byjTLxAkmG84g259Mkl+ULAQIOnbjS
	2vgcpxbG1FfMs09v695Smq1kq/PKjyEhhZO4RdIovOvHMOXyRZmHhFE2/145R8JUWApU2j
	XRBpWmPRR5ShzBbvi/9oRKfHZcltE96s6qx7Q/T93sEXQ2XE3M8dvpA28jIREhmUFGuIBP
	8U4vQ2M7o6H4Ifp5gPBF1ZIfPlROdzxFWRAgZddmaxuFRMZjIJjlKE6/LyqTaQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 13 Mar 2025 10:41:35 +0100
Subject: [PATCH v3] migration-guides/release-notes-5.2: add known issue on
 stalled NVD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-nvd-stalled-v3-1-1ee9b67a975c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAE6o0mcC/32MQQrCMBAAvyJ7NpJNiLae/Id4SLsbG6iJJCUop
 X837U0QjzMwM0Pm5DnDeTdD4uKzj6GC3u+gH2y4s/BUGZRURmpEEQqJPNlxZBJMrTm1TcvSWKj
 FM7Hzr+12vVUefJ5iem/zgqv9/SkoUDjdaKLeaY3HSxfjNPpw6OMD1lNRf2q11qQbZTq2TuJ3v
 SzLB2M4j77mAAAA
X-Change-ID: 20250311-nvd-stalled-ed957989e05a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2878;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=EPj6T3C9uE91LPipZ7LB0LoL6L73EZAy8fCh3EPesmU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn0qhZYnGXttxJewiRzWq0M3o+XITVlF2pjnEbr
 spk9sOVUZCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9KoWQAKCRDRgEFAKaOo
 NpgND/9ZQGa0wxIQsITiyUV5TeAeOv3WYs56/7cLrx6ebxS5NzxDJK+GVpvnY+j2iYBnHhZyLV0
 dPOdRrFiJUVYIosA796racAl+luERjpJIIKhHZBBiskm5uQUdBeUgpQNxexz1H7D7/+3oUFiJNA
 8HRLH2XdBWDDcuw9RmnecdMN+u44fLP8qfU2GIs5AAyBi7EIZqv5X58vmyOKMko4IaPywWGMq9g
 pzBmVLkC8r+4uxb+DDKReZQJI2UL6wEO97pPsCkL82Nj4stlGdeCwOgDkVfvVgtq/0mgEWDmlKw
 qi+H3xZxSoks7yxYkI1Ea7n8Wx+nWbadwhCS5HfZWF1IvCS4zqCsQRzOaKx+nlo92Y46mOYRVfg
 RxaW1Z43gDgDA7D5ekj/crqWOpog/TTdr0Ley2qlmPA4xRFdizg3x9jCfp4CLcWCtrF5QYj3mDd
 w4NaMnYDKOe7Nt7RN+5OPVmA2WGSCHMJGs84kf6c0f08FquEQyz7mgk3ZEmabtgfxTQY/YyIFOj
 1WZvojbnsW0y0qQwraM8Qt9h0pIdvrvUvpjdtaMYoOlTqqlRAl5XtO28myR6RIne7wxkcxfewUM
 fAYesRxv7gukx2PeUzQFWiXZLfjJf6qLjmfilF+Ap693tdVHsT8hpCAju+5/CcX6BQ+KzL7xVYQ
 VqDa2/kqPgynNzA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -106
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdejieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqiedmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdeiheduiedvjefhkeduudeuteetheehteegueeutdehfeetfeeiiedtueelgfeinecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrdhorhhgpdhnihhsthdrghhovhdpghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhli
 hhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Mar 2025 09:41:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6553

From: Antonin Godard <antonin.godard@bootlin.com>

Add an entry to the known issue as the NVD is not up-to-date, the
impact on current CVE reports and future plans for the Yocto Project.

Follows the discussion on:
https://lists.openembedded.org/g/openembedded-core/message/212446

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Suggested by Marta (thank you!):
  - Add what users can do at the moment.
  - Simplify the sentence regarding the CVE Project.
- Link to v2: https://lore.kernel.org/r/20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.com

Changes in v2:
- Typos and suggestions from Quentin Schulz (thank you!)
- Link to v1: https://lore.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com
---
 .../migration-guides/release-notes-5.2.rst    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 417b202cd..60564bbda 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -402,6 +402,30 @@ New Features / Enhancements in |yocto-ver|
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
+   The Yocto Project team is working on a solution for the next release (October
+   2025). This solution should be based on SPDX version 3, which is already
+   implemented in the Yocto Project with the :ref:`ref-classes-create-spdx`
+   class.
+
+   The `CVE Project <https://github.com/CVEProject>`__ is currently seen as
+   candidate for being a new source for enumerating and classifying CVEs.
+
 Recipe License changes in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: e608902ffae3af5ab0c5308b0550e49a790482f0
change-id: 20250311-nvd-stalled-ed957989e05a

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


