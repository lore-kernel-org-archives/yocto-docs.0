Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D069CF11D8
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:10:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.41658.1728562258524910648
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jrsam0P9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0665AFF809;
	Thu, 10 Oct 2024 12:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVKTekHE93hOB8Wqt1xb1WlVvfbwl/x1DveF1yGM7jc=;
	b=Jrsam0P9rrhZ52t79xjstjdrnVo7jEleUkbMfWdToNhzYQhM0welHfTwz/SZOkjEPoYBuL
	w6zF6zwLUYTbEFWocPboGmx9fFxCmzfogzTkGCzIj8Pr64VcqfWdQxh971n4/cSnwDNA43
	QNv+G4r4SxaHlWM09523viHWQhCdp/13bxxL5r+6neVjGe/mJ7xxvwLKplVU1Nt9wPTBRb
	RnntW9OnR/eCMon277bmiLysFwvtqeeKz8mQeztCvJgDHkHQUEerCjG8t48fBd9FIDCMn9
	qhgO3Yy0u6yc1dLnOAtCfirKBCGurG065u+lBUOMSGTiR6LkGKKXMVBLUa+B6w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:29 +0200
Subject: [PATCH v3 04/16] ref-manual: add missing nospdx class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-4-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=792;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Rlm3IE48hEsW+EzB9a615bLjqQCCc/oQamIjDx4W9I0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8RNTAnq8OWzHIDhmrdNCmhIXUBz88suFnj8B
 c/x1lwI/z2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETQAKCRDRgEFAKaOo
 Nv7ID/9Ujv2/qYzzSA633ZOLr96i/pOMq6bu0APVu3B2FD1UIVSXNal5sCNfQSDvDo15d5T80DG
 cJDr0ecRRabtEblMbt9s4njv5vZ8f+ijsD3qIQGNuHn9SND5TXk97PabOC2NavQJBpav4vjxrD0
 4lO+NvcQVmmrfl2NEGWb4C1EcD35c+Qe3owHqjrlowMQ8ehRmW60R7SyiHcmdzXYNHw8cYKsPeq
 4YznANlNWIJndq3OuA/jecJCcDivYS32hD7L/tAB7L88oAsVdHOZpWNvZt84w1HM20ELAI7P7Ia
 Hoz6HQ8gt3Yp7e+pl6nSJQn8qzSfWQfqsriPd4DXAReqzHdFnBHRQ+1RuNRgCmtfVzi1IP08k4c
 O31T1quKEWoGp0ahPeHAUWQv1iobVliH6kmbzt+ztYlo3Sj/0AbjspydlnAX++rJDS5KeMqlAtB
 WPVt/iHJ87RtExFFrlriRFJQA1BOGruQNMKyGoyRb/0HPa9fND8NIm57WEH7S82FFseQ48AWX54
 FWEz6FDG5Hh84V+a5L3ITIooLYHsL4Gwz9YhWWS0UNv9DEBp5xmMaWc/2ZbNwL8kmHpbUZuJuE5
 M7CYvBbEH4wTi1PFfBrYzK89oXSvRl4KcWQ9/6SSfPZMlT5HShT8/aHSeN4BD0XZAtdv5UGukWv
 zXY1oFh4PNoMX+A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5457

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9f6e42725..14aa0f3a3 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2049,6 +2049,14 @@ and the target. All common parts of the recipe are automatically shared.
 Disables packaging tasks for those recipes and classes where packaging
 is not needed.
 
+.. _ref-classes-nospdx:
+
+``nospdx``
+==========
+
+The :ref:`ref-classes-nospdx` allows a recipe to opt out of SPDX
+generation provided by :ref:`ref-classes-create-spdx`.
+
 .. _ref-classes-npm:
 
 ``npm``

-- 
2.46.0


