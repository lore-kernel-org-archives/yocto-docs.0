Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB872CA0FFF
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 07:41:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.8085.1756453284665731527
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 00:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=o0gCZkX0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 64C361A0E44
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D982606B9
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 864281C22D663;
	Fri, 29 Aug 2025 09:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756453282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ueQYC5c7LxaRD2l5puv9jEIdpUZYDutjg8u8WVUXVZE=;
	b=o0gCZkX04AX5V3TUvTixqSTG2dhmGsviSZNtpsfNWs4wAbHjWCVNSzEeQAMx4E7SoWNHJQ
	u2QkViDXZ6wTdi/il18+UVaM4lNIs5SR58cU8Niz78ACdWJM/YYyBm+VwQn+a4yuwWuJLq
	b+d6YEvU5gktkYQKYHmkMZq6fb0INKUYXIoMZMJAFdySpSlx5Pbuyj0XwJUGMEhf3p2zBm
	2H/4DAaNbnUaJEPt0lBg4GrpxaG4o0z6cuaY0ACauu0nT1a5RSiHwS7z3djyCkICuoT3GJ
	Nase8rSC2OjNqOawyE3Ww0NXVZZ6s7WxCE59XegUAxbVtD2a8qFp1O8SS/7KOQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 00/19] Updates from Poky master
Date: Fri, 29 Aug 2025 09:41:00 +0200
Message-ID: <175645283483.82658.11176847847296415255.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
References: <20250729-release-note-5-3-first-bunch-v1-0-058971e37c93@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 07:41:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7466


On Tue, 29 Jul 2025 11:56:34 +0200, Antonin Godard wrote:
> Update the documentation with regards to the latest changes on Poky's
> master branch.
>=20
> This covers commits from c4a5e590b53b ("rust-llvm: Compile llvm to use
> dynamic libraries") to 2a832e6af1b6 ("orc: set CVE_PRODUCT") in Poky.
>=20
> This series depends on:
> https://lore.kernel.org/r/20250724-bb-defer-bbclasses-v1-1-70f1826d4b83=
@bootlin.com
> and
> https://lore.kernel.org/r/20250728-refactor-qa-checks-v2-0-9e0737979f05=
@bootlin.com
>=20
> [...]

Applied, thanks!

[01/19] ref-manual/tasks.rst: add documentation for do_recipe_qa
        commit: d3f172b600413b58ee51c70e9dd4f69b32fdc5f8
[02/19] ref-manual/variables.rst: document SPDX_PACKAGE_URL
        commit: 108549dae76a582bc98d3b7bd976e0239a6b92a6
[03/19] ref-manual/variables.rst: document KMETA_CONFIG_FEATURES
        commit: 1a9f68b875a78c1c7681ed300111399de97631e6
[04/19] ref-manual/variables.rst: document TESTSDK_SUITES
        commit: fbc6db0ab525c7e46774c01fc595f30d6d0fe3c1
[05/19] ref-manual/variables.rst: document PSEUDO_INCLUDE_PATHS
        commit: 5fc49ee007d22c7dc28c11ea579c804881b9cb8f
[06/19] Drop the icecc class and related variables
        commit: 30c9413c5106bcbcc1600ef16b8d0cece86d8158
[07/19] ref-manual/variables.rst: document the FIT_CONF_PREFIX variable
        commit: 860891492b96eb127af5e7bab6348fca12167c68
[08/19] ref-manual/variables.rst: add link for BB_DEFER_BBCLASSES
        commit: bf3c2ade55e4d90dd50f39d01405352cd48c1703
[09/19] ref-manual/variables.rst: document SPL_DTB_BINARY
        commit: 05eb461cb1da76ad9cbaf634da7f47447b3f6765
[10/19] ref-manual/variables.rst: document UBOOT_VERSION
        commit: a9a4bcc754b9400fa6d3c0297e86771f03325590
[11/19] ref-manual/classes.rst: document the go-mod-update-modules class
        commit: b1a9848d2bba9e1392d153ff992304b83b259318
[12/19] ref-manual/variables.rst: document OE_SHARED_UMASK
        commit: b0a6f80a3216faf6c6add785aab2257a53b667dc
[13/19] ref-manual/variables.rst: document CVE_CHECK_VEX_JUSTIFICATION
        commit: cee3eb30cc736d990f2232ede0bc6d9686a63713
[14/19] ref-manual/classes.rst: document the testexport class
        commit: 362a331255525fc853dab3af4ec905c417fabb0b
[15/19] docs-wide: update wic source plugin names
        commit: 7224d7733e9e0f423475e1b9c5b48aff0de1f744
[16/19] ref-manual/tasks.rst: do_package_qa: update link to qa checks
        commit: 0fcd1a352ae364bee191e7d160b2fec35431fcfd
[17/19] ref-manual/qa-checks.rst: add space around equal warning
        commit: da2e9d45a4c70c5d78d225277a85cc4173e4ee7a
[18/19] docs-wide: fix space around equal assignments
        commit: 77ce1544dd793036b1135817c02e090138fe6407
[19/19] migration-guides/release-notes-5.3: updates
        commit: c8d852ad63219d067e497a77d489a4011b0d0a26

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

