Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4648C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:07:57 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.45788.1743066476464209099
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 02:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aPuwatEY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04E54432FC;
	Thu, 27 Mar 2025 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743066475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcDCj0dNutkMe9R5K6+qXEXmHwHtRBZ1hSCly/CrcGc=;
	b=aPuwatEYz1BzG/NIFnO22rb5a/h/WBwpK+F/eoYDesvQBd87jB4Dq8tTIlM1pIc6QgpgGG
	4rttrozQ6gY93SEr4iE45N3TiX19QPAe1YhY1oVZxWacc6CqOAKQVzuwC4640Hz1pzPSrM
	5OGOwG+ufuvQNPmltvpCUciDTTekEoGk4JsZvFEJ6yKEDDrpI5LZMqZW+gZrjpv+3qZlY2
	tnytSP2y9AUUJiauokDwzA7rTFww0uxLZRcQVhqLCXfM1hAYr1zGRVEp6kM/I3YvwhZKdV
	oIW/b9ruMRS5Z6r8sBD+uC+hcdwVgjHGOgArfO/YMXvTFgU8HsFwiDpCZV2NIg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Mar 2025 10:07:27 +0100
Subject: [PATCH v3 2/6] ref-manual/variables.rst: add manpage links for
 toolchain variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-cc-vars-v3-2-742dbddce008@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
In-Reply-To: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DvfYFoHEeCDbSbKID4tQ9LcGYrA8VujN+WmEu1lnHvk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5RVp9F7D566lPEWMOMWE0r4PnpTWs/8tNd1uc
 h0qQNno1reJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+UVaQAKCRDRgEFAKaOo
 NtqPEACb6bOjP1dEL89GbB105nt55jBvlIw1/pi6qVvX06zF5zEPsdJ6zkAKpG+o5td6Agnq/O1
 L4OgjWUxdHVfPggEPXGWbBDHn3Rve687DMjn4FNZRnVg4nTsEPIZtZzoO75fYqcK42cxpZoz0Mf
 RKrl9/rnu7i3Ft4ljq5YcD8I15PXm1zpimNjE2UrEI7yqwCcJ1anK7HmaAwgkiccMDErw+cHhQX
 eDL+PT1gFKrsojwx6+1m32lCJMgXxCM0vrJaHJwUtkAmyFqTbR68QrE+/bCcONudmwBSfmmrRf3
 AZ09vv7EsdkY8110/CHLYZdnj3UrUJE4XVG1VLhewAHApA6+2EMw3gtnj63ltzfAAv6W10Tb0IE
 O5Dmp11mfyF+/XuDjRkhgIktOFRHY8wvh4zXX/S6aR7eWlzG8wDNOKjd2ZGNI8JiELeG5WuAfG2
 z0CI5k6gen98RqNGj6vNdIZWtj+yS1YDl7gsiOUwML7pXOb9CkFuBIxdZmFmOG9qGa2vNdUXuyK
 PEtwpjqDOPxqFAFFlPiHYF2AZqcNDUvxyeSi5DX0HiiQf96vljsJgq3vMPruUqCY2Bx8sEr9DpR
 u3e4RCArSz3RgfDPSeRUAHOLwS8JCYNY4+VLpzXGq08quh/3Yk/U8EJtPpwWJ0xe6sewkiCP27R
 2BaZ892hn6AWVTA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieektddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Mar 2025 09:07:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6646

Use the :manpage: role to provide links to common toolchain utilities.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4e675b6bf..d98721818 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -143,7 +143,7 @@ system and gives an overview of their function and contents.
       information on how this variable is used.
 
    :term:`AR`
-      The minimal command and arguments used to run ``ar``.
+      The minimal command and arguments used to run :manpage:`ar <ar(1)>`.
 
    :term:`ARCHIVER_MODE`
       When used with the :ref:`ref-classes-archiver` class,
@@ -165,7 +165,8 @@ system and gives an overview of their function and contents.
       ``meta/classes/archiver.bbclass`` file in the :term:`Source Directory`.
 
    :term:`AS`
-      Minimal command and arguments needed to run the assembler.
+      Minimal command and arguments needed to run the :manpage:`assembler
+      <as(1)>`.
 
    :term:`ASSUME_PROVIDED`
       Lists recipe names (:term:`PN` values) BitBake does not
@@ -5165,7 +5166,8 @@ system and gives an overview of their function and contents.
       ``LAYERVERSION_mylayer``).
 
    :term:`LD`
-      The minimal command and arguments used to run the linker.
+      The minimal command and arguments used to run the :manpage:`linker
+      <ld(1)>`.
 
    :term:`LDFLAGS`
       Specifies the flags to pass to the linker. This variable is exported
@@ -5771,7 +5773,7 @@ system and gives an overview of their function and contents.
       variable is set.
 
    :term:`NM`
-      The minimal command and arguments to run ``nm``.
+      The minimal command and arguments to run :manpage:`nm <nm(1)>`.
 
    :term:`NO_GENERIC_LICENSE`
       Avoids QA errors when you use a non-common, non-CLOSED license in a
@@ -5860,10 +5862,10 @@ system and gives an overview of their function and contents.
           NVDCVE_API_KEY = "fe753&7a2-1427-347d-23ff-b2e2b7ca5f3"
 
    :term:`OBJCOPY`
-      The minimal command and arguments to run ``objcopy``.
+      The minimal command and arguments to run :manpage:`objcopy <objcopy(1)>`.
 
    :term:`OBJDUMP`
-      The minimal command and arguments to run ``objdump``.
+      The minimal command and arguments to run :manpage:`objdump <objdump(1)>`.
 
    :term:`OE_BINCONFIG_EXTRA_MANGLE`
       When inheriting the :ref:`ref-classes-binconfig` class,
@@ -7174,7 +7176,7 @@ system and gives an overview of their function and contents.
          QA_EMPTY_DIRS_RECOMMENDATION:/dev = "but all devices must be created at runtime"
 
    :term:`RANLIB`
-      The minimal command and arguments to run ``ranlib``.
+      The minimal command and arguments to run :manpage:`ranlib <ranlib(1)>`.
 
    :term:`RCONFLICTS`
       The list of packages that conflict with packages. Note that packages
@@ -8914,8 +8916,8 @@ system and gives an overview of their function and contents.
       places stamps. The default directory is ``${TMPDIR}/stamps``.
 
    :term:`STRIP`
-      The minimal command and arguments to run ``strip``, which is used to
-      strip symbols.
+      The minimal command and arguments to run :manpage:`strip <strip(1)>`,
+      which is used to strip symbols.
 
    :term:`SUMMARY`
       The short (72 characters or less) summary of the binary package for

-- 
2.47.0


