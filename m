Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B69C36010
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.61726.1742894477568470194
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cSD+r2a4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94EC64328B;
	Tue, 25 Mar 2025 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iEGoMS/ddvsOSLEIi1bHwdMrGzaXoCCe5JN+6WIWKds=;
	b=cSD+r2a41efLItDzhxcVY+z6ndqCJ8Jigp9tnWhr5YdRZ5jlxk1y0DpDd8VYwCxoApp0xV
	Ap5Vuc+LOdYmjifVwF6o+2yqcjy6iVibGI9DDyXBegCud6s48xunfNAxIIPm5Pt7WHW9dL
	HC1BZIjsnbGacwBtL5wp5li/BHsNOnb5Ok24NcNtzrEUGHxNAa8p7LiRDZNbjXFHbl2X3N
	wLfB7Bsms3fLQHavSxW9dPnF0gfV5nQTiVBMnHgnu4ur8nWDxXb3Kd92DpVxJESbeFGX3N
	DPMEnONAk9S2/HOLyXW0LAQxXCoVMOGJk7iCGYbTL0pzwfAy+Y2wEs9mXaM92Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 00/12] Updates for upcoming 5.2 release
Date: Tue, 25 Mar 2025 10:20:44 +0100
Message-Id: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGx14mcC/3WNQQ6CMBBFr0K6dkw72ACuuIdhUeggk2BL2ko0h
 Ltbce3yveS/v4lIgSmKa7GJQCtH9i4DngoxTMbdCdhmFihRS0QNgWYykcD5RKAB4blYkyiCLbH
 RymLZVLXI8yXQyK8jfesyTxyTD+/jaVVf+4uWqvofXRVIqLGX5qJqNOPY9t6nmd158A/R7fv+A
 aJxmXfCAAAA
X-Change-ID: 20250225-release-note-5-2-updates-d32951d23978
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KVlFyRZ9AB5jsmettXs3mVprjBK43SnbzwMyNF5T1Ck=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWKNAQkbzq5c5V9TxmHIkSGGtmJK4mfM6QyA
 q9Ib2qBEwyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1igAKCRDRgEFAKaOo
 NqEUD/92dPr9acasjCAK/cSFiaemazoU6x+5IWlxe0m6BFOaKsauuuWWGTOsMjtvqLpfPqA2o6/
 KIP1tpPg9Dsd/gHcaeOhrCB+8iBrVlbhSF9tscTTay9v3Md6jiG/hzNIDNvc5nsuy8Ujt6qPY+l
 Z6Wp5E4qY/9uHZE0P+6hZDf0ti0YYhe2ywg0wQUIfw5iS1CY+wOgQ4VQG0yDqmrKRC8ixD0KaSE
 KZRJ5nSDYyIldq5ecZj8TolrDXxhpp5JJ2HurNS7StdOyhMhlsZ2kSID31RQFNmVSILZYTBubma
 FhUOxWaoUMEjYabtYIQSU0G394jF4bB/iiCfN/sP1hbb1qbl4Kucmr34KIqs1bU/quv/iBu5RtI
 MOYbHGhF+7bZQx7WrMmQuHHd5q/AvgHTD1CA+lNo7gQmWQH7KSKUiY+7kYwneKXizFq4JA0rVDP
 QIskuKeeMLd1PxhE7y/uETpSImGF9EGKIVbb6sb9hlZZ1ICyoxDjUw3p+H/sZ1imUdES8VFcoJn
 IiXiMhJzr3e4SQyhFVgiE+gs5rsPgOrPLQ4OSYTvPGaW6C68Nu7cPNv0JBe4v6qRBtYlVL37e+8
 qa0zsnNZt/iw5c3+uGDyAiN9Yt0pOJHubd4lZlBk77Cde8wdrQKyjnrrxEKV6eOGmMnsgZcgmeJ
 98h7fGHqwjAAbuA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtudeuhfelveehueevudefgedvtdfffeevleefuedtjeeuteelgeelvefftdejteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6613

First series of patches documents the missing or deprecated bits of
documentation.

The last two patches update the release note and migration guide for
5.2.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- New patch "ref-manual/variables.rst: document autotools class related
  variables".
- Add an item in the migration guide on recipe inheriting autotools now
  requiring a configure script.
- Add minimum Python version required on the host in the release note.
- Mention that users can choose the NVD database source in the beginning
  of the release note (thanks Marta for the suggestion).
- Various additions to the release note after documenting a bit more
  commits from Poky's master branch.
- Fix some indentation issues in the release note.
- Link to v1: https://lore.kernel.org/r/20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com

---
Antonin Godard (12):
      ref-manual/classes.rst: document the ptest-python-pytest class and variables
      ref-manual/variables.rst: WATCHDOG_TIMEOUT: fix recipe name
      ref-manual/variables.rst: document the WATCHDOG_RUNTIME_SEC variable
      ref-manual/variables.rst: document the MOUNT_GROUP variable
      ref-manual/features.rst: drop ld-is-gold
      ref-manual/variables.rst: document the MESON_INSTALL_TAGS
      ref-manual/variables.rst: document the NVD_DB_VERSION variable
      ref-manual/variables.rst: document autotools class related variables
      migration-guides/migration-5.2.rst: add information about autotools changes
      ref-manual/variables.rst: add a link for BB_USE_HOME_NPMRC
      migration-guides/migration-5.2: update for upcoming 5.2 release
      migration-guides/release-notes-5.2: update for upcoming 5.2 release

 documentation/migration-guides/migration-5.2.rst   |  57 ++++
 .../migration-guides/release-notes-5.2.rst         | 354 ++++++++++++++++++---
 documentation/ref-manual/classes.rst               |  15 +
 documentation/ref-manual/features.rst              |   3 -
 documentation/ref-manual/variables.rst             |  60 +++-
 5 files changed, 448 insertions(+), 41 deletions(-)
---
base-commit: ee6b3698da044e290dbc4fbb852f3cc37638e689
change-id: 20250225-release-note-5-2-updates-d32951d23978

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


