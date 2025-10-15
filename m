Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D6ACCD197
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:46:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.14099.1760528780830091852
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 04:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=2KuHENaG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 85D0D1A13D1;
	Wed, 15 Oct 2025 11:46:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C663606F9;
	Wed, 15 Oct 2025 11:46:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDD3D102F22CF;
	Wed, 15 Oct 2025 13:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760528778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6wsU25M/yOHuCaEYFQWLkg3/smJsvItHooeuBaa1/wY=;
	b=2KuHENaG1c+dM1cLADSOms0If60RNzttHJEoNkwNIHEHOcNE1xCzlwWtI7MqpnF8GTL0hG
	hGNYnXtsgCVekvWYY4kRel/mJZ2nJjQdOPxP7gXleDir4vf7IgeCITrZnjifi4wK1ISfvZ
	wTKIFlqpycaPykVyEsaIYUi9zJESoWJZiArx4yICGx0Avwi0SPZcsgVheeQjxOs9L4oO2y
	yRM8zu5hLKma09ljhDFNqTD1whmA1Mn6NmnNanMnsxs1YhyFObAJys9XKoBujJm9GaqCzY
	nCCyr708dT0C1S7AMy4LEZse/HVn0LO952vz/Mhc1EruQ+eOhwl/m1K6eS7IoQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 4.0.30
Date: Wed, 15 Oct 2025 13:45:24 +0200
Message-ID: <176052868598.3167271.17936699108578759270.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006061344.511511-1-chee.yang.lee@intel.com>
References: <20251006061344.511511-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7706


On Mon, 06 Oct 2025 14:13:44 +0800, chee.yang.lee@intel.com wrote:
>=20


Applied, thanks!

[1/1] migration-guides: add release notes for 4.0.30
      commit: e89c95b167c24cfb9c1d5d548a26872393ca2fee

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

