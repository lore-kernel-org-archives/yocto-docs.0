Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE84C77B7C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 07:43:35 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.2511.1750405408500293192
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 00:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eQpctkpm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE8FB442D2;
	Fri, 20 Jun 2025 07:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750405406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eYKDdGHS8r0/LmPb9w5SIPrkLw9Tf/Kevsaz9nrjwLg=;
	b=eQpctkpmR4TlHQaogoAHP9T39PdR8/7y4mH7gzhggjql/YDzLw3cp3kNDBb5E2clEnmzxK
	272yUXCJ0GoGKGZgilCAJWRuyqda7CWTvipJscF5rVNEAme/TIRRv0hH+MdOs0Hgn5G0+e
	ozkTDF3UahJnkDk7Nzz4TH4M2kvfuZ5Sk6gs/ie9+vfqxXZng9xqpsRLJHpxOXiwCmIQe2
	ZSJEfX9U4evtjOqxcGnVK8QuPoSCDao/aYEPhHf54Ln7dkQl59WbPZiu6nSUwT8DXrSK8o
	ejNgnoyg4lPDywlryNFnhH0hq9ksfgYiZmasZKqHF414aKbCmmbr3fhQGFaMuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 09:43:25 +0200
Message-Id: <DAR6XI7YEENB.2541J7KCCOVHG@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdejkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 07:43:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7116

The following changes since commit 6f424ed4ce749a135be3145a2e9d04030fdbda39=
:

  docs: conf.py: silence SyntaxWarning on js_splitter_code (2025-06-06 19:0=
9:28 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 731bb4a7d58f16e7920b4798409a4db1b57a0344:

  bsp-guide: update all of section 1.8.2 to reflect current beaglebone conf=
 file (2025-06-20 09:36:30 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.10

Quentin Schulz (2):
      ref-manual: classes: reword to clarify that native/nativesdk options =
are exclusive
      ref-manual: classes: nativesdk: move note to appropriate section

Robert P. J. Day (4):
      overview-manual: small number of pedantic cleanups
      bsp guide: update kernel version example to 6.12
      bsp-guide: update lonely "4.12" kernel reference to "6.12"
      bsp-guide: update all of section 1.8.2 to reflect current beaglebone =
conf file

 documentation/bsp-guide/bsp.rst                    |  50 +++--
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.10.rst      | 208 +++++++++++++++++=
++++
 documentation/overview-manual/concepts.rst         |  25 ++-
 documentation/ref-manual/classes.rst               |  26 +--
 5 files changed, 258 insertions(+), 52 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.10.rst

