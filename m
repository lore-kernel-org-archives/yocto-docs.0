Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F25CC36010
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:05:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.54803.1743433497396184509
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 08:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XbIBeApf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF25544535;
	Mon, 31 Mar 2025 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743433496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MSN7aQqBuEhGbJRugU6ea3BWt68D3lmB3WdDmNNQB6A=;
	b=XbIBeApfM4aoZowQwzS+LQA7b/s8PtL0ipIi90ggTCyFEKi2Qkepw3lQQFxVm9NqvnhK4h
	3ZZEEiStOL4aANY+SFafanf0ihgUlBlcFPa+M+vuTXNIJg1EbAnxrrQ4A0aEBhMrJXnZHe
	4ch+RXaoKhe8jg9Lep5BSo5zgt2Ed+U4beN/7H4xd/lqfo0XgrmKpZt98uPoAgAWDOZscN
	UkEaQ3tIvJp5l/OPJrO0JWQ6+jYt12DL7YD5zURucX4h/Y7xrrSAgzMCvqHYPw7d4/vNQU
	8wrjH0Tzy0hpf+honnIi9llZCmSa+1dYa5QtPPbaMqDc/JbbQ2wuSIzPKqSV0w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 31 Mar 2025 17:04:46 +0200
Subject: [PATCH v4 2/6] ref-manual/variables.rst: add manpage links for
 toolchain variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-cc-vars-v4-2-2281f4c47652@bootlin.com>
References: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
In-Reply-To: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3671;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rgP9c16jT2aBYsuPpv1u7g3odTdEAqs9hKk/Pqvm3lo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn6q8WKGuIJ6KkBMdJi1WpQsJF0ZdBOaQ9O6iNr
 rjFmMg7gMmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+qvFgAKCRDRgEFAKaOo
 NpI4D/sFNCURFcckvSPAeMP1eb/QG/MILifto1Uy+WURm/pfq5nSmREezHZjjRLTM3v5qj+pB4t
 fWJg2zpIVCIvG966P6b7Pvg/zZOpLxTpcfLJ2o95IfsSVGS8YMpnAzbFh6MTWNdy13SBAOBH7e8
 ocXBljDOXgyIMAjiWyNYbnK9QD4Cr8Uy2Wqi+G0hCiH5flgiS+GEL5BQF6W3nAPeWreBIlYC9dc
 mK7AuoW3kbitMVEpDl1/QsJvs/clnTS4PKaeuEuFAEArAmfun9kHMizcX0npNSaaXaa/8lXm9Sq
 cIxtYWBdpUKG8Lc8YKo5RtrTVouNW3sQX6qiv/iyBMtmB6cIv+yKpYN3DjeHy6IWZlBhXnvJ3RC
 xdWiQfb453WeVBOsWeQV79tPSfzgjcdHuiAGfUWdTeSOpvtBEG99DIXUQsZ55MoRQY0rogASVpU
 UUxGn0Pg3ICtT5tsPU0wMBn2TMGTgwIOTjzw3hXvELClro+j0+uOasNgMMb5/Q46w1vXxkeAQyy
 QQ/mVYCRSGGfio65bqAoHmwHFDiBphdGKybclXeSgIPhwigKKPukiADcODEcGiKsWeSBFcJyCoV
 Jim8K8cSWo4phAr8k32lknTZm+pwPjpo7Adrx15EWzNtMMJ3TKIzGgPkSwc5e4IZLM/rGt2JC9N
 NMv5aVO6kCvksEg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhv
 ghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 15:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6688

Use the :manpage: role to provide links to common toolchain utilities.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8e612d061..8ff051327 100644
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
@@ -5189,7 +5190,8 @@ system and gives an overview of their function and contents.
       ``LAYERVERSION_mylayer``).
 
    :term:`LD`
-      The minimal command and arguments used to run the linker.
+      The minimal command and arguments used to run the :manpage:`linker
+      <ld(1)>`.
 
    :term:`LDFLAGS`
       Specifies the flags to pass to the linker. This variable is exported
@@ -5804,7 +5806,7 @@ system and gives an overview of their function and contents.
       variable is set.
 
    :term:`NM`
-      The minimal command and arguments to run ``nm``.
+      The minimal command and arguments to run :manpage:`nm <nm(1)>`.
 
    :term:`NO_GENERIC_LICENSE`
       Avoids QA errors when you use a non-common, non-CLOSED license in a
@@ -5905,10 +5907,10 @@ system and gives an overview of their function and contents.
           NVDCVE_API_KEY = "fe753&7a2-1427-347d-23ff-b2e2b7ca5f3"
 
    :term:`OBJCOPY`
-      The minimal command and arguments to run ``objcopy``.
+      The minimal command and arguments to run :manpage:`objcopy <objcopy(1)>`.
 
    :term:`OBJDUMP`
-      The minimal command and arguments to run ``objdump``.
+      The minimal command and arguments to run :manpage:`objdump <objdump(1)>`.
 
    :term:`OE_BINCONFIG_EXTRA_MANGLE`
       When inheriting the :ref:`ref-classes-binconfig` class,
@@ -7229,7 +7231,7 @@ system and gives an overview of their function and contents.
          QA_EMPTY_DIRS_RECOMMENDATION:/dev = "but all devices must be created at runtime"
 
    :term:`RANLIB`
-      The minimal command and arguments to run ``ranlib``.
+      The minimal command and arguments to run :manpage:`ranlib <ranlib(1)>`.
 
    :term:`RCONFLICTS`
       The list of packages that conflict with packages. Note that packages
@@ -8974,8 +8976,8 @@ system and gives an overview of their function and contents.
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


