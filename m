Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E642C36017
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10705.1743167257730104996
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=abLSkgGW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15807441A9;
	Fri, 28 Mar 2025 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ch2McYUGsA1UYm5dXuPYmz+eydZwWtaSOiWr88r/H/w=;
	b=abLSkgGWLL6Xq+YzooQMQiPvRwjJUDkZUxTTKwSwafpPXvvpejkCuF4RXoToG1a4Z+Rmn7
	2oheLzs6wgr5xINfhQ1VcdKWnARBdy+xbQKs9pMf0Umf8QY1P3MLqbval/WQe8OrGWY0go
	mwKwQ9ENsDjZrfHaY5U+nZ2GXZaeYuMMYXVe7mjsLHDDbg990lbdympMv0aN6Rv1E7gHTv
	cD2UCbXbRagstFL2P2u29UXqRUVoVwyMll43LLCG4PmMEm+B7ssdjxBWB+0tfZiQB5Gvna
	Os93hsAcQu8aLjas++rDB9rKVRdEboSRzkru/q6bNM4bnNj//SRvR8trvKKgHA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:13 +0100
Subject: [PATCH 10/11] ref-manual/variables.rst: document the
 SPDX_PACKAGE_VERSION variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-10-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KIWuKv5ENGzY3gEgIcFybF5pKAL1Fq2mfGaxFXiT8XA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8Vm+/yxPxsv14F57sG7N/54U1UrD3lQB/0h
 qYlIZB3qMmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFQAKCRDRgEFAKaOo
 NqpbD/4yqkqJ38DOHwh+fCZp/+u+LLyBDtVpHX0gDD4VcLLmusJy56qDcmGovs4IbXsKeu5YVxD
 N3twbhTspC417ijqQOPOpW8HATPBDZMxWqW+uDIiV48Ld/WXjvC/1JwFcyEUfBA/pKAplrW8wsJ
 Ak57zygIpYx5XgNK+GnVuzuDCUPd8Wcc/QvOP+KChrNs80QyhgNVtuEvcmYZhfnVap4f/ikZ6YA
 aRBEjXITN0EDUZyu3WwMINNr1CPvHYtmGsuuAioyqHfyvr5Xl3yjay2XOI8a6eT/OwzmK6pfdoa
 CWirAkdUgIYv71u+NkIHb8qFd6cSwWNnikYNhSXBiXoP0y9/XWDeDYKVwUrJ+oJ3Z9gVZQs3uVZ
 jYIn9+C+WG+G0U5D7ffE034FDTy9h62+ec+mAOVHhh8aK2aw3rY4q4vzv7/USG3b2mj2FOFbIcP
 OqxCQndUDnB3GzmAspYFvAiboUNUgOpOCczoKrLx6QUentPiNYFI+nmI3Z07uBR6xg4Rn7DMiRU
 p6l4Z5AmdF3WrwYGeQk7Ae5VqeERBLvwf76B1B2olr1ByoQ/5v1HKty2vBKHTA+tM79N8mV+hyH
 rYXPrLqVBu6XdlE4mphZ+dD4Aloo7JK0Q0AQU6BC3T4q1u7KLRWbXdx4FFIMGBVR8/RhmxPBUha
 4EmQuNMpMzUETGw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeduiefghfeggefhleeigefhtdevheelkeefkeevfefggeegleevvdetvdelieenucffohhmrghinhepshhpugigrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhop
 hhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6665

This variable controls the package version as seen in the SPDX 3.0 JSON
output (software_packageVersion). The default value for this variable is
PV.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 20563d61f..62e339ed8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8420,6 +8420,11 @@ system and gives an overview of their function and contents.
       and the prefix of ``documentNamespace``. It is set by default to
       ``http://spdx.org/spdxdoc``.
 
+   :term:`SPDX_PACKAGE_VERSION`
+      This variable controls the package version as seen in the SPDX 3.0 JSON
+      output (``software_packageVersion``). The default value for this variable
+      is :term:`PV`.
+
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a

-- 
2.47.0


