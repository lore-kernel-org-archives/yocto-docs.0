Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85222EF48F7
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67813.1770973647117279475
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=mVux0rFF;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 978FE4E40D27;
	Fri, 13 Feb 2026 09:07:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D025606CC;
	Fri, 13 Feb 2026 09:07:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A684510368DFA;
	Fri, 13 Feb 2026 10:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973644; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n9SgBCgOcTQpnOvH8KvmBl5lwlvxDYqePF8hI+B5dRI=;
	b=mVux0rFFBSH4ik4Hh5piIa8y5WV4m8KqyWsqXm5dEBj6xX8+ZhTOpbT6/kQhst7LQQxgVn
	ZxCQJ1xHZN7MnxRRI8oyxRtNSsckQTlkOiHJXXPc1gmuFMXk02Kef8dyFAQYk1Cf1wKtK7
	xkLx9GgI1g2ovU0oDixCsNFJ0xuyw+iCcY/75A923rwKHHrgbGHrlc8MIw1wMSJP+LGJkH
	vHdCVJL0NVqq+EgM0/oiJ9XbOw6DS1bZw1IqvKJOv4ezEkaHszZWsBjTEn9ul3EHj0z80V
	I9fhz6O0D0PLVKhUokhkpMAn8l8S66htigkMvD6pp57PASylzcLHRppASIXW+A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	AdrianF <adrian.freihofer@siemens.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual/variables.rst: document new FIT image variables
Date: Fri, 13 Feb 2026 10:06:47 +0100
Message-ID: <177097354652.48715.8640578258319864938.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203225740.1605305-1-adrian.freihofer@siemens.com>
References: <20260203225740.1605305-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8908

Applied, thanks!

[1/1] ref-manual/variables.rst: document new FIT image variables
      commit: 749b79b1a3001c73d2ddc4c0c3ab73634a591cdd

