Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8288FC981C
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:42:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46977.1774860129777626968
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 01:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QF1yvZHJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 080401A3097
	for <docs@lists.yoctoproject.org>; Mon, 30 Mar 2026 08:42:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1D0F5FFA8;
	Mon, 30 Mar 2026 08:42:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEB4310450C82;
	Mon, 30 Mar 2026 10:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774860127; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gN3fAKMYuin97Q2r8049+7syOvDhvNiXuJC8JxYALIY=;
	b=QF1yvZHJoq/Iz3zhPKWVPIi8AxR7sk8n/XGZSsnRTYZZNaHGYt3TpykchyMRTABub52evH
	e1Y+lkc897j+oRE8ZHsTG2rCNA8bkov9Ch5Hsobdths0ZuUdDoFrPpXgsPq59cVJHzn1gO
	jjRf2/FtdNyE9mLh4X0rvbzC14OZ14apIdL0PyjwpNpiDiJ6XQ/+9mDKKv+QPpxQbk5aps
	n7TRftzB/dYkEXKhOZ2UwhI/20atbXQNWxEe6ZJEy76EwHUIed5rEr1vOBKi2EvF1ywo3I
	fytRDVlkuCumK1voBmLCzEls46qBZIF6TqITDWJ/h+CHVTzBlyi36jJsLFEFJQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 10:42:06 +0200
Message-Id: <DHFZELR6D1BT.3RN7O6PUJQDJN@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 30 Mar 2026 08:42:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9141

The following changes since commit 5bfe4f9aecf542766dec727bedbb30b1f93ab64a=
:

  ref-manual/system-requirements.rst: remove Fedora 41 from supported distr=
os (2026-03-20 11:00:44 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to dc1574b9f71532c469f355af2ff5ff5664083e48:

  ref-manual: document the usage of FIT_LOADABLES (2026-03-30 10:40:23 +020=
0)

----------------------------------------------------------------
Antonin Godard (8):
      conf.py: define new {oecore,bitbake,meta_yocto}_rev roles
      ref-manual/variables.rst: document qemuboot variables
      ref-manual/variables.rst: SPDX_PACKAGE_URL: add missing parenthesis
      ref-manual/variables.rst: document the LTO variable
      ref-manual/variables.rst: document the SPDX_CONCLUDED_LICENSE variabl=
e
      migration-guides: update 6.0 (Wrynose) release notes
      docs-wide: add warning on disabled NPM fetcher
      ref-manual/faq.rst: remove the CVS proxy note

Francesco Valla (1):
      ref-manual: document the usage of FIT_LOADABLES

Stefano Tondo (1):
      ref-manual/dev-manual: document new SPDX variables and capabilities

 documentation/conf.py                              |  16 +-
 documentation/dev-manual/devtool.rst               |   5 +
 documentation/dev-manual/packages.rst              |  10 +-
 documentation/dev-manual/sbom.rst                  |  18 +
 documentation/migration-guides/migration-6.0.rst   | 193 +++++++-
 .../migration-guides/release-notes-6.0.rst         | 455 +++++++++++++++++=
-
 documentation/ref-manual/classes.rst               |  21 +-
 documentation/ref-manual/faq.rst                   |   2 +-
 documentation/ref-manual/variables.rst             | 527 +++++++++++++++++=
+++-
 9 files changed, 1218 insertions(+), 29 deletions(-)

