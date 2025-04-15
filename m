Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19053C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:52:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.20653.1744725128023592028
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 06:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LDNhAU1D;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7B6643A21;
	Tue, 15 Apr 2025 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744725126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dRGWcFoWnu73rjvHf+W4Yf+SavhbPo54DgmkYnTgh9M=;
	b=LDNhAU1DCx+JiOsoH31GVAI4eNAIlDhUClRbHE3MoWiQfaPH9YEQTxs6i/ks5DiWD0Bgy0
	VG0jnOY4ZT9vOctZ00wKPR7OqoiIQj3rLZMCCy1/twiFqk+m0yyBBwtByiR849hdpxK5as
	lmukgL2S69YJsyVkzKxifivnZVcC0ok/YnLbMpqFGuSGo1JxEyoLc7tkafunN+zv2GpaEd
	hLeV8fEg3ZdiwOwKWJtWIyqmRo6j9RVubRhtRi9uL/IbEKTnZPnwpUAjLyWU2phbyYPiGe
	q3aiofQTSmXp0M9eGMNXWN+NiCuYbD4bXCqxqzRHn4oSWB3YpYd+loSFfWMOVA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 15 Apr 2025 15:52:00 +0200
Subject: [PATCH v2] migration-guides/{migration,release-notes}-5.2.rst:
 notes for systemd pni-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-systemd-migration-note-v2-1-f23b14bd62a5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAH9k/mcC/4WNQQ6CMBBFr0Jm7RhaioIr72FYQDvAJNKStmkkh
 LtbuYDL9/P/+zsE8kwBHsUOnhIHdjaDvBSg595OhGwygyxlXSpRY9hCpMXgwpPvY26jdZGwulH
 TVlqTkQ3k8epp5M8pfnWZZw7R+e38SeKX/lUmgQKlGluiu5ZDq56Dc/HN9qrdAt1xHF/hefXNv
 gAAAA==
X-Change-ID: 20250415-systemd-migration-note-36e893cced28
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2746;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hIeAJVk7y7omt4pusrwuIxBRoK2L7yXuLCKPfxu/P8Y=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn/mSFdF2mT+b1EZ10FkGErCeqpf1tJgnxE1qTR
 ZitwzIImzWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ/5khQAKCRDRgEFAKaOo
 Nu2IEACtjxSubO0/Ep6zbZqXjS5bPBT2zncxQjjKfwTVoDcrtJPi7xTJYWDdk2YeC5Wwc+aqEkq
 VdOTiYXynzpn+DsYmsfwR4mRN9rc0iV8qjjoA/+Br0+RpeP2kbPP8jFF/J1ZGacMbzCceyYA69F
 /dQT9Jo7zE1uvH8R3OwhXTs/oLiSZZVBpC463+cgDbbnXZfCnkBK3ykAYLV0gLHCLmvSpU0V0BA
 RC3nutY9Dig91ZKtMajPBF7KrecBZKvcAD5nXY5GIypgIM9amChhmwAcMwhj+23bOEWGqdAE6Jf
 kfDXgkl8DWzZD9F8Yz92sqbN9a5+4no0C7vxq7GUx9YWkMKvW76DFHNK2/9cLzL8pnjXzS+0/Ed
 gnxTcWns1BwZgJ3ECCgnxrF8AvkMdjP2xX2QtbDIdQQcvNDER6nr4w2XdYVKWEHxKv8tycImQku
 jQD5Ix+2zJ0GG4fekgTxfE3LnrDzwiQzv5w6+WUej5kq2V5J5FPIEK7GZ1tyCxvU7rEQYd+vUbQ
 QmFP5Ds5u1yKcSBspfD32wMa/xWlbHH6Uo71PhoVL05hrVDfxlWU9x8LdFNb2o+kJPAWohWCATe
 GGMXEn2AHKSGT5uqup3TydoOA9W6LisePUFaw/9NWl8sRgGyqZOhEt8sUcWjtokG/XxD+BNSwiD
 6lvtKdiiTGgJDYA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejkeefteegfeeifeelheekheeivdehiefgvedvheegleeljefgtefgvddtgffhjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvghjohesphgvnhhguhhtrhhonhhigidruggvpdhrt
 ghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 13:52:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6750

Add a note to the migration guide regarding the pni-names behavior
change.

Suggested-by: Enrico Jörns <ejo@pengutronix.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Add missing "not" in migration note (thanks to Daniel Ammann).
- Link to v1: https://lore.kernel.org/r/20250415-systemd-migration-note-v1-1-24f9ee7c2b94@bootlin.com
---
 documentation/migration-guides/migration-5.2.rst     | 7 +++++++
 documentation/migration-guides/release-notes-5.2.rst | 7 ++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 6b7d02d65..9e9f466ad 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -104,6 +104,13 @@ systemd changes
    ``journald.conf`` to "persistent". The ``/var/log/journal`` directory is now
    used for logging instead of ``/run/log``.
 
+-  If ``pni-names`` is not in the :term:`DISTRO_FEATURES`, the `Predictable
+   Network Interface names <https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/>`__
+   systemd feature will now be disabled. Previously the feature was still
+   enabled even if ``pni-names`` was not part of :term:`DISTRO_FEATURES`. Make
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


