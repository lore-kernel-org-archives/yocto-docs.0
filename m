Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F285C36014
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10722.1743167257775117189
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Uo1bF81z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42FEF441AB;
	Fri, 28 Mar 2025 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0wYVxGI+RMBfqnnS/1U2h52Go8u28I4VFsx1Pcte6U=;
	b=Uo1bF81zWxEXHTFoHTdFbZCezwZUatgSRx9z72EWlv7NVh6XbjFwkW1zJ7UtAfimcIgcH8
	/MHu0PFLA8VIONhfJEahhs0r3wvrRj2rAx/n4qPqpEHXssC2kkZhvRz9RMo2vYOewGks22
	IloE2PpXgTfAleEnEUAY/BncJAWl9UIvLXaTvaS220kvFicquHMwfoCKtpCJw1t0U+94Zz
	m7XygXue7p8AM6SPG4fkHe6O0g3hJ3xm+fOQkXUqmru1g3iwYGsAVCLSuJv+0WBGZU+em7
	227wvI1qOEnKZ8gidXtYwMdCLPQYlcsB0Ijbs4hBFMH1oDbOtPO7wZFQkczb9A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:14 +0100
Subject: [PATCH 11/11] migration-guides/{migration,release-note}-5.2:
 update for 5.2 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-11-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4985;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UkVF7nBT/4LcASqiIvsvIm9muLITDHsGx1LoUkTD/Yw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8VupLBybcHW/cpJWAxdvX7OsxJ3x32DBh1O
 OGB3w10SZyJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFQAKCRDRgEFAKaOo
 NrqXEACoQRp072fawreIeNRQrSMyJeuOK0q928BJpfM7vW0Gpc9NljStaG+7konmX0L+ry1ZSco
 9Aen8NI6B4AuQHQ2v12I8YjIH+nyyPgNxSfnqKb1yoacMjkI8zrtD5aAK9FpcBMYsp99nu6TbAN
 kwjUg5Zw5YaswG6N+Kc47+Guel0XC1vGokHvik9WkHi8of1wIr+TTSzWmelq42qWybU3Y3VGKP5
 ZAbUIQzfYlH4BAmKsAmPZj0g/Qw4MJ7FwDiJRcRyf0jUeSf7yOIkA3fc23IhJNC5GAC1Mfkn7nf
 6ct23k3bCFezf5uEJ82b1f0eEnVvvaDVEzkMeXwVRbbFGXYcV+L99HFU4p6rd2t5S1CD65koxTE
 pFwDp7FKEPUnTluDqwN/+3IIZhAWUJyXr1MjKTZGijb/AJdazhECqca3E/vetBDyHKYsHi99DQp
 RMiDB3WB/SXkNNLF8qOzJItd6rViIr4utb9QMLzyoOjdBNQQRjx6K9NiMK6hQu3cwsT/fcoZipH
 gWcMQ+hR9ZGcHxk16R2bziTWhCkHt8cr8TNKi+Y5IWc8sIpVN11cKAncknXerWx8wrPuyzU6ZOt
 DpgHqp6dxGwIebeDWwh+LfDjHF/lPFVozaT6lEPORtl9pV+TNj+GLn1m8buenrV/6HtIwRTRu9X
 Rqe0P/KlUq/67IA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeukedtudeliedvteetkedtkeeivdfhhfdtfffgvedujeffhfeuheeigeethfefkeenucffohhmrghinhepshhomhgvrdhhohhsthenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohept
 hhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6666

Document changes between 0e91a1dabf27 ("adwaita-icon-theme: upgrade 47.0
-> 48.0") up to b3c21a23ad3a ("migration-guides/release-notes-5.2:
update for upcoming 5.2 release") in Poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst   | 26 ++++++++++++++++++++++
 .../migration-guides/release-notes-5.2.rst         | 22 ++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 59a2782f2..c54f054c7 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -178,6 +178,32 @@ This should now be replaced by::
 
    UBOOT_ENTRYPOINT ?= "0x20008000"
 
+
+Git fetcher: support for multiple revisions per URL removed
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The support for having multiple Git revisions per URL in :term:`SRC_URI` was
+removed from BitBake, which means the following syntax is not supported
+anymore::
+
+   SRC_URI = "git://some.host/somepath;branch=branchX,branchY;name=nameX,nameY"
+   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
+   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
+
+This was rarely used in the core repositories, and this removal simplifies the
+code logic in several places.
+
+Git fetcher: Branch parameter now required in :term:`SRC_URI`
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The ``branch`` parameter is now required when specifying a Git repository in
+:term:`SRC_URI`, for example::
+
+   SRC_URI = "git://some.host/somepath;branch=branchX"
+
+A missing ``branch`` parameter used to produce a warning, and will now produce
+an error.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index cbef0d686..05fc92e85 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -43,6 +43,13 @@ New Features / Enhancements in |yocto-ver|
       This can be used for authentication of private NPM registries, among other
       uses.
 
+   -  The :term:`GRUB_MKIMAGE_OPTS` can be used to control the flags to the
+      ``grub-mkimage`` command in the context of the Grub recipe (``grub-efi``).
+
+   -  The :term:`SPDX_PACKAGE_VERSION` variable controls the package version as
+      seen in the SPDX 3.0 JSON output (``software_packageVersion``). The default
+      value for this variable is :term:`PV`.
+
 -  Kernel-related changes:
 
    -  :ref:`ref-classes-cml1`: in :ref:`ref-tasks-diffconfig`, do not override
@@ -81,6 +88,10 @@ New Features / Enhancements in |yocto-ver|
        -  ``qcom-x1e80100-lenovo-t14s-g6-adreno``
        -  ``qcom-x1e80100-lenovo-t14s-g6-audio``
        -  ``qcom-x1e80100-lenovo-t14s-g6-compute``
+       -  ``qcom-adreno-a623``
+       -  ``qcom-qcs8300-adreno``
+       -  ``qca-qca2066``
+       -  ``qcom-adreno-a2xx``
 
    -  ``linux-firmware``: split ``amgpu``, ``ath10k``, ``ath11k`` and ``ath12k``
       in separate packages.
@@ -208,6 +219,10 @@ New Features / Enhancements in |yocto-ver|
    -  ``rust-target-config``: Update the data layout for the *x86-64* target, as
       it was different in Rust from LLVM, which produced a data layout error.
 
+   -  The :term:`PACKAGECONFIG_CONFARGS` value if now passed to the ``cargo
+      build`` command, which means that Rust recipes can now properly define
+      their :term:`PACKAGECONFIG` configuration.
+
 -  Wic Image Creator changes:
 
    -  Allow the ``--exclude-path`` option to exclude symlinks.
@@ -330,6 +345,8 @@ New Features / Enhancements in |yocto-ver|
       -  ``wget``: increase timeout to 100s from 30s to match CDN worst
          response time.
 
+      -  ``wget``: Support setting :term:`PV` in :term:`SRC_URI`.
+
       -  Add support for fast initial shallow fetch. The fetcher will prefer an
          initial shallow clone, but will re-utilize an existing bare clone if
          there is one. If the remote server does not allow shallow fetches, the
@@ -494,6 +511,8 @@ New Features / Enhancements in |yocto-ver|
    -  ``systemd``: ``apparmor``, ``fido``, ``mountfsd``, ``nsresourced``
    -  ``ovmf``: ``debug``
    -  ``webkitgtk``: ``assertions``
+   -  ``iproute2``: ``iptables``
+   -  ``man-db``: ``col``
 
 -  Systemd related changes:
 
@@ -540,6 +559,9 @@ New Features / Enhancements in |yocto-ver|
    -  Add a sanity check to validate that the C++ toolchain is functional on the
       host.
 
+   -  Add a sanity check to check that the C++ compiler on the host supports
+      C++20.
+
    -  Add a sanity check to verify that :term:`TOPDIR` does not contain
       non-ASCII characters, as it may lead to unexpected build errors.
 

-- 
2.47.0


