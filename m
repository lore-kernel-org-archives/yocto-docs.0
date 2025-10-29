Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18126CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 08:36:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.2452.1761726973614421093
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 01:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dY9rocft;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D2DD61A172C
	for <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 08:36:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8EA6606E8;
	Wed, 29 Oct 2025 08:36:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05E8210311148;
	Wed, 29 Oct 2025 09:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761726970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dSAr7g17c9YtDI4C/b2MrtbaYiuiuhhth0RwCtLxsYY=;
	b=dY9rocftszNZbMlE4dKW2DFFwIrmE3dir8lm0Pt7PccQM/Tpx8K1DaeLb/3L3MtoCttD28
	C91KdZIR/pN2C6BmJadykVku00fMWhR6ADEYax39ASRUcj9Y4b1CyLEaUrPFK2h7yCPRpr
	k2WN5GL+x1/EK1XJGACx+Raor9kkcrLRjFlzd7GvtV2Wq4VJOUW3+tt/J717N1mf67rjVN
	n04d8jMykALdzack8nzfTvh8uhP7SrJ7BYAiFivVN2taZQuosRp2ZNyaXqZzAusVBClg9n
	CkhrW9sXmOSDlVk2Q+gqGB3SsxyQJzqgy3gxxZJ6t3/JtMJy3rMcxUFBi1nCNQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 09:36:09 +0100
Message-Id: <DDUO38T27G3T.1P7LBZ0Z45YIH@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 08:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7890

The following changes since commit fca48e1239950ccf10f6b1b805c5734104144ded=
:

  vulnerabilities: update nvdcve file name (2025-10-13 09:13:46 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 073f3bca4c374b03398317e7f445d2440a287741:

  ref-manual/classes.rst: document the relative_symlinks class (2025-10-27 =
17:09:19 +0100)

----------------------------------------------------------------
Antonin Godard (9):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation
      ref-manual/classes,variables: document the CCACHE_DISABLE variable
      ref-manual/variables.rst: document the REQUIRED_MACHINE_FEATURES vari=
able
      ref-manual/variables.rst: document the REQUIRED_COMBINED_FEATURES var=
iable
      ref-manual/variables.rst: document the REQUIRED_IMAGE_FEATURES variab=
le
      ref-manual/variables.rst: document the USE_NLS variable
      ref-manual/classes.rst: gettext: extend the documentation of the clas=
s
      ref-manual/classes.rst: document the relative_symlinks class

Jo=C3=A3o Marcos Costa (1):
      variables.rst: fix LAYERDEPENDS description

Paul Barker (1):
      dev-manual, test-manual: Update autobuilder output links

 documentation/dev-manual/vulnerabilities.rst      |  2 +-
 documentation/ref-manual/classes.rst              | 96 ++++++++++++++++++-=
----
 documentation/ref-manual/variables.rst            | 71 ++++++++++++++++-
 documentation/test-manual/reproducible-builds.rst |  2 +-
 documentation/test-manual/test-process.rst        |  2 +-
 5 files changed, 151 insertions(+), 22 deletions(-)

