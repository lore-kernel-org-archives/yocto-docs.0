Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD5DCA0EC0
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:46:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.28598.1754495170641017707
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 08:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ww9DBllV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3793A1FD49;
	Wed,  6 Aug 2025 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754495169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yijaQBrCxHqxov36FBahby31pF3VkM98z4MVAAiz08=;
	b=Ww9DBllVHZ5TSuZ9VskGh9g0u0J8oztKxMXWlURoQxBp2FpF7mT+DOJZdzWZVIAXweNLMM
	ggFxTkOzj8hSS4bdoWm6NgdDhhSWYgwL7l7mzXRArxquNxDYg7JXSjsOYbS42eO/Y7CCc9
	1XdoiSLGp5IS/ANf4fh/rautM8EeC+vvv3oYkZS2KJVOhbIi8BoEHOBQGLW2T8CvUM1IGC
	I1H3Zmbgo10N4fW6C6ZaURXm8GpoxN11zQwEO9zqrn0Ervb5u4dr75gNowWSL797KNuhdM
	T6CM3J3jflvSuxdjtV8E64TKDHlXvqS/Fhd7/NuPMsJu0WGSjbAiUtKsVdEC6A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [kirkstone][PATCH] ref-manual/system-requirements.rst: update supported distributions
Date: Wed,  6 Aug 2025 17:04:48 +0200
Message-ID: <20250806154546.719832-5-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806154546.719832-1-antonin.godard@bootlin.com>
References: <20250806154546.719832-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: spam:medium
X-GND-Score: 300
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecundevohgrshhtrghlucdlfedttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfetheevtdehgefhvddvieethedttdefgeejkeegvdeiffetkeegvdefleelgfenucffohhmrghinhepvghnughofhhlihhfvgdruggrthgvnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhon
 hhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Aug 2025 15:46:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7440

Update the distributions to match the list of workers on the
Autobuilder. This list was generated with the help of
yocto-autobuilder-helper/scripts/yocto-supported-distros.

Also:

- Sort the lists alphabetically.
- Fill the second list with EOL distros still running on the
  Autobuilder.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../ref-manual/system-requirements.rst        | 67 +++++++++++++------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 660a2051a..dbac18bda 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -58,20 +58,35 @@ Supported Linux Distributions
 Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
 supported on the following distributions:
 
--  Ubuntu 20.04 (LTS)
-
--  Ubuntu 22.04 (LTS)
-
--  Fedora 38
-
--  Debian GNU/Linux 11.x (Bullseye)
+..
+   Can be generated with yocto-autobuilder-helper's scripts/yocto-supported-distros:
+   yocto-supported-distros --release kirkstone --config yocto-autobuilder2/config.py --output-format docs --poky-distros
 
 -  AlmaLinux 8
+-  AlmaLinux 9
+-  Debian 11
+-  Debian 12
+-  Fedora 39
+-  Fedora 40
+-  Fedora 41
+-  Rocky Linux 8
+-  Rocky Linux 9
+-  Ubuntu 20.04 (LTS)
+-  Ubuntu 22.04 (LTS)
+-  Ubuntu 24.04 (LTS)
+-  Ubuntu 24.10
 
 The following distribution versions are still tested, even though the
 organizations publishing them no longer make updates publicly available:
 
--  Ubuntu 18.04 (LTS)
+..
+   This list contains EOL distros that are still tested on the Autobuilder
+   (meaning there are running workers for them).
+   See https://endoflife.date for information of EOL releases.
+
+-  Fedora 39
+-  Fedora 40
+-  Ubuntu 20.04 (LTS)
 
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has
@@ -80,19 +95,33 @@ limited value if you have access to such updates.
 Finally, here are the distribution versions which were previously
 tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
--  Ubuntu 18.04 (LTS)
-
--  Ubuntu 20.04 (LTS)
-
--  Ubuntu 22.04 (LTS)
-
+..
+   Can be generated with yocto-autobuilder-helper's scripts/yocto-supported-distros:
+   yocto-supported-distros --release kirkstone --config yocto-autobuilder2/config.py --output-format docs --old-distros
+
+-  CentOS 7
+-  CentOS 8
+-  Debian 10
+-  Debian 8
+-  Debian 9
+-  Fedora 29
+-  Fedora 30
+-  Fedora 31
+-  Fedora 32
+-  Fedora 33
+-  Fedora 34
+-  Fedora 35
+-  Fedora 36
 -  Fedora 37
-
--  Debian GNU/Linux 11.x (Bookworm)
-
+-  Fedora 38
+-  OpenSUSE Leap 15.0
+-  OpenSUSE Leap 15.1
+-  OpenSUSE Leap 15.2
 -  OpenSUSE Leap 15.3
-
--  AlmaLinux 8
+-  Ubuntu 16.04
+-  Ubuntu 18.04
+-  Ubuntu 19.04
+-  Ubuntu 21.10
 
 .. note::
 

