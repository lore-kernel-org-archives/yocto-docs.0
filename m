Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D12C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:10:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.19703.1744355435662250628
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 00:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fL4hqcld;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4531B44436;
	Fri, 11 Apr 2025 07:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744355434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yLGgcMSc9Pm2aFdApvxNvTEucMt64AFaglDhcyZewfE=;
	b=fL4hqcld6zhYO2eqYGzf/DsjBipnDu0bhl61WZ2acOPdkwrNIF83Q0njKzZzNW7TBJTyJm
	GsIftzk/H6Rfz85LvzePwt5QQxFQalch/prQkEDfD5eTr5+ylHR4CcSSwFG39/H2E80Lty
	6KaU0TU6PHOsxqlN0HDa+e2uFLzt+xGe3OHnimVlYHXo1U8MnItxveMI3HQR9G3LHHsmt4
	gnPaTXLZdC3Qg1I9kkF7lRtYpmSGQ3ak2MOmPpgeGYIQNJbX04ic2BHXMI+vvcMUk64DKA
	OMNxgu2ZMe6Eg5StaNwG8C5HFam350CqDqjuwL8VErXmbLgVyF9MmkFg+Aey2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 09:10:34 +0200
Message-Id: <D93ME7PCBVBN.2RYZ82FD152KA@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheefheekfeekvefghedthefftdeigfetieffleehfefggfeikeffteegveeuhfegnecuffhomhgrihhnpeihrghmlhdrihhnnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 07:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6729

The following changes since commit 9b4c36f7b02dd4bedfec90206744a1e90e37733c=
:

  ref-manual: don't refer to poky-lsb (2025-03-07 11:28:03 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 0d51e553d5f83eea6634e03ddc9c7740bf72fcea:

  Fix dead links that use the DISTRO macro (2025-04-10 10:23:32 +0200)

----------------------------------------------------------------
Andrew Kreimer (1):
      manuals: remove repeated word

Antonin Godard (3):
      ref-manual/variables.rst: document autotools class related variables
      poky.yaml: introduce DISTRO_LATEST_TAG
      Fix dead links that use the DISTRO macro

 documentation/brief-yoctoprojectqs/index.rst     |  2 +-
 documentation/bsp-guide/bsp.rst                  |  2 +-
 documentation/dev-manual/qemu.rst                |  2 +-
 documentation/dev-manual/start.rst               |  2 +-
 documentation/poky.yaml.in                       | 11 ++++++++++-
 documentation/ref-manual/system-requirements.rst |  2 +-
 documentation/ref-manual/terms.rst               |  2 +-
 documentation/ref-manual/variables.rst           | 17 +++++++++++++++++
 documentation/sdk-manual/appendix-obtain.rst     |  6 +++---
 documentation/sdk-manual/extensible.rst          |  2 +-
 documentation/sdk-manual/intro.rst               |  4 ++--
 documentation/sdk-manual/using.rst               |  2 +-
 documentation/set_versions.py                    | 14 +++++++++++++-
 13 files changed, 53 insertions(+), 15 deletions(-)

