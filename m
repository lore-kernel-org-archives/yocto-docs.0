Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB335C021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 08:23:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.6573.1739435003479364712
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 00:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k2IfwwAf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D6EB204A1;
	Thu, 13 Feb 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739435001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=52Mdl55x4kWRsydrnv5WNlXEPzxFHpQqhmiph0HE95U=;
	b=k2IfwwAf5pwR060WZoRI8m40z8kGB4rUrMD9o71jodGv/75v65mfH7csuJx3hBbNhP0N71
	aAVaFomc13MTVzSfMggaqTf+XC9jC6VRTB/1WUgWNfsmvm+8ZnZa/Ea5jwQY49h0OPD4Xg
	Di5r7Ke985lS9+Sxhilc3c/54V8y8JF/HS6eiXgpkE6vOY00Ye8Z59DxVq9y2eLWsMr/Pz
	qYDqITn/z27Gs6vhUu2xJC5XpgsHWlXKhsbRlqjPRtpuQ+pLWm3WEoUhQYwO+68nQyY6dz
	mN7reMzKPojJhPx6MKhqQiO8w1AomKkwyyx8Dy5dTmFqtX544gevuklnIzqPQw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/6] Improve multiconfig documentation
Date: Thu, 13 Feb 2025 09:23:14 +0100
Message-Id: <20250213-multiconfig-doc-v2-0-f2bd35115cb7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPKrrWcC/2WNyw6CMBBFf4XM2pq2KARX/odh0SdMAh3SYqMh/
 LsVly7PSe65GyQX0SW4VRtElzEhhQLyVIEZVRgcQ1sYJJdXLmTH5ue0oqHgcWCWDDN1W1+kapT
 uBJTVEp3H11F89IVHTCvF93GQxdf+WpK3f60sGGe+qY1VWnhlu7smWicMZ0Mz9Pu+fwBEpAYEs
 AAAAA==
X-Change-ID: 20250129-multiconfig-doc-c37342a6ab91
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Mark Hatle <mark.hatle@kernel.crashing.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mfJ5+Su6EAK5woVQChqvSjAdckCyspKt54UJX2usYbI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnrav4qwqg8Y9HLUI8PIf6CUTRpFItWqhnPnYzq
 BHYqgdVAdmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ62r+AAKCRDRgEFAKaOo
 NlZ5EACCVG7hWTVWi2t/Mj23CPSWbhi7D6UrqjHzp8Ba2oeO85qjRMwVVBDlkduK4Dh3DU7VujU
 EalT9uS0VM7HJf1cfFhF93P5JdAgLqCOso7Mtc/nEkDJq/UvZDlbsqAPZj0mZFJi1FXKpwRfQVP
 EQSMyudxG9rQNI3ib+C7aQG68Ty9J6JPd3OBroLMEaBOtdojyEtF/JmV4HafcfkuiSPD2jZquXE
 CnjbLNo0CZYZfN86hK3VO1JfIKKxpwCHLgSWcITpwEKyNsgpp4UcdkgWxhDh/3gQgTeqIlvaied
 hktk9po5oAtWCZ1lA1ORnL17kad6G6xf4mkRfmKZG4MjwrklSMO7RaqB2tPQGb2csgAq/NeuY9+
 pFoW/dSQPGwmFw9VWUtmpSw0MkpHEpnSWTpH/L2EIPYTaTZmdqtN7xeLWEZUHrt1IobWxBB+qBs
 m9xhE7lB9IRTUMDSvGNpR7Wg0p41YypMK6vbbQOyP5EqT4MKN1HOqY3rCejk6yp8dix7grj+nEc
 eFrCBqqi47RZDRo/sTE8EUXSTRO6r+THNx51MvN9/y3gevGVmHMSTslGFuARmk57xW9cSgI2urJ
 dYjIgWR7di2GWZvmVNEmBCvrsecMh0crcv7qUulilsLe8h1xCRErCU2BXXfMT3tKIvdqtfMc9LK
 pwncuoHNmxeJUDw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeekkeeghefhvdfhfeejuefgudduveefgeefieekkeeghfffueeljedvjeekiefhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvr
 hhrhidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghrkhdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 08:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6358

This series moves the multiconfig doc to its own document in the dev
manual, and adds 2 sections to improve it.

It also adds BB_CURRENT_MC to variables.rst, and fixes previous
references of that variable in the doc.

This series depends on the following series that adds the BB_CURRENT_MC
doc in bitbake: https://lists.openembedded.org/g/bitbake-devel/message/17185.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- reviews from Quentin (thanks!)
  - add dependency on bitbake series
  - fix first commit's bad reference, replace with a :doc:
  - fix some typos
  - add example install and deploy tasks in the suggested best practices
  - mention that the baremetal scenario could also apply to a main Soc
    with companion microcontroller + add a note on overriding MACHINE or
    not
- Link to v1: https://lore.kernel.org/r/20250207-multiconfig-doc-v1-0-f63cdab1fad9@bootlin.com

---
Antonin Godard (6):
      dev-manual: move multiconfig documentation to its own document
      variables.rst: add a reference to BB_CURRENT_MC from bbdocs
      migration-5.2: fix references to BB_CURRENT_MC
      dev-manual/multiconfig: rename to use Multiconfig term
      dev-manual/multiconfig: improve the current doc
      dev-manual/multiconfig: add suggested best practices and baremetal sections

 documentation/dev-manual/building.rst            | 156 +-----------
 documentation/dev-manual/index.rst               |   1 +
 documentation/dev-manual/multiconfig.rst         | 309 +++++++++++++++++++++++
 documentation/migration-guides/migration-5.2.rst |   4 +-
 documentation/ref-manual/variables.rst           |   3 +
 5 files changed, 317 insertions(+), 156 deletions(-)
---
base-commit: 6eda443c7fcfeecebd6b44b96a1587c4bb093a34
change-id: 20250129-multiconfig-doc-c37342a6ab91

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


