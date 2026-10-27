Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18785.1793107111068095488
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 06:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fujZKfpI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 511554E4133C;
	Tue, 27 Oct 2026 13:18:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EB85603BD;
	Tue, 27 Oct 2026 13:18:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3DC91032904F;
	Tue, 27 Oct 2026 14:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793107108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DnjsEzo8w3C36Bu9nxc/KlLHuE210y3COoi4edt0Uwc=;
	b=fujZKfpIq5b5/MLXsNePYzwc59bcT5UJdO/eilpvV0PsOYBWn5g7GFNpIyjBgAQjxsSToM
	s1U+z+mwkgmyZzhZmFbvQTCyyhuUJWFF0LNpDj/rGVmZw6hKSFQr3fRb6fOE5vpk/iSckt
	tS1kkB4u59WN7WibsOTOaHdsGvkNKLXlJms2ntgD7WKiHb3HDRTTTXe5vc2b/iDe36N2me
	Ew5SsW/QdxYbvTD+kGK+IOwjHt1n6/rf3TRaHiNLOYaQeBNKTLPKjuAhh/qW1walwi0M6g
	LAd5G5rRXOD3du7oKLA+83BWOfmzwoYu9LDz4VjfNYZBA0XSPslBiEJwgpcoEw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] release-notes-6.1: update Downloads section
Date: Tue, 27 Oct 2026 14:17:44 +0100
Message-ID: <179310701160.402741.4044268784595551467.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022092606.218597-1-chee.yang.lee@intel.com>
References: <20261022092606.218597-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10727

Applied to master, thanks!

[1/2] release-notes-6.1: update Downloads section
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D47589e19d18d
[2/2] migration-guide: add release notes for 6.0.4
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Dbea2f21354f2
