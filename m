Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB46C021A9
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 09:12:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.15641.1739869928659439999
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 01:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=njh2zkkf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09D49432B1;
	Tue, 18 Feb 2025 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739869927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=snHiUnNU2ZrUYXpLj4lOTs7YRXOqfYF3vMon4MnoNso=;
	b=njh2zkkf15XsI+lwhtTzoCu7DDEfb1hJHnPLbSYYP7bftT4oYvKXRq35z84tEUDtJtOMCO
	UuOTAkH6vLC4wquAQdIgyRZ527+6KKPEOvAqku/iE50UfhpWcFo3pqrqzFxQrIhADtD5ud
	q5S1W/FS+CIODLDxBu4pFBKJCw/P7D58mpR+Gh/sXNdLoB+V8f3+Gj5tpHsO0Uwc8FFm5I
	i1SYLQ/TCWgkqDQQ/ApUDUBZja71TtYQrYopvHVYsHVVEqOPnSpDWK4POIDPiw7yxhW8NU
	MrabRiX//AE4vzNfiWu9hweF1dMmcPFnNLdfAWr7KZtjIYJTuCUALjia89G+0A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 18 Feb 2025 10:12:01 +0100
Subject: [PATCH 6/6] ref-manual/variables: improve the UNPACKDIR
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-overview-figures-v1-6-75d23b5e7a88@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
In-Reply-To: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5owgBRaWnzahcZCHJIGDi/LeNiP5DYHkNDemyov7FvA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBntE7j5ibsajhYViEX55yiqIp5CVIuNMKHXZsU9
 rTsKVevr/CJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ7RO4wAKCRDRgEFAKaOo
 NorIEACFzBYw0Nnn/97YM+r4xF/bQEQa1tzmghPYeH3sJbcSzfPjk5aJT9Y3mgwuO05d79fRxsN
 4N1lqzG56D0aQamSK6SlQvF+tW4Hp2JZOAU0ytOHQkCIrFrzok1RWWXMgCKtzLfqWF+77kt78Zk
 uBTNTZ8rVTpzyxJvp/Vbz/189vt6WmIFaX8m9Oq3Zy3ZAwVKmeWUcfuntRxSRNpLIC7UVDuI2qQ
 alLlD0QlEO0zke+hKE3Kwozwi59tmZhEJ2udi2t+9QsgKVcdvE1xYyUnh1N3YQRGWE3uKjFerYk
 jeMsk2vonvx86Kk0p9yuii+HBCvNaN5uw0v3vLUu7uohStTp3sgo3acUW9gj3/HHcP5AyYcwXqP
 4v+0fNN7fIGhPQkfJnjxzmY1nZ9MpNyhEwto+/2g9w/qNiVNSG/PHLbRcLRPqDhENtrWTKa5Xnz
 +3adXQPQD3DvK8XHXIWmSkIj3/rg/wqj77digwbKgTlnNKXRtbORkUih2kgWIo9QfPzdMDKlW7k
 LR3pzfzaboxasdoSrDCHyq4eRQQaGPjz2MRKtmPQlhkaSjWUDuLYVufuP+1nrR3/c9JtkVN24P4
 I1yNPdIrv8pkRvWBBMwCdbwqICrZqTgFS7XXwbXoxuBgv6tKrzQzV6xqAT1b9yGstGMFniYfEIp
 D+Jek/kgeH6S/dw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Feb 2025 09:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6416

It was clear why UNPACKDIR was introduced at first, and what is the
recommended way of setting S and UNPACKDIR for a clean separation of the
source code and WORKDIR. Add documentation for this in the reference
manual.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8f39d33be87c5db6688a807156540410..d970fc21f69fe35830a9d6b5a28da7cb257c0709 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10035,9 +10035,46 @@ system and gives an overview of their function and contents.
 
    :term:`UNPACKDIR`
       This variable, used by the :ref:`ref-classes-base` class,
-      specifies where fetches sources should be unpacked by the
+      specifies where fetched sources should be unpacked by the
       :ref:`ref-tasks-unpack` task.
 
+      Although the default value of this directory is
+      ``${WORKDIR}/sources-unpack``, the recommended way of setting
+      :term:`UNPACKDIR` and :term:`S` is::
+
+         S = "${WORKDIR}/sources"
+         UNPACKDIR = "${S}"
+
+      This allows the source code to be safely unpacked and patched in a
+      separate directory.
+
+      .. note::
+
+         In some cases, the :term:`UNPACKDIR` directory only holds the sources
+         temporarily. When the first directory after :term:`WORKDIR` in the
+         :term:`S` variable is matched in :term:`UNPACKDIR`, the directory
+         in :term:`UNPACKDIR` is moved to the :term:`WORKDIR` directory.
+
+         For example, let's represent the :term:`UNPACKDIR` directory
+         for the ``foobar`` recipe after extraction as follows::
+
+            ${WORKDIR}/sources-unpack/foobar-1.0.0/...
+
+         And the variable :term:`S` for this recipe defined as::
+
+            S = "${WORKDIR}/${BP}"
+
+         Where :term:`BP` expands to ``foobar-1.0.0``.
+
+         Since the first directory of :term:`S` after :term:`WORKDIR`
+         (``foobar-1.0.0``) matches the directory ``foobar-1.0.0`` under
+         ``sources-unpack``, the latter is moved to the :term:`WORKDIR`
+         directory. The final location of the source code will then be
+         ``${WORKDIR}/foobar-1.0.0``.
+
+         This behavior was added for compatibility for recipes that do not set
+         the :term:`UNPACKDIR` and :term:`S` variable in the recommended way.
+
    :term:`UPDATERCPN`
       For recipes inheriting the
       :ref:`ref-classes-update-rc.d` class, :term:`UPDATERCPN`

-- 
2.47.0


