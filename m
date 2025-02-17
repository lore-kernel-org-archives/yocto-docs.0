Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632FFC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 14:50:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.53279.1739803835784472584
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 06:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TWsezrhe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3C1543313;
	Mon, 17 Feb 2025 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739803834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xyhd3/xbRWCLmQxXAml0DkvDIv3BvsSYaz3c4n5b01o=;
	b=TWsezrheRMmkuaEi4yx4NP93O5HegWzVTiaI962NZm0MghNHh0F9eb8/20j3fRjCmObDxK
	aTZhp0+NA0UWx1ivz95QTRb8xFVRgtM0SvBVfBOlrj+k326IWk4RHG/j4jHq+XZUyUSz7C
	MbirsHXybH1tKUMlirgif8+Lu7/2gERCC3DArM/JhP9pnLqsPUTfsQ2F7jsn049lU2b/2D
	Udp1HRh3fSliGfZ652BMGAGlFWEVxo67EEuAMXavN/+qd/FSqEzSUAaxjCiBdWGhOJSmvP
	f31KoNSGHqUVuVDNaDaID1ObnzzI81Nse/Zm5teSIiHU/73oqo+p6E/2jjly1w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/6] Improve multiconfig documentation
Date: Mon, 17 Feb 2025 15:50:19 +0100
Message-Id: <20250217-multiconfig-doc-v3-0-027a9fb282c3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKtMs2cC/2XNTQ6CMBCG4auYrq1ppwLBlfcwLvoLk0BrWmw0h
 LtbcKNh+X7JPDOTZCPaRC6HmUSbMWHwJcTxQHQvfWcpmtIEGFSMQ0vH5zChDt5hR03QVItGnEH
 WUrWclKtHtA5fm3i7l+4xTSG+tweZr+vXAtbsrMwpo64W2kjFnTTtVYUwDehPOoxk1TL8CFzsB
 VgFUEZUnFdaNf/Csiwf1jh4RvIAAAA=
X-Change-ID: 20250129-multiconfig-doc-c37342a6ab91
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qPpP+dinbBavGxiTi6qzrV5rzUTU3D+Cb1G5o3PsioE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBns0y4uGvsVmUWZkgDg5rP7rMZnqDU8TM5LbeBU
 4YreyFlQ7qJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7NMuAAKCRDRgEFAKaOo
 NnoRD/9+B+yX60uPNzKzUx2CXKyDWt+hK3uBmn5dG/qPN8IGsdsH5l6f0eOZUEKXWGLUR7qTBLH
 BArznPmNaDk4OFKzR5mksYPO6pRPUKnGsLtwHVZm1Y+JX6a6J2boRdRKGZCl6Jvches00DRIVQ3
 Jedd8LcsYkj0uFOWemAMybkSF9MPZiNUexuv3PDVqV8EVGyIkaLxIwTptbfd4v/LxY3SDmZgJeu
 CnmQpY0lwJPYUX3RsCl7zK9i2n6xGoIdjiPh9t9BxdOfiTU4pLFiQYSDxdly3mGR1DCDL6/h6dK
 upWfnqpN6McS8n7S7Q+jqTfnm4wanIfglPGedHmf1PzoVfEdasKhjfH1hRhC2zIl+RhfWoksnS+
 EhxjAfA/h1V8tHiaDkL0Sddq+h57X93ckXkbQzaDusAoUxGbHoeWzFLw79aCPv/hodQSaL2Jjy8
 YPPT5hzJ94ms3+NtQ6AuTMjBxoYCJ69OaQABQaWFyumrw8/KX2BSJVmDFFctOPmCXoFlUajuVyP
 X4lHWyT1lvzL7kdpYyZAXuoRFU7zqITbewKZtrNAKFzehozjFCNytQWC/0l+HjQH9ZP9563xh+3
 NM77ZBqtyKDG4STbLaxXEJ1TwYqRzowfc9v78URg2aSiaFWEAy8Kh3EV4/g9P/PrrRaTpm6EXSH
 LSNIx1P694RdX2g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeekkeeghefhvdfhfeejuefgudduveefgeefieekkeeghfffueeljedvjeekiefhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtt
 hdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:50:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6394

This series moves the multiconfig doc to its own document in the dev
manual, and adds 2 sections to improve it.

It also adds BB_CURRENT_MC to variables.rst, and fixes previous
references of that variable in the doc.

This series depends on the following series that adds the BB_CURRENT_MC
doc in bitbake: https://lists.openembedded.org/g/bitbake-devel/message/17185.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Various typos and suggestions by Quentin (thanks!)
- Link to v2: https://lore.kernel.org/r/20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com

Changes in v2:
- reviews from Quentin (thanks!)
  - add dependency on bitbake series
  - fix first commit's bad reference, replace with a :doc:
  - fix some typos
  - add example install and deploy tasks in the suggested best practices
  - mention that the baremetal scenario could also apply to a main Soc
    with companion microcontroller + add a note on overriding MACHINE or
    not
- Link to v1: https://lore.kernel.org/r/20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com

---
Antonin Godard (6):
      dev-manual: move multiconfig documentation to its own document
      variables.rst: add a reference to BB_CURRENT_MC from bbdocs
      migration-5.2: fix references to BB_CURRENT_MC
      dev-manual/multiconfig: rename to use Multiconfig term
      dev-manual/multiconfig: improve the current doc
      dev-manual/multiconfig: add suggested best practices and baremetal sections

 documentation/dev-manual/building.rst            | 156 +-----------
 documentation/dev-manual/index.rst               |   1 +
 documentation/dev-manual/multiconfig.rst         | 312 +++++++++++++++++++++++
 documentation/migration-guides/migration-5.2.rst |   4 +-
 documentation/ref-manual/variables.rst           |   3 +
 5 files changed, 320 insertions(+), 156 deletions(-)
---
base-commit: 6eda443c7fcfeecebd6b44b96a1587c4bb093a34
change-id: 20250129-multiconfig-doc-c37342a6ab91

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


