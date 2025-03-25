Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26D2C3600D
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.61367.1742894479287272158
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PW563/1h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 735114421F;
	Tue, 25 Mar 2025 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIBImh2y8NcKyPglyfcoQMZ1ESPD8GhpUosHan47DZg=;
	b=PW563/1hDVKqYEOVlqx+gNtw/o8IlxqnGzknur+HUalul6FQUL1QzjzdylPgEslPE7PKev
	htjopUuAmOeQWp2IkdGp0p2knHZqF92JCvLw8+2OSqriM5lceaK4vF8L2SHRz3+P6p+aT9
	4y5VN86P/ewEP8qObS+ZzxGAHMXUmDh99CG60nUf7kmp3HFWxvKaZlTTX1Oekad/+x4GeN
	Z3zg2iY4edeZmXrdnTcEfJqkx2tcFLPOS7+6cu0f+UcSaoYvN3F7CnkzsXeYazx/BuUXXO
	ZWPx611iHS9uAnmZpopwVu+As5JWVmZFql/SFCWnuoseF2A/gyCGvz/aGLdSSQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:55 +0100
Subject: [PATCH v2 11/12] migration-guides/migration-5.2: update for
 upcoming 5.2 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-11-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3857;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=S0NQfJFJlY2veXeGmRQv4keSzGi9iRDajeRUFVC3NfE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWLMdVq1oUqakd3I3p/YeGTdPhTSKpXxMG1M
 HYXDvYtUhOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1iwAKCRDRgEFAKaOo
 NoNpEAC9wnmjVdwNSEMRCOT5MiKJWwSWt4RgTtRVYzKBBkrlgeH7BKFqD9Jy0SM19T4UW9jBVIw
 vsmEw/r3mpV3TPfZjCEmLDGq1dauAOCBlhyAP2U0Pkz5fVYF28Fu2BBhPp9pmezUZfLU6+msnKk
 xVec/s5dwULVskz7cZfjczN9f5fRdShqhJj/BNv6a1xcgXl4JM0XcUYQjP5dgcHDcuGXuYvfYpt
 cDm2Hd/g44JvxYI1MCvOeAWdi2kRRIxhgMRxalxVv7nOZuvZMNOQVlu2RMpLNrm5H6qQAeWBA0L
 FsHzfhPAA4fuOxPIc28+exJqoTGcaZMD9QeJg5EcMSkxOOGZYy4uPjifxTn/mKwSO+dRa3WbYPG
 G7LAK4wh0ZfLyVrum0ipQtwJydDOAFycgiydqbQTBnnqKD7/pVTD1ulKDa47yHeHNK6jt22UrlT
 HB6uwcgZSl8zrGqSPFMPuiQO63fns290o3gu+kSV8rCOyNrQw1d/MKH3+If8VzfP0fKdO1uLn1g
 AFmkalsvsR1i3rFWFr+1ZKPFIpNhftL5IvaG5fMo5MmMCDYwZB3PJmatHFGAfw/UkHzsJPC1tmz
 o1KhDsFDW6j9jpC98q9R1hEmjDgPkxYQiIjK5Bea80is+nclVymfiVczOT56H6Lea6RsQnV8iPi
 Sm5ISC+3Ui0oGUg==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6622

Changes since 87d7341465f8 ("python3-iniparse: remove recipe") up to
9cd6b3ad8b9b ("cronie: Resolve build failure with GCC15") in Poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index c4ee3fadd..b5df4412e 100644
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
 
@@ -151,9 +156,32 @@ c++/binutils)" </openembedded-core/commit/?id=4ccc3bc8266c>` in
    find m4 macros, then usually the solution is to set ``EXTRA_AUTORECONF += "-I
    path/to/m4"`` in the recipe.
 
+-  The :ref:`ref-classes-autotools` class now requires any recipe that inherits
+   the class to have a ``configure`` script. The configuration script location
+   is stored in the :term:`CONFIGURE_SCRIPT` variable. The
+   :ref:`ref-tasks-configure` task will fail if the script is missing.
+
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
 
@@ -176,10 +204,19 @@ Removed recipes
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
 
@@ -188,6 +225,12 @@ The following classes have been removed in this release:
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
 
@@ -201,3 +244,6 @@ Miscellaneous changes
    Therefore, the :term:`UBOOT_ENV` is no longer handled by the
    ``kernel-fitimage.bbclass``. There is a new variable :term:`FIT_UBOOT_ENV`
    which should be used for adding a U-Boot script to a FIT image.
+
+-  The ``devtool ide-sdk`` utility has been removed from the :doc:`eSDK
+   </sdk-manual/extensible>` (but remains available in the BitBake environment).

-- 
2.47.0


