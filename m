Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62CACDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:45:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38980.1782117933880229707
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SYz4jn3f;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0522C62209;
	Mon, 22 Jun 2026 08:45:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA19C601BB;
	Mon, 22 Jun 2026 08:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA392106C895A;
	Mon, 22 Jun 2026 10:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782117930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=QZDY0HB8EiZYxY+APYIeYryqwJahKl2eN+qBv1eHeWs=;
	b=SYz4jn3fT8InaBCvmXnAnRVHIyejy6TsY+HZYsvxlMhftGjkVz/OYE7FKIAkHFS+uAjG5l
	0X6OZu6JPWb6VTKderO1nwDNV9rsSybDSMoW6pgp9TG4pVduNNZvgOoespzgvoNonPqEQ6
	0VItb5hyn1+lbfavJaY++3FX015NnOyzSX+jdxGwbcykrTG3R6BNv/yIFa6mzIUSKIj3VR
	RaAD+f7V7HaxqyVmZIYnd78x4fPR9lktZR76vciEjI7icWNsTU/oDVYgt/+wTh/e+exzln
	V5cbx31x4WfSZMqC1E6Tgho/Wh7xfPUkRG8mHnGbA07tUnJ8ezf12xeG4398HA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:45:28 +0200
Message-Id: <DJFG2YC0ETX6.3IGVQ4I11OJIY@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:45:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9823

The following changes since commit 76f4b5ded4aa04ca1404510f0232593a968e0f66=
:

  migration-guide: add release notes for 5.0.18 (2026-06-08 17:30:57 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 1b819d324780a699d9307a2d4e68c69b576ab748:

  ref-manual: add more explanation to glossary variable LICENSE (2026-06-22=
 10:39:37 +0200)

----------------------------------------------------------------
Peter Marko (1):
      build-manual: update ROOTFS_POSTPROCESS_COMMAND example

Robert P. J. Day (11):
      ref-manual: clarify that PACKAGE_EXCLUDE supports DEB packaging
      dev-manual: drop "PREFERRED_VERSION" from x86-base.inc snippet
      dev-manual: fix grammatical error, missing word "with"
      dev-manual: fix broken grammar in "Libraries" section
      dev-manual: fully define SOLIBS-related variables in bitbake.conf
      kernel-dev: remove references to defunct LTSI project
      dev-manual: update AUTOREV explanation to match current file
      dev-manual: SysVinit is the default init manager for Poky
      ref-manual: clarify use of "PACKAGE_ARCH" in a packagegroup
      ref-manual: document RM_WORK_EXCLUDE_ITEMS variable
      ref-manual: add more explanation to glossary variable LICENSE

 documentation/dev-manual/build-quality.rst      |  2 +-
 documentation/dev-manual/building.rst           |  2 +-
 documentation/dev-manual/external-scm.rst       | 45 +++++++++++++--------=
----
 documentation/dev-manual/init-manager.rst       |  2 +-
 documentation/dev-manual/libraries.rst          |  2 +-
 documentation/dev-manual/new-recipe.rst         |  5 ++-
 documentation/dev-manual/prebuilt-libraries.rst |  4 +--
 documentation/kernel-dev/concepts-appx.rst      | 16 ---------
 documentation/kernel-dev/intro.rst              |  6 +---
 documentation/ref-manual/classes.rst            | 19 +++++++++++
 documentation/ref-manual/variables.rst          | 19 +++++++++--
 11 files changed, 67 insertions(+), 55 deletions(-)

