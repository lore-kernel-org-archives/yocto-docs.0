Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF2DC0219B
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:29:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.73796.1738945738309247752
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 08:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WD5tMQzS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4E0F44339;
	Fri,  7 Feb 2025 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738945737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvMVaWTl+ElqUpjf+YiZfefmM1ZbbGqad6OV3Zlrpqo=;
	b=WD5tMQzSeVynTDLfqz+NODvBg2fU2jNWwt//a3QEtBcihGa2Ecmo+MM6SmpYRUsPWjV24a
	sZnhvNqEbHMdZG2kodZAnX7/h/e4ed0WbIsSz2wiNX5ei9l2vNdF9ugZZ/V2XBqYVB+0ZS
	s72rG3eC738dtEhiqpHrnhRRwiZRmxQ5WjY50F20U2O3JHVuLEoXhGPcTJmCGb5+LIw1Te
	RBmdn+YfVgpaPGqIRxJQjPTHDQlbvWa89NfUJjvg+o9KSH3tRCxUbU+15rbyG3fDEkM29G
	UM9k6Ysk9zKzvnv0eJlLFzR2+ZiAAA8UocFb9pAJFaa0WCaN/rjgSjibk6yDDw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 07 Feb 2025 17:28:52 +0100
Subject: [PATCH 2/6] variables.rst: add a reference to BB_CURRENT_MC from
 bbdocs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-multiconfig-doc-v1-2-f63cdab1fad9@bootlin.com>
References: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
In-Reply-To: <20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RYSloyBLGtr9c/1aoXZmtiBHTMSYZkiSgPmJzS8NhD0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnpjTHZQkTJOLLxGCOYt4aJJPVAfBbf4GhGlKNb
 AKogJDrfeGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ6Y0xwAKCRDRgEFAKaOo
 NhdCEAC+Qt0PfnRuyJVXJKQtjW63Uz4aXnlXOG/+ZUP/hOtXR9sfwv3boFwu2ztcMsyFgW5mxuR
 lNVzTpjxWrj6agZBK8Pquh4lq47khJwZ5ZyoYFSq9ZHjaHtKAHEB7TSNjUieoSffBU0lC1fZKF8
 ei6vAZdwtx1SIlR/PXZszsyjTVifHMV4LyvjsE5i10rXbOUisEv3kIdDkNvQ3COrlztQxGgGh7e
 bibB9kEM0BJXE26Idt+9VQQTaV2OYfy2CTc0HkgY28pK732i143Mt+GlWD4fe8hVaoksHPzMy+w
 9sZMT+5N4qAUMy08Z9islt7h9G8081Qjj/w/J/SDVbWirlg5Xk8DAok0FXqHF1Cn3AQ7uRn1oyl
 gln8UywsNFc23/H99cvD7j07aV1R9w4WLngQRAA4YGey7zi7Wy1onL3eIJGk/bvyYQU1+Qjamu8
 OMxzyh4FAu3/3/MQ0ie33f+oCmstEwq7E5l+KvrLyu0Kfpkz8jxNRz6nYjw0ZncRTZxPqtsHXgH
 fB4yBAlroDN5e5pFpJ3rLBbbmxiVYcEQ+BKUaOo6p1X83OSjLyfAGelSfgYec6xDwJjBlsKUR0E
 cUXkm9hVZgqlL4NzghSvStqIKP945eRWsIxnPzZVFbmI27qT0KhA3NT7CxqMIJ1rP1ESb08GLnr
 2ZQZ3IRW8vgGkWw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 16:29:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6302

BB_CURRENT_MC is documented in the Bitbake user manual. Add a reference
to it here.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8..a402815b6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -390,6 +390,9 @@ system and gives an overview of their function and contents.
    :term:`BB_CURRENTTASK`
       See :term:`bitbake:BB_CURRENTTASK` in the BitBake manual.
 
+   :term:`BB_CURRENT_MC`
+      See :term:`bitbake:BB_CURRENT_MC` in the BitBake manual.
+
    :term:`BB_DEFAULT_TASK`
       See :term:`bitbake:BB_DEFAULT_TASK` in the BitBake manual.
 

-- 
2.47.0


