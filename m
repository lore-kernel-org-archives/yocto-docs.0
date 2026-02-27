Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9A5FD532E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:00:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92242.1772186449169822380
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 02:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qV705grv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 38FC31A1A66
	for <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 10:00:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F35635FE74;
	Fri, 27 Feb 2026 10:00:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A9C4103693CC;
	Fri, 27 Feb 2026 11:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772186442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sFUEcK913utXCKRV1XYry4KOtcAcZtVU/eiYXrn8RjE=;
	b=qV705grvwGWlceH+DX8wLq4pM+LBwKAyRpxhNfTme+4fOoCUOLW5gCDRouh1lUOJFWx4Ag
	h6BJH3K/oEMe1sC4vgBeKEDEYM1/rJT+z1i2uMbouvND6N+HuytaYjCqEJIqndaCnhrVKZ
	SanfWm61T3RVUut2YOXYYvSsSHs/JfdFwvjiRNC5oCVwm+s4bEyR4ngs7TO2xTUu3u3pPz
	aVnjrNdYMYHyBsRKRMjzgpihv5vJyyR4SWjKWgpt3YtYAJtx1+v1gb7HOGH9eGxyhYffWQ
	2GWq0pbdpUswlkJklKh4aZFQ4+jw8v1+2IhQA7lS4GNdmv1PT8mXzx32TXxm5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:00:38 +0100
Message-Id: <DGPNNUQZEBLH.2MADX9J6OLTLR@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 10:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9005

The following changes since commit 398a2a080361eb22b9c447dbde31fca58bf4e0bb=
:

  migration-guides: add release notes for 4.0.32 (2026-02-11 15:19:18 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 7c348dd67cfd169b1a56bf969606b03dccb76c56:

  what-i-wish-id-known.rst: replace figure by the new SVG (2026-02-23 13:58=
:32 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      what-i-wish-id-known.rst: replace figure by the new SVG

Michael Opdenacker (1):
      ref-manual/classes.rst: fix broken links to U-Boot documentation

Yoann Congal (1):
      ref-manual/system-requirements.rst: update untested distros

 documentation/figures/yp-how-it-works-new-diagram.png | Bin 219234 -> 0 by=
tes
 documentation/ref-manual/classes.rst                  |   4 ++--
 documentation/ref-manual/system-requirements.rst      |   5 ++---
 documentation/what-i-wish-id-known.rst                |   2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 documentation/figures/yp-how-it-works-new-diagram.png

