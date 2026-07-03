Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CAEC44503
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90613.1783079100873271778
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=myV/jVOR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E89C9C49F56
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C43560300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73744104C94A8;
	Fri,  3 Jul 2026 13:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NhwpNC8z0Ur04wIF+Qzbgl9AdpIbvLkWs32LBcm6a/I=;
	b=myV/jVOROiwyXoDMboIzQKEVpYqNF7KDQdz7eSy+mtaqvxxd9DYGF8nlgo4H4xwS146YdD
	wYrLlQPyy0MAUPe6i603AHeJgRJjMdt2nyrdNSwj+9k9kpHVvZh06kTvfE6HNmrXIXAYdl
	tBXOCkwrPF6cVikM1fUytl3nb+D0erwPZamqPycarDvPhuYxOXPl3d8fQ9wO6Xbu99dLet
	3SilqcmPAeHx6M2hbnL6LtfYVwqudHeFUgZpFgrfYx3dmNtqxk6Zgn4pY0nKbnYUzFnDZe
	GDYWDuf9Z3J16hjDygQ6/bnVYXxGv6sHlo3DmsArosGvHms1+3GO6ZPRNALG8w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/7] Cover recent upstream changes
Date: Fri,  3 Jul 2026 13:43:33 +0200
Message-ID: <178307887477.248663.17997351817724844357.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
References: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10019

Applied, thanks!

[1/7] ref-manual/variables.rst: document the USERMOD_PARAMS variable
      commit: 85eeb215978a6ed2f8fe66ce465084312a590e1e
[2/7] migration-guides/migration-6.1.rst: add USERMOD_PARAMS note
      commit: 3a8eee5d056e3ec9f70023c84078f8e31d158d76
[3/7] ref-manual/variables.rst: add deprecation note for GROUPMEMS_PARAM
      commit: d37434c73e36ddbb0926b5d0b79973af762558a9
[4/7] ref-manual/classes.rst: document python_uv_build
      commit: 2b51a958f1a8f5967ef0896529e081102f7816a3
[5/7] migration-guides/migration-6.1.rst: add note on oe.utils.*_distro_f=
eatures() removal
      commit: 37cf8c7b0589f5258d6fc31ee8eabfd9bba1dbc2
[6/7] ref-manual/variables.rst: document the UBOOT_FIT_CONF_DESC variable
      commit: 6f6bb544373f42c9e99db5dbc31ba66804e37118
[7/7] migration-guides/migration/release-notes-6.1.rst: cover recent chan=
ges
      commit: fa41f0bd3d105410226cbe4df2b86b82aa7b93d2

