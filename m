Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18543.1793107109024874861
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 06:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=rZCV+0lX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C402B4E41328
	for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8ED0D603BD
	for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6C5610328FAC;
	Tue, 27 Oct 2026 14:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793107106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ltlTk2QHM6J6ekCQAROPt1uHo2GRJ9Z7LYpdjGLfWN4=;
	b=rZCV+0lXk8ERBfhvYfe8frxkrS4mrZ7bA8zBsEqgm0VFxkVjJdNJxsDi7DCrzJwNw9ummE
	+lmP2apdfz1kGTQS1e1vRt+tCyl6Tepr7BtmUQPPfjbkx24QlVk5ObKC/wUB+id3OV0NVb
	62isLYURqG/6aEYynZONwcK2+xbhv6VZnCLmUBQzAPOZkflnlzMmoTezJKzuz++3aLwifF
	etNHXviVfMVO3La+BTEv2iRPbJqLiZ01sk4vLfeM80el3er5Z9TAYiuPl5n7ItN3otlwEm
	KeYTzarqMUBxEnmIUq4bArCp5/Df2qO1AGmMGJoXwlwf5DQexJBOubAYCGtIvA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/2] Add a recommended minimum number of CPU cores for the host
Date: Tue, 27 Oct 2026 14:17:41 +0100
Message-ID: <179310701140.402741.11176125082776958525.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
References: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 27 Oct 2026 13:18:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10725

Applied to master, thanks!

[1/2] dev-manual: update recommendations for build system
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Dc3996e27256d
[2/2] docs-wide: recommend a minimum of 16 CPU cores
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D30a4efcd44d0
