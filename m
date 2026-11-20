Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8595.1795189320284757217
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 07:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oNow/AEE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1DE08C62222
	for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 15:42:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E8FA601B9;
	Fri, 20 Nov 2026 15:41:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27E4511BC03F9;
	Fri, 20 Nov 2026 16:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795189314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8vp7JD8MIh9NvXBFx2zFdpkv0autpc2JrVowQuXUSOs=;
	b=oNow/AEELS3J5GiGNl+ezL5HLra8iUJanUxGVK2SeYZikYTUfYIPHDuboidsW5MeFM9ysp
	ciOolT7iFUnP4CfK5/avz/vjzsbw0ENGecPMdVaF1ALRBOO8Oan55ms/XQPyTpZxH58Geo
	VwC2eeisuVN/WfroKi1LOaty3LqsdTe3YsUZ1m+3FRoSHZHphCNk9qwEielgmHh69Ecc8L
	TO3ShCVqgmky0KQ60RxUC+2IkxE+HwLwBsmPTKgIwtdzikQJqhZ3gKrZFFiZuLUlPvzaE+
	GxxfUFlRqj/+EjnrR0EbS0gp2FXE/UOYjykHDty1EPtCBDvGu8HRDq0EDkYLXQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 16:41:52 +0100
Message-Id: <DN05I17VJ8WK.21FCD243WZ6XR@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 15:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10817

The following changes since commit 2c5846cc2c2649b29de7e7a6ac07fef5c2e7f302=
:

  contributor-guide: Adopt new AI-Assisted Contribution Policy (2026-11-04 =
15:16:40 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 1ced0db0c39bb85213a3c20dd32158430944ea4e:

  tools/gen-releases-svg: simplify tempfile usage (2026-11-20 09:29:07 +010=
0)

----------------------------------------------------------------
Antonin Godard (7):
      ref-manual/kickstart.rst: add a section for commands and directives
      ref-manual/kickstart.rst: warn about the include directive only worki=
ng for .wks
      ref-manual/kickstart.rst: document location and variable expansion
      tools/gen-releases-svg: use subprocess check_call instead of run
      tools/gen-releases-svg: start showing releases from oldest active one
      tools/gen-releases-svg: store docs root dir in variable
      tools/gen-releases-svg: simplify tempfile usage

Erik Lindsten (2):
      kernel-dev/maint-appx.rst: fix the kernel cache repository name
      migration-guides/release-notes-5.0.17.rst: fix the oecore download UR=
L

Otavio Salvador (1):
      dev-manual: Document yocto-check-layer --run-tests

Saeed Nourian (1):
      docs-wide: remove trailing whitespace

 documentation/bsp-manual/bsp.rst                   |   2 +-
 documentation/dev-manual/layers.rst                |  38 +++++-
 documentation/kernel-dev/maint-appx.rst            |   4 +-
 .../migration-guides/release-notes-5.0.17.rst      |   2 +-
 documentation/ref-manual/kickstart.rst             | 140 +++++++++++++++++=
+++-
 documentation/ref-manual/svg/releases.svg          |   2 +-
 documentation/ref-manual/variables.rst             |   8 ++
 documentation/tools/gen-releases-svg               |  88 +++++++------
 8 files changed, 235 insertions(+), 49 deletions(-)
