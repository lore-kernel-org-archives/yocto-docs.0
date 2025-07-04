Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2974EC83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 08:01:56 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.7677.1751616109104059925
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Jul 2025 01:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GRT5ewVi;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9D4C442BE;
	Fri,  4 Jul 2025 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751616106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WlrB1AeHfUT56ePhqg12bPFG/xW1zN1+GX/iy6V3z6w=;
	b=GRT5ewViY+Bp8hlQZvvrWrz25UwPa5//DLWxuoME0OJDnCzqau/bZqmWYtnrn1vvugq5is
	WVDbv/N6c+w5CmxRFKnUV7iyo+TI6TfCMpp15oEwHnfK21OTer6aqWOOFbpIw7OBIozQgq
	f7ommm550I99uxn/IjV4SrU3EjK1Kt1x8eILEXb9cdQw/MDMo6T2iikxGRzKcnLesi7NXg
	TfLLD90TInFSiJPhLGx4NNB7DsGXpHx22cik980RoFRLpBop8fdxLOPIEiU6PO9DH3su2l
	ol0hoHPUNEJmplAJUxs+pvcCFF2+yenzQtNSaJH+0QGNBQwcoHgoyDfiytWfQw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/2] Add a document on limiting host resources
Date: Fri, 04 Jul 2025 10:01:37 +0200
Message-Id: <20250704-resource-limiting-v3-0-4feb5e673aa6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGGKZ2gC/23PTQ6CMBAF4KuQrq1ph2LRlfcwLviZwiRAtQWiI
 dzdAibGhOWbZL55MzGPjtCzSzQxhyN5sl0I8SFiRZ11FXIqQ2YgIBFKau7Q28EVyBtqqaeu4hI
 Mag2ZOQvFwt7DoaHXat7uIdfke+ve64lRLtNNO4Ha0UbJJTepSbDMy8yI+Jpb2zfUHQvbssUb4
 WdoIfcM4IKnoIXWhVIgyn9j3ko6fA7h3/7bdJ4/j5fcyA0BAAA=
X-Change-ID: 20250417-resource-limiting-12fe772af904
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5CuV9ozN2ZRoC0GzOmXYutnfz8RzZCunGSaPmrZ163E=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGhnimmj9BozUTiOk5MEsHP6vqMMdXMxSw8b1IMF41w5G0k0E
 YkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJoZ4ppAAoJENGAQUApo6g2lp0P/1L7
 HEEEVN6ppxGLj5f3actfmYnXBDvfo4Zftnr+wHmClLqdypObJhQxZIc3UGGZ46oqL53MX1t9ooA
 8Uvmf+RlVwQp4iA8ioG0MmSAvC13OTUw12DPgVSq81bbPNFk+gmbR5jsCW83ci6J+r4BWZ6wi8m
 NDm2dp7icicDorqU+MbPI6LDOKkV4yfWRN3MnGg9MWIGB5CiSpvT6FiTbepz99QeL62TiEbksQA
 qpifvp3cf2soePltl8+BsvJN/UkQgPsUCAs4pNHyHzGEo3h6ARcNTQFi3KSSlnXPnq8qXFmn4Zs
 zm+1oWuWvh9EWvgmobH70qZ86sDYZfXI/ahZ6trXim7OPmj9LPOQkw6k244Z3rcfNfF5HUZhuOM
 R3rDLA0rXDwrzh9nR1h+dyGIAJ5NjmyBAViXWLD700IJP4k3YrKXCTSvL82axECPXuPXkDpVZ2V
 6HjZDCdMhKbINq1oiKPzlAcwGyCX9c3WadAPKAwix64rpAYsG1NCUYVsiW4y5OwNKYaFmLmfCoq
 7rNUUmC8Zm/SmTTqq9muCCmAb6Q3tv3cSDbir2WNQcgb1zqDEv4AeSWbPfyswvGb9lcotq6TfjB
 JoIeUjExjUMZ2Rzl1NM3O6WtJnlhzyEWk44mNjTAcE8eRnwEAawS3iB9d3HAARbaPdIXnN7jTcH
 fqX+w
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduuefhleevheeuvedufeegvddtffefveelfeeutdejueetleegleevffdtjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgts
 heslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Jul 2025 08:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7264

This patch depends on:
https://lore.kernel.org/20250701-pressure-messages-v1-1-bebffe123676@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Add a note on the out-of-memory killer and odd looking failures
  (suggested by Mikko, thanks!)
- Link to v2: https://lore.kernel.org/r/20250701-resource-limiting-v2-0-827077c4420d@bootlin.com

Changes in v2:
- Fix typos and add suggestions from Quentin Schulz (thanks!).
- Add a better section on how to determine what the best pressure for a
  given host is.
- Link to v1: https://lore.kernel.org/r/20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com

---
Antonin Godard (2):
      Add a document on limiting host resources
      ref-manual/variables.rst: make reference to new limiting-resources doc

 documentation/dev-manual/index.rst              |   1 +
 documentation/dev-manual/limiting-resources.rst | 133 ++++++++++++++++++++++++
 documentation/ref-manual/variables.rst          |  32 ++++--
 3 files changed, 159 insertions(+), 7 deletions(-)
---
base-commit: 95691fa4e7d30ee27cb1280df20751bf449538a4
change-id: 20250417-resource-limiting-12fe772af904

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


