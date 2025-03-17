Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F34EC35FFF
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.47915.1742202393687741918
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cyfQ4gLn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4004843291;
	Mon, 17 Mar 2025 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nyF8LqzUQp0SwMnhtCwn7QHHGPigN3+ymCY1jCqMfE=;
	b=cyfQ4gLnIJfXD7r/T3PUaD3nwEwZnvN1e/0EpWxRnPcgg3eMItatTs/ANP0fjlhVDBajOx
	Snuiva2L9ZAOvgwKfNtFsSqy4TNDOcFK+aZp7ps74Q4P92PVcxipkllpExWoQxq6Jn8rof
	zJkeaUd5KBEiwSTMbdb7Dz8CoRUNz4wItD+LuPUv/RvWE3tyRfUkPHgv9kM8Uf0vbmQU6z
	HsPBOrFyx2grYgZAb31i36g9D/4SswVMdWr18Nvhqm+iFZ4rHrfhm5PQvMAafOderv/WhH
	p4fUGVj2eN9wmCwnlWwVqvAn4LCyJfxWYQrZ4jhYrwheBbsGEe6TElN99XO6NQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:10 +0100
Subject: [PATCH 04/11] ref-manual/variables.rst: document the MOUNT_GROUP
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-4-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ksd8JRUm5jm1sOBr3DgrPbdV56LEIQE0sDlr5EELB1k=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YWSwj1hUJhJ8nOvj8c7EaYaaCO53fWTeaN+
 IsiTWe4rcuJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFgAKCRDRgEFAKaOo
 NqZGEADNvI5uXfn+JAiRfbc06XEqI2iaOlmdJwE3GLrIoecJOntkxRJoQoEBxTabGqUBdz9zWjt
 jyl6u1YA55Wjo8TWgaDuyf4dBuZXBbBfYnUYoQLjjNaeylRr5l8MVJeQ9cMxaNcAwoKckL/yZYZ
 suNjKRYsEZfaZpIizUO+phMMBnbrbk16ppj1aotN+8WPfUGS+leb9zpLANGxo06w7d0Rpw7RuNF
 cPA4iri9/zmeBh2yuYajoehgpZbu6tb5dZ1003RlBqXKxIkV3E/luQ4ItiHOhr2IUyxCdnAjWSs
 h0qxuSPzzICK81PEMCuHJk04eDd/L2e4Lvav1Fur9H+iHBN3pWADJharGlKbhKGVwBucd+iHm1b
 7ADG/EJxs0jmnRzXtUTgng6SIbub07D+cQcygBz5TLgLWoizmaoLRSe/GzaogMRkHPqFdrFY9Fo
 hIX9dkoYydofNS5tbrEjRHesYuROrgr8Ws5tQRJOPKtxDfrH6TZvGpk0skgqI91KRIHfs/ti5bm
 6r6W5eH/RrCEMr3zh+tns03Se2/Zh3qkG1jeMgpPRl8uNb0/0YlrODT+s1RojKAHR5bpTKITn+Q
 L/Pr2IibNBG98Vf5Nhpxk/Hc1CAC9DQxDTL+fSNIR5UV6jBEd773bYXw95VnHN5MQoOAVuoMFPZ
 56L1QskPSwOA8TA==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6565

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 60cc8e9af..21c196488 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5717,6 +5717,11 @@ system and gives an overview of their function and contents.
       specifies the base directory for auto-mounting filesystems. The
       default value is "/run/media".
 
+   :term:`MOUNT_GROUP`
+      On non-systemd systems (where ``udev-extraconf`` is being used),
+      specifies the mount group for auto-mounting filesystems. The
+      default value is "disk".
+
    :term:`MULTIMACH_TARGET_SYS`
       Uniquely identifies the type of the target system for which packages
       are being built. This variable allows output for different types of

-- 
2.47.0


