Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F708E7542A
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:04:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117600.1766567074678390835
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 01:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xwx0wqBm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 877E34E41D80;
	Wed, 24 Dec 2025 09:04:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 566BA6073D;
	Wed, 24 Dec 2025 09:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2DB910AB0D94;
	Wed, 24 Dec 2025 10:04:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766567071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+8x/O5CvktSFCrOtUp6ACLWSUArcZnekoPmAQUjOj3k=;
	b=xwx0wqBm0ePE61qnPy2Y48No7e/J2VYqDYK1iAP9J+q9i+Q8gepiV8ebNeVaMY4cUMVfSi
	sOBeIQdXp3aJF+8GjmW4d0frN2R1F+K601LKUaZ7mPOMCrr0tYs7kXzPNMifvJT+U0mxHW
	ZUSiJzoodrZ4j8TPIJAmgRxOgqVegM6M+QPHOULioWo8uRf3cF68AWytOSnDSoNcdyJgm4
	i+8LwulGLCW7HsCsOxaFUFMidS6l+wl0izUFY8fjDoTEoCoEMuGH8QCglQPV4T3p+RCDB/
	MvbKdD3BiORGsBPuRLm6CHTHIiEnKypdRVpKaer2KrhJeY7aycL60I1IImbG7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Dec 2025 10:04:30 +0100
Message-Id: <DF6BRGGOY31I.2CEFWSXOZNZSA@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 09:04:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8320

The following changes since commit 4b9df539fa06fb19ed8b51ef2d46e5c56779de81=
:

  migration-guides: add release notes for 4.0.31 (2025-11-14 18:10:02 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to cebe8ff0508e0fc2de8378a1cf93eb8054e12699:

  ref-manual/classes.rst: document the image-container class (2025-12-24 09=
:57:14 +0100)

----------------------------------------------------------------
Antonin Godard (6):
      overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
      overview-manual/yp-intro.rst: link to YP members and participants
      ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      ref-manual/svg/releases.svg: mark whinlatter as current release
      Add a new "Security" section
      ref-manual/classes.rst: document the image-container class

 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/security-subjects.rst     | 194 -----------------=
----
 documentation/index.rst                            |   7 +-
 documentation/overview-manual/yp-intro.rst         |   9 +-
 documentation/ref-manual/classes.rst               |  47 +++++
 documentation/ref-manual/svg/releases.svg          |  16 +-
 documentation/ref-manual/variables.rst             |  18 ++
 documentation/security-reference/index.rst         |  14 ++
 .../reporting-vulnerabilities.rst                  |  85 +++++++++
 documentation/security-reference/security-team.rst | 110 ++++++++++++
 10 files changed, 292 insertions(+), 209 deletions(-)
 delete mode 100644 documentation/dev-manual/security-subjects.rst
 create mode 100644 documentation/security-reference/index.rst
 create mode 100644 documentation/security-reference/reporting-vulnerabilit=
ies.rst
 create mode 100644 documentation/security-reference/security-team.rst

