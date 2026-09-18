Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DDBC982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11762.1789739648731927314
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=q3EKifg9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1BD901A091E
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEEA160649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEB141032901D;
	Fri, 18 Sep 2026 15:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i3cKS6/qxrF0yTFtem6o4jilg0ZyCZiR/3Iz/YqC8VE=;
	b=q3EKifg9BpKGSV8OHA7/AX1h6XaginxBesFSOxUoz/2Md+cdSIm9ZfzigRoWqcGZq/UHn/
	OXC9ocKT3myvPM4w99RbmBI7bip9xCPxPQRJYTeR6hH+TPjl16EprzbDfv+CNsX3Zce6zK
	C+sw0oVaK+gJ+P2PTHbmgX/udlanCqklyGjYzahGKhvf9P5Wj/NLcZeonBuL2H3qaGchN8
	YPNxUpjkpdS5vWPeoxzGDLg0Q56CNAhyJ5oSYB0wPwRf5b+Wy4rgpiMxejZ8UkfxImZ2PO
	wdJYLt+9kxVWruGEPlIancGHLfU8VvxJ7BPF5nDilGzE6PbUky/e+FjkF2176g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:34 +0200
Subject: [PATCH 04/20] ref-manual/classes.rst: linux-kernel-base: drop the
 class documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-4-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1ASzrHRrPBrLwyYAQxHmMemUTA7JMt9e5fZo7dMfbqk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJjqA/7jFxgQO4ReHlS4p1u0U1TxN95dDqYQ
 yDnN1DZE5qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CYwAKCRDRgEFAKaOo
 NolkD/0W+PYzgjJPgYxtJOpvC7NHoDJKdzUyVl2iqAEneic4aVCd8fLwIRWebX0bvHq4kvMRGDj
 gMrjxGBY2bN7Uas6QIcyULKy7dal15ScDeVOu8V6LLrWZTH35Yq1q7lEOeI2UmhNwtnVjyO2soT
 U/1xl3AwCObZDosRsk4/bG0iw+oYHozlVyVCmSR25xrnPLyZxCS6GmaePfC56hfwX6T39qwYe1W
 zFPR0Q8m5wzMCb/TaIDFr/73xkH3Otk1tA8ucswiMBxvch6kdZDjtC5X6uDY8ZUfsuJxjSonL0J
 ACzp+Qiy5mi+DinTvXnAhkWr7IsRWwY78xfbVKQTlbQScqXvw0wBiYfIm+P8IxCsr1JDgboqKsR
 bfML8eip0fJuukVtDj10m11XoCFicmUSfI+A/VYoBrigRZNzerSfeI3B+bUQ8dhjWCmt/QQ3ain
 AIA9HqPmGIHGBs41Ve/3rjBV9e3mC7EoVblxNxWZ2hro0LBrS2hlD7nLOJgNK117ZWz03Rw7YEP
 nvecs0sGzCvz+RDTTwcUnHVE3yKoHlI04T+39/Ful1PEU0ZQN33Q4ubakEmyDJt+B16mqLptj1M
 EOZwnV85nLKmF39tx8Xl4XlbTukt3LZwAKkYD36bpFvkYeZeRDQTFOeA/QZ3zJol9TyToiBbYL/
 K+QCYMwkqEiuOwQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10536

Class was dropped with 06057ac24f74 ("linux-kernel-base: Fold remainder
into kernel-arch and drop") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index eb28c794d..c88180835 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1316,8 +1316,7 @@ information on how to build an :term:`Initramfs`, see the
 the Yocto Project Development Tasks Manual.
 
 Various other classes are used by the :ref:`ref-classes-kernel` and :ref:`ref-classes-module` classes
-internally including the :ref:`ref-classes-kernel-arch`, :ref:`ref-classes-module-base`, and
-:ref:`ref-classes-linux-kernel-base` classes.
+internally including the :ref:`ref-classes-kernel-arch` and :ref:`ref-classes-module-base` classes.
 
 .. _ref-classes-kernel-arch:
 
@@ -1597,16 +1596,6 @@ The :ref:`ref-classes-license` class provides license manifest creation and lice
 exclusion. This class is enabled by default using the default value for
 the :term:`INHERIT_DISTRO` variable.
 
-.. _ref-classes-linux-kernel-base:
-
-``linux-kernel-base``
-=====================
-
-The :ref:`ref-classes-linux-kernel-base` class provides common functionality for
-recipes that build out of the Linux kernel source tree. These builds
-goes beyond the kernel itself. For example, the Perf recipe also
-inherits this class.
-
 .. _ref-classes-linuxloader:
 
 ``linuxloader``

-- 
2.55.0


