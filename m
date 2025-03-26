Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8B5C3600C
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:21:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.22292.1742995308282294687
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JD4UjUIK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B312B443A1;
	Wed, 26 Mar 2025 13:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742995306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyGdM6qZn6gQJbInVdjoLmKXQ7RHZ+HlH9KFtfydELE=;
	b=JD4UjUIK2DkFUF5iwba5q+IesiAouM4d8dZfot5Kt5XE9Jop7yxPwCqn4ttZib9aCxvy8K
	DhXVYG/xILtnNe8blJgP/6sKYHcueSOMiOwIeNWypmzFT85XVOqsPfOKsKHqRiPDx4+6rc
	kos7WD06fEckaZSH6ScDiVHHHKNoFP0xDUSFs5opL/Lz7XH7Fxlt/rSbRXkx9+HlYCXOgs
	ugxZ6UUFnnmucXTdKqXYo2EgDfD2xITrMclx32TTsXx22qM6xJixIrh2HDjTxi8hHIVqAc
	zHnltR1aJpabKfvZenJf+rJ0oWP5KMOFFIKfc7HT47d7F3UCLlD1fJ4Rl69ynA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 26 Mar 2025 14:21:38 +0100
Subject: [PATCH v2 2/6] ref-manual/variables.rst: add manpage links for
 toolchain variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-cc-vars-v2-2-36b80c64c4a9@bootlin.com>
References: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
In-Reply-To: <20250326-cc-vars-v2-0-36b80c64c4a9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3525;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/SOAnkBBzSRLjr2cDfp6WCzPbx0bsOlaW9OXtQoAZdc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4/9p5NHtU/hQ4Z4P+fxnsC1BeaTTVcncWspzD
 eV4lnZGVUiJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+P/aQAKCRDRgEFAKaOo
 NuiIEACJGvFvfPl43fZX790TN++gTfrtrioM9sXfC/xTPhv2p/WcX9JSTtiH9p7Au/A2dUZK3GK
 K2+16aweFLI7PvmOnEunHhSq7SeY4ushS5FVRCSWih/d7pugzBHGMaivlAr9iUEtUVG2Di7cZmy
 11TLej7uiAdrSnOP946S+nEbVwHfHSD8a0kkABR3eJN2MYjPbqrypoTe2COPD1rGKKx1Mcv40g3
 md7OkijSAgJTIHpw7HkpQv9K5rF2CHk3EOZxScGZpv0tgxGW4lvc7uouXDw0FAErTojsY6Tgj9/
 dXVrw9Fc8/4ITnJjDWbYuYpucwHdvL/3N6k5L8MKAhZddaOquosLiBN/iZ7stjQUU9K5ZZwXuv3
 F+JiTOFAlQILU3EpJDovWNgYDeUHjsblNQrDz4pGV+hSCIwEBXx/r7uMnyELTufRfcJG0ApIu/C
 rqs8HN6toNdIo8UmII9b9UYFYIzmvp5uohGUS8F7PSB6e5fiSzR+fje+/06Ck9j8ihcSAfH1VCJ
 WmrHXMEtBA8hHi3prmi0GKgDh2/bOONnKjwPMt28wI7vd9v3d9EluaVo5wQRH+iDqGFxXOKvyvk
 JjSUDxp/H3r72w4TV1BO2IO0L/mmgtLhla+VEUIG5R0RgxA3D8kg/6iQciqhnPfz3XjJgMs3rik
 6lJJK8maO7E7npw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhpr
 hhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6636

Use the :manpage: role to provide links to common toolchain utilities.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2b31bc7b0..ccb4e0de2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -143,7 +143,7 @@ system and gives an overview of their function and contents.
       information on how this variable is used.
 
    :term:`AR`
-      The minimal command and arguments used to run ``ar``.
+      The minimal command and arguments used to run :manpage:`ar`.
 
    :term:`ARCHIVER_MODE`
       When used with the :ref:`ref-classes-archiver` class,
@@ -165,7 +165,7 @@ system and gives an overview of their function and contents.
       ``meta/classes/archiver.bbclass`` file in the :term:`Source Directory`.
 
    :term:`AS`
-      Minimal command and arguments needed to run the assembler.
+      Minimal command and arguments needed to run the :manpage:`assembler <as>`.
 
    :term:`ASSUME_PROVIDED`
       Lists recipe names (:term:`PN` values) BitBake does not
@@ -5164,7 +5164,7 @@ system and gives an overview of their function and contents.
       ``LAYERVERSION_mylayer``).
 
    :term:`LD`
-      The minimal command and arguments used to run the linker.
+      The minimal command and arguments used to run the :manpage:`linker <ld>`.
 
    :term:`LDFLAGS`
       Specifies the flags to pass to the linker. This variable is exported
@@ -5770,7 +5770,7 @@ system and gives an overview of their function and contents.
       variable is set.
 
    :term:`NM`
-      The minimal command and arguments to run ``nm``.
+      The minimal command and arguments to run :manpage:`nm`.
 
    :term:`NO_GENERIC_LICENSE`
       Avoids QA errors when you use a non-common, non-CLOSED license in a
@@ -5859,10 +5859,10 @@ system and gives an overview of their function and contents.
           NVDCVE_API_KEY = "fe753&7a2-1427-347d-23ff-b2e2b7ca5f3"
 
    :term:`OBJCOPY`
-      The minimal command and arguments to run ``objcopy``.
+      The minimal command and arguments to run :manpage:`objcopy`.
 
    :term:`OBJDUMP`
-      The minimal command and arguments to run ``objdump``.
+      The minimal command and arguments to run :manpage:`objdump`.
 
    :term:`OE_BINCONFIG_EXTRA_MANGLE`
       When inheriting the :ref:`ref-classes-binconfig` class,
@@ -7173,7 +7173,7 @@ system and gives an overview of their function and contents.
          QA_EMPTY_DIRS_RECOMMENDATION:/dev = "but all devices must be created at runtime"
 
    :term:`RANLIB`
-      The minimal command and arguments to run ``ranlib``.
+      The minimal command and arguments to run :manpage:`ranlib`.
 
    :term:`RCONFLICTS`
       The list of packages that conflict with packages. Note that packages
@@ -8913,8 +8913,8 @@ system and gives an overview of their function and contents.
       places stamps. The default directory is ``${TMPDIR}/stamps``.
 
    :term:`STRIP`
-      The minimal command and arguments to run ``strip``, which is used to
-      strip symbols.
+      The minimal command and arguments to run :manpage:`strip`, which is used
+      to strip symbols.
 
    :term:`SUMMARY`
       The short (72 characters or less) summary of the binary package for

-- 
2.47.0


