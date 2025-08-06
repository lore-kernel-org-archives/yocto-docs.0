Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE41AC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:46:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.28800.1754495170409610815
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 08:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AQVkbA5W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 958A31FCE3;
	Wed,  6 Aug 2025 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754495168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BCEdBlF2YcJVkQrMW6Bua2Lgw2xeV2wG1gXxLFrEhN8=;
	b=AQVkbA5WyjXnPCEG3om7F6vzRssbFXaElZiAWbBElUv6VTHzxS1pm7v1Ul502yd1dWKaUl
	7MkVUmqbNU9qT+fucEtQ2iYquolM/qIjxM3sCn1c2xg2RmA82bmv5zIsKohRS8GqR/vyn7
	Tj/n1GIOJaUSMiaMC/F6Cbk+INQBEX0wtp3bcS3SvhubkLDR+AqvGAnDQYJNXVv0M2D2a9
	6s9ux6IVVJeDVDBDE2l0YaJauQ9G/bmMRjvueikWlcAK0zQmoBJroudL5s5FGvUS5VZHHe
	MFkesrWOmFn+y+kPddASpUVmLx1/8CbWS696MFukNuQrgMYDfcnDg4+qQ3ZNSw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH] ref-manual/system-requirements.rst: update supported distributions
Date: Wed,  6 Aug 2025 17:04:45 +0200
Message-ID: <20250806154546.719832-2-antonin.godard@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7436

Update the distributions to match the list of workers on the
Autobuilder. This list was generated with the help of
yocto-autobuilder-helper/scripts/yocto-supported-distros.

Also:

- Sort the lists alphabetically.
- Decrease spacing between entries for readability.
- Remove older Ubuntu distributions that are not tested on the
  Autobuilder anymore.
- Fill the second list with EOL distros still running on the
  Autobuilder.
- Empty the third list as it does not make sense to maitain on the
  master branch.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../ref-manual/system-requirements.rst        | 57 ++++++++++---------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 14b635013..0ea52ae95 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -58,54 +58,55 @@ Supported Linux Distributions
 Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project is
 supported on the following distributions:
 
--  Ubuntu 22.04 (LTS)
-
--  Ubuntu 24.04 (LTS)
-
--  Ubuntu 24.10
-
--  Fedora 39
-
--  Fedora 40
-
--  Fedora 41
+..
+   Can be generated with yocto-autobuilder-helper's scripts/yocto-supported-distros.
+   yocto-supported-distros --release master --config yocto-autobuilder2/config.py --output-format docs
 
+-  AlmaLinux 8
+-  AlmaLinux 9
 -  CentOS Stream 9
-
 -  Debian GNU/Linux 11 (Bullseye)
-
 -  Debian GNU/Linux 12 (Bookworm)
-
+-  Fedora 39
+-  Fedora 40
+-  Fedora 41
 -  OpenSUSE Leap 15.5
-
 -  OpenSUSE Leap 15.6
-
--  AlmaLinux 8
-
--  AlmaLinux 9
-
--  Rocky 8
-
--  Rocky 9
+-  Rocky Linux 8
+-  Rocky Linux 9
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
 
--  Ubuntu 20.04 (LTS)
-
--  Ubuntu 23.04
+-  Fedora 39
+-  Fedora 40
+-  OpenSUSE Leap 15.5
+-  Ubuntu 24.10
 
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has
 limited value if you have access to such updates.  Also, :term:`buildtools`
 may have to be used on older releases in order to get current enough
-tools, such as python.
+tools, such as Python.
 
 Finally, here are the distribution versions which were previously
 tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
+..
+   On the master branch it does not really make sense to fill this list. We
+   should maintain the list below on stable branches once we drop support for
+   distributions.
+   The list can be generated with yocto-autobuilder-helper's scripts/yocto-supported-distros:
+   yocto-supported-distros --release <release> --config yocto-autobuilder2/config.py --output-format docs --old-distros
+
 *This list is currently empty*
 
 .. note::

