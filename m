Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F78C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:57:00 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.3502.1753783011211601918
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 02:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IkJr8fQp;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EFEA4313C;
	Tue, 29 Jul 2025 09:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w7yEGnHLw+42H36E11hcijKPXT2Jp9ADVuWJf4KeSAQ=;
	b=IkJr8fQpPBEzsSk0agGsJDX7IcemeILH7ky/aDc3CSDPds7cugKVengMMOhVuFPolJVZGQ
	uznMpqJugHy6+6ATopASq7nTC5PUnEDxgCcDs8tOlgGEVq7itJ7Pw26g9fb1xJM9AHxnPE
	pqkaMIHkq0CTEOeZ7jBD5AczQKpdZdwyMdS5HEP9V4mpqHcVdc88TG/gn+rhyuyZHA8cKD
	Agcwd6xI8tHSbinuwy+YuNLE+1O1JEcHF/LBM5C09BbNOz2zsu6+sDJqSn+tyZDYgk4PSS
	mFIbxuYC5005FEsxMXm5EUQ58BqWkmtIZSkzaPCm5oMm3PR62m2m6KWOadwIuQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/19] Updates from Poky master
Date: Tue, 29 Jul 2025 11:56:34 +0200
Message-Id: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANOaiGgC/x3MQQqDQAwF0KtI1g0YRxF7Feliql8NlFESWwri3
 R1cvs07yGEKp2dxkOGnrmvKkEdBwxLTDNYxm6qyaspWWjZ8EB2c1h3ccOBJzXd+f9OwsAR0dRe
 DSBgpF5th0v/d96/zvAARLu6ObgAAAA==
X-Change-ID: 20250717-release-note-5-3-first-bunch-13e949a3113d
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sDEdecIAwkvY6/F7aDu8flyKotozSBsdsY+pPQlMKsg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiJrd1gW8agJMKSumyeJpyqsXAOmvXW8EsOUs8
 ZDEGxehjXyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIia3QAKCRDRgEFAKaOo
 NqsYD/46gmstZWfU7OgQg6vK8zE355smmi2JobOhj4orRaMVLIpW5zcHSHLXYq7S6hgxLf+sZnh
 63iOcd2zrzwpUX6f4zo8SDS3ITB+x4Xku1CtkVKBya3/E443MgvM0E6wkWCMOg7zJvTkWhR7QAk
 vPNGPF/m3RM4k1r+3FCBO3m9uQhJEl1jcp4xyk3qvjY7uMqm5S0cHKCl2Inyd70HbDWWxPU+pws
 1zZ+Y2lnEYI2GtUZkhqEmjQ3yG2xy/EU0G6BsK7FD0xUbOdbbjCWcDbtowA32ztaQAldmYHN0NG
 YkzUofJC8xJmub6NVgNwsu8C/V+97wo/ZMwt2QgCwsUb0HYPooh4hwyzvtRK6osi4Z2WXkXkr8n
 lbCTLe0UCVAqQCDGdyc61CYxNlY2BIK0fjFu/g6ZhBPLgK1ySFLabHN5tOjG9NRGSPQlavn9kCi
 IcNSPfsBl80TaPlza4mznX8CUYlEutRdLPx/yfVF0bO78wks3WHMbWWX8ZZS+b6xO5toQcvzTqS
 9CLfnWFyse4r3mVkn7ph31EEMqdYxFZwDvCJbUWVim78f3xk8ViWk5v9bugx1DNr5tUG+aZtszO
 YZip0omdJ72diFE3lOfvjEFrbiMKskKrmE4ujyvdDm3r1YdLDWsyTna0xaTzs5bDzvJvlVa06TX
 9k0dprJHj2BaRag==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdduuefhleevheeuvedufeegvddtffefveelfeeutdejueetleegleevffdtjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 09:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7393

Update the documentation with regards to the latest changes on Poky's
master branch.

This covers commits from c4a5e590b53b ("rust-llvm: Compile llvm to use
dynamic libraries") to 2a832e6af1b6 ("orc: set CVE_PRODUCT") in Poky.

This series depends on:
https://lore.kernel.org/r/20250724-bb-defer-bbclasses-v1-1-70f1826d4b83@bootlin.com
and
https://lore.kernel.org/r/20250728-refactor-qa-checks-v2-0-9e0737979f05@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (19):
      ref-manual/tasks.rst: add documentation for do_recipe_qa
      ref-manual/variables.rst: document SPDX_PACKAGE_URL
      ref-manual/variables.rst: document KMETA_CONFIG_FEATURES
      ref-manual/variables.rst: document TESTSDK_SUITES
      ref-manual/variables.rst: document PSEUDO_INCLUDE_PATHS
      Drop the icecc class and related variables
      ref-manual/variables.rst: document the FIT_CONF_PREFIX variable
      ref-manual/variables.rst: add link for BB_DEFER_BBCLASSES
      ref-manual/variables.rst: document SPL_DTB_BINARY
      ref-manual/variables.rst: document UBOOT_VERSION
      ref-manual/classes.rst: document the go-mod-update-modules class
      ref-manual/variables.rst: document OE_SHARED_UMASK
      ref-manual/variables.rst: document CVE_CHECK_VEX_JUSTIFICATION
      ref-manual/classes.rst: document the testexport class
      docs-wide: update wic source plugin names
      ref-manual/tasks.rst: do_package_qa: update link to qa checks
      ref-manual/qa-checks.rst: add space around equal warning
      docs-wide: fix space around equal assignments
      migration-guides/release-notes-5.3: updates

 documentation/bsp-guide/bsp.rst                    |   4 +-
 documentation/dev-manual/building.rst              |   8 +-
 documentation/dev-manual/layers.rst                |   2 +-
 documentation/dev-manual/new-recipe.rst            |   2 +-
 documentation/dev-manual/qemu.rst                  |   4 +-
 documentation/dev-manual/wic.rst                   |  16 +-
 documentation/migration-guides/migration-4.0.rst   |  10 +-
 documentation/migration-guides/migration-5.3.rst   |  89 ++++
 .../migration-guides/release-notes-5.3.rst         | 564 ++++++++++++++++++++-
 documentation/ref-manual/classes.rst               | 113 ++---
 documentation/ref-manual/qa-checks.rst             |  16 +
 documentation/ref-manual/tasks.rst                 |  13 +-
 documentation/ref-manual/variables.rst             | 161 +++---
 documentation/sdk-manual/appendix-customizing.rst  |   4 +-
 14 files changed, 808 insertions(+), 198 deletions(-)
---
base-commit: dc984e5f54c38748603243053fde8b4d078ba586
change-id: 20250717-release-note-5-3-first-bunch-13e949a3113d

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


