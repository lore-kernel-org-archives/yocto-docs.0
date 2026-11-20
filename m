Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8594.1795189320284429719
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 07:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HfGLw8yd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A06BDC6221F
	for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 15:42:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E031D601B9;
	Fri, 20 Nov 2026 15:41:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C22511BC03CD;
	Fri, 20 Nov 2026 16:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795189313; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=LjWxr6toXKSYKJ7h9FrN3980Xbf0kEl7ApplP3EZxC8=;
	b=HfGLw8yd/gDVjzSLnKGiNYAx2s1Xm2lOXlmbjFEDv28YMxq7vSxI7r9Osl7OMYoqfHg7JW
	mEW1B+8cDUnRL7EbLkZXmIlQJvpKqBOJw/mIxfKl1e2KSWXOrW4sAIVRraZ9RPzppV8a31
	RlB+pmgPwPbmWwIxF1t3ZxgElDve/97aY3HSOdbSSxGWLmjZqt9ydIBz7XYZAH93QP1T/V
	3AjMJVPzVgZCpfxV1adM6IPb5Vv8OhH88SlAP+pY3AtMVtjgkHN7z1E5Md4HmtuAR7bPk6
	3U9gioFfk/gkOsFJ1O/MY8dTIoljjS4DWh1Fd9FbAnbiosATpyg2uQILX/pF+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 16:41:50 +0100
Message-Id: <DN05I0BWATZU.2G4GZ36391DDI@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [scarthgap] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 15:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10816

The following changes since commit 7a4ccf27524f102f0ba64f1bb1c39c73997b1548=
:

  contributor-guide: Adopt new AI-Assisted Contribution Policy (2026-11-06 =
09:50:52 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to fbefb1b1018cec911ebd026c5e3c16134e4e5335:

  migration-guides/release-notes-5.0.17.rst: fix the oecore download URL (2=
026-11-20 13:19:07 +0100)

----------------------------------------------------------------
Erik Lindsten (2):
      kernel-dev/maint-appx.rst: fix the kernel cache repository name
      migration-guides/release-notes-5.0.17.rst: fix the oecore download UR=
L

 documentation/kernel-dev/maint-appx.rst                 | 4 ++--
 documentation/migration-guides/release-notes-5.0.17.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
