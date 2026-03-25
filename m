Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AED103A9A5
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 10:49:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19306.1774435738392122236
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 03:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Kzs/XgVo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 70E414E427EF;
	Wed, 25 Mar 2026 10:48:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BC1860214;
	Wed, 25 Mar 2026 10:48:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D8B5104513F6;
	Wed, 25 Mar 2026 11:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774435735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CHIccZrndT4kOCUJDZPe4bTXtrhMnsc02SV3/a0zuAQ=;
	b=Kzs/XgVo1JL8RxjWLMJohBapgcGckFgzdGEynqnUymucUhyfLClpLfsVSguLRpYdcJzOMQ
	eskkBu7/qgr3tlKWhMr6MT029D/OmMrzWeYH0boAtf2AEeW2bWVFYCG4N6G0mamMIGGMr9
	k9LPCFcEqN7BXaKACFqZFSF+MyBrQwLo9CxvozqFPcYxyYfUtP9fqeyzpIBGskhGWcZdcX
	eunY4zHSJ20/UYmZxrySkySgyjnVBgxl1uTVEfeEMWUaoml7xaJNIvF7xZFOCAetveIRcG
	2JTJ0wYCVZ6qNUaBvaKsGc8p98lfjLbi8EtO9yv7O0IhJ7r5TLXgdMNtipirMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 11:48:54 +0100
Message-Id: <DHBSYYTJP3YB.Z3ULE9IDTRNN@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Mar 2026 10:49:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9129

The following changes since commit f2811603d829c3258d290762b31b1f6f50d40a4a=
:

  set_versions.py: fix codestyle/formatting issues (2026-03-17 13:22:35 +00=
00)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 5bfe4f9aecf542766dec727bedbb30b1f93ab64a:

  ref-manual/system-requirements.rst: remove Fedora 41 from supported distr=
os (2026-03-20 11:00:44 +0100)

----------------------------------------------------------------
Antonin Godard (1):
      ref-manual/system-requirements.rst: remove Fedora 41 from supported d=
istros

Lee Chee Yang (2):
      migration-guides: add release notes for 5.3.2
      migration-guides: add release notes for 5.0.16

Niko Mauno (1):
      recipe-style-guide: Drop obsolete EXTRA_QMAKEVARS_POST ref

 .../contributor-guide/recipe-style-guide.rst       |   2 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-5.3.rst     |   1 +
 .../migration-guides/release-notes-5.0.16.rst      | 219 +++++++
 .../migration-guides/release-notes-5.3.2.rst       | 639 +++++++++++++++++=
++++
 documentation/ref-manual/system-requirements.rst   |   2 -
 6 files changed, 861 insertions(+), 3 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.16.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.2.rst

