Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CABBCAC5A0
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.24173.1758118446967667844
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IwwfmLAC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A77D91A0E88
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F6F76063E;
	Wed, 17 Sep 2025 14:14:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C334102F1BD0;
	Wed, 17 Sep 2025 16:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CThyiHSx7sdQxy/hqkiKFon7zVxqwJVW+KXFgnKAD/Q=;
	b=IwwfmLACxcPTQgBpuHjSuxFElEnA54/2/eag1dM+tDWts7l3S/65tlSKNLNRshV4mO6KXB
	rGAnCTLqYzsaPdu75bwiPVP1QrEdiSGqzjZ116g+wb/sCQSGdpS9XJSdCtOxSeFjTx9MXU
	gt/2uuXhLXen/Ctep0mpYEVLrJWdjvwaOX8UYT4VdLkoj0CwKzD574I+3tWIo9MtpuUJT1
	TxFgrMOnIWuCUanvhFSjvzD/91jQNXEdoF5xquW+ac+c54hs0fZLL+uUFeRlwxFI6A8pF7
	SK5+aDqYb4nWW8u13RoLzAeSBLG3iUKXQ3DEU0pXxXkbDCL1ylH+/k3RyvIp5w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] migration-guides: add release notes for 5.2.3
Date: Wed, 17 Sep 2025 16:13:18 +0200
Message-ID: <175811826412.690097.9742035793714397806.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912140334.1504278-1-chee.yang.lee@intel.com>
References: <20250912140334.1504278-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7531


On Fri, 12 Sep 2025 22:03:33 +0800, chee.yang.lee@intel.com wrote:
>=20


Applied, thanks!

[1/2] migration-guides: add release notes for 5.2.3
      commit: 3a73f28b3fffaa7abbb68dd164fa8615efbfece5
[2/2] migration-guides: add release notes for 5.0.12
      commit: e77139b5c616e6e5ad436eb91416fd804389425f

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

