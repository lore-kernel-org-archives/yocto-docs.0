Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE06ECA0FFD
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 07:41:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.8086.1756453290852665945
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 00:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0gJlEgL2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 935811A0E44
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BB7F606B9;
	Fri, 29 Aug 2025 07:41:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B037B1C22D73B;
	Fri, 29 Aug 2025 09:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756453289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ejmYXUJmpOo8bIMCKnpKIYPceWnGkntjYlHxM7H306Y=;
	b=0gJlEgL2tZbCuNs045z8iH/3jFCObGdRPG7QEMOzXosmQqNcnkdZo2NlYjGE3I7aWR3ckr
	8leOv2uEhwI/J6xsTaZ1UTP5McPsz3QiLoHxN23Q/PXd1vfKxjDzQE+8uVaUe1WPxzlDYz
	PdxAsihFhHjlTiMC5arl9EAwEhzG5KMPi0uOh+IbpQYSkfaNNSK+Zpkvyn5XXRmgoEukLl
	dYTFzJia446ZM40D9K9v/6dkkpda/+lnHX1Rci44jlB+CgD53JuB9IcoP0axfxs7fgwwb4
	33WMlsDDwK/TcWbIQMbly7/KvwlHRNHKFSTkWEiYv+RU//XVmShaP0SRR4ED3Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Erik Lindsten <erik@awto.se>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual/yp-intro.rst: fix broken link to article
Date: Fri, 29 Aug 2025 09:41:04 +0200
Message-ID: <175645283482.82658.13946923906474017687.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806123528.44117-1-erik@awto.se>
References: <20250806123528.44117-1-erik@awto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7470

Applied, thanks!

[1/1] overview-manual/yp-intro.rst: fix broken link to article
      commit: b9680ad83ad3fc5e2b87594f7c62c057134d198b

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

