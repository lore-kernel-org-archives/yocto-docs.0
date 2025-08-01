Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B85CC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:12:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.84313.1754043170835618553
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ISQYcQjC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A39F01FD33;
	Fri,  1 Aug 2025 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754043168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dUcsq7j10NAyB3zMnAx5E31irgwnWXDX6SdPh52Mn0Y=;
	b=ISQYcQjCs9sQRADWn5u1RsnpfnwZn1F40pimUQgSUmv3otPGGyLcGN1irFyC4/2Mk0PH6z
	RFxIHna71GSkJRcAos/tF6lpUnBZ9n5wLHOH1kpZ1ZWVvH6OzoJFLeERDCxe7RCr+yFiIt
	sD6CMt3BpDok27ctNVRLY1XOVeBdwbN7RGI+C8UF16D5Dt4zSMklowc9EgdeurvO3HRdrX
	2tsffL4lqf7UZgEULoHV4j79OCezSoiWfo3Vi8Pt6BK4kGe/ZTzzWFR8QbWPEkdggEp8td
	ZdM8eCcDgxvPglCsluO3SBNAM1eD3VXyr79ubjDA/6MB/FIUe8f+ViTnmV0diw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 12:12:48 +0200
Message-Id: <DBR0ERE1YAD8.2ECRYTYD0BPW2@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Aug 2025 10:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7423

The following changes since commit 02cc810c17e37563a206629d703dc21fc4280cbf=
:

  conf.py: improve SearchEnglish to handle terms with dots (2025-07-11 10:3=
0:41 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to bf855ecaf4bec4cef9bbfea2e50caa65a8339828:

  dev-manual/start.rst: added missing command in Optimize your VHDX file us=
ing DiskPart (2025-08-01 12:04:36 +0200)

----------------------------------------------------------------
Marco Cavallini (1):
      dev-manual/start.rst: added missing command in Optimize your VHDX fil=
e using DiskPart

 documentation/dev-manual/start.rst | 1 +
 1 file changed, 1 insertion(+)

