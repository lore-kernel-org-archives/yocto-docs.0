Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A68CCA46F
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 06:45:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.47622.1759128337340495577
 for <docs@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 23:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Fhmqk/e1;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F08774E40D17;
	Mon, 29 Sep 2025 06:45:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C890E606AE;
	Mon, 29 Sep 2025 06:45:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21C6C102F1844;
	Mon, 29 Sep 2025 08:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759128335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BZBfYYGO1OaSvTZEDw3xlvfH+KuTdbXut+Qb2ClbuVE=;
	b=Fhmqk/e12S6ZzkXpZTF8I3jMRwE4b6PqETWn2VxxSEEMquwgx1JPmTWtBjp8fpmifQRkdl
	HUdqEu6hC8lzSqp6zRnSSKwBP0sn1kh1JR5PBbqc+xCKPj9f+18ZxI/hTIslBkrya0HnQM
	NXpxjg5gLhJcO4PbS6wQ6/RkXjGpNUs5HlRUC/ue+XMXGfRJ8/KfC7detMX1wMlCm6L6P+
	RBzzikoYMDBt9t577WebqwqBrRmUUNhi9aaGXODqXCU4nYUSNCxKWlC+9m1ZQxYj2lLCn/
	TfS6mUCuyspsjUQZZWPGuPh7klzJozmAHDPGZH/w7D8Z+pzaD4Z0d6pNkqfMGQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Peter Kjellerstedt <pkj@axis.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] migration-5.3.rst: Correct a typo
Date: Mon, 29 Sep 2025 08:44:30 +0200
Message-ID: <175912824405.5757.15804865679547355307.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917140653.314767-1-pkj@axis.com>
References: <20250917140653.314767-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 06:45:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7624


On Wed, 17 Sep 2025 16:06:52 +0200, Peter Kjellerstedt wrote:
>=20


Applied, thanks!

[1/2] migration-5.3.rst: Correct a typo
      commit: a87be4bc3c518fe92c5fc849975fcd233fdc51db
[2/2] migration-5.3.rst: Correct info about the removed libsoup-2.4 recip=
e
      commit: ac2896c89df7e5dfa91b18a5e1681019f17182d3

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

