Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83AEC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 08:59:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.42190.1744016374921441375
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Apr 2025 01:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kxuFvdNN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 097B94445B;
	Mon,  7 Apr 2025 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744016373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UUn3wKcVzzgZ/AZwcIAoEAtbMcgpVorOIP4HWz68gD4=;
	b=kxuFvdNNmvEECitTO1BBepTWpYU9zAL5/Kqnj5YUQ234RGgP4ASRTFoT2uJHfkQpjAeKLO
	+rsKhYRXTn0PRnA2wgclJSjB4smmf7VqbHyjCreY/ZsGEGhoXL3gsyWOd7S8TtgCD6E2Ca
	nxwSnE+Hycn+zhrdx5Gcziu+UGI+h/A8JnpkQvwmNXiS1vUdlCttPvtogOOBcILRD9Agn/
	JchDdH6TTV7NcmdHFFUm2in7+y7Tu4g1fnDNUNIv/kmfaXobcSncW73MRnofWB/ZIjFb4n
	eguxN7y4i4XYAvbAF1P1ySlGNFXEYMKrCFRfyXRZHQdTC3pn9PTlfpagMYLUJA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 07 Apr 2025 10:59:20 +0200
Subject: [PATCH] migration-guides/{migration,release-note}-5.2: update for
 5.2 release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-b4-releases-notes-5-2-v1-1-76789ffce2f6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOeT82cC/x2MQQqAMAzAviI9W6jdRPAr4mFq1YJMWUUE8e8OL
 4EckgdMkopBWzyQ5FLTPWapygLGNcRFUKfswMQ1eWpw8Jhkk2BiGPczs0bG2TVMY5i8I4bcHkl
 mvf9v17/vByHlospnAAAA
X-Change-ID: 20250407-b4-releases-notes-5-2-f3720cad4302
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3363;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FRCRo4sn/i1KtP9eFNCY2H+CgOlqaFD3DUuQWuM7acc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn85PzUC+LWFZ1YVR/u9Q413YrQOLWgd1p5z/NQ
 kMku64wDvCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ/OT8wAKCRDRgEFAKaOo
 NoN8D/0aHSxS39SqeNuhYh6pfJvHLV+8K9IS3TG7WMlWzsCDYiv1y9gZtEGYP/cyguQyb+ZLTR8
 aRoq/zGoyEIrPzvqqGM07dyGpBUkk6+hBFlDZN4igxr/i0y321ZaUYHc5bMDANR9TpUQZTsRO+R
 WrDnok0WaexpverzwI67Er0mBEvFpEbrPm5SzbY2VOCIskgpVyPp0VO8XccVDx0xrOdvrGcT38O
 9wqzUkGW9ukggjCa4f5yvK4asv+y3+4GJHoiEmFQPZ6/4DvKISLQ0S917QoP01Xcx5EYVzmjrga
 IH80fCRqNR5n9ceoMKiFkQx6D/g+jIXjC9Qw0vBL1amOGv7xVvBtGd0HErvBI9vTmFnCvFfBP4K
 L50VxnOBJwm6PpeUxwjMeGRlokRZSAN4WoVH/E4HjftlOwjV9eQ9c8g1GBEQiqKVF0MFqWZacxK
 arXXlWR7106ghEKM/LlXy/msGB718cVG9ec/oLZ91OFnjo1l7MVtEB3E71ammHmdNMulWlk3E3w
 SOBoKmyjQmX/5NY8iAEYIoyfLgduARtGkZcldlSPAbgs7puyUvXg2R94p9STwg7AyU/prEj32Q6
 ZDVbV/qG1p4TypQIGSMjOKq1mfLzy/f3XhAfTy9nM2KiHP89ROulYZVN9kWWt/EGM25OUpVcYmb
 bqooCdUSTQMpJMQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleeljeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfeejkedvgeehtdehffevieejiefggfelffehleejjeeugfdugeettddufeekkeenucffohhmrghinhepshhomhgvrdhhohhsthenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmr
 ghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Apr 2025 08:59:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6715

Document changes between 1c3020f17370 ("expat: Upgrade 2.7.0 -> 2.7.1")
up to e894acce6ede ("build-appliance-image: Update to master head
revision") in Poky:

- Add a note on the devtool upgrade-status change.
- Be more precise about the usage of multiple repositories in SRC_URI,
  mention that it makes sense for bare clones only.

As the walnascar branch has now frozen and is up for QA, these should be
the one of the last changes to these documents.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst     | 16 +++++++++-------
 documentation/migration-guides/release-notes-5.2.rst |  4 ++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 4dd8cd20f..6b7d02d65 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -186,18 +186,20 @@ The support for having multiple Git revisions per URL in :term:`SRC_URI` was
 removed from BitBake, which means the following syntax is not supported
 anymore::
 
-   SRC_URI = "git://some.host/somepath;branch=branchX,branchY;name=nameX,nameY"
+   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX,branchY;name=nameX,nameY"
    SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
    SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
 
-This was rarely used in the core repositories, and this removal simplifies the
-code logic in several places.
+This was rarely used in the core repositories because it would only ever make
+sense for bare clones (the ``bareclone=1`` :term:`SRC_URI` option) where recipes
+take care of the Git checkout. This removal simplifies the code logic in several
+places.
 
-If one of your recipes is still using this mechanism, you can split the
-code source fetching into two separate entries::
+If one of your recipes is using this mechanism, you can split the code source
+fetching into two separate entries::
 
-   SRC_URI = "git://some.host/somepath;branch=branchX;name=nameX \
-              git://some.host/somepath;branch=branchY;name=nameY"
+   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX;name=nameX \
+              git://some.host/somepath;bareclone=1;branch=branchY;name=nameY"
    SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
    SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 2ad441449..ac9c6319a 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -447,6 +447,10 @@ New Features / Enhancements in |yocto-ver|
       with a matching hash and path, it will be linked, otherwise a new File
       element will be created.
 
+   -  The output of :ref:`devtool upgrade-status
+      <ref-manual/devtool-reference:Checking on the Upgrade Status of a Recipe>`
+      is now sorted by recipe name.
+
 -  Patchtest-related changes:
 
    -  Refactor pattern definitions in a ``patterns`` module.

---
base-commit: 3b50193fa0c9acf4a601aeae6e1c78d0e4a05aef
change-id: 20250407-b4-releases-notes-5-2-f3720cad4302

Best regards,
--
Antonin Godard <antonin.godard@bootlin.com>


