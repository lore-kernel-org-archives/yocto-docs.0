Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED131C36011
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.61730.1742894478364850703
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LB6Oe0xH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F141644212;
	Tue, 25 Mar 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIKl4hmwaGbGuPINKbqFgDv16F5ZO5y3WmMnzlD/VBQ=;
	b=LB6Oe0xHs1+zwo0jaYGvkygHPI/ethgX6+VEZ1bxfTcd+0jYPyuoYP1h7raUNerkSSu5pA
	T+i6N/0Y8vzFUuzj1/Da64LGaI++MayLmsQ3ior6fszrVGg6mBz51V/ZwALzODUbKu7iNZ
	ObmM7189XM/zcmGTI1hDW+kEEQYWcli1x0ELaIWmZebu8S5YF2LLDl5ad7fEVMBpSipPa4
	6gKxINeaNls3NE3Hz9l+Xiwv+9NI9r5DkuJy0a7OR+W12xuk8zXOFlaUcZ7Ayf+MF4xbkT
	Q2Oq9SExR9oagANBztS88VEMQ9ZKW36FWzKzx+0lI7GiuIssaO/jiPdwc+amVA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:52 +0100
Subject: [PATCH v2 08/12] ref-manual/variables.rst: document autotools
 class related variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-8-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=D9c6T6XJxZ93Y4Z+s7Uh+nBSQ+eSPzESx6YNEAUPPek=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWLSbQVwDcU6SdaZ1Ye/V7FFb4VV17Xw5UwD
 ADP4Mwwg8uJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1iwAKCRDRgEFAKaOo
 NjqfEACVm/kjJ1QkVPAzzQXYw+oN43PAIMmM+F2RteMCcJksrZ6y9NXDYOm+0nPB9Opzr6EoMXB
 05KQVuTldI4wqvzx2zS387/FNxnC/3shZorLF1APpeSnFdnvn7TcTFF6xRpC4kFN3f/Y8/zpfhu
 InRtKufnlwoadHt4m2L7UsZRVTS4/N3sPDcYEHTCwyhyiGak9aLESSQqFXjVGbqEky/oSIL1MAy
 U8Cr3vpMhMSZ1zIWr0sj5WGhqkEtPhZF/4DzzNc/kXqPkVCDtp13Diq3BrikbfP0CGNbH+9VTa9
 Ka86Yx2bfBcfRQH1Lt75u3Va9NzDQuYN3Ljhpr2UKOcw5r5KtI36jqu1BAbwNAEOJ1zGOJWQYqD
 wZxkfRR2lRQmLJFrbJOqLwOxFJ0tIsELXEFwSRFO96NXNH7MWDg3mnbufAzWnwVvoAMplULUz0/
 K4PXcGGd8VtKvg8gnFYxERYR/V/gvlKvCecyQhtR5yvVar+hKqP2ocOQdTPK60hrprB/279Ro8t
 t24UP5dSsNgtdAII3VVO7UJysWNTCw2/mkMIiCw89hOFv4bgIS/PrTIPhcHAdSMr2/XjlqqWa+l
 1l2e15xp21979213A8IcE125PTjFnlS9r73EOTwBXKNkVPRcKQla+Q6IfFprg3+mLRsU3q9Up1v
 qR+CfQpuiegheDw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6620

Document the AUTOTOOLS_SCRIPT_PATH and the CONFIGURE_SCRIPT variables.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 597b0d031..e9e8a6933 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -224,6 +224,12 @@ system and gives an overview of their function and contents.
       must set this variable in your recipe. The
       :ref:`ref-classes-syslinux` class checks this variable.
 
+   :term:`AUTOTOOLS_SCRIPT_PATH`
+      When using the :ref:`ref-classes-autotools` class, the
+      :term:`AUTOTOOLS_SCRIPT_PATH` variable stores the location of the
+      different scripts used by the Autotools build system. The default
+      value for this variable is :term:`S`.
+
    :term:`AVAILTUNES`
       The list of defined CPU and Application Binary Interface (ABI)
       tunings (i.e. "tunes") available for use by the OpenEmbedded build
@@ -1528,6 +1534,17 @@ system and gives an overview of their function and contents.
    :term:`CONFIGURE_FLAGS`
       The minimal arguments for GNU configure.
 
+   :term:`CONFIGURE_SCRIPT`
+      When using the :ref:`ref-classes-autotools` class, the
+      :term:`CONFIGURE_SCRIPT` variable stores the location of the ``configure``
+      script for the Autotools build system. The default definition for this
+      variable is::
+
+         CONFIGURE_SCRIPT ?= "${AUTOTOOLS_SCRIPT_PATH}/configure"
+
+      Where :term:`AUTOTOOLS_SCRIPT_PATH` is the location of the of the
+      Autotools build system scripts, which defaults to :term:`S`.
+
    :term:`CONFLICT_DISTRO_FEATURES`
       When inheriting the :ref:`ref-classes-features_check`
       class, this variable identifies distribution features that would be

-- 
2.47.0


