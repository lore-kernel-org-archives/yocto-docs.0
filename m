Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4684C3600C
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:07:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.45524.1743066476483827810
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 02:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IFShh/KO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4FA6432F7;
	Thu, 27 Mar 2025 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743066474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMjyVSuMwTB5xvxfSqX8AnsGcW7VHt9Q51UsNH3GvKM=;
	b=IFShh/KO4ERw7ru4VMFgekDDn2n7w5j23AwKzCdzfSA8CfUBZXn6nLwWRv8s4zC4Gofj2Z
	k/f4zuUCpp70h7bpKU1kV9J8gEXWP8lcpM6siIaws/3YcSRDl0+T2cW+eHI5T7koC9lSeJ
	UwdympCvDx+Q1SNL/M3FOfpyrANIXd3HL7/AB7dXZyN4kyrnMY0GvfjxFvt+nZ7jTvIFLL
	RcwMsmZ/xiaRsCPKjVNK52ZSHBjIP8OePWXvlLm9fAnrfqDXzYpUqEfw2BfyQio0c6jscA
	U+8MzzEXYXRtgpfcx5vyiMDemL5j5s60/pjMljtWkeJ423uQ+5gmY4T0t9k4Fg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Mar 2025 10:07:26 +0100
Subject: [PATCH v3 1/6] documentation/conf.py: define a manpage url
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-cc-vars-v3-1-742dbddce008@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
In-Reply-To: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3311;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=F6zRFv1AUZjyBsGV9xMkP/MMyjxs1I7h18QeocGp9qw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5RVpkLCPa6dApAflWOrdy/Y1L4ZJRbqmPSLQ8
 xX3BlGN2VKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+UVaQAKCRDRgEFAKaOo
 NkDkEACJz9cS6UoTK6AvpL8x+fA4s+07c0AKwG+8lZdaayZ3kcUSnJjLRtK4peV0MpBP1O7Zamy
 PfOXb6ZC2URmmPw3J1U4qZ8/5I5f+943leQj9ghMMund7L6BVWbG1YqssVvh4ec07kc1ddDMgbF
 N4MxB/teCpQe5wpzP72LiYrpozVUlcG+W+VWGuoId9mAVqHkZkUr2R4Htro5YLs5PmuSaAtHvru
 ziqbOeEPFKDoo6Zk5UvnsrVkr8tLxvf/zJ88mH5zms890XIak+wsc1pFC4B7dGqo+bWXxTcVXFP
 xrgt2MGgm222OL/aAdWOPkSaNVufi4taFqYvtc9mRfXn4vrWiqKCpF8VXTeFUcJ7EKzl85/R6Ob
 1X0wA13LtyJbHH5JcU/k7yCBvU126CrcADB5z5h+XXBZLbFQGOXB9RgYLaJitRLEJHB1qh1G734
 sHTamu1rhSlppJ5tQJKqxdYORVe/j58FENV/8VZThAR43v+f0KnGpEFzrLoKgd+XKPJZujGfUG+
 QvwGJu04ZUf6zXJXT+BA9Y5YD2qMoWUhOrfGrPPK5Pvynnt+CDUzpuL9ZwXkrCanKon0rItuwy6
 og3Pcd1tlsVfkLpFukLNAr4z/tVU5lwE/ggeRYhp3yA/lhsyTAsZnTiMpn5iftUfxNDGL4LCSdr
 CIY92liQ1yowehQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieektddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtteeuheejgfdtfeekteehueeugfejgedvleehieelteefkeegjeelueeugeelveenucffohhmrghinhepshhphhhinhigqdguohgtrdhorhhgpdifihhkihhpvgguihgrrdhorhhgpdguvggsihgrnhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdhhvgdrnhgvthenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghto
 hhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Mar 2025 09:07:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6647

By defining the manpages_url we can use the :manpage: role in the
documentation for providing links to manpages. See:
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url

Replace existing manpages links to use this role.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py                      | 3 +++
 documentation/overview-manual/concepts.rst | 2 +-
 documentation/overview-manual/yp-intro.rst | 2 +-
 documentation/ref-manual/variables.rst     | 4 ++--
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 477e75112a..0352bbef20 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -111,6 +111,9 @@ extlinks = {
     'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
 }
 
+# To able to use :manpage:`<something>` in the docs.
+manpages_url = 'https://manpages.debian.org/{path}'
+
 # Intersphinx config to use cross reference with BitBake user manual
 intersphinx_mapping = {
     'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index e4d806f98f..416c28f0d9 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2204,7 +2204,7 @@ require root privileges, the fact that some earlier steps ran in a fake
 root environment does not cause problems.
 
 The capability to run tasks in a fake root environment is known as
-"`fakeroot <http://man.he.net/man1/fakeroot>`__", which is derived from
+":manpage:`fakeroot <fakeroot(1)>`", which is derived from
 the BitBake keyword/variable flag that requests a fake root environment
 for a task.
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 4a27e12e01..11e6d99e32 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -400,7 +400,7 @@ Yocto Project:
    Autobuilder :doc:`here </test-manual/understand-autobuilder>`.
 
 -  *Pseudo:* Pseudo is the Yocto Project implementation of
-   `fakeroot <http://man.he.net/man1/fakeroot>`__, which is used to run
+   :manpage:`fakeroot <fakeroot(1)>`, which is used to run
    commands in an environment that seemingly has root privileges.
 
    During a build, it can be necessary to perform operations that
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 41bda5d0d6..4e675b6bfb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4514,8 +4514,8 @@ system and gives an overview of their function and contents.
 
       The value in :term:`INITSCRIPT_PARAMS` is passed through to the
       ``update-rc.d`` command. For more information on valid parameters,
-      please see the ``update-rc.d`` manual page at
-      https://manpages.debian.org/buster/init-system-helpers/update-rc.d.8.en.html
+      please see the ``update-rc.d`` manual page at :manpage:`update-rc.d
+      <update-rc.d(8)>`.
 
    :term:`INSANE_SKIP`
       Specifies the QA checks to skip for a specific package within a

-- 
2.47.0


