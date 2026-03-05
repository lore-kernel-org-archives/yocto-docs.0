Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B381F3D33D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:13:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49577.1772730820521240684
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L4KsFcan;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 129641A2CD1;
	Thu,  5 Mar 2026 17:13:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDDB65FF89;
	Thu,  5 Mar 2026 17:13:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E14C103698B4;
	Thu,  5 Mar 2026 18:13:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772730818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dmq3g5jkgKKNsdwZ2UnVpMckuqXq9j35hD74jITkIHI=;
	b=L4KsFcan5K2DCuEVONozWVjcTbVrLhVEbN3qaLj0xZmTAdeAqZBN54gVPqJaDCr6ZF/bO2
	ofywkxQEvSBJaQjwURhyMzYRtqAmb4V/PIrS15lueUIXb8CXSbpAb+H6KXsYM3M0M8PCyU
	pT94N3kyPmIa+Yx/auKaLuC8sjvSLqxW2d/6mRSQ61CKA90iWCVPK2xiWhQrxaFkDGWBCF
	c3FWCzRi9MmTVhXJN6j2YHjFVysDPBohIhRCIxvC9cWqtNV3FeOB/VHRYCHmIscDxAigqG
	iIl6ASO3iGxfsC4z5d6xTBGW3zf3ypUnrnynslsjlEAw+lxvWoBpfjHsng/vnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 18:13:38 +0100
Message-Id: <DGV0MN6Z1YZH.EOBW2WJOWKHS@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:13:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9077

The following changes since commit d97cfeaa55ed42722998d3313c1857aa377f6881=
:

  tools/containerfiles: fix docker warning (2026-02-27 10:54:14 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 92a1c1d98fe410eb9323b46d568633b0f32b3e83:

  ref-manual/system-requirements: add fedora 43 as supported distro (2026-0=
3-05 12:01:32 +0100)

----------------------------------------------------------------
Kristiyan Chakarov (1):
      overview-manual: escape wildcard in inline markup

Quentin Schulz (3):
      overview-manual/concepts: list other possible class directories
      ref-manual/system-requirements: update list of EoL distros we still t=
est
      ref-manual/system-requirements: add fedora 43 as supported distro

Robert P. J. Day (1):
      ref-manual: delete claim PACKAGE_EXCLUDE does not support .deb

 documentation/overview-manual/concepts.rst       | 5 +++--
 documentation/ref-manual/system-requirements.rst | 3 +++
 documentation/ref-manual/variables.rst           | 3 ---
 3 files changed, 6 insertions(+), 5 deletions(-)

