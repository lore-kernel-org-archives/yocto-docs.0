Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AA1CA0EC2
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3361.1753783011615658607
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J5pf+rYW;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A1C143185;
	Tue, 29 Jul 2025 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8mH5AeSnKknsX26+eJFvTiHMqIsBtbh2VvliBszEU9c=;
	b=J5pf+rYWmfO3nuni8mtSkyTTmSnpzIRGR3wFRN1w703Yfl5WADSM0+/A20LWLZeE9AOMmp
	dLpVm8ulwWMFSbWTstvzk3lwmMTGyrdUR6P5AtdlEMUjJi3JXGByiwi21iwpDzQRFOK/Vi
	uXVu308dbuErlhMTqj7NdqTsbqdvkeNyTL5e1iWnf7Iqqphmj135ZFVQhyyS/Qz/btaTKS
	cAxWIuZ6BvIYq5Vw75wZBrkD3GwRve5Mndtf+D7T8BAf/+KmN2zQsz9nmop/3n8iqzri0t
	ckpIRF/ZIJpnHUUkY6pQD63zVcdMtkb/jJXuKWpbCbRJzU8W2l3+x1jeBpiCiQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:38 +0200
Subject: [PATCH 04/19] ref-manual/variables.rst: document TESTSDK_SUITES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-4-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=X5V+Zc2njfaRDc4XPpD8xyCcs21hl2p05tlKk70zNHE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJreWBSniufwP1gfOW3fzxw38oUmSE0mJM10g
 p9Yco3ntTeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3gAKCRDRgEFAKaOo
 NoenD/4hKnLiz5fwWoxk0S6SjZ0sRp7efoEJH0lkpe2/b0Pr016pbuaQsUFTTAZc333jRB7534L
 pcA+1r3aYSmwICrcjTVPPMJTZo6VmAZ/peH6Zi/Lz4PaRHn68Nt7TPiQ4HKyzp0wy3z9npeC4yK
 fas2AJopSF5fspP/vIUVXED0iMdPxsnljgrsrdBK1JDx6LHecaheiVW+TJ31NzLi9eVv8isNSfS
 +0T8H4zhoQFJgeETGWRT8qiFP1R8GYoW0OZ7VCCAnm1F6BBuq3Jq/sCcolgNEZuj7i0lYkGs5Y2
 8rzXTiC+KYyYeN/U1cTGZ0oWNN6qQ0fdARn2lIyA5DP5gztfq1bLqujG6VHFUzYpNwW5kEX2mmy
 pBpGhUxc2f5HWEW4QNAUE94vLnt8kNIEJns3THPHfYCJYhJ4IFkq0sNPuUXBRwrHruU4qDXnQPx
 beK3GyAc35oBw2dburHzqm7sp+UN09MSxOmZPLOfFwl6Hrx/7se/Vq1l6U3TQV+XUl/WxMDIqEw
 5lnvTbhVNtXrrPfP2pQBCLieG6NHfGg8BNKALIwrwFGcIlsyPUpV0zKnqmHfW0nL+lX4flLdp1T
 rU2V5MGK8PrFroaG6oxVIIJW4ckqFQ80AcPGZ+EOoCFUoXioacWR8s1Le6D1qAaXLS2q4jJmN1A
 NHy3Ealjh5yP+yg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7396

The TESTSDK_SUITES variable can be used to control the list of test
modules run with the testsdk class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 3 +++
 documentation/ref-manual/variables.rst | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index ee583fe9b..7c2b4fb27 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3069,6 +3069,9 @@ using the following::
 
    $ bitbake -c testsdk image
 
+The list of test modules that are run can be controlled with the
+:term:`TESTSDK_SUITES` variable.
+
 .. note::
 
    Best practices include using :term:`IMAGE_CLASSES` rather than
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1a4e8a254..a5d43966c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10165,6 +10165,12 @@ system and gives an overview of their function and contents.
       :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`  lists space-separated paths on the
       target to retrieve onto the host.
 
+   :term:`TESTSDK_SUITES`
+      When using the :ref:`ref-classes-testsdk` class, the
+      :term:`TESTSDK_SUITES` variable can be used to control the list of test
+      modules to run. The default value for this variable is an empty string
+      and all test modules that can be found are run.
+
    :term:`THISDIR`
       The directory in which the file BitBake is currently parsing is
       located. Do not manually set this variable.

-- 
2.50.1


