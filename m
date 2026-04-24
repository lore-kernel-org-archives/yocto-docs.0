Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED790FE51E4
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:44:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16524.1777020242121583197
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yu1lpVsp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5CF7A1A33E4
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E34C604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A69810720744;
	Fri, 24 Apr 2026 10:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777020239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4v12AGTF52thIlhGTelimhw4/L261tq+s+fq3wbVbtU=;
	b=yu1lpVspHmjsIonpkKMf7JqUK1xXOUuYrfjfkOZpEoe4+BXYO4r9AZW5UNrMEhXfqieNn7
	elH0LeUMraLsUQJoiHHqYORdXRgkH0JDr+v+tpaoPz1d7roITm0/pMoye+koqOsRH7qnul
	cqJuXiV8ZfIAsNcpUDvmuuXrYeeJiec8fsd1MDAsR/pyGsYD7Is4xHMxGw3m/9xJqqzasy
	GyeIeWtsbwdmCTLCpbW3SHBYQmIfjWzSzGwLPqVgzOJ+L4+07KwMeRuA9cCY10NYv3rm7B
	uSPWsP0R3lxkWrkFRONyAIaoTpgVQ9WkMGZHU4x2DbcemxNCjsueDlL3eli7FA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 0/2] Updates to host requirements
Date: Fri, 24 Apr 2026 10:42:37 +0200
Message-ID: <177702011529.92831.9842508795484598657.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420-python3-websockets-requirement-v3-0-22bfa3f411cc@bootlin.com>
References: <20260420-python3-websockets-requirement-v3-0-22bfa3f411cc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9360

Applied, thanks!

[1/2] ref-manual/system-requirements.rst: make python3-websockets a defau=
lt host requirement
      commit: 144b182d71f073f37748e3b71e0f18b4ea5fc659
[2/2] ref-manual/system-requirements.rst: instruct to install a buildtool=
s tarball
      commit: eb74fdfd9e5e579a65e8872d1a73b51e77b14f63

