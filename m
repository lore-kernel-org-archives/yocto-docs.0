Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2A5CD5BAB
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:52:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21645.1779198717336186985
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 06:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c8A+LSm9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 996084E42CEF;
	Tue, 19 May 2026 13:51:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FA405FFC8;
	Tue, 19 May 2026 13:51:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81381107E92A8;
	Tue, 19 May 2026 15:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779198714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DRlWHFu52YU6AUWNHxesBgE9Ty3PQ8kyAt/0fkjAxyI=;
	b=c8A+LSm9MAVAIAEGYcVrJ00F6uUP1O/1fZdfUm2ZzACohdR/2luC4Ozk0jQllGEFN565vv
	bePhdbqnwyNesZn79QsJhcZ05emtyOzTpYX3jusjU187+CzmNRAFVMLZjbhOszMn/HNirB
	Vrj/Tm0gl09PE6iQZbGBdQ4g4bqOFAmAEantaXEWNel2WecMpwjwYu3cp6OpVA06RxKTZ6
	mXfiKfRhORcwBFI3kqC6OqkoEwu6zBhoVWOd+3Y+xcnfC0Q0teUjMyKYbKwG/ITkp/Fvj1
	MP71/7Ef+NUiMKEBnSyNoyCLXf0NX4hXKoByu21R4wQx4KMErAoJaJoxYydF4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 15:51:53 +0200
Message-Id: <DIMPB15YI7BK.218D480KX5XX0@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 13:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9489

The following changes since commit 192be45726500cf875db6fad377116b48f7aabaf=
:

  sphinx-static/theme_overrides.css: switch to a fixed width documentation =
(2026-04-21 15:18:31 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 18269707048c23f6c63ea91195d9bc49c52a656c:

  migration-guide: add release notes for 4.0.35 (2026-05-19 10:52:12 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.35

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.35.rst      | 198 +++++++++++++++++=
++++
 2 files changed, 199 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.35.rst

