Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2273.1792742258507503149
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 00:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1l4EG6Fc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 219304E412D1;
	Fri, 23 Oct 2026 07:57:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E049060398;
	Fri, 23 Oct 2026 07:57:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4326210328E8D;
	Fri, 23 Oct 2026 09:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792742254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GQFj51YJOu1bmuHBOSVpvu1IDbaS8gbkKj0XaeiJLi4=;
	b=1l4EG6Fc1kY0ph4FkrPHPMlxoGFyyBikxWejZAfouYv4d8OpZE4PI4W9uIL9/c2oS9Zfjd
	/aDZwjY9ZyXY2Oq5KN3BgiumotOzapHz5TEJYbKGkGxE+qUCiPiheEr9h6YF+wSvjCgrC+
	+YdSHHIvujHt3VdNFgjdBscmjlEO0Bs2BzBvwYsSzl1jwLasWmnSAuTqpiR54MXg2Ef2f2
	H6RD8ZaWPG9Kpi9MZQb8GJhMg3nK7ZJ05IaNSCE2lIP+MZ6nCVWQdfjDM6Rz60weEORf9t
	hDzOIJO8Ge6bgcAw2Yx0AeYJD6yyqNpVJBC2g7gNc7Bu5K9CckdMp5/rDyLKRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 09:57:32 +0200
Message-Id: <DMC2399P5SKK.1OGUKYFGO2Q57@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:57:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10721

The following changes since commit 4328c23c4df10dc9a04426f4ec3081bd17a05e2e=
:

  dev-manual: correct directory name for oe-core wic files (2026-10-15 09:3=
9:36 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 197ed05f4f157432e7fcab63ced8df1249217366:

  ref-manual/release-process.rst: add textual legend (2026-10-23 09:45:16 +=
0200)

----------------------------------------------------------------
Antonin Godard (2):
      ref-manual/svg/releases.svg: update diagram
      ref-manual/release-process.rst: add textual legend

Lee Chee Yang (1):
      migration-guide: add release notes for 6.0.4

 documentation/migration-guides/release-6.0.rst     |    1 +
 .../migration-guides/release-notes-6.0.4.rst       |  445 +++++
 documentation/ref-manual/release-process.rst       |    3 +
 documentation/ref-manual/svg/releases.svg          | 1899 +---------------=
----
 4 files changed, 450 insertions(+), 1898 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-6.0.4.rst
