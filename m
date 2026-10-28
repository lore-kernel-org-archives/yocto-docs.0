Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37905.1793174718403426499
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=j/dxHtTs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 323A71A1374
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0690960769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78F54103290AA;
	Wed, 28 Oct 2026 09:05:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793174715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=h/h/Fb9kXnf0t3wDD8EtQ3+YxikncD77drb/Jn5gDW4=;
	b=j/dxHtTsxkvtsyy/MIHjsi+hrCKtwNwgrmbsjLCpsIZSbQsmpNVyV4G+fZrF4y9ri99GDV
	EsCwOEFDveSLeMHO1a3wxsWklg/jl53OlCAEMLmq05AplH2l5SKQPF9f2zGy1cUTqA8Mt/
	z10UBuMc5fZGtUPWqbC8KmFJ2fpvv2T2RjSOywgVvNUQh8WkszsP4oWNga6OO8kDrgZIKV
	AHSH++Yw1qbmyWxHNe58KBE0x8+Wx7c5M8UlbjZQZJAuL8+/RgIKSTvo2DNrpxpO/DFTMt
	HYcPFp3BXZunOc/NJIsOmnKv/hHlqDuabxwoKCgBUuqJWqB76rEvyUjmWsJn+A==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/8] Add support for documentation tags
Date: Wed, 28 Oct 2026 09:04:52 +0100
Message-Id: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyND3ZLE9GJd4yQLU4tEQ3OjpFQjJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tABJTmetoAAAA
X-Change-ID: 20261021-tags-3b858a172be2
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6351;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FMQ8rpCrJbapQ/bn+fP1zZraUMTEy9lzO1ag6QL/zYc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4ay2GdKeVzcEDck1Ogrl+loCiHVzCa5nKcjO3
 RCtbeFI7g+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauGstgAKCRDRgEFAKaOo
 NoNUEACcjbdkEABwg/CQ43+piVVcxXyJREt1NrRYKqwXxuSYJcRVT7fBhNM5U5UEwgJy4mUj5GD
 RUFLrd2XmmU27DHt67cs89lJoGfIYdLZ+j5K9cUYG5OrO4XsdUiEQRH+oyicKTaX18xBK16rix+
 zVNNw8MJ57GfAX+SciAUMtVd8lvuqkW51lkqbMiwwuO+lnZY/xMO43UClxBkINn3gt0qe/gI6Sj
 nPHAKrS9JssnqoO/WIW5Fm27c1Vj2NcC6B5JiuEpKnI/0kUoZeSfvIOwSJrMWsKW3ugtSu0DIxi
 pCZu9NMWe8L5QSIsP7rF6yrsb5kl2/DGAcIGdMmxtSi9VJ95Xi0GgZy+UeEddMg8GgwZrQiPYbI
 sKcupVaEiWF/Hs0ODGAQIoqw4zY+myxrDubVCvOmMzIMkT/F/CkQvEhogkp2dwTfgVw4PdNVxtG
 KPKusnMzzVP9Gjf1x6z8lSbOVEOtUod83RKY5jhrVMPy+7LjKw+PAi/25HHuQFEh/+OtzHjtmTl
 rgqvehckfreVkB7WbpOaj85IL15oCrBq8FsHzBzPdh/I8TyoXkoLDBa1dY78cIXmqK/XnRTf+LN
 yvIYyyYUSTbG5KNx07YhvyxEBjVltUZhcjGdtx7eBJdZUEtmYfiL8mEmGaSsPuxzavdNOlzQJnN
 xit1rC3GNZTmhmA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10730

This series aims at making discovering documentation easier for users.
The Yocto Project documentation is a long-lasting repository and
nowadays has *lots* of documentation:

=E2=9D=AF cat -p $(find . -name "*.rst" | grep -v migration-guides) | wc =
-l
61530

Looking for documentation has always been a trouble of mine, so this
series adds support for tags. Tags are keywords that show at the bottom
of pages and that group different sections of the documentation by a
common category.

For example, all sstate related pages are grouped under the 'sstate'
tag. Users wanting to learn about its concept or how to use it can know
where to go from the 'sstate' tag page.

A tag overview page is also create and lists all known documentation tags=
.

A series will be sent to OE-Core to add sphinx-tags to the buildtools
tarball used on the Autobuilder for the docs build.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (8):
      Pipfile: update dependencies for sphinx-tags
      tools/host_packages_scripts/pip3_docs.sh: update for sphinx-tags
      conf.py: enable the sphinx-tags extension
      sphinx-static/theme_overrides.css: customize tags appearance
      Makefile: use splithtml tag for html target
      docs-wide: tag sections
      index.rst: link to the tags overview page for splithtml
      standards.md: add note about document tags

 documentation/.gitignore                           |  1 +
 documentation/Makefile                             |  6 +++++-
 documentation/Pipfile                              |  2 ++
 documentation/conf.py                              |  8 ++++++++
 .../contributor-guide/identify-component.rst       |  4 ++++
 .../contributor-guide/recipe-style-guide.rst       |  4 ++++
 documentation/contributor-guide/report-defect.rst  |  4 ++++
 documentation/contributor-guide/submit-changes.rst |  4 ++++
 documentation/conventions.rst                      |  4 ++++
 documentation/dev-manual/bblock.rst                |  3 +++
 documentation/dev-manual/bmaptool.rst              |  4 ++++
 documentation/dev-manual/build-quality.rst         |  3 +++
 documentation/dev-manual/building.rst              |  3 +++
 documentation/dev-manual/creating-fragments.rst    |  4 ++++
 documentation/dev-manual/custom-distribution.rst   |  4 ++++
 .../custom-template-configuration-directory.rst    |  3 +++
 documentation/dev-manual/customizing-images.rst    |  3 +++
 documentation/dev-manual/debugging.rst             |  3 +++
 documentation/dev-manual/development-shell.rst     |  3 +++
 documentation/dev-manual/device-manager.rst        |  3 +++
 documentation/dev-manual/devtool.rst               |  4 ++++
 documentation/dev-manual/disk-space.rst            |  4 ++++
 .../dev-manual/efficiently-fetching-sources.rst    |  3 +++
 documentation/dev-manual/error-reporting-tool.rst  |  3 +++
 documentation/dev-manual/external-scm.rst          |  3 +++
 documentation/dev-manual/external-toolchain.rst    |  4 ++++
 documentation/dev-manual/gobject-introspection.rst |  3 +++
 documentation/dev-manual/hashequivserver.rst       |  4 ++++
 documentation/dev-manual/init-manager.rst          |  4 ++++
 documentation/dev-manual/layers.rst                |  3 +++
 documentation/dev-manual/libraries.rst             |  3 +++
 documentation/dev-manual/licenses.rst              |  3 +++
 documentation/dev-manual/limiting-resources.rst    |  4 ++++
 documentation/dev-manual/multiconfig.rst           |  4 ++++
 documentation/dev-manual/new-machine.rst           |  3 +++
 documentation/dev-manual/new-recipe.rst            |  3 +++
 documentation/dev-manual/packages.rst              |  3 +++
 documentation/dev-manual/poky-manual-setup.rst     |  4 ++++
 documentation/dev-manual/prebuilt-libraries.rst    |  3 +++
 .../dev-manual/python-development-shell.rst        |  3 +++
 documentation/dev-manual/qemu.rst                  |  4 ++++
 documentation/dev-manual/quilt.rst                 |  3 +++
 documentation/dev-manual/sbom.rst                  |  4 ++++
 documentation/dev-manual/speeding-up-build.rst     |  3 +++
 documentation/dev-manual/sstate-mirrors-setup.rst  |  4 ++++
 documentation/dev-manual/start.rst                 |  4 ++++
 documentation/dev-manual/temporary-source-code.rst |  4 ++++
 documentation/dev-manual/upgrading-recipes.rst     |  3 +++
 documentation/dev-manual/wayland.rst               |  3 +++
 documentation/dev-manual/wic.rst                   |  3 +++
 documentation/dev-manual/x32-psabi.rst             |  3 +++
 documentation/index.rst                            | 11 +++++++++++
 documentation/kernel-dev/index.rst                 |  4 ++++
 documentation/overview-manual/concepts.rst         |  4 ++++
 .../overview-manual/development-environment.rst    |  4 ++++
 documentation/overview-manual/yp-intro.rst         |  4 ++++
 documentation/profile-manual/index.rst             |  4 ++++
 documentation/ref-manual/devtool-reference.rst     |  4 ++++
 documentation/ref-manual/fragments.rst             |  4 ++++
 documentation/ref-manual/kickstart.rst             |  4 ++++
 documentation/ref-manual/release-process.rst       |  4 ++++
 documentation/sdk-manual/index.rst                 |  4 ++++
 .../security-manual/build-process-security.rst     |  4 ++++
 documentation/security-manual/read-only-rootfs.rst |  3 +++
 documentation/security-manual/securing-images.rst  |  3 +++
 documentation/security-manual/sstate-signing.rst   |  4 ++++
 documentation/security-manual/vulnerabilities.rst  |  3 +++
 documentation/security-reference/index.rst         |  4 ++++
 documentation/sphinx-static/theme_overrides.css    | 23 ++++++++++++++++=
++++++
 documentation/standards.md                         | 15 ++++++++++++++
 documentation/test-manual/ptest.rst                |  4 ++++
 documentation/test-manual/reproducible-builds.rst  |  4 ++++
 documentation/test-manual/runtime-testing.rst      |  3 +++
 documentation/test-manual/test-process.rst         |  4 ++++
 documentation/toaster-manual/index.rst             |  4 ++++
 .../tools/host_packages_scripts/pip3_docs.sh       |  2 +-
 76 files changed, 308 insertions(+), 2 deletions(-)
---
base-commit: 7b54854d12f3f2c909727702d39066a3d22a4a40
change-id: 20261021-tags-3b858a172be2

