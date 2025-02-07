Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE251C02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:28:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.64770.1738916888415665186
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 00:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MWKSgcd2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 864D5442FA;
	Fri,  7 Feb 2025 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738916886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XChg3ibBzpgK+hDe9elUzCcYuVJ9YQAHokFKjOK6S4Y=;
	b=MWKSgcd2nBM+6/by2B8qDrd3c/saQAYOtNFSeAeGcIqvH7EsmyIqwlpZVOi+u+gBZPAsbq
	w+kjNBbXSaRhbtYIBeIQHng3S6Y7q5Dp/s7N+zmAOzXvYIGs8Xw4T4LcoA+SLMJ6bHlywD
	S/kH60mvxCbnZKjvWyI1HKg7lSGINQ73zvw8tXTb353kpjdkzhNIWuboGPLcYna8JhvglJ
	f11/3JrHXDHrv4XqMzjgeWmhOnnyIiRckba9K52lrJvkvK5kCa7FtzunZDn4LJwmtq/nc6
	jWX3Jn/ie+TFC5WfDwyLe2QPLFF7158mKjsBVMQNjyEuXAIF0VBnO9ePZm36+g==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/2] migration-5.2: Add entries for virtual provider and
 multiconfig changes
Date: Fri, 07 Feb 2025 09:27:42 +0100
Message-Id: <20250207-migration-5-2-updates-v3-0-9571efbb1cd0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7DpWcC/4XNSw6CMBCA4auYrh3TB5TiynsYF30BTYSStjYaw
 t0trHRhXP6TmW8WFG1wNqLzYUHBZhedn0qw4wHpQU69BWdKI4ppjQltYXR9kKlsQQ0UHrORyUb
 QihOmMFWG1ajczsF27rm711vpwcXkw2t/k8k2/SdmAgRaUREuq4YLKi7K+3R300n7EW1mph8OI
 78cChgqbbkQsqlUZ76ddV3faa4MiQQBAAA=
X-Change-ID: 20250129-migration-5-2-updates-cb613b02bd35
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6AYI8zIR73Dx3Drjb83pKOOAsjUASV9IXBGlaCl3GnM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpcQVila2ODlsEkVCQBLfbPFXH+pOcCv0BQWqt
 ccfUye190aJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6XEFQAKCRDRgEFAKaOo
 NsjfEACETP2QsRwaqBAqrbYVi8n7Y/a8sP6Z2DRZ9nZGC0v4KCDzsFeErknYlcfGlm5tIhrCS5J
 YJZ/t1D+qcVY4YdpA0NisQl7I0ampB/4ZDawGlQEoAEY4ZUvprFLgrl3rgoYA4Vi1gKZzp+4k+r
 ME389hx3Lq+c65Mh/88IoSUX+gMtSK2easCUK9w1hSZ/18qJoeR3mJgJ0dmi+dvV9f0SD/zu+QW
 +ZniJmoNuqtwiafT01zhC3HIFSbZ5LttDHtpatvM5LUNY+xP5QdWdae5rFBOVxP7peb+T9Y19Yu
 L3QGiTNQCffreRh+6OSA8hkVFFtx12RLmh2PzHpArkdibIpUonMHFquFUsaUow3wdu//agvv5Ar
 2IOZdGVSlTsIeRJaOQxmKdrIowdg7U/4gPRDp3kRS9ciBLHQGdCqkV8Uw95IDx1jGyYEgl8TFlm
 JnmvymoQPnQv4HNNE2etdleOuVIbFdimSMjwv/AhhhGXogQYI5D76XVQFUYq3w9HSD68cZTQK5m
 DhReAFLCy+bs6/Cm5zoSws1WO/DZAL5Q/8dhmaAY0ga0BrMbEWm9SFfmJ+8r6qMzYEDWJs2nrKA
 q2e060xMOmHqfNjhVJA69ZX1ZCyPs7fMc09QJwKsz6jObgessB6B/DVbzz1xxe2UGcvacHgyvJD
 bg99p+1h6yTlC7A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefggfeuuedvvefhvdehffejuddujeevhfeiueeftddvgfekudegfeetkeeuffdvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrr
 hihrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 08:28:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6274

Notes:
* original patch by Richard Purdie:
  https://lore.kernel.org/r/20250126111850.2609298-1-richard.purdie@linuxfoundation.org
  This patch is just reformatting/typo fixes.
* The BB_CURRENT_MC should ideally be documented, but that will come at
  a later point with
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=15709.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Review by Quentin:
  - Rephrase virtual provider change to state that the examples are not
    complete and link to breaking commit to show more examples.
- Link to v2: https://lore.kernel.org/r/20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com

Changes in v2:
- Split BB_CURRENT_MC and virtual changes in two commits
- Review from Quentin (thanks!):
  - virtual changes:
    - Add more examples to instruct how a user should migrate
    - remove spurious "-" in example
  - BB_CURRENT_MC:
    - suggest to update logic based on BB_CURRENT_MC
- Link to v1: https://lore.kernel.org/r/20250129-migration-5-2-updates-v1-1-98416a476828@bootlin.com

---
Antonin Godard (2):
      migration-5.2: document BB_CURRENT_MC default value change
      migration-5.2: add virtual provider change

 documentation/migration-guides/migration-5.2.rst | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
---
base-commit: e6745669cc26de8f61d5d1ccdd5a95b552eece97
change-id: 20250129-migration-5-2-updates-cb613b02bd35

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


