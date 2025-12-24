Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDC6E7545C
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123711.1766593908528161115
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yw537Sx9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0F83A1A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA8596073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C117102F0CD4;
	Wed, 24 Dec 2025 17:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wmacNUMFTTFfpNlfudV+0sZzKAhMGw4RWSIKF+IFO3o=;
	b=yw537Sx9SVsf003dfLkeosMU7rqFaZxP6FEreHB4emC4oEyqiPVwJgAPbVAXpOBhWm9vfU
	ojxnvtf6Yh/JTt0KwLSVPVxUzgYlRHtE6w6tpYbD03YKm5fDGP2PY11SSIEBpyhe58tVTT
	m/wjzqMbSs/7pB2/qy33NmBfNvQNkNepboUpMZ4paFCJ4dW72OQc66OYVLZJF5ryh4DfeL
	q34Ysm3rDfHmeVdudza1tfMVBFZdSWX5wo6uaBB86F/f7XxQ910ThyxRgbh+Ksxcl8UjAV
	MQG8sFBEHklo3joGHbqL/aSWONN1ePr+oMBKmhrDK+gjfa58ppoFXlHqWNPqtg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/53] Remove obsolete poky repo references
Date: Wed, 24 Dec 2025 17:31:26 +0100
Message-Id: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8VTGkC/0WOyw6DIBREf8WwLgkg+PqVxoXC0NLGR0FNG+O/F
 2vT7u7kzsyZlQR4h0CqZCUeiwtu6KPgp4Toa9NfQJ2JmggmFBdCUo9uWEDH4f6Kt4VHrxFoyjN
 RyjZVKrckhsf4c89P8bk+dJjbG/S0t30dHo85EqfD9gdWyQ83wXdhB8X8lWqjjRIloFhRLXyva
 ZsAqoeuc1OV2JJJAW4apSTjuYXMZMY0t0a0xhY6jwttwwtSb9sbBtddk/sAAAA=
X-Change-ID: 20251224-remove-poky-references-316294b3557f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9051;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/NHUmefUaMUJOVUNC1xkD7cE/6Jt3LPdqvxLHXvnC5g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVm8kQuSmkcsQ+gaYGamHnSCoyaZcRa3KUAi
 sycSyRF6qqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVZgAKCRDRgEFAKaOo
 NsiFD/93dyV4/izwEEBcxLnAj6agnPEQhQnALvWP1EdGGXq4C6N5QUP1w6xPj7ddzEbCzgnn7wt
 QTHjxdaHoFGZkxnUBiBbekmTqNxt1nrvKMZi2roNeyX6gRJi6petRXNxWKHWJdILdvHx/sPifVW
 wZqazIZJfean5oy/+q0xxKDHqNCDpUtm5nBdRDKb+W3esvSU/hkyzIaoEzTm3430P3kyBKWWoKf
 yjizcyDQPlWURuApBkz4PMvXq8JGsdLdj8m9Ckxv3ntmc9lOfCar+dXpzgyK12iCW9qA9Cgefcq
 9XOBHd6Ov/TrehzToW81B5SESXv+p1gv2KWR5SndCfOh9rvJf5COx1NuKMQ6xtdkXatt6leZ764
 7HRQbDn6sAOscgFXd6uf4kjU0cb4BXckAd+nOIHhekakCdlXaVacJeVzUfEErlCaECEu8pBxIYo
 66XDO7ZcxKj04AokwcUbuT8cXrpBlOBz2SQId5DBMRtbCWUpQRXBB3I+0+2Ml0BV95IyzdtK3yS
 1jafI5BfcyXCecsVC2AD79pLGiv0ikfeCFWUq7vYS5d7WFbYbD12ZVuptbBeyLC55vGF5LQKaOK
 4WPYNR2N53aCut1B7jZm/YT+Us5pC7ceMUHxqhFxY5zEXkHJca8d/D4e1XjtWrBxT57fZCo9GDe
 T74SOPSmLiZHr1g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8329

The Poky repository's master branch is no longer updated:
https://git.yoctoproject.org/poky/tree/README

Many places in the documentation were still making references to Poky as
in the repository. Migrate the documentation in two steps:

Check all occurrences of "poky" or "source directory"
(case-insensitive/multiline match), and reformulate/adapt.

Most of the occurrences will usually be a path in Poky that can be
replaced by OE-Core/meta-yocto.

Some others are more tricky, and needed some re-organization / rework.
For that reason, patch were split by files, to make reviewing/merging
easier and incremental.

This series depends on the "Redefine terms now that the Poky repository is
obsolete" series which redefines terms used to replaces occurrences
here.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (53):
      transitioning-to-a-custom-environment.rst: remove obsolete poky repo references
      dev-manual/start.rst: remove obsolete poky repo references
      dev-manual/poky-manual-setup.rst: remove obsolete poky repo references
      bsp-guide/bsp.rst: remove obsolete poky repo references
      kernel-dev/advanced.rst: remove obsolete poky repo references
      contributor-guide/submit-changes.rst: remove obsolete poky repo references
      dev-manual/building.rst: remove obsolete poky repo references
      dev-manual/debugging.rst: remove obsolete poky repo references
      dev-manual/error-reporting-tool.rst: remove obsolete poky repo references
      dev-manual/external-toolchain.rst: remove obsolete poky repo references
      dev-manual/layers.rst: remove obsolete poky repo references
      dev-manual/layers.rst: remove obsolete poky repo references
      dev-manual/libraries.rst: remove obsolete poky repo references
      dev-manual/new-recipe.rst: remove obsolete poky repo references
      dev-manual/securing-images.rst: remove obsolete poky repo references
      dev-manual/temporary-source-code.rst: remove obsolete poky repo references
      dev-manual/wayland.rst: remove obsolete poky repo references
      dev-manual/wic.rst: remove obsolete poky repo references
      kernel-dev/common.rst: remove obsolete poky repo references
      migration-guides/migration-1.4.rst: remove obsolete poky repo references
      overview-manual/concepts.rst: remove obsolete poky repo references
      overview-manual/development-environment.rst: remove obsolete poky repo references
      overview-manual/yp-intro.rst: remove obsolete poky repo references
      ref-manual/classes.rst: remove obsolete poky repo references
      ref-manual/images.rst: remove obsolete poky repo references
      ref-manual/structure.rst: remove obsolete poky repo references
      ref-manual/tasks.rst: remove obsolete poky repo references
      ref-manual/variables.rst: remove obsolete poky repo references
      sdk-manual/appendix-obtain.rst: remove obsolete poky repo references
      sdk-manual/intro.rst: remove obsolete poky repo references
      test-manual/runtime-testing.rst: remove obsolete poky repo references
      toaster-manual: remove obsolete poky repo references
      README: remove obsolete poky repo references
      contributor-guide/identify-component.rst: remove obsolete poky repo references
      dev-manual/build-quality.rst: remove obsolete poky repo references
      dev-manual/custom-distribution.rst: remove obsolete poky repo references
      dev-manual/custom-template-configuration-directory.rst: remove obsolete poky repo references
      dev-manual/init-manager.rst: remove obsolete poky repo references
      dev-manual/licenses.rst: remove obsolete poky repo references
      dev-manual/packages.rst: remove obsolete poky repo references
      dev-manual/python-development-shell.rst: remove obsolete poky repo references
      dev-manual/qemu.rst: remove obsolete poky repo references
      dev-manual/upgrading-recipes.rst: remove obsolete poky repo references
      dev-manual/vulnerabilities.rst: remove obsolete poky repo references
      ref-manual/devtool-reference.rst: remove obsolete poky repo references
      ref-manual/faq.rst: remove obsolete poky repo references
      ref-manual/features.rst: remove obsolete poky repo references
      ref-manual/release-process.rst: remove obsolete poky repo references
      ref-manual/system-requirements.rst: remove obsolete poky repo references
      ref-manual/yocto-project-supported-features.rst: remove obsolete poky repo reference
      test-manual/reproducible-builds.rst: remove obsolete poky repo references
      test-manual/understand-autobuilder.rst: remove obsolete poky repo references
      what-i-wish-id-known.rst: remove obsolete poky repo references

 documentation/README                               |  39 +--
 documentation/brief-yoctoprojectqs/index.rst       |   2 +-
 documentation/bsp-guide/bsp.rst                    | 160 ++++------
 .../contributor-guide/identify-component.rst       |   9 -
 documentation/contributor-guide/submit-changes.rst |  29 +-
 documentation/dev-manual/build-quality.rst         |   2 +-
 documentation/dev-manual/building.rst              |  40 +--
 documentation/dev-manual/custom-distribution.rst   |   8 +-
 .../custom-template-configuration-directory.rst    |   8 +-
 documentation/dev-manual/debugging.rst             |  16 +-
 documentation/dev-manual/error-reporting-tool.rst  |   3 +-
 documentation/dev-manual/external-toolchain.rst    |   2 +-
 documentation/dev-manual/init-manager.rst          |   6 +-
 documentation/dev-manual/layers.rst                | 297 +++++++------------
 documentation/dev-manual/libraries.rst             |   8 +-
 documentation/dev-manual/licenses.rst              |  28 +-
 documentation/dev-manual/new-recipe.rst            |  16 +-
 documentation/dev-manual/packages.rst              |   8 +-
 documentation/dev-manual/poky-manual-setup.rst     |  28 +-
 .../dev-manual/python-development-shell.rst        |   2 +-
 documentation/dev-manual/qemu.rst                  |  11 +-
 documentation/dev-manual/securing-images.rst       |   4 +-
 documentation/dev-manual/start.rst                 | 324 +++------------------
 documentation/dev-manual/temporary-source-code.rst |   4 +-
 documentation/dev-manual/upgrading-recipes.rst     |  22 +-
 documentation/dev-manual/vulnerabilities.rst       |  20 +-
 documentation/dev-manual/wayland.rst               |   2 +-
 documentation/dev-manual/wic.rst                   |  20 +-
 documentation/kernel-dev/advanced.rst              |  12 +-
 documentation/kernel-dev/common.rst                | 149 ++++------
 documentation/migration-guides/migration-1.4.rst   |   2 +-
 documentation/overview-manual/concepts.rst         |  77 ++---
 .../overview-manual/development-environment.rst    |  95 +++---
 .../figures/poky-reference-distribution.png        | Bin 23784 -> 0 bytes
 documentation/overview-manual/yp-intro.rst         | 155 ++--------
 documentation/ref-manual/classes.rst               |  34 ++-
 documentation/ref-manual/devtool-reference.rst     |   8 +-
 documentation/ref-manual/faq.rst                   |  43 ++-
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/fragments.rst             |   2 +
 documentation/ref-manual/images.rst                |   5 +-
 documentation/ref-manual/release-process.rst       |   6 +-
 documentation/ref-manual/structure.rst             | 155 +++++-----
 documentation/ref-manual/system-requirements.rst   |  12 +-
 documentation/ref-manual/tasks.rst                 |  10 +-
 documentation/ref-manual/terms.rst                 |   2 +-
 documentation/ref-manual/variables.rst             | 149 +++++-----
 .../yocto-project-supported-features.rst           |   2 +-
 documentation/sdk-manual/appendix-obtain.rst       |  27 +-
 documentation/sdk-manual/intro.rst                 |   8 +-
 documentation/test-manual/reproducible-builds.rst  |   8 +-
 documentation/test-manual/runtime-testing.rst      |   4 +-
 .../test-manual/understand-autobuilder.rst         |   2 +-
 documentation/toaster-manual/reference.rst         |  12 +-
 documentation/toaster-manual/setup-and-use.rst     |  56 ++--
 documentation/toaster-manual/start.rst             |   6 +-
 .../transitioning-to-a-custom-environment.rst      |  21 +-
 documentation/what-i-wish-id-known.rst             |   5 +-
 58 files changed, 785 insertions(+), 1402 deletions(-)
---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20251224-remove-poky-references-316294b3557f
prerequisite-change-id: 20251224-terms-refresh-cdcd529ee508:v1
prerequisite-patch-id: b7b67e1bba73c55f30b2d386e7f389edd65ccc55
prerequisite-patch-id: 39e885d60801727fff2c835f0c1904287a8223ad
prerequisite-patch-id: 24b72cfa745a96bee141c53a9a69dcd5fcb17019
prerequisite-patch-id: 5d3a0d233c97fb5eb2e09f729dafbf0ef7c1883f
prerequisite-patch-id: 99720dcd01f9c1bd80097bced9e19aa7ceb2c107


