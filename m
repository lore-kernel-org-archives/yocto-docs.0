Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5616FC87FD3
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3364.1753783012516736741
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z8SBkyVv;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FB5344203;
	Tue, 29 Jul 2025 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9NT4xwmPag79ZtLIbULi18/paGrkusravv+cg1nVJ+k=;
	b=Z8SBkyVvexHsad3DuP2yDFsq3jVSC6O14dDITY3KKdAJHAGgj3TfPnpziQ+csyF2V4sHtq
	YOwkiNCv0R/D/cCvCqhmtdy23QREpmzekBU2rqWDGeQxya32bADMmsOJEHTh4B4eYQDPam
	LRYQPSOV4SRoXOrtVOSChiVFLa7Zb+NOiZsmlEaPbAjkzShq8/HDXMmLq1+wBM/QOXkOaa
	ohN3OuYi8Khtn/rnekJ7A3nS7MaW8NXijqgnRRZJwjFJC8tK/7ZeeeaiHG5cUkPXt8iqKJ
	j+HhgRd/0ZpRyMmdXceLICDyxi6aC7MYBILjPXyQquzK5XcJhuTwDD+XlPW1Eg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:42 +0200
Subject: [PATCH 08/19] ref-manual/variables.rst: add link for
 BB_DEFER_BBCLASSES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-8-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PsCJ1g+2ofrktU+HwE6UybjHVk81iEgTk8E5TyjppLk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJreCPFJ47/HkZHUYPzou6oHR3Pfg9UrhheTD
 KeZn8v6DMqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3gAKCRDRgEFAKaOo
 Nt7wD/wM47NxBFR7/eMgIr3N8cODNQt2nqzms1PtnUH0YM098oi3wKB49IUslsru/gqZiIz/LXx
 +esShSEt6IRYyEUBr9kC+2U0qyOyfTZYGuYbnj2XnPBW24ad9qhsTjEa4cmT3ENXLJFwezj5a++
 xr5pHXX6mCp6McEkMrqpEL1OnDIJGWBmc+NLZxWaPUHawtJ/Snv4AKbepXJt03dy5LodVrsiro5
 PikGUl0yQfyDE3eiUhm8Xkkfi0FI3Q8F6ZpqrlikMirkzPxQf8776+ZgFc+aQCLNArR2h9jr1v8
 yO0W6TrPOWRU2YnLpHqlZmDwilCDjZiPnWcM7/TroQvXM4DG9hfd5D1PIov2wa6AYlmW6GvaxCf
 BE/gmR9QPuGb4t0Ey/1k6uzranyolxyWgGb9e2HLevjqLRJpAzBK/c5gz15I0CwX/EdLNaY+eUX
 /F3yQAZxXI7h53tivE25w0do6WEfaFAMeGsXlVbQrd3sL6ndYSc8HvBJPUyBTu8hchrEkuCkFr4
 cHF7vrlDEXL7f8MB/20ZWL/if9pRkSayJJbnkVYxnU0EOHOTuRAilRDaKyBM3/N/e56Khx/Ns9C
 cRPRzkb6d0wmUh+9neg7lfd2YcnZkMh1vDY0kMxUpLz7OWfsuY7ptw6PrWw3TTu2BHSZLVhDAvC
 kJKSJpadLwl7GNg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7399

Added by commit 8e741b2e885a ("ast/BBHandler: Add support for
BB_DEFER_BBCLASSES") in BitBake.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 25879b9b4..bd82b9484 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -406,6 +406,9 @@ system and gives an overview of their function and contents.
    :term:`BB_DEFAULT_UMASK`
       See :term:`bitbake:BB_DEFAULT_UMASK` in the BitBake manual.
 
+   :term:`BB_DEFER_BBCLASSES`
+      See :term:`bitbake:BB_DEFER_BBCLASSES` in the BitBake manual.
+
    :term:`BB_DISKMON_DIRS`
       Monitors disk space and available inodes during the build and allows
       you to control the build based on these parameters.

-- 
2.50.1


