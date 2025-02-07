Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF704C0219C
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:28:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.65036.1738916888413861381
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 00:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jUoQtnZu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C695B4430A;
	Fri,  7 Feb 2025 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738916886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvK77Lxg8CYOBQGX2xqYqibajnwDeyPjMko40bK0tvQ=;
	b=jUoQtnZu+lmdWydjfE67L4qY5m3gW4ivtACs1pCEyFpSsYQmPgaGIFf8LeGKXGQeCpCgyW
	vwk2QWXYGicQK7Yeuk/9gsUsgYbAWBY7nKpgmgyMqHyNCPHVDtcj7g807SAyTkynb6aCMw
	3fJ88EBPy5u3OjTSOSwo/y2GdcQZIcgPW1tLIx1XoZ9eh9q30uTocSZQdLLfiQmpjRQ9NS
	MNCEidaToJfRTt0c0BI3cVqvGQW2cCJqCGGO5bLhpkSASW7lm5Bmi5N4SBM6R5VQnJNgsz
	ehw1bBOfHHcDr3700pRzTBtm+40R0VK5rKK3oxlRpyCCoYSyeWV00P+UFJCtiA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 07 Feb 2025 09:27:43 +0100
Subject: [PATCH v3 1/2] migration-5.2: document BB_CURRENT_MC default value
 change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-migration-5-2-updates-v3-1-9571efbb1cd0@bootlin.com>
References: <20250207-migration-5-2-updates-v3-0-9571efbb1cd0@bootlin.com>
In-Reply-To: <20250207-migration-5-2-updates-v3-0-9571efbb1cd0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VbH8l8H+YDXAdo2x7Btu7iMxrUSBHs0JGFipsu5QAgk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpcQWqFbphJxP3Z8+jtqs1oVKC2nbFX4bV9oNh
 dgtRjLVafSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6XEFgAKCRDRgEFAKaOo
 Nnf5EACt4BHFu4T3eljLO8ucGW9SrT07ke+jy+RPuSKyqLKEE8M7gkg95khIAWkNNuFuk4CBs3O
 1Q4ALgH+5+f+Mr57CxdftEfqV8RtvPjMEkciPLZu3tUEnmDg2j03GOh3YOMciuRxNc4Pfl+ae9t
 uXD07SZB2119+hizP7M8RkWFHRJmBUvmWPwEpE4+sdqY9CoJZ474EmNlD1fY8C81Hk+cENAIybD
 sTXRMIE6J+DgVjfFaFpR/U1Q0K/SObZ6xp5lqVC1UBL5rOHZlwJbd6ex16VLTUzc44T7QyOputn
 qkHl+UekZsYabwhlVoRpOGxd1HvdXjEeFrPvI4EsKMHx9RVmNhlHkCEZBPFrlyvmZZ6yLA6pRvd
 dF2uRCrVpZjPWdj5VbiLPh+IdRZAQS7+lS07ZEfRpNtHLFgmMaRnenUkvTlkVchNDguzgbhv69i
 r7JYJxInUGP3unzSI/Kx/f2dg76syrrjzKnADNXVRT+b+UDfpMXpyCy7Czs2br/iIOXxwpN8JtV
 MEzAG6NDSA+t8FKw+LBwf4XR9KzTfKmU3fvzF2UZoz6r9KjUCL7E3tN5oql+6Jc/vqRrJ7cGJua
 gxVCY6XHO4xXMKSK6dsrB1fK0kvvw+rPcWtlDNDfxgcT8VmtonIWfFSGXmKu3KwZpfKQMlRpMP+
 y6kiUsCEU4+UdJw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 08:28:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6273

After commit 0fa0d8d764bb ("cooker/cache: Drop mc 'default' string
value") in Bitbake, the default value of BB_CURRENT_MC was changed from
"default" to an empty string. Document it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index e9de6910e..a60e3e9a8 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -94,6 +94,17 @@ systemd changes
    not for socket files).
    Now all service files must be explicitly added to :term:`FILES`.
 
+Multiconfig changes
+~~~~~~~~~~~~~~~~~~~
+
+The value of ``BB_CURRENT_MC`` was changed from ``default`` to an empty string
+for the default multiconfig configuration to avoid needing to map the values
+within BitBake. This was already not happening in some cases so this fixes
+some obscure bugs.
+
+Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by default should
+be changed to be equal to an empty string.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 

-- 
2.47.0


