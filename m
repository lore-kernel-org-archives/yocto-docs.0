Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0740BCAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 08:08:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.28642.1759738100266095297
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 01:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=DVfbx3nh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E75BB4E40D5B;
	Mon,  6 Oct 2025 08:08:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEC85606B7;
	Mon,  6 Oct 2025 08:08:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1B5E102F1D53;
	Mon,  6 Oct 2025 10:08:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759738094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=90jcDYPVuE2vfwKbpCgg/3iO+JWkFBk+uZPohFsoN50=;
	b=DVfbx3nhbkO3yDBUd1sXOLWEbD336yDVORj41ONG3/9++x5Xxs4uaf2tim7O9jWKtYyAWv
	COSshc25d5gnntcLV0jnlCKZf0I0i5+RUtojHZqPvlUEGvZNSmb1xdhAaNF4R8EeW4foKD
	chPR5B7nzLH38VVl5coW+3nOs98o7kX2lgMWjgng7Dij7B+nGNObO6MuUqd4YKKPB9PEIG
	dmoYKMIMJdDsFCdf2Gwyhy7OdvcVH8+vkXNYcB7G7AgdTWT4Lqv3E8vIa3faYLkDqfluUS
	WHKk0IoH2mffAdMRCRcNtKctSFj6I85i3JQj7zsXZ4ljrOXoLYNipn4zf3fVWQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Talel BELHAJ SALEM <bhstalel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 2/2] dev-manual/building.rst: add note about externalsrc variables absolute paths
Date: Mon,  6 Oct 2025 10:07:22 +0200
Message-ID: <175973778848.1174293.7992648901735044938.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921132033.31644-3-bhstalel@gmail.com>
References: <20250921132033.31644-3-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Oct 2025 08:08:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7652


On Sun, 21 Sep 2025 14:20:33 +0100, Talel BELHAJ SALEM wrote:
>=20


Applied, thanks!

[2/2] dev-manual/building.rst: add note about externalsrc variables absol=
ute paths
      commit: 33166d70b6ad093bd95ffccafc0b07820682f656

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

