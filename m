Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DB4C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:10:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.17731.1752657021969064233
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 02:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BtCHeDZw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 906BE41DF1;
	Wed, 16 Jul 2025 09:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752657020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=82QvgLERac0jyQOE64Pnr8XmOeGHx2DCp9bD5dggkSU=;
	b=BtCHeDZwGYWUOR8xPBwNwya1EGiL5Qy6VM76jz8X1ioca2IZ1MdsNlFtaOJKRacvpL6jnG
	bSukFPuNDZTBj7dC847WO7kQcQsuwFglatwdWVgF3crufNjIeoL52AmRzLCAXOv/NZFeqU
	PdU4Wmfy7swkwJ5DW/yVGb8oOkN8aaLmDl9bUgXc6BkjktzLEXsYZYlwQ747dJfXMxF6I5
	jlSxQ0EaJUCGs8ZlJ9fj1Tzrh6LAFksttW+P3kgAgAh59lc5MOimDPELfPjwy3Zb+exv6k
	tHdvs5rXJmqs8RqoMFOscjMbsVrvgTQ3TKRi79yyz8eJKMLMwDzVfZfk5lcJRA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 16 Jul 2025 11:10:07 +0200
Subject: [PATCH] dev-manual/start.rst: remove basic setup for hash
 equivalence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-remove-local-hashequiv-setup-v1-1-e2c80b0bfb24@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAG5sd2gC/x3MQQqDMBAF0KvIrB2IKVrpVYqLEL/NgDU2o0EQ7
 97g8m3eSYokUHpVJyVkUYlLQVNX5INbPmAZi8ka25pn03HCN2bwHL2bOTgN+O2SWbHtK3fe9r0
 ZvX1MjkqxJkxy3P17uK4/iMXdA24AAAA=
X-Change-ID: 20250716-remove-local-hashequiv-setup-6c2880dc23fa
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TzO+r9A0N6/UUDQSpH1GDOXqV5NhEMEypPDdOZaotaQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBod2x73+RHxXH7a80ieoVDvKYsbYyZgPW/W+MnV
 bUCBfUK/6qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaHdsewAKCRDRgEFAKaOo
 Nst9D/41gCuBMZ/cn6Zue/dzpnOHqzKUFBxVGYSo6/hgKDjA1i3brUm5TmEwI4EaBdUtXKDsHLY
 C+7/n8Cg3ozb7CnuWImBN8y6YLxzQPM7xniNmK/H3S/yl+W3rGYisWOjT+rwEXzLbqwMCadKPhn
 n+L1rxWzZgnq3xXsdwsAs+fdNV8oyrWH/TvuxtjxMY3ne0VcDosAhtrnEtowG2tuo5jzmKn8cej
 69gPQmrSVzC4/irhvWNmTTFp4nCKqWhs2pH8UGCSzaPrblL8OhYdwJez/QPwyg0+ubUR3r2Cw/G
 3EbbgztlPhreF3pg11i7hE9XO4PFadX7VR3+7t6lA6KC6WpyvFp4GBUkkiM7+KYFoV7ADBriFpR
 BmvnTKBYBvmecMrDwURtep5h/L4lEotI560lpLwHDesBOzUdAErSlCKnNV9IFI20cRmXUCbzcH6
 kCqUekBSGIAf5RbJ8GqdjGPp4ktc01v+6H6RxMfqUSa9LHrLsX/TXjsfXB6SRyk/ezQv3tNS1kF
 FuvZNgsCgLtUZ5QK/6tl6Gw0KmqZYwXX6jfAqlKSofJCa3APoVNaZlcpNQJPnaqVCuEDPNW1kBs
 5HW4A7+cYnAdmpqPEWwgTGPF9umlqQo4TEK932ZIIm9N0yGGihIkYho/a2KoJPM5JR7LxlRmprW
 MLhLX7Q6AdRuYFQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehjeefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdegteehlefgheegvddufeevheehveeijedvfeduvdefvdekueduuedvjeelteehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Jul 2025 09:10:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7342

Quoting Alexander Kanavin [1]:

> 1. BB_HASHSERVE and BB_SIGNATURE_HANDLER do not set up or start a
> server, they set up the hash equivalence client built into bitbake.
>
> 2. The above client configuration (used by poky) also starts a private
> server that is specific to a particular build directory. So hash equiv
> information would not be shared between multiple build directories,
> and this will cause sstate mismatches (as reported in the bug), if
> sstate is shared.

This setup does not shed light on the potential of the hash equivalence
feature. So for now, remove this basic setup, and later rework the
concepts (or create a new) document that explains how to set up a hash
equivalence server shared between builds.

[1]: https://lore.kernel.org/r/CANNYZj_kvLsZG3sgH+nPu9B=pqWBU785w0SGHGdQqB4UW-DtmA@mail.gmail.com

Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/start.rst | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index e10367752..f34f0a9a9 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -228,12 +228,7 @@ particular working environment and set of practices.
        used by developers in the same organization and share the same
        source directories on their machines.
 
-    -  Set up a local :ref:`overview-manual/concepts:Hash Equivalence` server
-       with :term:`BB_HASHSERVE` and :term:`BB_SIGNATURE_HANDLER`. A basic setup
-       would be::
-
-          BB_HASHSERVE = "auto"
-          BB_SIGNATURE_HANDLER = "OEEquivHash"
+    -  Set up a local :ref:`overview-manual/concepts :Hash Equivalence` server.
 
        See the :ref:`overview-manual/concepts:Hash Equivalence` section of the
        Yocto Project Overview and Concepts Manual for more details on the hash

---
base-commit: f9f1c87424d307d2df60024bc448bd6778605cf8
change-id: 20250716-remove-local-hashequiv-setup-6c2880dc23fa

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


