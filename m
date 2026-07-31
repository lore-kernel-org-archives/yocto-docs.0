Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CB3C55175
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2958.1785490624440362180
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=oSwHS6rM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A1AC84E4104D
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 786FE6039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F331811C1660A;
	Fri, 31 Jul 2026 11:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GoXBnO/ZPIBXjNKqxvvjipDq6ciAdbChwI/uMURcWG0=;
	b=oSwHS6rMCW7Sze8eJdnpG4LCAAmX2PVtKntl+LbrkEEyAJXhMWb7RywoWML6ZvOT6uT+aP
	z7GAl/bO1g2cW+7/O7T8Ozt0Oz/MOh5MyKtF3iSa5okikmd/ua8ouq8A6AZWNRY9+621nz
	cEoOwHJalTSxO+MWaewpofduikBRTKR3PPCNb7bQeiF+oUqSdMPPuOReA+no7AS1oeoOIE
	iia0DpGtpd4NrvSuLjesNkoKLHy0quqXaWjB3X8XuKx33v99SzVXNzPL2/Zn3sEoVnNN4K
	zIWfcfjIiRzGLPptIBVAegom68ZSFXT8mPD9EeyJa6pIgsM+Yr+NqxcgUWmEig==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/9] Rework the docs.yoctoproject.org welcome page
Date: Fri, 31 Jul 2026 11:36:15 +0200
Message-ID: <178548999959.2379643.11037729505854930021.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
References: <20260724-rework-welcome-page-v1-0-491772cc4b65@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10212

Applied, thanks!

[1/9] index.rst: add introduction paragraphs
      commit: 976ee1e250af67b944521b0446c255c88e57db07
[2/9] index.rst: move the contributor guide out of the Manuals section
      commit: 8a20261c231c2bda8be6eea2bbefee19b49cf35d
[3/9] index.rst: move the "Overview and Concepts" manual in the "Introduc=
tion and Overview" section
      commit: 62b982ca545441657491f4d8553144cef7cb3185
[4/9] index.rst: move external links to the bottom of the intro section
      commit: a23f8a921a56ded065bf94bc52e26f280e83c949
[5/9] overview-manual: move the intro content in the index
      commit: 9deb3a9496e3cf36b0528d7616004c0f9cd6c427
[6/9] bsp-guide: rename to bsp-manual
      commit: 6b2ae95b7d9c6b014d625d0a55ebe08701d87f5f
[7/9] contributor-guide/identify-component.rst: use the same tense as oth=
er section
      commit: cc1179dd71a1baa03ecce5a3ebc1f3a49c1c7b38
[8/9] bitbake.rst: rename section to "BitBake User Manual"
      commit: 77d257b88861ed690e19e5d03b6f353dfaeb9a82
[9/9] index.rst: move release notes in their own section
      commit: f68f97ee4ee9b444a853569cdbe3c307d2521677

