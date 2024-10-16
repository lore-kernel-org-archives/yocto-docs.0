Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D64D2A52B
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 15:24:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.26144.1729092296664774576
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 08:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UvFObAAH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D1F6C0003;
	Wed, 16 Oct 2024 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729092294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OP6IaRCjc6yREaK6+neHgEPy8yiVlWQKlM44rNzGGqg=;
	b=UvFObAAHhuKtMpmS6n2dD2xKENxkUNHhq6gHTxax+ECqhaZmPoNjvzsoiNzW9uc9lJKQtA
	UBlZuR3b/1TStBeMyXDRBrac9cj4Nn/0FFdi4FzozqVQmyIaxrVHp6OuSyDD5U1kNPI6qc
	5CyDt83ho22yG2JL35JNPKVdIXDV9bqrTkNUquueodZWslAQAonjsiUG932jIQhFPCXKYU
	gYg4wlA5vLQKmGSmq++WF2ZzjVYjGdi7nfqqPdCvNFuWVH+Nlp63X7Ff5boSOwXw/jyObx
	6dgn5KbEzNjjAHsdt1kJ079slds0ELvFsBfBKQ2e+qowT1nh7zH72IuIZ8++wg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 16 Oct 2024 17:24:48 +0200
Subject: [PATCH v3] ref-manual: structure.rst: document missing tmp/ dirs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-bug-14543-v3-1-35ff2724e662@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAL/aD2cC/22Myw6CMBQFf4XctTV9XKB15X8YF7a00ESpabHRE
 P7dwgoTl3NyZmZINnqb4FTNEG32yYexgDhUYIbb2Fviu8LAKUdGGRL96gnDGgWpG6eRSkVl46D
 8n9E6/95al2vhwacpxM+Wzmxd/1UyI4y0RtZMaauMMmcdwnT349GEB6ydzPdus3d5cTsnqJACU
 bTtr7ssyxd/8a6/4AAAAA==
X-Change-ID: 20241014-bug-14543-56fb4089086f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3697;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vcYKQX3SNVgoT76SlR0XAyigoIk00CvRA9tPEzsgyW4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnD9rFeW5xnf7pjxeMAyvfH1Fx/Q+t8w7VrCH8a
 W7nnSklLEGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZw/axQAKCRDRgEFAKaOo
 NqZeEACWIzjl8G4yDxO/80z61+xgxJxG0qe0jmgxgIizqijlhddtO2rQrnfJzeXH3fmHz6Hrn0E
 wreuYgaPZHxiocx1f24c39H+9ibDTjgPqWw58/JZRAdfJzCTAFHHn05zysrYu/RxGIt5lm9jDQP
 sCTiYF6mI2LaF2cdTqu5Nognl3AIyfqJ8vXIVo8cRkHLMDuBnKZhD5s0PDHZTXEOvOL4d6pznlf
 am+ewG4h/d+25b2AD+gbIf92MP55lPE6C2XEcw4xNBdYa1mqfe80ThlgmNkDPvZO4PLg4nKw4PW
 npM4bXPuHkvNPA4D1HxUbUoC9IAoNJdzZoa359+fhWfNCZsJm7RDPmZSawOKwieJCxi28bF28tg
 HNsVXPvMnlS67oAsQ9O4oSeTbTQuaUvK1EYtrBrcJfk3gvuJ73qXOSLyhVVm/t4EbfuBo/Mx+U+
 Ec6vslq7crbDKGSeWXnS64F3f9ctVd84K6zw9LzxFzfwDMXttmXu9gt+3M5PCgHuP7mT4qlU+ka
 gtzIAWsIXSEJG/uh1t4ka1xxZs0VpW21pIVfEA9JJGjXpHK7aujb4326xmU6MB8I8QqDTeAX9HO
 f4C20EXGqhKoa+qgVKiqtSJ8ZR32wyYBgs8OrpRvdc8YOL5QgqYNrM/BYqsLM/QK+9LPBNzp+q1
 8078Ee83wCitoQQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 15:24:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5523

Document `hosttools/`, `pkgdata/` and add some more information on
`work-shared/`.

Adresses [YOCTO #14543].

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
---
Changes in v3:
- Rephrase triple "to" to "to make the kernel source code and kernel
  build artifacts available to..."
- Add a note on the rarity of using this directory, and an example of
  when it's used.
- Link to v2: https://lore.kernel.org/r/20241016-bug-14543-v2-1-df3038344377@bootlin.com

Changes in v2:
- hosttools: add missing "the"
- hosttools: Remove "pre-installed" packages and point to host
  requirements section instead.
- work-shared: s/as a way to make it common to/to make it available to/
- Link to v1: https://lore.kernel.org/r/20241014-bug-14543-v1-1-7c8519be9c9c@bootlin.com
---
 documentation/ref-manual/structure.rst | 35 ++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index e4d8b54bb9e39ffe344d2db1798e4fe76c742f4e..bbeda78c791d430faa55356a3209f5eeb1402837 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -484,6 +484,30 @@ the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
 section in the Yocto Project Application Development and the Extensible
 Software Development Kit (eSDK) manual.
 
+.. _structure-build-tmp-hosttools:
+
+``build/tmp/hosttools/``
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+The OpenEmbedded build system uses this directory to create symbolic links to
+some of the host components that are allowed to be called within tasks. These
+are basic components listed in the :ref:`ref-manual/system-requirements:required
+packages for the build host` section. These components are also listed in the
+:term:`HOSTTOOLS` variable and are limited to this list to prevent host
+contamination.
+
+.. _structure-build-tmp-pkgdata:
+
+``build/tmp/pkgdata/``
+~~~~~~~~~~~~~~~~~~~~~~
+
+The OpenEmbedded build system uses this directory to store package metadata
+generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
+directory contain information about each output package produced by the
+OpenEmbedded build system, and are used in different ways by the build system
+such as ":ref:`dev-manual/debugging:viewing package information with
+\`\`oe-pkgdata-util\`\``".
+
 .. _structure-build-tmp-sstate-control:
 
 ``build/tmp/sstate-control/``
@@ -657,8 +681,15 @@ Here are key subdirectories within each recipe work directory:
 
 For efficiency, the OpenEmbedded build system creates and uses this
 directory to hold recipes that share a work directory with other
-recipes. In practice, this is only used for ``gcc`` and its variants
-(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
+recipes. This is for example used for ``gcc`` and its variants (e.g.
+``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
+:ref:`ref-classes-kernel` class to make the kernel source code and kernel build
+artifacts available to out-of-tree kernel modules or other kernel-dependent
+recipes.
+
+In practice, only a few recipes make use of the ``work-shared`` directory. This
+directory is especially useful for recipes that would induce a lot of storage
+space if they were to be shared with the standard :term:`Sysroot` mechanism.
 
 .. _structure-meta:
 

---
base-commit: 1304b899cd4480f80eaeb6e58d57e87d3d2f6911
change-id: 20241014-bug-14543-56fb4089086f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


