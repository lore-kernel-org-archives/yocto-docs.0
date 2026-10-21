Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5990.1792567329145793284
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 00:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=QPp1Yfgq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7FB081A12AD
	for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:22:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 554F9606E3;
	Wed, 21 Oct 2026 07:22:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ADA610328C52;
	Wed, 21 Oct 2026 09:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792567326; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6z+3MN+DnVGGdF0yFByMLuOYY0m9UsIF2/WwkBlOodI=;
	b=QPp1YfgqPkb5mmhMSQ8NvUQ9ydmbntR5y7kZ0rojBKH6fT3xfnEOA6Aneae7m/InwmOk0W
	g2W2wGm6myCoE4NqUAlxBTwKyYPyBEi7h0Q0eccOgOFmEZztRFJiQXTt0TCvgm0G9mCCMt
	YCbjR1oQ2ZL43rp95ObXT6LHNYyTx+Fv78Ql3QeY55VXXqQUA7LdXLRrf+9KHMAbF0HUBD
	8mPXuMIGQKroCwM1An95eybHaSTpSur8xUF81UrF2eO3CPfSFnQ0VQTNbbWAP3gMujPkNc
	wvLU8rt3GNToEcJfZ0k3HM3lytkCLwU0Jx+bQc1/DjQURjY72NkFms+kC/sDzQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3 00/10] docs: editorial repairs to the examples
Date: Wed, 21 Oct 2026 09:21:47 +0200
Message-ID: <179256699508.524663.10604556566877889227.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 07:22:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10703

Applied to master, thanks!

[01/10] docs: give the root prompts a preamble
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D64c57e5c12c2
[02/10] docs: copy only the command from a console block
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D6fa38c6d8b31
[03/10] docs: show a prompt on commands the reader is meant to type
        https://git.yoctoproject.org/yocto-docs/commit/?id=3Dbe47648a8010
[04/10] docs: write an elided passage as a comment
        https://git.yoctoproject.org/yocto-docs/commit/?id=3Df8e676c038a5
[05/10] docs: mark the placeholders in examples
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D18af4ce3b2c3
[06/10] docs: remove real accounts from the examples
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D506b28871d73
[07/10] kernel-dev: give each example block one thing to hold
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D0625631abce9
[08/10] ref-manual: put the ARCHIVER_MODE comments on their own lines
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D04a6651f50f4
[09/10] ref-manual: drop "partition" as a wic kickstart command
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D3a52e7633466
[10/10] dev-manual: indent a list continuation so the code block ends
        https://git.yoctoproject.org/yocto-docs/commit/?id=3Ddc28a61ac708
