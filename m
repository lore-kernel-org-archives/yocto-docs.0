Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A738BC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:41:23 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.19024.1744720879681802851
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 05:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kbCmkBuv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97A9343B57;
	Tue, 15 Apr 2025 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744720877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qaGMpD4FPZWmUNNsumCE+dPyqnUS61VNFQr/tHIXGpw=;
	b=kbCmkBuvfEQmTOT2kGxgu4RKP+kvj5/s6FKgn4KiMPKzqZDs4f4TDxY4ieTCt4qeY8687o
	TPvf0+QkrjS2QJPRA5juOYuEqYDFjgGTTtkK4pvtNyYN4XQE9lzGhkB7RiU1EScYIHELNx
	1m7u2ntrXtNYVGxl1r/eWRluQcFmk1YQEEJBZ03DbfEBGrXAGt7S+95Y+OAl4OgNSl1foR
	nfeRPpCS5MRStVPAYLkUFtVnnH+5dwlumcB35gn50pXxw0oXkC9dNZsJ2pgdzML/dS/eZs
	uF6Yt8DOmxuTpq3uLO0xOpdHoPL9S2x98FtTwaMhwNrZbnT6yHtTfkQPEx7bcQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 15 Apr 2025 14:41:10 +0200
Subject: [PATCH] migration-guides/{migration,release-notes}-5.2.rst: notes
 for systemd pni-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-systemd-migration-note-v1-1-24f9ee7c2b94@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOVT/mcC/x2MSwqEMBAFryK9tkHjB52riAtJntoL45AOooh3N
 7gsqKqbFEGg9MtuCjhEZfcJyjwju05+AYtLTKYwTVGXDeulEZvjTZYwxWSz3yO4atH1lbVwpqM
 U/wNmOb/xMD7PC4lYbEVoAAAA
X-Change-ID: 20250415-systemd-migration-note-36e893cced28
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2552;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SYoPd/0yjBUbwsSmI1HCnv7QYNitmXKxxwO+yLgDOoM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn/lPt1oD+LEIcuzrGxTsUjBAuKo5uKQlUIbXU7
 jk6qvjNkseJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ/5T7QAKCRDRgEFAKaOo
 Ntj9EADMQhXtqedrvJEPnClzBF08rCUYJm9z1Xu8G8vW5cupRzQsd0EiedeilDV1oP5lkf5r8gk
 F4AaaIxPeV6r9eXItnje/7dKH66X2JOa7Tf2K01GWAORsnQP7WKNM7muptATCoMsKbStZgo8r5z
 MKL6UOpaulIkPyXQ2dWTSRKCQ2XVvhm+iHz1yFE8K8enIYqlF8538zvnFQKy9DLgMJ3019hlZts
 D+CZE5zZHVrL3o1ZYlJCspIagbotV6vHkF8hB4BZ/w/+eoNMomy3jqjwSdwUuKhI7pf7bsC9bH/
 yDvITTIr9uUslvaprj6t/4JXE4LgklsQzU6b5XNVg/Dr96K0yN6EQIyek7iqmYiincqw0Gmwxki
 d3L+DK/leasy9Z0CquJDFxm7Lea294JOYQxsYUa/oElm8MNnsOsiMa8yngt/Bc2WJ0HYLg4klQ2
 KZwP+MwIKYxMetCGotWu0/yZCtfphSpi0PvqjGDXyGJUKmFQH6K4FY9K6hmmtUSfCbSZBUtgXFU
 BD2AI2KED/u6+7qH6PUgQHGo0apeeaL0OxVjF5Jju18bhOtyKCtVSsJb0OJVI4CkQMSSFJ2BJE4
 NnVby3lqxGZ8tcslrg5gLfP1MzD8NhCBWTctDVyrsoFoe+BcfWcAWtkncUxxTjKmuIP1vycoMcf
 kzRF/MEqX/P0KWQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekfeeuteegvedtheeiuddttdevueekveehtdffvdduffffvdffvdelleetgeeiueenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepvghjohesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 12:41:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6746

Add a note to the migration guide regarding the pni-names behavior
change.

Suggested-by: Enrico Jörns <ejo@pengutronix.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst     | 7 +++++++
 documentation/migration-guides/release-notes-5.2.rst | 7 ++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 6b7d02d65..9df04d291 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -104,6 +104,13 @@ systemd changes
    ``journald.conf`` to "persistent". The ``/var/log/journal`` directory is now
    used for logging instead of ``/run/log``.
 
+-  If ``pni-names`` is not in the :term:`DISTRO_FEATURES`, the `Predictable
+   Network Interface names <https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/>`__
+   systemd feature will now be disabled. Previously the feature was still
+   enabled even if ``pni-names`` was part of :term:`DISTRO_FEATURES`. Make
+   sure to add the feature to :term:`DISTRO_FEATURES` if you want to keep this
+   systemd behavior.
+
 Multiconfig changes
 ~~~~~~~~~~~~~~~~~~~
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index ac9c6319a..0ac276c1e 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -523,9 +523,10 @@ New Features / Enhancements in |yocto-ver|
          ``${libdir}`` if the ``set-time-epoch`` :term:`PACKAGECONFIG` config is
          set.
 
-      -  really disable Predictable Network Interface names if the ``pni-names``
-         feature is not part of :term:`DISTRO_FEATURES`. Previously it was only
-         really disable for QEMU machines.
+      -  really disable `Predictable Network Interface names
+         <https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/>`__
+         if the ``pni-names`` feature is not part of :term:`DISTRO_FEATURES`.
+         Previously it was only really disabled for QEMU machines.
 
       -  split ``networkd`` into its own package named ``systemd-networkd``.
 

---
base-commit: 1ed64dbdf4a60b000305cdc2c67dc24f4bc97ef7
change-id: 20250415-systemd-migration-note-36e893cced28

Best regards,
--
Antonin Godard <antonin.godard@bootlin.com>


