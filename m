Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2257.1792742258411243475
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 00:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Dmg2qzRC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7AA5D1A12EC;
	Fri, 23 Oct 2026 07:57:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 447E060398;
	Fri, 23 Oct 2026 07:57:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FA8C10328501;
	Fri, 23 Oct 2026 09:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792742254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=uzVXvqu3yw5Vy8XpC8Tq+N71WEmQGpabDyM5KutjC3g=;
	b=Dmg2qzRCG+DlaknPfe73qqKQ8edBZI9vFmMCW9iVQWiG7rxolq6NFvl8quSvDorA9yvmVq
	14FTDm0l0tWP/9a935W13WZNKq/G4XxtMgpFWTpt7Km3NLhvQhNa7CLgCnWo74pHRDFCS0
	h38BDiBSVgHofUWuC31RiiiyD/opiv88Ha7uZqTriSGmV1DM4Yf4L5G/Wy/qxXxb3ekuCJ
	4rg7+ZX4WJVIVJH4gHkvueCz2hVquoCkSSom8ieM+PXsDZJ6rvWjP3DPPVpoQZQpHATk3t
	FIlQyTICRbW9RFJnpOd43sWdrMsGZPxooES+ts+6Dg8cjQj93iimKSUoLJAQxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 09:57:32 +0200
Message-Id: <DMC2391Z8B8Z.2P9SQTRQSA3EJ@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [scarthgap] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:57:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10720

The following changes since commit a34ca7357403feea970d27909e3529cf18e708d5=
:

  ref-manual: drop "partition" as a wic kickstart command (2026-10-15 09:35=
:47 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 37331af0a948b0f04eb11a194adbc214f9dd8674:

  ref-manual/release-process.rst: add textual legend (2026-10-23 09:45:16 +=
0200)

----------------------------------------------------------------
Antonin Godard (2):
      ref-manual/svg/releases.svg: update diagram
      ref-manual/release-process.rst: add textual legend

 documentation/ref-manual/release-process.rst |    3 +
 documentation/ref-manual/svg/releases.svg    | 1899 +---------------------=
----
 2 files changed, 4 insertions(+), 1898 deletions(-)
