Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64C6CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:31:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.14396.1761913857754139959
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=b/te0PU5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B1954E4143A
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FE1360704;
	Fri, 31 Oct 2025 12:30:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E738118125BC;
	Fri, 31 Oct 2025 13:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913855; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MhqZ+T3TatbgFfCplqXbNfz+x09rqe5l5el0HdZVObs=;
	b=b/te0PU5Vk2y0Bbaa8YgAHlkqszONvKrsHyzthNZtR316HhYeQJ6VRTTQKh1bg/Cv/zGau
	zhsMvwXnEWwnSqUEotEcYqeGT/ARJ+Fe8Cvnswl6ffgRx7VQemNibThMA+WTjUqDJqTeXz
	338OB4OrPoCwfiH7fG0/fcY0AaxFkPBF/dK2ocAOpjSKHwsuBNE7HFQ9facmQPyotsiZjX
	uH26HFNnngcgHGamWuf1EH1TRBLrygHWUH12NM7pXxaW4YSrtoD2yVEc5NPhDCZLrIrWk9
	+mj3HzcTrDobJnF6VBBBT7+CjHEuUKRbq6rRpuKnBYAu07G1tbeLlfd32hb+gQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Paul Barker <paul@pbarker.dev>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual, test-manual: Update autobuilder output links
Date: Fri, 31 Oct 2025 13:30:11 +0100
Message-ID: <176191376986.156612.10825346799928735293.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020-valkyrie-links-v1-1-38ab330b3a92@pbarker.dev>
References: <20251020-valkyrie-links-v1-1-38ab330b3a92@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7946


On Mon, 20 Oct 2025 10:57:45 +0100, Paul Barker wrote:
> The current autobuilder cluster is at valkyrie.yocto.io, published file=
s
> on autobuilder.yocto.io will be missing or out-of-date.
>=20
>=20

Applied, thanks!

[1/1] dev-manual, test-manual: Update autobuilder output links
      commit: 9ed06c070e309b52f1dbf8877867dcede79f4cb6

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

