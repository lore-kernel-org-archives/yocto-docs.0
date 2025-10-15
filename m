Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C87DCCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:46:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.14096.1760528778892097102
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 04:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=p/3UgKnX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 953591A13CE
	for <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C948606F9
	for <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB250102F22C9;
	Wed, 15 Oct 2025 13:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760528777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hciUDZUlIEzBgw9KL8Ua96jWU5Ah/kInzZP4N+O39tA=;
	b=p/3UgKnX8KsWwHgyfALFF22fNwseXTEfYoMfXMo7llFYniLg/zm4irujKzHAmXeWoQPHb/
	q5wMHS1eOiceCm01ZEz5JXwWGZLXuNu3IU/dB+5aH/HjkHli3USk0nN3cCPmLgBEZbgLyE
	t6+xe7wShV95fVXAycvgmz3YdFHy17MvvZjjgMLHtRQby1BH2mR5bdjZtO643dqmZRRMe4
	1I/Pf/xe3D6d16GFSoX+nxk2fBM5jsKOeXjlHBz8L3U7oYFz/o0zuAFpa0io6BWeXEdQLG
	pEta6elyFpAvYPsNsRNY+xWtL61qt9UlEtVfwM0PvjGx59yp2JwlSu6f99baRA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/2] tools/build-docs-container: add option to install essential packages
Date: Wed, 15 Oct 2025 13:45:22 +0200
Message-ID: <176052868601.3167271.6049737595185444311.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009-build-docs-container-essentials-v2-0-f135032bb43d@bootlin.com>
References: <20251009-build-docs-container-essentials-v2-0-f135032bb43d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7703


Applied, thanks!

[1/2] tools/build-docs-container: add option to install essential package=
s
      commit: 723e531ea442df96fd592635a2fbfba73e737886
[2/2] tools/build-docs-container: remove obsolete comments
      commit: 2e3d33f47dfba64a81767accb6a47cae842bd18e

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

