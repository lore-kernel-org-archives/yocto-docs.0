Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DFBF8FA81
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 13:44:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30006.1776779093724211016
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 06:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NjVBz/Pb;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4B5571A3385
	for <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 13:44:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23490600D2;
	Tue, 21 Apr 2026 13:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56E3710460872;
	Tue, 21 Apr 2026 15:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776779090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=xd42mAnkQryx0O7khmVCbMVRnH7fepH71brHbhiNOoI=;
	b=NjVBz/PbxHzv/mGkiSsdFclxIzYCWUq1NgNFkObFjzUZyo3ZTZ2VU8nK2V/bbGvp42xh1P
	ko9U1zSQtXBwEwFnmbCCUhneM/xSe1emc9DhDib4y8j+OhvlQBYA7s4Vc628dBINXQGZJ/
	tsNy1BGS3lU2sBenFI+hr8KPaISV8nXUDOpuGGp71frZV1xS6y7RjgGzwHet+AN7pIrO98
	24+DQk23D3y9LmxgrIMUeKbSbwVWsnQ860iNKxIgCgQ0T39CBcyrrdKeUh1fp7zRVn2VGx
	WpP8QowL9r95GtdkFf9zf6Vj0weJCQwp1OKX1jm7/WRRoyTEdXrt1/FOEs+wKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 15:44:50 +0200
Message-Id: <DHYVMDM4WS52.FC176SXHUK7L@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [kirkstone] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 13:44:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9298

The following changes since commit ce6734c68649739c635675a133fa77edb9865028=
:

  migration-guide: add release notes for 4.0.33 4.0.34 (2026-04-02 15:22:08=
 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 192be45726500cf875db6fad377116b48f7aabaf:

  sphinx-static/theme_overrides.css: switch to a fixed width documentation =
(2026-04-21 15:18:31 +0200)

----------------------------------------------------------------
Antonin Godard (1):
      sphinx-static/theme_overrides.css: switch to a fixed width documentat=
ion

 documentation/sphinx-static/theme_overrides.css | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

