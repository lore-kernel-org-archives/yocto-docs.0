Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BE8C87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.3373.1753783014986235350
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GsrEyZ6L;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 450C243185;
	Tue, 29 Jul 2025 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8RUsgCsIEi6kAeFZHsoEYPY1ZxFOKeXS3YczNb1Tq8=;
	b=GsrEyZ6L7YerlNP8/iJ7gNPh5Cw3/PyGYV4R5ViVxfdODfKZZL1g1KJmy8mc/5z1Y0YGJl
	XnA+Q8qaYCkcVLgAPzhb3dbFgxLKhVzs3CqsCbIHzX5KKVTQwpsVxlUB9TErjFvclAg6Uq
	3D08OxbHpebtGgTZ+640oZaWbqA+NySTbNgnCeD4RTl/GjsLL2tmixoqdt8T04peUe0CjX
	BALvmKb7gl5IdGdWcACelNF3PRGyedaNyY4uKLo1bYDxt40kMJRuRT86dt5Ls9qya493ln
	QULYcj30HUudZjk8Ygz138hTG/PpU2ALR7bbAvib8/9b0OfygcrxMpUFAjo3Vw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 11:56:48 +0200
Subject: [PATCH 14/19] ref-manual/classes.rst: document the testexport
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-release-note-5-3-first-bunch-v1-14-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sDRpPomjT/YxZGoGL19nLNdGCIU3eNOUOvhHqR/xSJ0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrfAPeDhzi1zn2xWY4dbskPoiefGCLOzcldJ
 pdhOFyPHvyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3wAKCRDRgEFAKaOo
 Nk2xD/wIZl/tMsjra9ra92yhPZaUEZbuR1OsgwX/hxRK+u844UsCZeZDydGBJ+qwFY8Bn8XCH2z
 259eAATOiKzU+TFWbHfqNZpH4WKQmaXbFb5uPuSFARe0zX3o1hv87Bl6K4+Yv5FSwNr+H5ErGnu
 KxIEpRfsAnRWQxSifULyu7FLDSzXHGmnoe7VarvqBUAtac2aqxKhfaC0EwVBbAYi7uxLXNLSzA3
 /MwNQdtsaJI8Yt9nTlk137iDYhnleALhXhFS6V/GNm5nVuEXu8wY2DgZ2SM+K2Gz19o/RKu8G5P
 pdzg9YTOhwKjaguqgHrCf6JuekLGyFz35QjbcIbHAvYb/NTHgAJ5Ic1iq6sEAjJnJJim58nqQ2Q
 D/GLxjgCTsOZtjiVGK7zOgCExN6HBGHIgyWB/jH+lOw6PLfTw/A0JVDphe/8rp1XakWVjKWbEeH
 po4/QRXIDw7fIoRhMHqFySE9n+FsQKFb6a93j58ZWDxMFZdNsmaNKbi/1w4TzHVxvb0q0JvFQsu
 EMmkZ2/stqtkDcBDbGak6HrM+7Ff1ftPExhY//usVKhebEwJP7Q1zOGsbwfvNSARUJz9pv3c6Gb
 6+sAvzNBqlloU6RBFzhOCLqvxrTACX/KTe7lVST6qufIq/C8hI+A/QZrtjEIRnG7+Ih0kkE9KWu
 bKh7Zp9LWItQHpQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheetgfehkeehfeelgeeguddvgeegteduledtveelteefvdevtdefleetleffleetnecuffhomhgrihhnpehruhhnvgigphhorhhtvggurdhphienucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7412

This class has been in OE-Core for a while but never documented in the
reference manual. Add some description for it and link to the existing
documentation on it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 586930f66..d12b1c56b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2968,6 +2968,22 @@ class assuming :term:`PATCHRESOLVE` is set to "user", the
 :ref:`ref-classes-cml1` class, and the :ref:`ref-classes-devshell` class all
 use the :ref:`ref-classes-terminal` class.
 
+.. _ref-classes-testexport:
+
+``testexport``
+==============
+
+Based on the :ref:`ref-classes-testimage` class, the
+:ref:`ref-classes-testexport` class can be used to export the test environment
+outside of the :term:`OpenEmbedded Build System`. This will generate the
+directory structure to execute the runtime tests using the
+:oe_git:`runexported.py </openembedded-core/tree/meta/lib/oeqa/runexported.py>`
+Python script.
+
+For more details on how to use :ref:`ref-classes-testexport`, see
+the :ref:`test-manual/runtime-testing:Exporting Tests` section in the Yocto
+Project Test Environment Manual.
+
 .. _ref-classes-testimage:
 
 ``testimage``

-- 
2.50.1


