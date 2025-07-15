Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E4DC83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:56:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.4651.1752573406925891326
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 02:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IaKwyG89;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB1CC43AED;
	Tue, 15 Jul 2025 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752573405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jUgdBx5lhyM+iX+RJEwjJ/Ducv/AXqDLpxivnIwL/hQ=;
	b=IaKwyG89u4eWDp1bUR0lz9gWeTAgXEOUbxKCI5bPjShpLN4P8H5q5UU/HLo15uczlUt9cw
	wWX4ypX/ZwsYNfJJQ1vVzxNskflpAX4jUVFRHyntbpcjMMC8cQMzajoDa7gqvd608YTNyX
	+fyuHBMZ6Qzl6aTecfYIJNQU2+D0HK6rQr8cMdH6sTwyubNAMjtJ85hu/z1E+nbizrKPfa
	jNn+QPFIUrDfm1IOud/QAdvg05SnDU8RVFtyKD00VF2vmakd4TtM1TmG7qQ8/8Izp8t+Ds
	H2+DvnCJRxgwSNKIZDPuXGlMHCec04gM4ynVP4Y7cnUETrshKZVbgI7E0dn0eA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Remove shared PERSISTENT_DIR mentions
Date: Tue, 15 Jul 2025 11:56:38 +0200
Message-Id: <20250715-fix-persistent-dir-v1-0-e3f31214b677@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYldmgC/x2MQQqAMAwEvyI5G7DFUvAr4qHUVXOpkogI4t8tH
 gdm5iGDCoyG5iHFJSZ7qeDahvKWygqWuTL5zocuusCL3HxATexEOXkWZUTkPi+9Ty5RDQ9Ftf7
 pOL3vB6c1P5pkAAAA
X-Change-ID: 20250715-fix-persistent-dir-e7ec4cf42a1a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xQgMzJkOczBGwu2zMB/askiG9mtNhFi9Y6rQH0TkzHc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBodiXbNyC45fgsH65fpPpfyrbUsj7dTTkoljfYL
 /YkK/yxE66JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaHYl2wAKCRDRgEFAKaOo
 NlDrD/9aMcENHyyHZk2F7bTk6XJ0N5ZOHBi0vzwApDm6PXu/1iUBuZsqe9BpPnofdxacAUOFkhx
 dkRBGvujoJaJbWRLAnhgWCWHmzpP0Cv8kLzk/t4h3MlRvjkXc9dWLFXnJsKfXHs4JCErK+01Zo+
 2qB9FgXHwBwZs4Ef93sKsy3adlOiKf7lkkKLK6azZt0Wkdc8IvZw+6CzKJXG5XQ8FWG/ZwW1ARV
 6x7M6wQn7F4h9YOBF71MYQnlkNUkjrWi1Q8kkQIDAiMsVXFLFRH7TRFeyACDxua6UXSVw58Aq/1
 kcRtRYJmDW7khj024C6tNzBuHWJ884d/bGaNOfJd9XFllxq0Iz011vGMEtvoxo3gXjhjq8DgT21
 gG9pXvj6d6F5nAZZQoMunJQziTW2Vw6a5Jjwt35//xcq4DZ63h1zypix7sFFhgptK46tt9GU8HP
 09c/UmceeJfxYlmv6vrmYx3mzpcAHAQaj+uCAqNQpJ5/r+9chqHnMYveb9d4vFVprnCUpuuBva6
 Yr0kXpMuGsUGE/4SmMlza9uWVJV0d2ay21gitKFUG3Se+CP1F9hXCDwfhcTy6zJPTM71O/jnx8B
 C0ihkFCJo/hwTBWCBdzdLdhfVk1OhVdcFYkiG/3hnSBVTnL0zmhQtPUj9TPMrZxm9wjRUKfk9J0
 em5cxuzcQwcCxGA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtkeegveffteetfffftdfgleeghfffgffggefhkeffudfhveefgfeggfegffdvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehmrghtthhhihgrshdrshgthhhifhhfvghrsegvfidrthhqqdhgrhhouhhprdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgto
 hhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Jul 2025 09:56:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7334

I wrongfully thought that PERSISTENT_DIR could be shared after reading
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15921. Remove the
mentions of this I previously added. In dev-manual/start, mention the
hash equivalence server setup instead.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual/structure.rst: remove shared PERSISTENT_DIR mentions
      dev-manual/start.rst: remove shared PERSISTENT_DIR mentions

 documentation/dev-manual/start.rst     | 14 ++++++++++----
 documentation/ref-manual/structure.rst | 11 -----------
 2 files changed, 10 insertions(+), 15 deletions(-)
---
base-commit: 576677eae6960dbc2d2ececeba0fde5bba7bb69f
change-id: 20250715-fix-persistent-dir-e7ec4cf42a1a

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


