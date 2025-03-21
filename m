Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F59C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 10:40:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18443.1742553622007930544
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 03:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ED1P6+Jw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 216DD44287;
	Fri, 21 Mar 2025 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742553620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PhmYg12HDVedk2ueCSnX3Q7I7wXUCkkiCPCrmU/1kEM=;
	b=ED1P6+JwdWQpgYFy/a/sPZQHuvAyvjqN++9DySrL5NJzZnRyjkCnA7e95DrpJOwno2H+10
	npLXy1nXONLSR1pd5Y+KlwYQ6TuCWjMIlv7q7FQjanSsWkMCP2m+eJodkjjm9gBhCIAIfI
	vWaA0CwEV/ym2F9Q8vpXRFVwYzIXJ6pFhUGmXnPYBg15DFwiwhPqM52FSyqJHIj7oSxWsC
	DuT6yJ9EIJ0aqEckOCJoo8ajrXd1kNs9VLBpTSW/yLAsjsAq2/finhOOfzrM5ymEYLNOsQ
	zqimxntIks/btjSD4jKbOcecaQ7WSoT8jk5Bgkb1iubtJO+yPGaqb7EtXRltEA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 11:40:19 +0100
Message-Id: <D8LVPDP0LB7G.29UH49QHL17FP@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefggeejtdetieeuteeijedvieejgfdufedtvefhffeludethedthfdvteefleegnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 10:40:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6599

The following changes since commit 7d3cce5b962ca9f73b29affceb7ebc6710627739=
:

  ref-manual: remove OE_IMPORTS (2025-03-07 11:53:30 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 56db4fd81f6235428bef9e46a61c11ca0ba89733:

  overview-manual/concepts: remove PR from the build dir list (2025-03-20 1=
6:42:35 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      overview-manual/concepts: remove PR from the build dir list

 documentation/overview-manual/concepts.rst | 3 ---
 1 file changed, 3 deletions(-)

