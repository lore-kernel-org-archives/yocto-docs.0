Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9055FF8FA80
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 13:44:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30117.1776779088781932125
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 06:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q4zaQ3Md;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C96BCC5C9AF;
	Tue, 21 Apr 2026 13:45:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B053600D2;
	Tue, 21 Apr 2026 13:44:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF24210460872;
	Tue, 21 Apr 2026 15:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776779086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=olN3pbSTpYj6aNO/oR3+uSV13W8JuoV9RteNIQV8qmU=;
	b=Q4zaQ3MddXCpjCbGYUmayBpUWUjGB9JiQzrFepPadZA5uGqTQjIegGRBbWnHu0kEBYvaTu
	7Br4K81NZwRj3xflVplHfvIFwUQUTLq7sOPAdTWKVLp3TiaSnywHrP80LuV9/9yyzJ5zpx
	SQdGK3lpUKnA7eIrl2d+kBCL9YKd1jmQ1+dhA0Fq9Az7SJo+lNtsQ+Jszps2hC2LOp2gt2
	lgnp7wbI9rIzVPcCLfEOSBG3UBGM2NaYhpjT52MOhP+UGdH6EOfixRUNbiCochaDtBJwui
	TMGFXhR6k4+9cZ6I1KTNkYAorFeG174IXvw4qjnDDFZThwiSN+uWzH/KCso2xg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 15:44:43 +0200
Message-Id: <DHYVMAQR7ULJ.35X1W6KVSNQOU@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 13:44:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9296

Hi Paul,

Here is a pull request that includes a first batch of docs updates for the
coming Wrynose release.

Alongside, we've got a patch that switches the documentation website to be
fixed-width. This patch was also backported to whinlatter, scarthgap, and
kirkstone to be consistent across all releases that we currently display on=
 the
website. This is why I'm also sending PRs for whinlatter and kirkstone (CC'=
ed
Yoann to this email too for context).

Please do not block the Whinlatter build because of these changes, as anywa=
y the
docs website displays the branch tip, not the latest tag.

Thanks,
Antonin

The following changes since commit 2c12ec7bf29aedeacf82970a9d2eb262fde4670e=
:

  ref-manual/variables.rst: fix wording in COMPATIBLE_MACHINE note (2026-04=
-16 14:31:11 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to eb74fdfd9e5e579a65e8872d1a73b51e77b14f63:

  ref-manual/system-requirements.rst: instruct to install a buildtools tarb=
all for leap 15.6 (2026-04-21 15:25:47 +0200)

----------------------------------------------------------------
Antonin Godard (22):
      sphinx-static/theme_overrides.css: switch to a fixed width documentat=
ion
      conf.py: define new *_path roles
      ref-manual/classes.rst: document the kernel-yocto-rust class
      ref-manual/classes.rst: document the module-rust class
      ref-manual/classes.rst: document the KCONFIG_CONFIG_ROOTDIR variable
      ref-manual/variables.rst: document the UKI_DEVICETREE variable
      docs-wide: refresh SBOM documentation after SPDX2.2 removal
      dev-manual/sbom.rst: add bullet point on recipe SBOM
      ref-manual/variables.rst: document the SPDX_PACKAGE_URLS variable
      ref-manual/variables.rst: document the SPDX_GIT_PURL_MAPPINGS variabl=
e
      ref-manual/variables.rst: document the SPDX_INCLUDE_VEX variable
      migration-guides/migration-6.0.rst: add note on WIC_SECTOR_SIZE
      ref-manual: document the sbom-cve-check class, fragment, and variable=
s
      docs-wide: adapt to the new {DISTRO,MACHINE}_FEATURES mechanism
      ref-manual/features.rst: drop pcmcia from DISTRO_FEATURES
      ref-manual/features.rst: drop usbhost/usbgadget from DISTRO_FEATURES
      docs-wide: replace meta-poky/conf/templates/default by oecore's templ=
ates
      migration-guides: update 6.0 (Wrynose) release notes
      migration-guides/migration-6.0.rst: tidy up the file
      dev-manual/new-recipe.rst: rework Unpacking Code section
      ref-manual/system-requirements.rst: make python3-websockets a default=
 host requirement
      ref-manual/system-requirements.rst: instruct to install a buildtools =
tarball for leap 15.6

Benjamin Robin (1):
      variables: add precision about special characters in CVE_PRODUCT

Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.17

Robert P. J. Day (1):
      variables.rst: expand explanation of RSUGGESTS

 documentation/conf.py                              |   3 +
 .../custom-template-configuration-directory.rst    |   2 +-
 documentation/dev-manual/gobject-introspection.rst |  12 +-
 documentation/dev-manual/licenses.rst              |   4 +-
 documentation/dev-manual/new-recipe.rst            |  24 +-
 documentation/dev-manual/poky-manual-setup.rst     |   2 +-
 documentation/dev-manual/sbom.rst                  |  43 ++--
 documentation/migration-guides/migration-5.3.rst   |   2 +
 documentation/migration-guides/migration-6.0.rst   | 207 ++++++++++++++--
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.17.rst      | 263 +++++++++++++++++=
++++
 .../migration-guides/release-notes-6.0.rst         | 256 +++++++++++++++++=
+--
 documentation/overview-manual/concepts.rst         |   5 +-
 documentation/ref-manual/classes.rst               |  94 +++++++-
 documentation/ref-manual/faq.rst                   |   2 +-
 documentation/ref-manual/features.rst              | 109 +++++----
 documentation/ref-manual/fragments.rst             |  20 ++
 documentation/ref-manual/structure.rst             |  18 +-
 documentation/ref-manual/system-requirements.rst   |  36 +++
 documentation/ref-manual/variables.rst             | 244 ++++++++++-------=
--
 documentation/sphinx-static/theme_overrides.css    |  17 +-
 .../host_packages_scripts/fedora_essential.sh      |   2 +-
 .../opensuse_essential_16.0.sh                     |   2 +-
 23 files changed, 1091 insertions(+), 277 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.17.rst

