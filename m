Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896E5C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.47831.1742202395011345322
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dufnnucl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CF26432B8;
	Mon, 17 Mar 2025 09:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MhCawKCSbZVQwSCrII5ge+zclQw+sScXxYchSxRBpiA=;
	b=dufnnuclRN3Sxo4Pz4vWk1teqSW1kChnKLo0PUAoXvt6VLs/MK0eg9E9Elf2BkBVCUgnYw
	Dan23NNn2hRj8OJ9Xc37FgFw5Kga8LgbG1mOlYRkgHcQNxIPvBJzp/AqQ4VBv7rIvmVxzx
	EaIRkzEstbcmrk0smJHGZwdAvE3dVKIy/LdP7J/0UFv0Rpq6cADdXXPnTl2dYC5XKcI6qs
	mBUmPQ+3ZXWYvwJa63Z+S3R0e0hN2y+fx85M4cX/2qVto29OI7t23rwRlrO/5hjUDRWAPk
	wrA5Vv7tlxF/5VoT9RmVeoveK3O7JnJl/5z+WspYHeUNmNvGQk1Jb2ERE/ue+g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:16 +0100
Subject: [PATCH 10/11] migration-guides/migration-5.2: update for upcoming
 5.2 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-10-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wWAsIlK304CLZU2YTgSZPNgbsIsWnbVknOYF49kFf/k=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YWhkVeiKZKBQnyaTAHkXukaKCBLavz8ls98
 gkf5k5N+xiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFgAKCRDRgEFAKaOo
 NrY/D/9sJJKEOSqeZPb7MCbKkPQadviijtz/sPaahYM3bc+ZGYlBVZpvcQ+GbjQSrnhY5Kc4VC0
 iWLEsVdw3sNrw3zZ0K6PuQ46suXboqtKz5Y8wm9oa6YW7/eDIK5wl6fPE72AXChKoYKqiNeBEIc
 rOtK3qntcCJQagvqm5OwXIMze5ZsXEWbQUhF2Zw1tHcPM0BM678lHCyHN4G2Houvsk/FFHCR/Ij
 RLY9E50TLLpcNnFccnhjpNtCQiLSxJZna0Sq19fRfknEEKaaMAv5N7AbfHIrZ4nErCdpKLW95Cr
 /UQ0dTolUT60fBnXImws3f3ZNmxi4+Y32dCBllKNnUtvFvB0EOebIFs7rarVZqjUCHcLSJd2XKa
 80har1B3BYjqR1b5AIUbofrkCjjBC6lcIdu12tlL3mwnEFNJUwp7K4u7aXaa6Z2UGrHkOI4BPDh
 T4ScKmiqophBCgqqEIkDubFZ5p/qNzkj+vP9YSABBIAjloizu2SVlKBh9IIYF1izLMHTe9W6kGB
 +NnFWfr2kNYVLVeTAjfrTkGFeBjyaKkyXzTeZFcCVBq5R6peYA7NLuIHcfWE+9fOyKwIQW9QXFU
 N0fj+wAUojsiB/UVSx6eyO5xwVPILyXdTkTq7DtRUURRdiVucXnZZFb3nOqNb3omFPdZCjuTClZ
 w0oDu+/TWwRROkw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6571

Changes since 87d7341465f8 ("python3-iniparse: remove recipe") up to
6610cad12a06 ("bitbake: data_smart: Ensure module dependency changes
invalidate the base config cache") in Poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/migration-5.2.rst        | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 1b8e56551..defb2569c 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -94,6 +94,11 @@ systemd changes
    not for socket files).
    Now all service files must be explicitly added to :term:`FILES`.
 
+-  Add ``create-log-dirs`` back to the configuration options. To enable
+   persistent logging a user can now set the "Storage" option of
+   ``journald.conf`` to "persistent". The ``/var/log/journal`` directory is now
+   used for logging instead of ``/run/log``.
+
 Multiconfig changes
 ~~~~~~~~~~~~~~~~~~~
 
@@ -151,9 +156,27 @@ c++/binutils)" </openembedded-core/commit/?id=4ccc3bc8266c>` in
    find m4 macros, then usually the solution is to set ``EXTRA_AUTORECONF += "-I
    path/to/m4"`` in the recipe.
 
+:term:`UBOOT_ENTRYPOINT` changes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :term:`UBOOT_ENTRYPOINT` variable should now be defined with a leading
+``0x`` to its value. For example, consider the following assignment::
+
+   UBOOT_ENTRYPOINT ?= "20008000"
+
+This should now be replaced by::
+
+   UBOOT_ENTRYPOINT ?= "0x20008000"
+
 Recipe changes
 ~~~~~~~~~~~~~~
 
+-  The ``libnss-mdns`` recipe is now renamed to ``avahi-libnss-mdns`` to avoid a
+   conflict with meta-networking.
+
+-  :ref:`ref-classes-ptest` support for the ``valgrind`` recipe was removed, due
+   to regressions occurring after updating Glibc to 2.41.
+
 Removed variables
 ~~~~~~~~~~~~~~~~~
 
@@ -176,10 +199,19 @@ Removed recipes
 The following recipes have been removed in this release:
 
 -  ``liburi-perl``: moved to :oe_git:`meta-perl </meta-openembedded/tree/meta-perl>`.
+
 -  ``python3-isodate``: moved to :oe_git:`meta-python </meta-openembedded/tree/meta-python>`.
+
 -  ``python3-iniparse``: removed as there are no consumers of this recipe in
    :oe_git:`openembedded-core </openembedded-core>` or :oe_git:`meta-openembedded </meta-openembedded>`.
 
+-  ``blktool``: It was created in 2004 as an alternative to hdparm and never
+   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active.
+
+-  ``cargo-c-native``: converted to a target recipe and renamed to ``cargo-c``.
+
+-  ``libnss-mdns``: renamed to ``avahi-libnss-mdns``
+
 Removed classes
 ~~~~~~~~~~~~~~~
 
@@ -188,8 +220,17 @@ The following classes have been removed in this release:
 -  ``migrate_localcount.bbclass``: obsolete class for which code was already
    removed in 2012.
 
+Removed features
+~~~~~~~~~~~~~~~~
+
+-  The ``ld-is-gold`` distro feature was removed from the
+   :term:`DISTRO_FEATURES`.
+
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
 -  :term:`ZSTD_COMPRESSION_LEVEL` is now a plain integer number instead of a dash-prefixed
    command-line option (e.g. it should be set to ``3`` rather than ``-3``).
+
+-  The ``devtool ide-sdk`` utility has been removed from the :doc:`eSDK
+   </sdk-manual/extensible>` (but remains available in the BitBake environment).

-- 
2.47.0


