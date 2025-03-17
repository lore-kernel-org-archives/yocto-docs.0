Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C808C35FFA
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.47917.1742202394163545863
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eihaXPBx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B10F243297;
	Mon, 17 Mar 2025 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2TfSRkEo2IrvhFarmArpvZFjBGWWnKRkf5pyWZSnCtY=;
	b=eihaXPBxCGTpITypwOlsEwVAgG7T5jz5ML0MtMq13kHvG9efMGungfXWRErlf4MiFfsHuw
	MNyJzdMl3B2aGJ/iw/uen/zmceQe1GxCqq9UFm15aFoFbBoARNJ2e1hG/QRIS0xnPGE9T4
	0fqhKuIhdf0mRDf6OqeG/1l2uaqc3PrbMnrj91rKsh/P7EWsnubc0TYLG1VXytL4WGIsMl
	B0fIpX+oeWw5noh4yOjJPGnDkXZZ7pzl25panQKPL4mptQFloeiqky8bNsPSiQ1wv8dIAX
	hq+e+dIbyKDtg76uTCc5MlSsbX7oz4GrJ8TRN9euMs81q9LisW6IpSu367/Xfg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:12 +0100
Subject: [PATCH 06/11] ref-manual/variables.rst: document the
 MESON_INSTALL_TAGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-6-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=koDuZQrp8FHCvqWlJqXCqTfwKpQBEv8CDcBxrDicHHc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YWVdbNQvuAtJMig5xJRim+b/6ABMim7fq4w
 XiL3tNRsfmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFgAKCRDRgEFAKaOo
 NhcWD/4hxaVIFdudXTIcQnvQsRx+6E3JdnfAANLWqR7BOupsT8EJK2dtAR7WrL/rdMczeLBOt89
 0wTUX5bmiCrF8CzRL6vlpSx7RYVy8aZLKcaH8uh0ZDQjnOO2XHJZSHoggsxekV/AHZbnMzv8BD9
 DM5L78+wojwSH37bHpUZ1ANyzvxTNx6idUTA78WfFiDmorJjODe3Vq39bHB5BsZmUJStwHiRxvQ
 Ujwr/qrN9kItIiMGd8x1CLrpbHqJRFyOzJCZlymKtRgK+e2061GWKLUYzUVMRLXZ5K+kqQTFQZe
 W6pA98szxI/huHBYsto8oty6yKkudTaNBP4ZFiTfs2OBUQfVdB6gMnNYBNTbF7N3OjCWrQJQpI3
 9KhJgqQ/iw+WM//4fjtA0LaYHOplH8BE0AmTzNhrMiwyBKdtVmjCeD9899AQGcp+qR0Grip3NvA
 wlWj68gku+aF+2QQd3g6QmjCQWTSv01ugV+xr7D0YYiwI1Pl/VyOEE48fMT9lP0EThAen9CBb35
 1lmwNwY/fIciKziO7mKI4vbFuhFAtzy8SCNMfFoMdWVh2rfg6PyhRu1qiAWev3QUBCCT/JB+XeU
 keJZL7Qqdzk4gIvXhKqbIbtv5sQ7J1tNy+q/Qi/ieFE1DdhPeQv/y4yu1N0UPW0vNlnp0F2+c/b
 WoVrH2modbyUm2g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:06:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6567

This variable can be used to add install tags to the 'meson install'
command.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 21c196488..0aa3a9b11 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5579,6 +5579,10 @@ system and gives an overview of their function and contents.
       you to specify the inclusion of debugging symbols and the compiler
       optimizations (none, performance or size).
 
+   :term:`MESON_INSTALL_TAGS`
+      A variable for the :ref:`ref-classes-meson` class, allowing to specify
+      install tags (``--tags`` argument of the ``meson install`` command).
+
    :term:`MESON_TARGET`
       A variable for the :ref:`ref-classes-meson` class, allowing to choose
       a Meson target to build in :ref:`ref-tasks-compile`.  Otherwise, the

-- 
2.47.0


