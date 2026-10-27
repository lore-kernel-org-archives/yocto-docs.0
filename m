Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18546.1793107109841854982
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 06:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=cKReeg6Z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0885E1A1360
	for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D257460769
	for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F77510329044;
	Tue, 27 Oct 2026 14:18:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793107107; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lfza+frxYBMhNwGMW3KhUrnwdkFvuN90a86msxuJbQg=;
	b=cKReeg6Zhu2k1RF0WU50XfXv14XdNw/LTGPS2ICWZxUyFYOoIcz7xNAptVU+RhXkOok7Nl
	OE75Ryi6OU1pjN48LszvHB1mo1DHTn+bxPGrGzZUn3X7/JFVD95TTEJOG4s1aA+BiQZj33
	CPn/489mCEFYEOObMxd10xVHjtF7XpyEFuVM02+aWjbNf5nmMf91K7CDzUMULR7ORQfhL5
	vZvoEtwYOzqFDGe0GwXD40NKx8/vNiYUiZQ/8zt0R63nKxsHXOQg4aAF+l2sEyXkpIUkgV
	hd4601n+KYxDgFGhOChv55b6ud5Ueg6DZ7abYpl0vnI6fh0Vk89th84+Ztj8mg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] migration-guides: add Garburn release note templates
Date: Tue, 27 Oct 2026 14:17:43 +0100
Message-ID: <179310701161.402741.12724048025348075649.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023-releases-notes-templates-6-2-v1-1-06967856aa4e@bootlin.com>
References: <20261023-releases-notes-templates-6-2-v1-1-06967856aa4e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10726

Applied to master, thanks!

[1/1] migration-guides: add Garburn release note templates
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D549d387f4b76
