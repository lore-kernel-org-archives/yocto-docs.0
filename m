Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C27C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:51:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.35416.1745311861300688849
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Apr 2025 01:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QmxU7Rnn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D592F43163;
	Tue, 22 Apr 2025 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745311859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QU5gBgS+p++cRdNthn/snrZdCn/KRbjYKeMLdSo4GJw=;
	b=QmxU7RnnyQmSWz/Zu4iDWNL/7tHrWqu1kfwC1T3BQ4HrxfX8LS3pXqqjgc7gdvCqniSFog
	bkRNUjcMpgvbK02QZVxg4rm4x1NgvQn2jpu/9XpPXy53cSeLV3euGtkidvD5cnTsMQru74
	Rg6zn/bhmwTXmd4dWSU2tKbaXVrOjTTSva6GkvC+6Hvmc3EUIOLuQat+eNuMjPINomgRHo
	2XyV6CSJ51JF6ZQFzFKUHy5PLr4EZ1jkzDL722FMP4i/xn/Nj82uKYCSWNPuvJsw7C2per
	OfcpK5lcJ3rK0NQbKnxy+MDaq3zSOJbL+TFV6O2u42Hd4vSDEMksOq3yn4NZIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 22 Apr 2025 10:50:55 +0200
Subject: [PATCH] migration-guides: add placeholders for 5.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-5-3-release-notes-template-v1-1-c0fc01eafd0b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAG5YB2gC/x3MwQqCQBAG4FeROTewjUlTrxIetvq1AVtlZxFBf
 PeWjt/l28mRDU73ZqeM1dzmVHE+NfT6xDSC7V1NEqQLFxHuuOWMCdHBaS5wLvguUyzgoKrXW6u
 i+qQaLBmDbf/80R/HD+JIubVsAAAA
X-Change-ID: 20250422-5-3-release-notes-template-08887938288b
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6598;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=A9oH1IWDHMHqE2MDvEsB2qXUXyFCxzX7p+SmiC79WxE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoB1hy8D6vdWzB2kkLNOOtpNPsTVGbobGTkxDuw
 SYAcSNNzHiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaAdYcgAKCRDRgEFAKaOo
 NraeD/4hvhpjLTEdNCBkRxoSzsay4ruS9AaLI4OhxlnDpzX+/mMKhGJe6wt8a7qmH48JO5NE4qv
 Sd22kCw+fJx3xdeBPan0GEARV7EyhCmfCDxxr8KW6EtCyQ00Dy6pNzUu+ABbfEreVgOmwvvrtur
 nzGiDCOspUUH2t4dBmJGJOvQDannDruAjz0NIrfad1cP+mkIxk0i6XBk5eCPWWmEKQNRrT3Sef5
 HbCaCEOIeAliFMZBnemM5gKeKnXVQE8faCrB6Cl4IspooE/jB7n9m5Dczbi4ICXZzaCMVb1935u
 JwAmEo9K3AOtO8h1RCtGrz/vRt9+JCn8yvQbIjojSE+kZMoWlbbsZVoJiohWyGRDLV2N54XhhqB
 efF2ZgU6hsBa527IwEGVDiEk4p2rM6P0WqUJt/s3vi3xvHHdyzW5uIupeDA8FIyvqVSW9qSXyT4
 Ly56Mrr3SdwRaHbvJiRaPnn6HMu/2D72Bdutn3ydLCvE513vGs4LMmcW0KbHXBlw5pQ+CvvmL8K
 fravg32P8lGVJbfeNUqo/az5/4yGkKbha9cz7fw2vYRozQE6P7x3+SkuHmThnNQ6iP+ZOZgvPLX
 vBOP7zalA4UXYFcdgy8bwxoG3nWRbTNsmEDYnAz+FYMKtlujQ9oOe5EVSDn82yaYGu9UBoDcDPY
 ZWLZ9K545ZuINAw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeffedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduieejledtieeuteffveetleeuffeivdffjefgteehgfehleeiteehieeuieekueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Apr 2025 08:51:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6768

Add placeholder files to be populated for the next 5.3 release.
Relevant section names from the previous 5.2 release migration
guide/release note have been left with their content empty.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/index.rst           |   1 +
 documentation/migration-guides/migration-5.3.rst   |  68 +++++++++++
 documentation/migration-guides/release-5.3.rst     |   9 ++
 .../migration-guides/release-notes-5.3.rst         | 126 +++++++++++++++++++++
 4 files changed, 204 insertions(+)

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index 14127d56f..81227ad56 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   release-5.3
    release-5.2
    release-5.1
    release-5.0
diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
new file mode 100644
index 000000000..22653fc91
--- /dev/null
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: whinlatter
+.. |yocto-ver| replace:: 5.3
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Release |yocto-ver| (|yocto-codename|)
+======================================
+
+Migration notes for |yocto-ver| (|yocto-codename|)
+--------------------------------------------------
+
+This section provides migration information for moving to the Yocto
+Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
+
+Supported kernel versions
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
+out the box, older kernels are not supported. See :ref:`4.3 migration notes
+<migration-4.3-supported-kernel-versions>` for details.
+
+Supported distributions
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Compared to the previous releases, running BitBake is supported on new
+GNU/Linux distributions:
+
+-  XXX
+
+On the other hand, some earlier distributions are no longer supported:
+
+-  XXX
+
+See :ref:`all supported distributions <system-requirements-supported-distros>`.
+
+Rust language changes
+~~~~~~~~~~~~~~~~~~~~~
+
+systemd changes
+~~~~~~~~~~~~~~~
+
+Recipe changes
+~~~~~~~~~~~~~~
+
+Removed variables
+~~~~~~~~~~~~~~~~~
+
+The following variables have been removed:
+
+Removed recipes
+~~~~~~~~~~~~~~~
+
+The following recipes have been removed in this release:
+
+Removed classes
+~~~~~~~~~~~~~~~
+
+The following classes have been removed in this release:
+
+Removed features
+~~~~~~~~~~~~~~~~
+
+The following features have been removed in this release:
+
+Miscellaneous changes
+~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-5.3.rst b/documentation/migration-guides/release-5.3.rst
new file mode 100644
index 000000000..bcde2d225
--- /dev/null
+++ b/documentation/migration-guides/release-5.3.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Release 5.3 (whinlatter)
+=======================
+
+.. toctree::
+
+   migration-5.3
+   release-notes-5.3
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
new file mode 100644
index 000000000..181f1a401
--- /dev/null
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -0,0 +1,126 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+.. |yocto-codename| replace:: whinlatter
+.. |yocto-ver| replace:: 5.3
+.. Note: anchors id below cannot contain substitutions so replace them with the
+   value of |yocto-ver| above.
+
+Release notes for |yocto-ver| (|yocto-codename|)
+------------------------------------------------
+
+New Features / Enhancements in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Linux kernel XXX, gcc XXX, glibc XXX, LLVM XXX, and over XXX other
+   recipe upgrades.
+
+-  Minimum Python version required on the host: XXX.
+
+-  New variables:
+
+-  Kernel-related changes:
+
+-  New core recipes:
+
+-  New core classes:
+
+-  Architecture-specific changes:
+
+-  QEMU / ``runqemu`` changes:
+
+-  Documentation changes:
+
+-  Go changes:
+
+-  Rust changes:
+
+-  Wic Image Creator changes:
+
+-  SDK-related changes:
+
+-  Testing-related changes:
+
+-  Utility script changes:
+
+-  BitBake changes:
+
+-  Packaging changes:
+
+-  LLVM related changes:
+
+-  SPDX-related changes:
+
+-  ``devtool`` changes:
+
+-  Patchtest-related changes:
+
+-  :ref:`ref-classes-insane` class related changes:
+
+-  Security changes:
+
+-  :ref:`ref-classes-cve-check` changes:
+
+-  New :term:`PACKAGECONFIG` options for individual recipes:
+
+-  Systemd related changes:
+
+-  :ref:`ref-classes-sanity` class changes:
+
+-  Miscellaneous changes:
+
+Known Issues in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Recipe License changes in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The following changes have been made to the :term:`LICENSE` values set by recipes:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe
+     - Previous value
+     - New value
+   * - ``recipe name``
+     - Previous value
+     - New value
+
+Security Fixes in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The following CVEs have been fixed:
+
+.. list-table::
+   :widths: 30 70
+   :header-rows: 1
+
+   * - Recipe
+     - CVE IDs
+   * - ``recipe name``
+     - :cve_nist:`xxx-xxxx`, ...
+
+Recipe Upgrades in |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The following recipes have been upgraded:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe
+     - Previous version
+     - New version
+   * - ``recipe name``
+     - Previous version
+     - New version
+
+Contributors to |yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+Repositories / Downloads for Yocto-|yocto-ver|
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---
base-commit: 29be069ebbf2c55d72fc51d99ed5a558af37c05e
change-id: 20250422-5-3-release-notes-template-08887938288b

Best regards,
--
Antonin Godard <antonin.godard@bootlin.com>


