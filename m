Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0832EC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77903.1734427637285277325
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ir3QEAjY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C50B21C000A;
	Tue, 17 Dec 2024 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dSJtzqSfZuO3nIKyzaOJDTSbKyvEsHIXX0OpW8pbbCU=;
	b=ir3QEAjYUOAg+w/69e5tLyXGPRr43kM3+Awi+4ENlBr2Gcx6KliXa5kuoyMtcbHaKnXpQ1
	ctDf7AZVgd9NhIG8aSA9ZmI92vZnGo6g2YylC7W9iW6ArCIB4gam3NTMYePyiBFJzNRpps
	0Kc4Ha2xUDpv3JhdI4CEHRN6/NbciI3Q3eZxiLEYxHHyDg0gI93O/Od/Lli2V6vTXfTtwj
	ap2rIJJAW8wakEgzBhQ4vFIyPlt6KBdIVHcutoLcEp9vJeusgj0qazpP3Rwr5SJzeMl7fk
	6HRQ820KeG/2m+a/bvKfrpFYPRVQXWWx4vEN7NRcM3oAM2gx+7KVfnPv2IDHGQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:10 +0100
Subject: [yocto-docs PATCH 11/14] ref-manual/classes: document the
 yocto-check-layer class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-11-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4J1ec8XAVPf0eCWGCBPoDsytN4v66kBVXgFboJhBgW4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPw5frdtnYvkIXccx3dZxAhqipUszFzAoHO4
 qRUBFCS3qeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 Nj1GD/wKliy7aPLeRxcLxpj74my+zIXLm+bLaEBQy84lwiH3OuVD0sVvN/rpWv1ChDpkDCVIGQj
 Gmp0Suhx880zj3+ws0ep1hzzDXvM9PUVaR5c3v4qIgaBFDRJtPrwqDBa8XsHPzqwlwVrZLKBg31
 Sl/VtpQeux3tKh5SGZBHMcG0X8Ho2gd1nlkjpyIOrHdu0T0ZaP9ddIe3N1gLUuoUwOI1/epf+Kq
 zT4s1BuU30xZHOb03+vSo3RbmzSIEj38TC0mx5BM85P2JBeiXTPxfOIJVgpt9bd6EsjXnU/LCX6
 x6Lwd4j+60k9R77Cdo9XPowfGFO3IPpVnfbXC5G7qbqpqktm/nvSf6hC1E1F7fjs4CZdqhrPfzg
 R09X0OsPKK+ge66TA5ipEWKByBBe6ni79jJ/61+lTCrA5NfzGwPzldjf5fWzOSBpFf25uQfER5o
 fWGiqzMGGMovomG4rjZjB9DyEboFPKkEif0+fgOmTcBH/r1Clo+zzoln/A+O7T6rXg97i3SJyWr
 VjyH9N6YHfD2/mC9uDzMZzeUYBHSBXgchgF+KrgRH8JkjJ4espyo/acngmADwu0a2LbnM6wGTBP
 u0N6O0bRqM7RM9ClCi0aQmyihT1tdtLAUNr90kkvyMcRJa6qvAdZsrlAlTc/ZWqxIHLAn/dbKJE
 VgsmGHRqTc/0RvQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5945

This class is used by the yocto-check-layer script to check if a layer
complies to the Yocto Project Compatible status.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 47f049c7435a989f30c033b7b12d86482686ac77..2480b4e221ff1d83585eb277c01d716e6bfa5a00 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3604,3 +3604,23 @@ the Waf build system. You can use the
 :term:`PACKAGECONFIG_CONFARGS` variables
 to specify additional configuration options to be passed on the Waf
 command line.
+
+.. _ref-classes-yocto-check-layer:
+
+``yocto-check-layer``
+=====================
+
+The :ref:`ref-classes-yocto-check-layer` class is used by the
+:oe_git:`yocto-check-layer </openembedded-core/tree/scripts/yocto-check-layer>`
+script to ensure that packages from Yocto Project Compatible layers don't skip
+required QA checks listed in :term:`CHECKLAYER_REQUIRED_TESTS` defined by the
+:ref:`ref-classes-insane` class.
+
+It adds an anonymous python function with extra processing to all recipes,
+and globally inheriting this class with :term:`INHERIT` is not advised. Instead
+the ``yocto-check-layer`` script should be used as it handles usage of this
+class.
+
+For more information on the Yocto Project
+Compatible layers, see the :ref:`dev-manual/layers:Making Sure Your Layer is
+Compatible With Yocto Project` section of the Yocto Project Development Manual.

-- 
2.47.1


