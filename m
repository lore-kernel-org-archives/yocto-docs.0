Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19F4C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:01:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11933.1788354095032848602
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=g/zHAt4o;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 17CD04E414C7;
	Wed,  2 Sep 2026 13:01:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1D526053C;
	Wed,  2 Sep 2026 13:01:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68ADC11C79877;
	Wed,  2 Sep 2026 15:01:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788354086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dR63OvCRYvVgWqr4a5OL607Tw87f86XnEMnpdJ8dr60=;
	b=g/zHAt4oR+hXVU+pNAa9WAOTna1LwKWmXhGlSih/Sssy9VETlMFUx39BWYPHDEDHBJjscU
	rvmsU2mKM04VYCerXmic77QTd6OlqsxH81bSf0ryba2t+SKGFklC5JOdmB1ZyTD7cI8EXV
	/ZqmOPHLMzZA/2cDIurOzfAzJugnZjkoggHbGUpucc2RgPzXX+NlOg//BefTx+dY0GOJ5G
	WPOU7a9utVe1NBFHIMhNtp9CEzKb5TMNeJlaMEmKlbqS5aWoC4vCOGNlJBlNVwEg7WDIyj
	13+8N4PY/Bl+s0/ZMi3D1gwQR6xzRjpsee8rmyxYMq6bwpuExXmYT4FJcx/1gw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 15:01:23 +0200
Message-Id: <DL4UM422KYRT.3U71TOH78CDEA@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [wrynose] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10433

The following changes since commit 66194e7869d2df4f8157af2fb6ce804f785a1250=
:

  README: update instructions for installing vale and sphinx-lint (2026-08-=
24 14:46:54 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to d4a5167233032f63826ad33f7b3a718d9a274a02:

  ref-manual/system-requirements.rst: drop ccache in distros (2026-09-02 14=
:52:40 +0200)

----------------------------------------------------------------
Jose Quaresma (1):
      ref-manual/system-requirements.rst: drop ccache in distros

Robert P. J. Day (2):
      documentation: use "https" protocol for git.yoctoproject.org
      README: add references to recent security documents

Trevor Woerner (4):
      ref-manual: drop the full stop from the QB_SMP example
      ref-manual: fix a typo in the QB_SMP description
      dev-manual: quote the values in two recipe examples
      toaster-manual: spell the json code-block language in lower case

 documentation/README                                           |  4 +++-
 documentation/bsp-guide/bsp.rst                                |  6 +++---
 documentation/dev-manual/layers.rst                            |  4 ++--
 documentation/dev-manual/new-recipe.rst                        |  4 ++--
 documentation/dev-manual/upgrading-recipes.rst                 |  2 +-
 documentation/kernel-dev/advanced.rst                          |  4 ++--
 documentation/kernel-dev/common.rst                            |  4 ++--
 documentation/kernel-dev/maint-appx.rst                        |  4 ++--
 documentation/overview-manual/development-environment.rst      |  4 ++--
 documentation/ref-manual/variables.rst                         |  4 ++--
 documentation/toaster-manual/reference.rst                     | 10 +++++-=
----
 documentation/toaster-manual/setup-and-use.rst                 |  2 +-
 .../tools/host_packages_scripts/almalinux_essential.sh         |  2 +-
 documentation/tools/host_packages_scripts/fedora_essential.sh  |  2 +-
 14 files changed, 29 insertions(+), 27 deletions(-)

