Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BDFC35FFC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.47914.1742202393415199153
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mfBECLjn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FB5143290;
	Mon, 17 Mar 2025 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742202392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8/Qz3x6JTZUFVPEr/JPI2Akl1HqeU49CK+aOJhHxuU=;
	b=mfBECLjnoAoHfZB4d5g9F/XZxIKBn2pA5duA+XcrEv+ygkYrnChCOpasGKWQG/AHkSSGRi
	MX3EV2TiqJOez1jrQpb5pOPwwDXCr76F6JcOYtmjTGZhiZrOP6Qh6xibl7fRCCeE7iD2s7
	VEr5wSTXpXFSs+Lsjaq+v2iV19ycay2NcjV7DQGSjKLRrsPl4ifIqbMEu4XntN66j0gVl6
	Tpvvzym98de85rCPecZ1bP5/KdcoUIiqa2QbB4bOM2H9EoLO59lgp/C/7z/u04N9L/CaNo
	aSXUbIYWzsodZzf4AfPZIU9+pYQD3FJ+FseUIssf5UH1Nw9WEjgPsx/IIOollQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 17 Mar 2025 10:06:09 +0100
Subject: [PATCH 03/11] ref-manual/variables.rst: document the
 WATCHDOG_RUNTIME_SEC variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-release-note-5-2-updates-v1-3-82b0a4182aff@bootlin.com>
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fGQfjaVjkAXdpOsQDBjD+T+Ngyc+yhhmG3ysQh94tq4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn1+YV8sMlR4CU6teWy6ywoix8jt3D1AWLn4mPg
 nnv+mgrTieJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9fmFQAKCRDRgEFAKaOo
 NgKGD/9kafx0Z165Dm05urMO6kYW6LDEAzJMyn6VEiAM9HwGLPAawgNvz1TbSKZ26j6cWMYQon0
 pU1HMa/c56mTgFOVjdvx6+yeP5Kl3wdVQaBxfIf6IK4jmoTcKo2A2clX7ePOEh5yjCbEywnTv0e
 YquB+rnn3rqPU+9qQ07jdqL9E4srYQXyGfYBVQXN32RIqDr0Y6aQSXefiu6JfEHd1Sz0acGMLM/
 R7L8YiWMHhBs5g+x0YjWZMs7e29PHGxGLGd9cYbyFhq0kajN5MCD6V0o/qU4yLbhvaTp0+mzSq3
 J7R/17x6Tnr0q225u75OlQhegi7Bl8ty+Fn7lSdiOkaTcnRG+MEjfhrx4QQVgBmfbZHqM7Pc9gE
 qxIuuaOOKJdLcjOWclN1eTbfAWis1C3ZIonQ9oOnCI3iMJ9Pn2+G2+740xqpGg597PxVpm829ed
 vkQ4qHOdgtpBDwvE5lwYhY8WubhOwRHU5gv+099ZqVwgeRvGGAeoDe7dl2ViuqXaQp3ySNAUVhn
 6tS/H2JyankmlHrxUU4NbwVC77RwTn9KOAXJ0l/l6xTsmYnYLHCX6Nh6rNAcSw+rrkiwzfkXHdj
 xdzRa3YFb7oFyFgvwIuZypiy8uTmHjAupc/CtXGBsRgJTWV024dsQCjl8S+fh4gboIS4hzeLCfh
 bbpsadls6Vc7F2g==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6564

This variable controls the RuntimeWatchdogSec option in
/etc/systemd/system.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d839c9702..60cc8e9af 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10453,6 +10453,11 @@ system and gives an overview of their function and contents.
       can control with this variable, see the
       ":ref:`ref-classes-insane`" section.
 
+   :term:`WATCHDOG_RUNTIME_SEC`
+      For the ``systemd`` recipe, this controls the value of the
+      ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``. The default
+      value is an empty string.
+
    :term:`WATCHDOG_TIMEOUT`
       Specifies the timeout in seconds used by the ``watchdog-config`` recipe
       and also by ``systemd`` during reboot. The default is 60 seconds.

-- 
2.47.0


