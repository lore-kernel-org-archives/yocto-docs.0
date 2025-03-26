Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676D9C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:21:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22220.1742995308324041803
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MOLfCTft;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 855684439E;
	Wed, 26 Mar 2025 13:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742995306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sS6U9MEnT44zlUTMQyVlRRKE4T9nOHlGLritS48BEKg=;
	b=MOLfCTftk7mNmQySWqlO2xNgGHI5H4gVjb0CAQdHNUiCIjDfSkfA5UtW8vpwwS74yjx4HY
	HC8mbR4rvQk8qO3bvNxBGFJ95v0BZeHBfPkQxQMdUeUqsiP8CaUCuciIzlTs79ycUniND1
	mq7EMMCDOjd3zTmt1jnpsE2PObpk891fO9kA8vhls22M6HoYidooCUaYiA8oSUzS9S1qa7
	JbwBlkJ9xGAA8I84/EDXMEMJkCAtVJ8zCRYNWPaV03+z4KOVLnBa6V+QTX7U5g6f7FiZNO
	NPc+czcCSTpcFyCb0uTsdP3H0VKKKVM7MR/q5kPhhhOo/8jhF1i7nqsSR+1sQw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 26 Mar 2025 14:21:37 +0100
Subject: [PATCH v2 1/6] documentation/conf.py: define a manpage url
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cc-vars-v2-1-36b80c64c4a9@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
In-Reply-To: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3257;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7WfuX7NTeotdljywjB/zvpXh6XjKJYX+VXJyWzB8i9c=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4/9pqYKLHPgr51qioIKT/xcKgDrlheHT5RMaK
 7iyDpYKikuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+P/aQAKCRDRgEFAKaOo
 NnuHEACxvkoEZULK5tJiPeLN6CfXQqYkgzH0w44OvFsjc6ZNhhQ9hNMp4Y0i/fAklqkCchY3FA+
 2XXpTOMfERQ8vjkjmcWrS9js3F5BSTk7ItZWY9JgJZgHzLV0izaisFwU7VE57CNl9ZCXYp8PGPk
 StOZei7P47SlD3nCgn7gKgzVbk57xDb7cN9rQU1jS10QcZrSSVrpQnaJJx39ouPQdAZYJlCbnlM
 9jwH14Ur39P6RNsxNcxd4WCO3IYNSaVE6Yf1udD4A0P0hPy6iOx2CmZ+DIdtwML8rujgWcfe9EU
 xrbbfDWKb4Zw89Ae5Kj4m5zHW/Kp58lRXmQPk+/rQ8PBM4Lka8MzcG2ti40zsctk1eFL8iXuhjJ
 ve1CQM6F8DHsModc3vvNIoBaSQGT/zuwiq/JEF5J06Eq7jY3CDYGvXFvNSDLTZPoTWsqqTlQBLI
 QlfirNxqCD2Irb9K16eUlQy0kesemoU2Z6VhdxGfRv9UYDUHW+ORWHedz08myIqUxJ340uwUD+K
 GgnEibN4xiCSJmunYtd2LSgalnsQ/0NHnYYFU20PPRPDH1tfc0ikhpRJWwdPecld9ZvArKBI0Wv
 LwjRClbONtDI++ES/ufl/5KZu7kICjQ9oppm/XnfHxIvH5g8uN5F19k2axwkq1Ppy0zc7TS7j2v
 3EwytY5AOtQ2rlw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtteeuheejgfdtfeekteehueeugfejgedvleehieelteefkeegjeelueeugeelveenucffohhmrghinhepshhphhhinhigqdguohgtrdhorhhgpdifihhkihhpvgguihgrrdhorhhgpdguvggsihgrnhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdhhvgdrnhgvthenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugess
 ghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6635

By defining the manpages_url we can use the :manpage: role in the
documentation for providing links to manpages. See:
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url

Replace existing manpages links to use this role.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py                      | 3 +++
 documentation/overview-manual/concepts.rst | 2 +-
 documentation/overview-manual/yp-intro.rst | 2 +-
 documentation/ref-manual/variables.rst     | 3 +--
 4 files changed, 6 insertions(+), 4 deletions(-)

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
index e4d806f98f..25cac82816 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2204,7 +2204,7 @@ require root privileges, the fact that some earlier steps ran in a fake
 root environment does not cause problems.
 
 The capability to run tasks in a fake root environment is known as
-"`fakeroot <http://man.he.net/man1/fakeroot>`__", which is derived from
+":manpage:`fakeroot`", which is derived from
 the BitBake keyword/variable flag that requests a fake root environment
 for a task.
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 4a27e12e01..d3037329d3 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -400,7 +400,7 @@ Yocto Project:
    Autobuilder :doc:`here </test-manual/understand-autobuilder>`.
 
 -  *Pseudo:* Pseudo is the Yocto Project implementation of
-   `fakeroot <http://man.he.net/man1/fakeroot>`__, which is used to run
+   :manpage:`fakeroot`, which is used to run
    commands in an environment that seemingly has root privileges.
 
    During a build, it can be necessary to perform operations that
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 41bda5d0d6..2b31bc7b00 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4514,8 +4514,7 @@ system and gives an overview of their function and contents.
 
       The value in :term:`INITSCRIPT_PARAMS` is passed through to the
       ``update-rc.d`` command. For more information on valid parameters,
-      please see the ``update-rc.d`` manual page at
-      https://manpages.debian.org/buster/init-system-helpers/update-rc.d.8.en.html
+      please see the ``update-rc.d`` manual page at :manpage:`update-rc.d`.
 
    :term:`INSANE_SKIP`
       Specifies the QA checks to skip for a specific package within a

-- 
2.47.0


