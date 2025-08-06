Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3400C87FDA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:46:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.28802.1754495170458518543
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 08:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p0KPe5ca;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04CAE1FD47;
	Wed,  6 Aug 2025 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754495169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7q9N8zwvB/gTQh4qMDRmy8dv6hNCNIcPcxb+cFZeuAc=;
	b=p0KPe5cailDib5VRJI07QyEDHl4WzSuEwXS/dvoXOYmKJcCAzUBwCfF97u4giYiO3yMHO8
	2iSBA6COH+/q/sowAY8JgkyrZOGdymubjOJ0sc8J597+zsoL92VEB8XbyduCapaLpkqRNx
	V1JZpVWb5LQCbHVbUeQ+xwth7IXmWqXG7Ilz9zU3mUZuloh3ecohNUcwHFz18vzbWkUJN1
	xORd/JUlVpbIzprJbzh4hiX+8DMBFbiCWOQjA6M3Q6ApTQGk5h4BB1CNQzWJu88pvvySTq
	JVnfWrBIS6Lc5vG0Y/ksOJVczKwlQFyfUdgHX7mOkNZmhuJm3b2/kr2oBvD6Bw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [scarthgap][PATCH] ref-manual/system-requirements.rst: update supported distributions
Date: Wed,  6 Aug 2025 17:04:47 +0200
Message-ID: <20250806154546.719832-4-antonin.godard@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7438

Update the distributions to match the list of workers on the
Autobuilder. This list was generated with the help of
yocto-autobuilder-helper/scripts/yocto-supported-distros.

Also:

- Sort the lists alphabetically.
- Decrease spacing between entries for readability.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../ref-manual/system-requirements.rst        | 53 +++++++++++--------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b22572c6b..ad7c70727 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -58,36 +58,35 @@ Supported Linux Distributions
 Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
 supported on the following distributions:
 
--  Ubuntu 20.04 (LTS)
-
--  Ubuntu 22.04 (LTS)
-
--  Ubuntu 23.04
-
--  Fedora 38
-
--  Fedora 39
-
--  CentOS Stream 8
-
--  Debian GNU/Linux 11 (Bullseye)
-
--  Debian GNU/Linux 12 (Bookworm)
-
--  OpenSUSE Leap 15.4
+..
+   Can be generated with yocto-autobuilder-helper's scripts/yocto-supported-distros:
+   yocto-supported-distros --release scarthgap --config yocto-autobuilder2/config.py --output-format docs --poky-distros
 
 -  AlmaLinux 8
-
 -  AlmaLinux 9
-
--  Rocky 9
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
+   (meaning there are running workers).
+   See https://endoflife.date for information of EOL releases.
 
--  Ubuntu 23.04
+-  Fedora 39
+-  Fedora 40
+-  Ubuntu 20.04 (LTS)
 
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has
@@ -96,7 +95,15 @@ limited value if you have access to such updates.
 Finally, here are the distribution versions which were previously
 tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
-*This list is currently empty*
+..
+   Can be generated with yocto-autobuilder-helper's scripts/yocto-supported-distros.
+   yocto-supported-distros --release scarthgap --config yocto-autobuilder2/config.py --output-format docs --old-distros
+
+-  CentOS Stream 8
+-  Fedora 38
+-  OpenSUSE Leap 15.4
+-  Ubuntu 18.04
+-  Ubuntu 23.04
 
 .. note::
 

