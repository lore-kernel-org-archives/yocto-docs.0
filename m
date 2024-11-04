Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012DDD132BB
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 12:40:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.56451.1730724012209203634
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 04:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=gm1 header.b=gMtVhHst;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 944291BF20E;
	Mon,  4 Nov 2024 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730724010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bz7hInad1m1w+uKQuwLG1U4suHkyE9eoQLmLrmUBkmU=;
	b=gMtVhHstbGcZoEpfGJ5DJSOlFUpCPggsLN6Y5yYd/Oc1qaJ+Wwy9Sq+CuEm7JEuraecA+h
	nIUpP3doVmbRVVNUTIRLlqm1EAK/DoAyzBHVCS3Vld8kXSKEHqwFXBtVrP4WSlZmSBE47Z
	tWwNP1f+01GP7zUNYeDwmyIZw8FZbwA65uLDynG9skllWuHtAZiomsKATN1pLlZfRRWGix
	5+8Uufr/Hu6yLG7ZiYcJzmZ++J3Ix7J1cxFUwwVuWQXG51o0jmsVbAciTwlrhrmqnC/cfe
	IsvC1bhm0CDplY5a2kZLasxX5V1zXCQaLVAeR+A3NI8k8haw3YmDw/vq9KJqpg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 04 Nov 2024 13:39:53 +0100
Subject: [PATCH] conf.py: rename :cve: role to :cve_nist:
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-new-cve-role-v1-1-4d2c6efa364a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJnAKGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwMT3bzUct3kslTdovycVF0LkySLlNSkRMtkM3MloJaCotS0zAqwcdG
 xtbUAa+TCPl4AAAA=
X-Change-ID: 20241104-new-cve-role-84b8deba9c67
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Julien Stephan <jstephan@baylibre.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=460059;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OZgiOl9lXsNDomH6FffhxJ0rRsiN9Uzqd1ZBIBQe36Y=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnKMCpwzoRPYvUG+xzWXZSBId8G5RgF8kdG+Ueo
 wuYldliOhGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZyjAqQAKCRDRgEFAKaOo
 NoVzEACv4cSI9dWewzFWgghec/F9dv95DFqVBH/Ps+byhAMUW5iSk0UsmPJ58G3veW+MXbOX3xD
 FYGSniJ5IC/BvBAf7Ygl+VzEFBjvwpWBk9n+/BKGjI0YXimiazd2tOZHWDgTPdkNBn8ZiFZ6HZq
 HWZ0MNFGKHvPSj6bNY+t7o3re4L1i4fHbVcllM1EbU52GDMoa/BOUYsl34TIStbSo4KzKKXAhla
 R60pnZZGvxlZ2EUW8goSWqShui+s3Gl9rxsMwg7ydIiapaPAjhEHk0RufWJj0gwCrhxoa2Gh1j4
 1PNwgvOFZRIcl2L0jZno+evcMeuexea+AbC4gfLkCGZfOW5bhfbx2qcx0S3N6iiNubtgkHnUSg4
 Kw0RqI1hy+YToEm5KS2wGf3d3FNdscpWlc+Y8kO8VUVYZ6TcjpljaplEqL5UIpoBCFTYCews/4M
 REgleL6SzffIYELyphXFmF1xlSF9JRXp09TZ/+syf2DELjWv191MFxTwAUZitCSuarDRctf+M/C
 TXJV60mzWNPgoU83ZilEvbGpUFnQWQ9T1P7OPdaEkNE6hx6FsKpdR2JxV0cSMvUcxpKXFcwpR/L
 7PeSH3IEWa9kyD4rAmU1nDMYACtjNO/ojZ0awOqj520gx4PqBIXO730MNCICizCoviZuBcRFX0O
 4YQp+CxdKgGoCcQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 12:40:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5654

Newer versions of Sphinx already define a :cve: role that points to
cve.org, instead of the role we defined in conf.py that points to
nvd.nist.gov.

Rename our role to :cve_nist: to avoid warnings (treated as errors).
This is also backwards compatible, meaning we can build the doc with an
older Sphinx if needed.

Suggested-By: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Following the discussion https://lore.kernel.org/yocto-docs/20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com/T/#t.
---
 documentation/conf.py                              |  2 +-
 .../contributor-guide/recipe-style-guide.rst       |  2 +-
 .../migration-guides/release-notes-3.4.1.rst       | 14 ++--
 .../migration-guides/release-notes-3.4.2.rst       | 40 +++++------
 .../migration-guides/release-notes-3.4.3.rst       | 10 +--
 .../migration-guides/release-notes-3.4.4.rst       |  6 +-
 .../migration-guides/release-notes-3.4.rst         | 56 +++++++--------
 .../migration-guides/release-notes-4.0.1.rst       | 10 +--
 .../migration-guides/release-notes-4.0.10.rst      | 42 ++++++------
 .../migration-guides/release-notes-4.0.11.rst      | 24 +++----
 .../migration-guides/release-notes-4.0.12.rst      | 48 ++++++-------
 .../migration-guides/release-notes-4.0.13.rst      | 68 +++++++++---------
 .../migration-guides/release-notes-4.0.14.rst      | 56 +++++++--------
 .../migration-guides/release-notes-4.0.15.rst      | 34 ++++-----
 .../migration-guides/release-notes-4.0.16.rst      | 30 ++++----
 .../migration-guides/release-notes-4.0.17.rst      | 42 ++++++------
 .../migration-guides/release-notes-4.0.18.rst      | 32 ++++-----
 .../migration-guides/release-notes-4.0.19.rst      | 36 +++++-----
 .../migration-guides/release-notes-4.0.2.rst       | 14 ++--
 .../migration-guides/release-notes-4.0.20.rst      | 16 ++---
 .../migration-guides/release-notes-4.0.21.rst      | 48 ++++++-------
 .../migration-guides/release-notes-4.0.22.rst      | 30 ++++----
 .../migration-guides/release-notes-4.0.3.rst       | 30 ++++----
 .../migration-guides/release-notes-4.0.4.rst       | 22 +++---
 .../migration-guides/release-notes-4.0.5.rst       | 10 +--
 .../migration-guides/release-notes-4.0.6.rst       | 44 ++++++------
 .../migration-guides/release-notes-4.0.7.rst       | 40 +++++------
 .../migration-guides/release-notes-4.0.8.rst       | 20 +++---
 .../migration-guides/release-notes-4.0.9.rst       | 42 ++++++------
 .../migration-guides/release-notes-4.0.rst         | 62 ++++++++---------
 .../migration-guides/release-notes-4.1.1.rst       | 22 +++---
 .../migration-guides/release-notes-4.1.2.rst       | 24 +++----
 .../migration-guides/release-notes-4.1.3.rst       | 36 +++++-----
 .../migration-guides/release-notes-4.1.4.rst       | 34 ++++-----
 .../migration-guides/release-notes-4.1.rst         | 60 ++++++++--------
 .../migration-guides/release-notes-4.2.1.rst       | 14 ++--
 .../migration-guides/release-notes-4.2.2.rst       | 30 ++++----
 .../migration-guides/release-notes-4.2.3.rst       | 34 ++++-----
 .../migration-guides/release-notes-4.2.4.rst       | 72 +++++++++----------
 .../migration-guides/release-notes-4.2.rst         | 64 ++++++++---------
 .../migration-guides/release-notes-4.3.1.rst       | 16 ++---
 .../migration-guides/release-notes-4.3.2.rst       | 24 +++----
 .../migration-guides/release-notes-4.3.3.rst       | 22 +++---
 .../migration-guides/release-notes-4.3.4.rst       | 34 ++++-----
 .../migration-guides/release-notes-4.3.rst         | 80 +++++++++++-----------
 .../migration-guides/release-notes-5.0.2.rst       | 22 +++---
 .../migration-guides/release-notes-5.0.3.rst       | 48 ++++++-------
 .../migration-guides/release-notes-5.0.rst         | 66 +++++++++---------
 .../migration-guides/release-notes-5.1.rst         | 52 +++++++-------
 49 files changed, 842 insertions(+), 842 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 35c5c14535ba67aae3554819b55f0fb52a9d0027..9e87df0564c1e93140bce8705d9b45f75cbded58 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -90,8 +90,8 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
-    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
+    'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 142c02db1f8ffd1bd0da42374520889d95e7f964..6a3eec3a0e3d3d6148d3ecf1738721d7dd5079a1 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -395,7 +395,7 @@ one CVE is fixed, separate them using spaces.
 CVE Examples
 ------------
 
-This should be the header of patch that fixes :cve:`2015-8370` in GRUB2::
+This should be the header of patch that fixes :cve_nist:`2015-8370` in GRUB2::
 
    grub2: Fix CVE-2015-8370
 
diff --git a/documentation/migration-guides/release-notes-3.4.1.rst b/documentation/migration-guides/release-notes-3.4.1.rst
index 097c249a9015f731af557d5ac0332a51930e448f..c4b99a269b44104923046ee22f16b6e6740c7024 100644
--- a/documentation/migration-guides/release-notes-3.4.1.rst
+++ b/documentation/migration-guides/release-notes-3.4.1.rst
@@ -11,14 +11,14 @@ Known Issues in 3.4.1
 Security Fixes in 3.4.1
 ~~~~~~~~~~~~~~~~~~~~~~~
 
--  glibc: Backport fix for :cve:`2021-43396`
--  vim: add patch number to :cve:`2021-3778` patch
--  vim: fix :cve:`2021-3796`, :cve:`2021-3872`, and :cve:`2021-3875`
--  squashfs-tools: follow-up fix for :cve:`2021-41072`
+-  glibc: Backport fix for :cve_nist:`2021-43396`
+-  vim: add patch number to :cve_nist:`2021-3778` patch
+-  vim: fix :cve_nist:`2021-3796`, :cve_nist:`2021-3872`, and :cve_nist:`2021-3875`
+-  squashfs-tools: follow-up fix for :cve_nist:`2021-41072`
 -  avahi: update CVE id fixed by local-ping.patch
--  squashfs-tools: fix :cve:`2021-41072`
--  ffmpeg: fix :cve:`2021-38114`
--  curl: fix :cve:`2021-22945`, :cve:`2021-22946` and :cve:`2021-22947`
+-  squashfs-tools: fix :cve_nist:`2021-41072`
+-  ffmpeg: fix :cve_nist:`2021-38114`
+-  curl: fix :cve_nist:`2021-22945`, :cve_nist:`2021-22946` and :cve_nist:`2021-22947`
 
 Fixes in 3.4.1
 ~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-3.4.2.rst b/documentation/migration-guides/release-notes-3.4.2.rst
index 5ff42d3900caceeca2abbd8f67813f4a2bb3eb4d..94dffcb79e78bdbe3d53b49ecf8118fa48ae7226 100644
--- a/documentation/migration-guides/release-notes-3.4.2.rst
+++ b/documentation/migration-guides/release-notes-3.4.2.rst
@@ -6,29 +6,29 @@ Release notes for 3.4.2 (honister)
 Security Fixes in 3.4.2
 ~~~~~~~~~~~~~~~~~~~~~~~
 
--  tiff: backport fix for :cve:`2022-22844`
--  glibc : Fix :cve:`2021-3999`
--  glibc : Fix :cve:`2021-3998`
--  glibc : Fix :cve:`2022-23219`
--  glibc : Fix :cve:`2022-23218`
--  lighttpd: backport a fix for :cve:`2022-22707`
--  speex: fix :cve:`2020-23903`
--  linux-yocto/5.10: amdgpu: updates for :cve:`2021-42327`
--  libsndfile1: fix :cve:`2021-4156`
+-  tiff: backport fix for :cve_nist:`2022-22844`
+-  glibc : Fix :cve_nist:`2021-3999`
+-  glibc : Fix :cve_nist:`2021-3998`
+-  glibc : Fix :cve_nist:`2022-23219`
+-  glibc : Fix :cve_nist:`2022-23218`
+-  lighttpd: backport a fix for :cve_nist:`2022-22707`
+-  speex: fix :cve_nist:`2020-23903`
+-  linux-yocto/5.10: amdgpu: updates for :cve_nist:`2021-42327`
+-  libsndfile1: fix :cve_nist:`2021-4156`
 -  xserver-xorg: whitelist two CVEs
--  grub2: fix :cve:`2021-3981`
+-  grub2: fix :cve_nist:`2021-3981`
 -  xserver-xorg: update :term:`CVE_PRODUCT`
--  binutils: :cve:`2021-42574`
--  gcc: Fix :cve:`2021-42574`
--  gcc: Fix :cve:`2021-35465`
+-  binutils: :cve_nist:`2021-42574`
+-  gcc: Fix :cve_nist:`2021-42574`
+-  gcc: Fix :cve_nist:`2021-35465`
 -  cve-extra-exclusions: add db CVEs to exclusion list
--  gcc: Add :cve:`2021-37322` to the list of CVEs to ignore
--  bind: fix :cve:`2021-25219`
--  openssh: fix :cve:`2021-41617`
--  ncurses: fix :cve:`2021-39537`
--  vim: fix :cve:`2021-3968` and :cve:`2021-3973`
--  vim: fix :cve:`2021-3927` and :cve:`2021-3928`
--  gmp: fix :cve:`2021-43618`
+-  gcc: Add :cve_nist:`2021-37322` to the list of CVEs to ignore
+-  bind: fix :cve_nist:`2021-25219`
+-  openssh: fix :cve_nist:`2021-41617`
+-  ncurses: fix :cve_nist:`2021-39537`
+-  vim: fix :cve_nist:`2021-3968` and :cve_nist:`2021-3973`
+-  vim: fix :cve_nist:`2021-3927` and :cve_nist:`2021-3928`
+-  gmp: fix :cve_nist:`2021-43618`
 
 Fixes in 3.4.2
 ~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-3.4.3.rst b/documentation/migration-guides/release-notes-3.4.3.rst
index 2af802307dd81d26029ef9b02a58b9f8649c18a3..cd9698d0e8b2f119d4371829cf4db113076ceee6 100644
--- a/documentation/migration-guides/release-notes-3.4.3.rst
+++ b/documentation/migration-guides/release-notes-3.4.3.rst
@@ -6,12 +6,12 @@ Release notes for 3.4.3 (honister)
 Security Fixes in 3.4.3
 ~~~~~~~~~~~~~~~~~~~~~~~
 
--  ghostscript: fix :cve:`2021-3781`
--  ghostscript: fix :cve:`2021-45949`
--  tiff: Add backports for two CVEs from upstream (:cve:`2022-0561` & :cve:`2022-0562`)
--  gcc : Fix :cve:`2021-46195`
+-  ghostscript: fix :cve_nist:`2021-3781`
+-  ghostscript: fix :cve_nist:`2021-45949`
+-  tiff: Add backports for two CVEs from upstream (:cve_nist:`2022-0561` & :cve_nist:`2022-0562`)
+-  gcc : Fix :cve_nist:`2021-46195`
 -  virglrenderer: fix `CVE-2022-0135 <https://security-tracker.debian.org/tracker/CVE-2022-0135>`__ and `CVE-2022-0175 <https://security-tracker.debian.org/tracker/CVE-2022-0175>`__
--  binutils: Add fix for :cve:`2021-45078`
+-  binutils: Add fix for :cve_nist:`2021-45078`
 
 
 Fixes in 3.4.3
diff --git a/documentation/migration-guides/release-notes-3.4.4.rst b/documentation/migration-guides/release-notes-3.4.4.rst
index 0bf9a162096133dc6e0f34f0cdc7cf6b3c518c8f..3ab858b0b935366b2725b7c3f1da9a4d436c93b2 100644
--- a/documentation/migration-guides/release-notes-3.4.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.4.rst
@@ -6,11 +6,11 @@ Release notes for 3.4.4 (honister)
 Security Fixes in 3.4.4
 ~~~~~~~~~~~~~~~~~~~~~~~
 
--  tiff: fix :cve:`2022-0865`, :cve:`2022-0891`, :cve:`2022-0907`, :cve:`2022-0908`, :cve:`2022-0909` and :cve:`2022-0924`
+-  tiff: fix :cve_nist:`2022-0865`, :cve_nist:`2022-0891`, :cve_nist:`2022-0907`, :cve_nist:`2022-0908`, :cve_nist:`2022-0909` and :cve_nist:`2022-0924`
 -  xz: fix `CVE-2022-1271 <https://security-tracker.debian.org/tracker/CVE-2022-1271>`__
 -  unzip: fix `CVE-2021-4217 <https://security-tracker.debian.org/tracker/CVE-2021-4217>`__
--  zlib: fix :cve:`2018-25032`
--  grub: ignore :cve:`2021-46705`
+-  zlib: fix :cve_nist:`2018-25032`
+-  grub: ignore :cve_nist:`2021-46705`
 
 Fixes in 3.4.4
 ~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-3.4.rst b/documentation/migration-guides/release-notes-3.4.rst
index d76bb004b114c5fc6c88fcd05f4b7c693edd246f..6eca9956be47db3b9a399ebd5e80f8f7a87f98f2 100644
--- a/documentation/migration-guides/release-notes-3.4.rst
+++ b/documentation/migration-guides/release-notes-3.4.rst
@@ -220,34 +220,34 @@ Other license-related notes:
 Security Fixes in 3.4
 ~~~~~~~~~~~~~~~~~~~~~
 
--  apr: :cve:`2021-35940`
--  aspell: :cve:`2019-25051`
--  avahi: :cve:`2021-3468`, :cve:`2021-36217`
--  binutils: :cve:`2021-20197`
--  bluez: :cve:`2021-3658`
--  busybox: :cve:`2021-28831`
--  cairo: :cve:`2020-35492`
--  cpio: :cve:`2021-38185`
--  expat: :cve:`2013-0340`
--  ffmpeg: :cve:`2020-20446`, :cve:`2020-22015`, :cve:`2020-22021`, :cve:`2020-22033`, :cve:`2020-22019`, :cve:`2021-33815`, :cve:`2021-38171`, :cve:`2020-20453`
--  glibc: :cve:`2021-33574`, :cve:`2021-38604`
--  inetutils: :cve:`2021-40491`
--  libgcrypt: :cve:`2021-40528`
--  linux-yocto/5.10, 5.14: :cve:`2021-3653`, :cve:`2021-3656`
--  lz4: :cve:`2021-3520`
--  nettle: :cve:`2021-20305`
--  openssl: :cve:`2021-3711`, :cve:`2021-3712`
--  perl: :cve:`2021-36770`
--  python3: :cve:`2021-29921`
--  python3-pip: :cve:`2021-3572`
--  qemu: :cve:`2020-27821`, :cve:`2020-29443`, :cve:`2020-35517`, :cve:`2021-3392`, :cve:`2021-3409`, :cve:`2021-3416`, :cve:`2021-3527`, :cve:`2021-3544`, :cve:`2021-3545`, :cve:`2021-3546`, :cve:`2021-3682`, :cve:`2021-20181`, :cve:`2021-20221`, :cve:`2021-20257`, :cve:`2021-20263`
--  rpm: :cve:`2021-3421`, :cve:`2021-20271`
--  rsync: :cve:`2020-14387`
--  util-linux: :cve:`2021-37600`
--  vim: :cve:`2021-3770`, :cve:`2021-3778`
--  wpa-supplicant: :cve:`2021-30004`
--  xdg-utils: :cve:`2020-27748`
--  xserver-xorg: :cve:`2021-3472`
+-  apr: :cve_nist:`2021-35940`
+-  aspell: :cve_nist:`2019-25051`
+-  avahi: :cve_nist:`2021-3468`, :cve_nist:`2021-36217`
+-  binutils: :cve_nist:`2021-20197`
+-  bluez: :cve_nist:`2021-3658`
+-  busybox: :cve_nist:`2021-28831`
+-  cairo: :cve_nist:`2020-35492`
+-  cpio: :cve_nist:`2021-38185`
+-  expat: :cve_nist:`2013-0340`
+-  ffmpeg: :cve_nist:`2020-20446`, :cve_nist:`2020-22015`, :cve_nist:`2020-22021`, :cve_nist:`2020-22033`, :cve_nist:`2020-22019`, :cve_nist:`2021-33815`, :cve_nist:`2021-38171`, :cve_nist:`2020-20453`
+-  glibc: :cve_nist:`2021-33574`, :cve_nist:`2021-38604`
+-  inetutils: :cve_nist:`2021-40491`
+-  libgcrypt: :cve_nist:`2021-40528`
+-  linux-yocto/5.10, 5.14: :cve_nist:`2021-3653`, :cve_nist:`2021-3656`
+-  lz4: :cve_nist:`2021-3520`
+-  nettle: :cve_nist:`2021-20305`
+-  openssl: :cve_nist:`2021-3711`, :cve_nist:`2021-3712`
+-  perl: :cve_nist:`2021-36770`
+-  python3: :cve_nist:`2021-29921`
+-  python3-pip: :cve_nist:`2021-3572`
+-  qemu: :cve_nist:`2020-27821`, :cve_nist:`2020-29443`, :cve_nist:`2020-35517`, :cve_nist:`2021-3392`, :cve_nist:`2021-3409`, :cve_nist:`2021-3416`, :cve_nist:`2021-3527`, :cve_nist:`2021-3544`, :cve_nist:`2021-3545`, :cve_nist:`2021-3546`, :cve_nist:`2021-3682`, :cve_nist:`2021-20181`, :cve_nist:`2021-20221`, :cve_nist:`2021-20257`, :cve_nist:`2021-20263`
+-  rpm: :cve_nist:`2021-3421`, :cve_nist:`2021-20271`
+-  rsync: :cve_nist:`2020-14387`
+-  util-linux: :cve_nist:`2021-37600`
+-  vim: :cve_nist:`2021-3770`, :cve_nist:`2021-3778`
+-  wpa-supplicant: :cve_nist:`2021-30004`
+-  xdg-utils: :cve_nist:`2020-27748`
+-  xserver-xorg: :cve_nist:`2021-3472`
 
 Recipe Upgrades in 3.4
 ~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-4.0.1.rst b/documentation/migration-guides/release-notes-4.0.1.rst
index 5529f71c6f26ba00faeb110bdd3f9a53289bf636..5b972f899e19679159607cc4f98a4bbd30667d07 100644
--- a/documentation/migration-guides/release-notes-4.0.1.rst
+++ b/documentation/migration-guides/release-notes-4.0.1.rst
@@ -6,11 +6,11 @@ Release notes for 4.0.1 (kirkstone)
 Security Fixes in 4.0.1
 ~~~~~~~~~~~~~~~~~~~~~~~
 
--  linux-yocto/5.15: fix :cve:`2022-28796`
--  python3: ignore :cve:`2015-20107`
--  e2fsprogs: fix :cve:`2022-1304`
--  lua: fix :cve:`2022-28805`
--  busybox: fix :cve:`2022-28391`
+-  linux-yocto/5.15: fix :cve_nist:`2022-28796`
+-  python3: ignore :cve_nist:`2015-20107`
+-  e2fsprogs: fix :cve_nist:`2022-1304`
+-  lua: fix :cve_nist:`2022-28805`
+-  busybox: fix :cve_nist:`2022-28391`
 
 Fixes in 4.0.1
 ~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-4.0.10.rst b/documentation/migration-guides/release-notes-4.0.10.rst
index f37c3471eaffeeb6b5f8aea836d3b36778986009..4e88bafe8a97abe3062fd29cdca25d99f62a109d 100644
--- a/documentation/migration-guides/release-notes-4.0.10.rst
+++ b/documentation/migration-guides/release-notes-4.0.10.rst
@@ -6,28 +6,28 @@ Release notes for Yocto-4.0.10 (Kirkstone)
 Security Fixes in Yocto-4.0.10
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  binutils: Fix :cve:`2023-1579`, :cve:`2023-1972`, :cve_mitre:`2023-25584`, :cve_mitre:`2023-25585` and :cve_mitre:`2023-25588`
--  cargo : Ignore :cve:`2022-46176`
--  connman: Fix :cve:`2023-28488`
--  curl: Fix :cve:`2023-27533`, :cve:`2023-27534`, :cve:`2023-27535`, :cve:`2023-27536` and :cve:`2023-27538`
--  ffmpeg: Fix :cve:`2022-48434`
--  freetype: Fix :cve:`2023-2004`
+-  binutils: Fix :cve_nist:`2023-1579`, :cve_nist:`2023-1972`, :cve_mitre:`2023-25584`, :cve_mitre:`2023-25585` and :cve_mitre:`2023-25588`
+-  cargo : Ignore :cve_nist:`2022-46176`
+-  connman: Fix :cve_nist:`2023-28488`
+-  curl: Fix :cve_nist:`2023-27533`, :cve_nist:`2023-27534`, :cve_nist:`2023-27535`, :cve_nist:`2023-27536` and :cve_nist:`2023-27538`
+-  ffmpeg: Fix :cve_nist:`2022-48434`
+-  freetype: Fix :cve_nist:`2023-2004`
 -  ghostscript: Fix :cve_mitre:`2023-29979`
--  git: Fix :cve:`2023-25652` and :cve:`2023-29007`
--  go: Fix :cve:`2022-41722`, :cve:`2022-41724`, :cve:`2022-41725`, :cve:`2023-24534`, :cve:`2023-24537` and :cve:`2023-24538`
--  go: Ignore :cve:`2022-41716`
--  libxml2: Fix :cve:`2023-28484` and :cve:`2023-29469`
--  libxpm: Fix :cve:`2022-44617`, :cve:`2022-46285` and :cve:`2022-4883`
--  linux-yocto: Ignore :cve:`2021-3759`, :cve:`2021-4135`, :cve:`2021-4155`, :cve:`2022-0168`, :cve:`2022-0171`, :cve:`2022-1016`, :cve:`2022-1184`, :cve:`2022-1198`, :cve:`2022-1199`, :cve:`2022-1462`, :cve:`2022-1734`, :cve:`2022-1852`, :cve:`2022-1882`, :cve:`2022-1998`, :cve:`2022-2078`, :cve:`2022-2196`, :cve:`2022-2318`, :cve:`2022-2380`, :cve:`2022-2503`, :cve:`2022-26365`, :cve:`2022-2663`, :cve:`2022-2873`, :cve:`2022-2905`, :cve:`2022-2959`, :cve:`2022-3028`, :cve:`2022-3078`, :cve:`2022-3104`, :cve:`2022-3105`, :cve:`2022-3106`, :cve:`2022-3107`, :cve:`2022-3111`, :cve:`2022-3112`, :cve:`2022-3113`, :cve:`2022-3115`, :cve:`2022-3202`, :cve:`2022-32250`, :cve:`2022-32296`, :cve:`2022-32981`, :cve:`2022-3303`, :cve:`2022-33740`, :cve:`2022-33741`, :cve:`2022-33742`, :cve:`2022-33743`, :cve:`2022-33744`, :cve:`2022-33981`, :cve:`2022-3424`, :cve:`2022-3435`, :cve:`2022-34918`, :cve:`2022-3521`, :cve:`2022-3545`, :cve:`2022-3564`, :cve:`2022-3586`, :cve:`2022-3594`, :cve:`202
 2-36123`, :cve:`2022-3621`, :cve:`2022-3623`, :cve:`2022-3629`, :cve:`2022-3633`, :cve:`2022-3635`, :cve:`2022-3646`, :cve:`2022-3649`, :cve:`2022-36879`, :cve:`2022-36946`, :cve:`2022-3707`, :cve:`2022-39188`, :cve:`2022-39190`, :cve:`2022-39842`, :cve:`2022-40307`, :cve:`2022-40768`, :cve:`2022-4095`, :cve:`2022-41218`, :cve:`2022-4139`, :cve:`2022-41849`, :cve:`2022-41850`, :cve:`2022-41858`, :cve:`2022-42328`, :cve:`2022-42329`, :cve:`2022-42703`, :cve:`2022-42721`, :cve:`2022-42722`, :cve:`2022-42895`, :cve:`2022-4382`, :cve:`2022-4662`, :cve:`2022-47518`, :cve:`2022-47519`, :cve:`2022-47520`, :cve:`2022-47929`, :cve:`2023-0179`, :cve:`2023-0394`, :cve:`2023-0461`, :cve:`2023-0590`, :cve:`2023-1073`, :cve:`2023-1074`, :cve:`2023-1077`, :cve:`2023-1078`, :cve:`2023-1079`, :cve:`2023-1095`, :cve:`2023-1118`, :cve:`2023-1249`, :cve:`2023-1252`, :cve:`2023-1281`, :cve:`2023-1382`, :cve:`2023-1513`, :cve:`2023-1829`, :cve:`2023-1838`, :cve:`2023-1998`, :cve:`2023-2006`, :cve:`2023-2
 008`, :cve:`2023-2162`, :cve:`2023-2166`, :cve:`2023-2177`, :cve:`2023-22999`, :cve:`2023-23002`, :cve:`2023-23004`, :cve:`2023-23454`, :cve:`2023-23455`, :cve:`2023-23559`, :cve:`2023-25012`, :cve:`2023-26545`, :cve:`2023-28327` and :cve:`2023-28328`
--  nasm: Fix :cve:`2022-44370`
--  python3-cryptography: Fix :cve:`2023-23931`
--  qemu: Ignore :cve:`2023-0664`
--  ruby: Fix :cve:`2023-28755` and :cve:`2023-28756`
--  screen: Fix :cve:`2023-24626`
--  shadow: Fix :cve:`2023-29383`
--  tiff: Fix :cve:`2022-4645`
--  webkitgtk: Fix :cve:`2022-32888` and :cve:`2022-32923`
--  xserver-xorg: Fix :cve:`2023-1393`
+-  git: Fix :cve_nist:`2023-25652` and :cve_nist:`2023-29007`
+-  go: Fix :cve_nist:`2022-41722`, :cve_nist:`2022-41724`, :cve_nist:`2022-41725`, :cve_nist:`2023-24534`, :cve_nist:`2023-24537` and :cve_nist:`2023-24538`
+-  go: Ignore :cve_nist:`2022-41716`
+-  libxml2: Fix :cve_nist:`2023-28484` and :cve_nist:`2023-29469`
+-  libxpm: Fix :cve_nist:`2022-44617`, :cve_nist:`2022-46285` and :cve_nist:`2022-4883`
+-  linux-yocto: Ignore :cve_nist:`2021-3759`, :cve_nist:`2021-4135`, :cve_nist:`2021-4155`, :cve_nist:`2022-0168`, :cve_nist:`2022-0171`, :cve_nist:`2022-1016`, :cve_nist:`2022-1184`, :cve_nist:`2022-1198`, :cve_nist:`2022-1199`, :cve_nist:`2022-1462`, :cve_nist:`2022-1734`, :cve_nist:`2022-1852`, :cve_nist:`2022-1882`, :cve_nist:`2022-1998`, :cve_nist:`2022-2078`, :cve_nist:`2022-2196`, :cve_nist:`2022-2318`, :cve_nist:`2022-2380`, :cve_nist:`2022-2503`, :cve_nist:`2022-26365`, :cve_nist:`2022-2663`, :cve_nist:`2022-2873`, :cve_nist:`2022-2905`, :cve_nist:`2022-2959`, :cve_nist:`2022-3028`, :cve_nist:`2022-3078`, :cve_nist:`2022-3104`, :cve_nist:`2022-3105`, :cve_nist:`2022-3106`, :cve_nist:`2022-3107`, :cve_nist:`2022-3111`, :cve_nist:`2022-3112`, :cve_nist:`2022-3113`, :cve_nist:`2022-3115`, :cve_nist:`2022-3202`, :cve_nist:`2022-32250`, :cve_nist:`2022-32296`, :cve_nist:`2022-32981`, :cve_nist:`2022-3303`, :cve_nist:`2022-33740`, :cve_nist:`2022-33741`, :cve_nist:`2022-33742`, :
 cve_nist:`2022-33743`, :cve_nist:`2022-33744`, :cve_nist:`2022-33981`, :cve_nist:`2022-3424`, :cve_nist:`2022-3435`, :cve_nist:`2022-34918`, :cve_nist:`2022-3521`, :cve_nist:`2022-3545`, :cve_nist:`2022-3564`, :cve_nist:`2022-3586`, :cve_nist:`2022-3594`, :cve_nist:`2022-36123`, :cve_nist:`2022-3621`, :cve_nist:`2022-3623`, :cve_nist:`2022-3629`, :cve_nist:`2022-3633`, :cve_nist:`2022-3635`, :cve_nist:`2022-3646`, :cve_nist:`2022-3649`, :cve_nist:`2022-36879`, :cve_nist:`2022-36946`, :cve_nist:`2022-3707`, :cve_nist:`2022-39188`, :cve_nist:`2022-39190`, :cve_nist:`2022-39842`, :cve_nist:`2022-40307`, :cve_nist:`2022-40768`, :cve_nist:`2022-4095`, :cve_nist:`2022-41218`, :cve_nist:`2022-4139`, :cve_nist:`2022-41849`, :cve_nist:`2022-41850`, :cve_nist:`2022-41858`, :cve_nist:`2022-42328`, :cve_nist:`2022-42329`, :cve_nist:`2022-42703`, :cve_nist:`2022-42721`, :cve_nist:`2022-42722`, :cve_nist:`2022-42895`, :cve_nist:`2022-4382`, :cve_nist:`2022-4662`, :cve_nist:`2022-47518`, :cve_nist
 :`2022-47519`, :cve_nist:`2022-47520`, :cve_nist:`2022-47929`, :cve_nist:`2023-0179`, :cve_nist:`2023-0394`, :cve_nist:`2023-0461`, :cve_nist:`2023-0590`, :cve_nist:`2023-1073`, :cve_nist:`2023-1074`, :cve_nist:`2023-1077`, :cve_nist:`2023-1078`, :cve_nist:`2023-1079`, :cve_nist:`2023-1095`, :cve_nist:`2023-1118`, :cve_nist:`2023-1249`, :cve_nist:`2023-1252`, :cve_nist:`2023-1281`, :cve_nist:`2023-1382`, :cve_nist:`2023-1513`, :cve_nist:`2023-1829`, :cve_nist:`2023-1838`, :cve_nist:`2023-1998`, :cve_nist:`2023-2006`, :cve_nist:`2023-2008`, :cve_nist:`2023-2162`, :cve_nist:`2023-2166`, :cve_nist:`2023-2177`, :cve_nist:`2023-22999`, :cve_nist:`2023-23002`, :cve_nist:`2023-23004`, :cve_nist:`2023-23454`, :cve_nist:`2023-23455`, :cve_nist:`2023-23559`, :cve_nist:`2023-25012`, :cve_nist:`2023-26545`, :cve_nist:`2023-28327` and :cve_nist:`2023-28328`
+-  nasm: Fix :cve_nist:`2022-44370`
+-  python3-cryptography: Fix :cve_nist:`2023-23931`
+-  qemu: Ignore :cve_nist:`2023-0664`
+-  ruby: Fix :cve_nist:`2023-28755` and :cve_nist:`2023-28756`
+-  screen: Fix :cve_nist:`2023-24626`
+-  shadow: Fix :cve_nist:`2023-29383`
+-  tiff: Fix :cve_nist:`2022-4645`
+-  webkitgtk: Fix :cve_nist:`2022-32888` and :cve_nist:`2022-32923`
+-  xserver-xorg: Fix :cve_nist:`2023-1393`
 
 
 Fixes in Yocto-4.0.10
diff --git a/documentation/migration-guides/release-notes-4.0.11.rst b/documentation/migration-guides/release-notes-4.0.11.rst
index 8a15884908fa15b75539b8323c028f894521b8c2..baef380586515cfa442687e9e766da9c84c8b8bd 100644
--- a/documentation/migration-guides/release-notes-4.0.11.rst
+++ b/documentation/migration-guides/release-notes-4.0.11.rst
@@ -6,18 +6,18 @@ Release notes for Yocto-4.0.11 (Kirkstone)
 Security Fixes in Yocto-4.0.11
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  cups: Fix :cve:`2023-32324`
--  curl: Fix :cve:`2023-28319`, :cve:`2023-28320`, :cve:`2023-28321` and :cve:`2023-28322`
--  git: Ignore :cve:`2023-25815`
--  go: Fix :cve:`2023-24539` and :cve:`2023-24540`
--  nasm: Fix :cve:`2022-46457`
--  openssh: Fix :cve:`2023-28531`
--  openssl: Fix :cve:`2023-1255` and :cve:`2023-2650`
--  perl: Fix :cve:`2023-31484`
--  python3-requests: Fix for :cve:`2023-32681`
--  sysstat: Fix :cve:`2023-33204`
--  vim: Fix :cve:`2023-2426`
--  webkitgtk: fix :cve:`2022-42867`, :cve:`2022-46691`, :cve:`2022-46699` and :cve:`2022-46700`
+-  cups: Fix :cve_nist:`2023-32324`
+-  curl: Fix :cve_nist:`2023-28319`, :cve_nist:`2023-28320`, :cve_nist:`2023-28321` and :cve_nist:`2023-28322`
+-  git: Ignore :cve_nist:`2023-25815`
+-  go: Fix :cve_nist:`2023-24539` and :cve_nist:`2023-24540`
+-  nasm: Fix :cve_nist:`2022-46457`
+-  openssh: Fix :cve_nist:`2023-28531`
+-  openssl: Fix :cve_nist:`2023-1255` and :cve_nist:`2023-2650`
+-  perl: Fix :cve_nist:`2023-31484`
+-  python3-requests: Fix for :cve_nist:`2023-32681`
+-  sysstat: Fix :cve_nist:`2023-33204`
+-  vim: Fix :cve_nist:`2023-2426`
+-  webkitgtk: fix :cve_nist:`2022-42867`, :cve_nist:`2022-46691`, :cve_nist:`2022-46699` and :cve_nist:`2022-46700`
 
 
 Fixes in Yocto-4.0.11
diff --git a/documentation/migration-guides/release-notes-4.0.12.rst b/documentation/migration-guides/release-notes-4.0.12.rst
index 0ea92a453d71aa6550a86e153b8c3a0f36351c31..ead33e18546a4a6e57e885d1bee1d32f2d64fe60 100644
--- a/documentation/migration-guides/release-notes-4.0.12.rst
+++ b/documentation/migration-guides/release-notes-4.0.12.rst
@@ -6,30 +6,30 @@ Release notes for Yocto-4.0.12 (Kirkstone)
 Security Fixes in Yocto-4.0.12
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2023-2828` and :cve:`2023-2911`
--  cups: Fix :cve:`2023-34241`
--  curl: Added :cve:`2023-28320` Follow-up patch
--  dbus: Fix :cve:`2023-34969`
--  dmidecode: fix :cve:`2023-30630`
--  ghostscript: fix :cve:`2023-36664`
--  go: fix :cve_mitre:`2023-24531`, :cve:`2023-24536`, :cve:`2023-29400`, :cve:`2023-29402`, :cve:`2023-29404`, :cve:`2023-29405` and :cve:`2023-29406`
--  libarchive: Ignore :cve:`2023-30571`
--  libcap: Fix :cve:`2023-2602` and :cve:`2023-2603`
--  libjpeg-turbo: Fix :cve:`2023-2804`
--  libpcre2: Fix :cve:`2022-41409`
--  libtiff: fix :cve:`2023-26965`
--  libwebp: Fix :cve:`2023-1999`
--  libx11: Fix :cve:`2023-3138`
--  libxpm: Fix :cve:`2022-44617`
--  ninja: Ignore :cve:`2021-4336`
--  openssh: Fix :cve:`2023-38408`
--  openssl: Fix :cve:`2023-2975`, :cve:`2023-3446` and :cve:`2023-3817`
--  perl: Fix :cve:`2023-31486`
--  python3: Ignore :cve:`2023-36632`
--  qemu: Fix :cve:`2023-0330`, :cve_mitre:`2023-2861`, :cve_mitre:`2023-3255` and :cve_mitre:`2023-3301`
--  sqlite3: Fix :cve:`2023-36191`
--  tiff: Fix :cve:`2023-0795`, :cve:`2023-0796`, :cve:`2023-0797`, :cve:`2023-0798`, :cve:`2023-0799`, :cve:`2023-25433`, :cve:`2023-25434` and :cve:`2023-25435`
--  vim: :cve:`2023-2609` and :cve:`2023-2610`
+-  bind: Fix :cve_nist:`2023-2828` and :cve_nist:`2023-2911`
+-  cups: Fix :cve_nist:`2023-34241`
+-  curl: Added :cve_nist:`2023-28320` Follow-up patch
+-  dbus: Fix :cve_nist:`2023-34969`
+-  dmidecode: fix :cve_nist:`2023-30630`
+-  ghostscript: fix :cve_nist:`2023-36664`
+-  go: fix :cve_mitre:`2023-24531`, :cve_nist:`2023-24536`, :cve_nist:`2023-29400`, :cve_nist:`2023-29402`, :cve_nist:`2023-29404`, :cve_nist:`2023-29405` and :cve_nist:`2023-29406`
+-  libarchive: Ignore :cve_nist:`2023-30571`
+-  libcap: Fix :cve_nist:`2023-2602` and :cve_nist:`2023-2603`
+-  libjpeg-turbo: Fix :cve_nist:`2023-2804`
+-  libpcre2: Fix :cve_nist:`2022-41409`
+-  libtiff: fix :cve_nist:`2023-26965`
+-  libwebp: Fix :cve_nist:`2023-1999`
+-  libx11: Fix :cve_nist:`2023-3138`
+-  libxpm: Fix :cve_nist:`2022-44617`
+-  ninja: Ignore :cve_nist:`2021-4336`
+-  openssh: Fix :cve_nist:`2023-38408`
+-  openssl: Fix :cve_nist:`2023-2975`, :cve_nist:`2023-3446` and :cve_nist:`2023-3817`
+-  perl: Fix :cve_nist:`2023-31486`
+-  python3: Ignore :cve_nist:`2023-36632`
+-  qemu: Fix :cve_nist:`2023-0330`, :cve_mitre:`2023-2861`, :cve_mitre:`2023-3255` and :cve_mitre:`2023-3301`
+-  sqlite3: Fix :cve_nist:`2023-36191`
+-  tiff: Fix :cve_nist:`2023-0795`, :cve_nist:`2023-0796`, :cve_nist:`2023-0797`, :cve_nist:`2023-0798`, :cve_nist:`2023-0799`, :cve_nist:`2023-25433`, :cve_nist:`2023-25434` and :cve_nist:`2023-25435`
+-  vim: :cve_nist:`2023-2609` and :cve_nist:`2023-2610`
 
 
 Fixes in Yocto-4.0.12
diff --git a/documentation/migration-guides/release-notes-4.0.13.rst b/documentation/migration-guides/release-notes-4.0.13.rst
index 3c096c356fec2830e233b933544549dd7ba29b9a..641c9d1f05fe280d049a15c6a99fa0ef3002f4f0 100644
--- a/documentation/migration-guides/release-notes-4.0.13.rst
+++ b/documentation/migration-guides/release-notes-4.0.13.rst
@@ -6,43 +6,43 @@ Release notes for Yocto-4.0.13 (Kirkstone)
 Security Fixes in Yocto-4.0.13
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2023-2829`
--  binutils: Fix :cve:`2022-48065`
--  busybox: Fix :cve:`2022-48174`
--  cups: Fix :cve:`2023-32360`
--  curl: Fix :cve:`2023-32001`
--  dmidecode: Fix :cve:`2023-30630`
--  dropbear: Fix :cve:`2023-36328`
--  ffmpeg: Ignored :cve:`2023-39018`
--  file: Fix :cve:`2022-48554`
--  flac: Fix :cve:`2020-22219`
--  gcc: Fix :cve:`2023-4039`
--  gdb: Fix :cve:`2023-39128`
--  ghostscript: Fix :cve:`2023-38559`
--  glib-2.0: Fix :cve:`2023-29499`, :cve:`2023-32611`, :cve:`2023-32636`, :cve:`2023-32643` and :cve:`2023-32665`
--  go: Fix :cve:`2023-29409` and :cve:`2023-39319`
+-  bind: Fix :cve_nist:`2023-2829`
+-  binutils: Fix :cve_nist:`2022-48065`
+-  busybox: Fix :cve_nist:`2022-48174`
+-  cups: Fix :cve_nist:`2023-32360`
+-  curl: Fix :cve_nist:`2023-32001`
+-  dmidecode: Fix :cve_nist:`2023-30630`
+-  dropbear: Fix :cve_nist:`2023-36328`
+-  ffmpeg: Ignored :cve_nist:`2023-39018`
+-  file: Fix :cve_nist:`2022-48554`
+-  flac: Fix :cve_nist:`2020-22219`
+-  gcc: Fix :cve_nist:`2023-4039`
+-  gdb: Fix :cve_nist:`2023-39128`
+-  ghostscript: Fix :cve_nist:`2023-38559`
+-  glib-2.0: Fix :cve_nist:`2023-29499`, :cve_nist:`2023-32611`, :cve_nist:`2023-32636`, :cve_nist:`2023-32643` and :cve_nist:`2023-32665`
+-  go: Fix :cve_nist:`2023-29409` and :cve_nist:`2023-39319`
 -  gstreamer1.0-plugins-bad: Fix :cve_mitre:`2023-37329`
 -  gstreamer1.0-plugins-base: Fix :cve_mitre:`2023-37328`
 -  gstreamer1.0-plugins-good: Fix :cve_mitre:`2023-37327`
--  inetutils: Fix :cve:`2023-40303`
--  json-c: Fix :cve:`2021-32292`
--  librsvg: Fix :cve:`2023-38633`
--  libssh2: Fix :cve:`2020-22218`
--  libtiff: Fix :cve:`2023-26966`
--  libxml2: Fix :cve:`2023-39615`
--  linux-yocto/5.15: Ignore :cve:`2003-1604`, :cve:`2004-0230`, :cve:`2006-3635`, :cve:`2006-5331`, :cve:`2006-6128`, :cve:`2007-4774`, :cve:`2007-6761`, :cve:`2007-6762`, :cve:`2008-7316`, :cve:`2009-2692`, :cve:`2010-0008`, :cve:`2010-3432`, :cve:`2010-4648`, :cve:`2010-5313`, :cve:`2010-5328`, :cve:`2010-5329`, :cve:`2010-5331`, :cve:`2010-5332`, :cve:`2011-4098`, :cve:`2011-4131`, :cve:`2011-4915`, :cve:`2011-5321`, :cve:`2011-5327`, :cve:`2012-0957`, :cve:`2012-2119`, :cve:`2012-2136`, :cve:`2012-2137`, :cve:`2012-2313`, :cve:`2012-2319`, :cve:`2012-2372`, :cve:`2012-2375`, :cve:`2012-2390`, :cve:`2012-2669`, :cve:`2012-2744`, :cve:`2012-2745`, :cve:`2012-3364`, :cve:`2012-3375`, :cve:`2012-3400`, :cve:`2012-3412`, :cve:`2012-3430`, :cve:`2012-3510`, :cve:`2012-3511`, :cve:`2012-3520`, :cve:`2012-3552`, :cve:`2012-4398`, :cve:`2012-4444`, :cve:`2012-4461`, :cve:`2012-4467`, :cve:`2012-4508`, :cve:`2012-4530`, :cve:`2012-4565`, :cve:`2012-5374`, :cve:`2012-5375`, :cve:`2012-5517
 `, :cve:`2012-6536`, :cve:`2012-6537`, :cve:`2012-6538`, :cve:`2012-6539`, :cve:`2012-6540`, :cve:`2012-6541`, :cve:`2012-6542`, :cve:`2012-6543`, :cve:`2012-6544`, :cve:`2012-6545`, :cve:`2012-6546`, :cve:`2012-6547`, :cve:`2012-6548`, :cve:`2012-6549`, :cve:`2012-6638`, :cve:`2012-6647`, :cve:`2012-6657`, :cve:`2012-6689`, :cve:`2012-6701`, :cve:`2012-6703`, :cve:`2012-6704`, :cve:`2012-6712`, :cve:`2013-0160`, :cve:`2013-0190`, :cve:`2013-0216`, :cve:`2013-0217`, :cve:`2013-0228`, :cve:`2013-0231`, :cve:`2013-0268`, :cve:`2013-0290`, :cve:`2013-0309`, :cve:`2013-0310`, :cve:`2013-0311`, :cve:`2013-0313`, :cve:`2013-0343`, :cve:`2013-0349`, :cve:`2013-0871`, :cve:`2013-0913`, :cve:`2013-0914`, :cve:`2013-1059`, :cve:`2013-1763`, :cve:`2013-1767`, :cve:`2013-1772`, :cve:`2013-1773`, :cve:`2013-1774`, :cve:`2013-1792`, :cve:`2013-1796`, :cve:`2013-1797`, :cve:`2013-1798`, :cve:`2013-1819`, :cve:`2013-1826`, :cve:`2013-1827`, :cve:`2013-1828`, :cve:`2013-1848`, :cve:`2013-1858`, :cve
 :`2013-1860`, :cve:`2013-1928`, :cve:`2013-1929`, :cve:`2013-1943`, :cve:`2013-1956`, :cve:`2013-1957`, :cve:`2013-1958`, :cve:`2013-1959`, :cve:`2013-1979`, :cve:`2013-2015`, :cve:`2013-2017`, :cve:`2013-2058`, :cve:`2013-2094`, :cve:`2013-2128`, :cve:`2013-2140`, :cve:`2013-2141`, :cve:`2013-2146`, :cve:`2013-2147`, :cve:`2013-2148`, :cve:`2013-2164`, :cve:`2013-2206`, :cve:`2013-2232`, :cve:`2013-2234`, :cve:`2013-2237`, :cve:`2013-2546`, :cve:`2013-2547`, :cve:`2013-2548`, :cve:`2013-2596`, :cve:`2013-2634`, :cve:`2013-2635`, :cve:`2013-2636`, :cve:`2013-2850`, :cve:`2013-2851`, :cve:`2013-2852`, :cve:`2013-2888`, :cve:`2013-2889`, :cve:`2013-2890`, :cve:`2013-2891`, :cve:`2013-2892`, :cve:`2013-2893`, :cve:`2013-2894`, :cve:`2013-2895`, :cve:`2013-2896`, :cve:`2013-2897`, :cve:`2013-2898`, :cve:`2013-2899`, :cve:`2013-2929`, :cve:`2013-2930`, :cve:`2013-3076`, :cve:`2013-3222`, :cve:`2013-3223`, :cve:`2013-3224`, :cve:`2013-3225`, :cve:`2013-3226`, :cve:`2013-3227`, :cve:`2013-
 3228`, :cve:`2013-3229`, :cve:`2013-3230`, :cve:`2013-3231`, :cve:`2013-3232`, :cve:`2013-3233`, :cve:`2013-3234`, :cve:`2013-3235`, :cve:`2013-3236`, :cve:`2013-3237`, :cve:`2013-3301`, :cve:`2013-3302`, :cve:`2013-4125`, :cve:`2013-4127`, :cve:`2013-4129`, :cve:`2013-4162`, :cve:`2013-4163`, :cve:`2013-4205`, :cve:`2013-4220`, :cve:`2013-4247`, :cve:`2013-4254`, :cve:`2013-4270`, :cve:`2013-4299`, :cve:`2013-4300`, :cve:`2013-4312`, :cve:`2013-4343`, :cve:`2013-4345`, :cve:`2013-4348`, :cve:`2013-4350`, :cve:`2013-4387`, :cve:`2013-4470`, :cve:`2013-4483`, :cve:`2013-4511`, :cve:`2013-4512`, :cve:`2013-4513`, :cve:`2013-4514`, :cve:`2013-4515`, :cve:`2013-4516`, :cve:`2013-4563`, :cve:`2013-4579`, :cve:`2013-4587`, :cve:`2013-4588`, :cve:`2013-4591`, :cve:`2013-4592`, :cve:`2013-5634`, :cve:`2013-6282`, :cve:`2013-6367`, :cve:`2013-6368`, :cve:`2013-6376`, :cve:`2013-6378`, :cve:`2013-6380`, :cve:`2013-6381`, :cve:`2013-6382`, :cve:`2013-6383`, :cve:`2013-6431`, :cve:`2013-6432`, 
 :cve:`2013-6885`, :cve:`2013-7026`, :cve:`2013-7027`, :cve:`2013-7263`, :cve:`2013-7264`, :cve:`2013-7265`, :cve:`2013-7266`, :cve:`2013-7267`, :cve:`2013-7268`, :cve:`2013-7269`, :cve:`2013-7270`, :cve:`2013-7271`, :cve:`2013-7281`, :cve:`2013-7339`, :cve:`2013-7348`, :cve:`2013-7421`, :cve:`2013-7446`, :cve:`2013-7470`, :cve:`2014-0038`, :cve:`2014-0049`, :cve:`2014-0055`, :cve:`2014-0069`, :cve:`2014-0077`, :cve:`2014-0100`, :cve:`2014-0101`, :cve:`2014-0102`, :cve:`2014-0131`, :cve:`2014-0155`, :cve:`2014-0181`, :cve:`2014-0196`, :cve:`2014-0203`, :cve:`2014-0205`, :cve:`2014-0206`, :cve:`2014-1438`, :cve:`2014-1444`, :cve:`2014-1445`, :cve:`2014-1446`, :cve:`2014-1690`, :cve:`2014-1737`, :cve:`2014-1738`, :cve:`2014-1739`, :cve:`2014-1874`, :cve:`2014-2038`, :cve:`2014-2039`, :cve:`2014-2309`, :cve:`2014-2523`, :cve:`2014-2568`, :cve:`2014-2580`, :cve:`2014-2672`, :cve:`2014-2673`, :cve:`2014-2678`, :cve:`2014-2706`, :cve:`2014-2739`, :cve:`2014-2851`, :cve:`2014-2889`, :cve:`2
 014-3122`, :cve:`2014-3144`, :cve:`2014-3145`, :cve:`2014-3153`, :cve:`2014-3180`, :cve:`2014-3181`, :cve:`2014-3182`, :cve:`2014-3183`, :cve:`2014-3184`, :cve:`2014-3185`, :cve:`2014-3186`, :cve:`2014-3534`, :cve:`2014-3535`, :cve:`2014-3601`, :cve:`2014-3610`, :cve:`2014-3611`, :cve:`2014-3631`, :cve:`2014-3645`, :cve:`2014-3646`, :cve:`2014-3647`, :cve:`2014-3673`, :cve:`2014-3687`, :cve:`2014-3688`, :cve:`2014-3690`, :cve:`2014-3917`, :cve:`2014-3940`, :cve:`2014-4014`, :cve:`2014-4027`, :cve:`2014-4157`, :cve:`2014-4171`, :cve:`2014-4508`, :cve:`2014-4608`, :cve:`2014-4611`, :cve:`2014-4652`, :cve:`2014-4653`, :cve:`2014-4654`, :cve:`2014-4655`, :cve:`2014-4656`, :cve:`2014-4667`, :cve:`2014-4699`, :cve:`2014-4943`, :cve:`2014-5045`, :cve:`2014-5077`, :cve:`2014-5206`, :cve:`2014-5207`, :cve:`2014-5471`, :cve:`2014-5472`, :cve:`2014-6410`, :cve:`2014-6416`, :cve:`2014-6417`, :cve:`2014-6418`, :cve:`2014-7145`, :cve:`2014-7283`, :cve:`2014-7284`, :cve:`2014-7822`, :cve:`2014-782
 5`, :cve:`2014-7826`, :cve:`2014-7841`, :cve:`2014-7842`, :cve:`2014-7843`, :cve:`2014-7970`, :cve:`2014-7975`, :cve:`2014-8086`, :cve:`2014-8133`, :cve:`2014-8134`, :cve:`2014-8159`, :cve:`2014-8160`, :cve:`2014-8171`, :cve:`2014-8172`, :cve:`2014-8173`, :cve:`2014-8369`, :cve:`2014-8480`, :cve:`2014-8481`, :cve:`2014-8559`, :cve:`2014-8709`, :cve:`2014-8884`, :cve:`2014-8989`, :cve:`2014-9090`, :cve:`2014-9322`, :cve:`2014-9419`, :cve:`2014-9420`, :cve:`2014-9428`, :cve:`2014-9529`, :cve:`2014-9584`, :cve:`2014-9585`, :cve:`2014-9644`, :cve:`2014-9683`, :cve:`2014-9710`, :cve:`2014-9715`, :cve:`2014-9717`, :cve:`2014-9728`, :cve:`2014-9729`, :cve:`2014-9730`, :cve:`2014-9731`, :cve:`2014-9803`, :cve:`2014-9870`, :cve:`2014-9888`, :cve:`2014-9895`, :cve:`2014-9903`, :cve:`2014-9904`, :cve:`2014-9914`, :cve:`2014-9922`, :cve:`2014-9940`, :cve:`2015-0239`, :cve:`2015-0274`, :cve:`2015-0275`, :cve:`2015-1333`, :cve:`2015-1339`, :cve:`2015-1350`, :cve:`2015-1420`, :cve:`2015-1421`, :cv
 e:`2015-1465`, :cve:`2015-1573`, :cve:`2015-1593`, :cve:`2015-1805`, :cve:`2015-2041`, :cve:`2015-2042`, :cve:`2015-2150`, :cve:`2015-2666`, :cve:`2015-2672`, :cve:`2015-2686`, :cve:`2015-2830`, :cve:`2015-2922`, :cve:`2015-2925`, :cve:`2015-3212`, :cve:`2015-3214`, :cve:`2015-3288`, :cve:`2015-3290`, :cve:`2015-3291`, :cve:`2015-3331`, :cve:`2015-3339`, :cve:`2015-3636`, :cve:`2015-4001`, :cve:`2015-4002`, :cve:`2015-4003`, :cve:`2015-4004`, :cve:`2015-4036`, :cve:`2015-4167`, :cve:`2015-4170`, :cve:`2015-4176`, :cve:`2015-4177`, :cve:`2015-4178`, :cve:`2015-4692`, :cve:`2015-4700`, :cve:`2015-5156`, :cve:`2015-5157`, :cve:`2015-5257`, :cve:`2015-5283`, :cve:`2015-5307`, :cve:`2015-5327`, :cve:`2015-5364`, :cve:`2015-5366`, :cve:`2015-5697`, :cve:`2015-5706`, :cve:`2015-5707`, :cve:`2015-6252`, :cve:`2015-6526`, :cve:`2015-6937`, :cve:`2015-7509`, :cve:`2015-7513`, :cve:`2015-7515`, :cve:`2015-7550`, :cve:`2015-7566`, :cve:`2015-7613`, :cve:`2015-7799`, :cve:`2015-7833`, :cve:`2015
 -7872`, :cve:`2015-7884`, :cve:`2015-7885`, :cve:`2015-7990`, :cve:`2015-8104`, :cve:`2015-8215`, :cve:`2015-8324`, :cve:`2015-8374`, :cve:`2015-8539`, :cve:`2015-8543`, :cve:`2015-8550`, :cve:`2015-8551`, :cve:`2015-8552`, :cve:`2015-8553`, :cve:`2015-8569`, :cve:`2015-8575`, :cve:`2015-8660`, :cve:`2015-8709`, :cve:`2015-8746`, :cve:`2015-8767`, :cve:`2015-8785`, :cve:`2015-8787`, :cve:`2015-8812`, :cve:`2015-8816`, :cve:`2015-8830`, :cve:`2015-8839`, :cve:`2015-8844`, :cve:`2015-8845`, :cve:`2015-8950`, :cve:`2015-8952`, :cve:`2015-8953`, :cve:`2015-8955`, :cve:`2015-8956`, :cve:`2015-8961`, :cve:`2015-8962`, :cve:`2015-8963`, :cve:`2015-8964`, :cve:`2015-8966`, :cve:`2015-8967`, :cve:`2015-8970`, :cve:`2015-9004`, :cve:`2015-9016`, :cve:`2015-9289`, :cve:`2016-0617`, :cve:`2016-0723`, :cve:`2016-0728`, :cve:`2016-0758`, :cve:`2016-0821`, :cve:`2016-0823`, :cve:`2016-10044`, :cve:`2016-10088`, :cve:`2016-10147`, :cve:`2016-10150`, :cve:`2016-10153`, :cve:`2016-10154`, :cve:`2016-
 10200`, :cve:`2016-10208`, :cve:`2016-10229`, :cve:`2016-10318`, :cve:`2016-10723`, :cve:`2016-10741`, :cve:`2016-10764`, :cve:`2016-10905`, :cve:`2016-10906`, :cve:`2016-10907`, :cve:`2016-1237`, :cve:`2016-1575`, :cve:`2016-1576`, :cve:`2016-1583`, :cve:`2016-2053`, :cve:`2016-2069`, :cve:`2016-2070`, :cve:`2016-2085`, :cve:`2016-2117`, :cve:`2016-2143`, :cve:`2016-2184`, :cve:`2016-2185`, :cve:`2016-2186`, :cve:`2016-2187`, :cve:`2016-2188`, :cve:`2016-2383`, :cve:`2016-2384`, :cve:`2016-2543`, :cve:`2016-2544`, :cve:`2016-2545`, :cve:`2016-2546`, :cve:`2016-2547`, :cve:`2016-2548`, :cve:`2016-2549`, :cve:`2016-2550`, :cve:`2016-2782`, :cve:`2016-2847`, :cve:`2016-3044`, :cve:`2016-3070`, :cve:`2016-3134`, :cve:`2016-3135`, :cve:`2016-3136`, :cve:`2016-3137`, :cve:`2016-3138`, :cve:`2016-3139`, :cve:`2016-3140`, :cve:`2016-3156`, :cve:`2016-3157`, :cve:`2016-3672`, :cve:`2016-3689`, :cve:`2016-3713`, :cve:`2016-3841`, :cve:`2016-3857`, :cve:`2016-3951`, :cve:`2016-3955`, :cve:`20
 16-3961`, :cve:`2016-4440`, :cve:`2016-4470`, :cve:`2016-4482`, :cve:`2016-4485`, :cve:`2016-4486`, :cve:`2016-4557`, :cve:`2016-4558`, :cve:`2016-4565`, :cve:`2016-4568`, :cve:`2016-4569`, :cve:`2016-4578`, :cve:`2016-4580`, :cve:`2016-4581`, :cve:`2016-4794`, :cve:`2016-4805`, :cve:`2016-4913`, :cve:`2016-4951`, :cve:`2016-4997`, :cve:`2016-4998`, :cve:`2016-5195`, :cve:`2016-5243`, :cve:`2016-5244`, :cve:`2016-5400`, :cve:`2016-5412`, :cve:`2016-5696`, :cve:`2016-5728`, :cve:`2016-5828`, :cve:`2016-5829`, :cve:`2016-6130`, :cve:`2016-6136`, :cve:`2016-6156`, :cve:`2016-6162`, :cve:`2016-6187`, :cve:`2016-6197`, :cve:`2016-6198`, :cve:`2016-6213`, :cve:`2016-6327`, :cve:`2016-6480`, :cve:`2016-6516`, :cve:`2016-6786`, :cve:`2016-6787`, :cve:`2016-6828`, :cve:`2016-7039`, :cve:`2016-7042`, :cve:`2016-7097`, :cve:`2016-7117`, :cve:`2016-7425`, :cve:`2016-7910`, :cve:`2016-7911`, :cve:`2016-7912`, :cve:`2016-7913`, :cve:`2016-7914`, :cve:`2016-7915`, :cve:`2016-7916`, :cve:`2016-7917
 `, :cve:`2016-8399`, :cve:`2016-8405`, :cve:`2016-8630`, :cve:`2016-8632`, :cve:`2016-8633`, :cve:`2016-8636`, :cve:`2016-8645`, :cve:`2016-8646`, :cve:`2016-8650`, :cve:`2016-8655`, :cve:`2016-8658`, :cve:`2016-8666`, :cve:`2016-9083`, :cve:`2016-9084`, :cve:`2016-9120`, :cve:`2016-9178`, :cve:`2016-9191`, :cve:`2016-9313`, :cve:`2016-9555`, :cve:`2016-9576`, :cve:`2016-9588`, :cve:`2016-9604`, :cve:`2016-9685`, :cve:`2016-9754`, :cve:`2016-9755`, :cve:`2016-9756`, :cve:`2016-9777`, :cve:`2016-9793`, :cve:`2016-9794`, :cve:`2016-9806`, :cve:`2016-9919`, :cve:`2017-0605`, :cve:`2017-0627`, :cve:`2017-0750`, :cve:`2017-0786`, :cve:`2017-0861`, :cve:`2017-1000`, :cve:`2017-1000111`, :cve:`2017-1000112`, :cve:`2017-1000251`, :cve:`2017-1000252`, :cve:`2017-1000253`, :cve:`2017-1000255`, :cve:`2017-1000363`, :cve:`2017-1000364`, :cve:`2017-1000365`, :cve:`2017-1000370`, :cve:`2017-1000371`, :cve:`2017-1000379`, :cve:`2017-1000380`, :cve:`2017-1000405`, :cve:`2017-1000407`, :cve:`2017-10
 00410`, :cve:`2017-10661`, :cve:`2017-10662`, :cve:`2017-10663`, :cve:`2017-10810`, :cve:`2017-10911`, :cve:`2017-11089`, :cve:`2017-11176`, :cve:`2017-11472`, :cve:`2017-11473`, :cve:`2017-11600`, :cve:`2017-12134`, :cve:`2017-12146`, :cve:`2017-12153`, :cve:`2017-12154`, :cve:`2017-12168`, :cve:`2017-12188`, :cve:`2017-12190`, :cve:`2017-12192`, :cve:`2017-12193`, :cve:`2017-12762`, :cve:`2017-13080`, :cve:`2017-13166`, :cve:`2017-13167`, :cve:`2017-13168`, :cve:`2017-13215`, :cve:`2017-13216`, :cve:`2017-13220`, :cve:`2017-13305`, :cve:`2017-13686`, :cve:`2017-13695`, :cve:`2017-13715`, :cve:`2017-14051`, :cve:`2017-14106`, :cve:`2017-14140`, :cve:`2017-14156`, :cve:`2017-14340`, :cve:`2017-14489`, :cve:`2017-14497`, :cve:`2017-14954`, :cve:`2017-14991`, :cve:`2017-15102`, :cve:`2017-15115`, :cve:`2017-15116`, :cve:`2017-15121`, :cve:`2017-15126`, :cve:`2017-15127`, :cve:`2017-15128`, :cve:`2017-15129`, :cve:`2017-15265`, :cve:`2017-15274`, :cve:`2017-15299`, :cve:`2017-15306`, :
 cve:`2017-15537`, :cve:`2017-15649`, :cve:`2017-15868`, :cve:`2017-15951`, :cve:`2017-16525`, :cve:`2017-16526`, :cve:`2017-16527`, :cve:`2017-16528`, :cve:`2017-16529`, :cve:`2017-16530`, :cve:`2017-16531`, :cve:`2017-16532`, :cve:`2017-16533`, :cve:`2017-16534`, :cve:`2017-16535`, :cve:`2017-16536`, :cve:`2017-16537`, :cve:`2017-16538`, :cve:`2017-16643`, :cve:`2017-16644`, :cve:`2017-16645`, :cve:`2017-16646`, :cve:`2017-16647`, :cve:`2017-16648`, :cve:`2017-16649`, :cve:`2017-16650`, :cve:`2017-16911`, :cve:`2017-16912`, :cve:`2017-16913`, :cve:`2017-16914`, :cve:`2017-16939`, :cve:`2017-16994`, :cve:`2017-16995`, :cve:`2017-16996`, :cve:`2017-17052`, :cve:`2017-17053`, :cve:`2017-17448`, :cve:`2017-17449`, :cve:`2017-17450`, :cve:`2017-17558`, :cve:`2017-17712`, :cve:`2017-17741`, :cve:`2017-17805`, :cve:`2017-17806`, :cve:`2017-17807`, :cve:`2017-17852`, :cve:`2017-17853`, :cve:`2017-17854`, :cve:`2017-17855`, :cve:`2017-17856`, :cve:`2017-17857`, :cve:`2017-17862`, :cve:`2017
 -17863`, :cve:`2017-17864`, :cve:`2017-17975`, :cve:`2017-18017`, :cve:`2017-18075`, :cve:`2017-18079`, :cve:`2017-18174`, :cve:`2017-18193`, :cve:`2017-18200`, :cve:`2017-18202`, :cve:`2017-18203`, :cve:`2017-18204`, :cve:`2017-18208`, :cve:`2017-18216`, :cve:`2017-18218`, :cve:`2017-18221`, :cve:`2017-18222`, :cve:`2017-18224`, :cve:`2017-18232`, :cve:`2017-18241`, :cve:`2017-18249`, :cve:`2017-18255`, :cve:`2017-18257`, :cve:`2017-18261`, :cve:`2017-18270`, :cve:`2017-18344`, :cve:`2017-18360`, :cve:`2017-18379`, :cve:`2017-18509`, :cve:`2017-18549`, :cve:`2017-18550`, :cve:`2017-18551`, :cve:`2017-18552`, :cve:`2017-18595`, :cve:`2017-2583`, :cve:`2017-2584`, :cve:`2017-2596`, :cve:`2017-2618`, :cve:`2017-2634`, :cve:`2017-2636`, :cve:`2017-2647`, :cve:`2017-2671`, :cve:`2017-5123`, :cve:`2017-5546`, :cve:`2017-5547`, :cve:`2017-5548`, :cve:`2017-5549`, :cve:`2017-5550`, :cve:`2017-5551`, :cve:`2017-5576`, :cve:`2017-5577`, :cve:`2017-5669`, :cve:`2017-5715`, :cve:`2017-5753`, :
 cve:`2017-5754`, :cve:`2017-5897`, :cve:`2017-5967`, :cve:`2017-5970`, :cve:`2017-5972`, :cve:`2017-5986`, :cve:`2017-6001`, :cve:`2017-6074`, :cve:`2017-6214`, :cve:`2017-6345`, :cve:`2017-6346`, :cve:`2017-6347`, :cve:`2017-6348`, :cve:`2017-6353`, :cve:`2017-6874`, :cve:`2017-6951`, :cve:`2017-7184`, :cve:`2017-7187`, :cve:`2017-7261`, :cve:`2017-7273`, :cve:`2017-7277`, :cve:`2017-7294`, :cve:`2017-7308`, :cve:`2017-7346`, :cve:`2017-7374`, :cve:`2017-7472`, :cve:`2017-7477`, :cve:`2017-7482`, :cve:`2017-7487`, :cve:`2017-7495`, :cve:`2017-7518`, :cve:`2017-7533`, :cve:`2017-7541`, :cve:`2017-7542`, :cve:`2017-7558`, :cve:`2017-7616`, :cve:`2017-7618`, :cve:`2017-7645`, :cve:`2017-7889`, :cve:`2017-7895`, :cve:`2017-7979`, :cve:`2017-8061`, :cve:`2017-8062`, :cve:`2017-8063`, :cve:`2017-8064`, :cve:`2017-8065`, :cve:`2017-8066`, :cve:`2017-8067`, :cve:`2017-8068`, :cve:`2017-8069`, :cve:`2017-8070`, :cve:`2017-8071`, :cve:`2017-8072`, :cve:`2017-8106`, :cve:`2017-8240`, :cve:`20
 17-8797`, :cve:`2017-8824`, :cve:`2017-8831`, :cve:`2017-8890`, :cve:`2017-8924`, :cve:`2017-8925`, :cve:`2017-9059`, :cve:`2017-9074`, :cve:`2017-9075`, :cve:`2017-9076`, :cve:`2017-9077`, :cve:`2017-9150`, :cve:`2017-9211`, :cve:`2017-9242`, :cve:`2017-9605`, :cve:`2017-9725`, :cve:`2017-9984`, :cve:`2017-9985`, :cve:`2017-9986`, :cve:`2018-1000004`, :cve:`2018-1000026`, :cve:`2018-1000028`, :cve:`2018-1000199`, :cve:`2018-1000200`, :cve:`2018-1000204`, :cve:`2018-10021`, :cve:`2018-10074`, :cve:`2018-10087`, :cve:`2018-10124`, :cve:`2018-10322`, :cve:`2018-10323`, :cve:`2018-1065`, :cve:`2018-1066`, :cve:`2018-10675`, :cve:`2018-1068`, :cve:`2018-10840`, :cve:`2018-10853`, :cve:`2018-1087`, :cve:`2018-10876`, :cve:`2018-10877`, :cve:`2018-10878`, :cve:`2018-10879`, :cve:`2018-10880`, :cve:`2018-10881`, :cve:`2018-10882`, :cve:`2018-10883`, :cve:`2018-10901`, :cve:`2018-10902`, :cve:`2018-1091`, :cve:`2018-1092`, :cve:`2018-1093`, :cve:`2018-10938`, :cve:`2018-1094`, :cve:`2018-10
 940`, :cve:`2018-1095`, :cve:`2018-1108`, :cve:`2018-1118`, :cve:`2018-1120`, :cve:`2018-11232`, :cve:`2018-1128`, :cve:`2018-1129`, :cve:`2018-1130`, :cve:`2018-11412`, :cve:`2018-11506`, :cve:`2018-11508`, :cve:`2018-12126`, :cve:`2018-12127`, :cve:`2018-12130`, :cve:`2018-12207`, :cve:`2018-12232`, :cve:`2018-12233`, :cve:`2018-12633`, :cve:`2018-12714`, :cve:`2018-12896`, :cve:`2018-12904`, :cve:`2018-13053`, :cve:`2018-13093`, :cve:`2018-13094`, :cve:`2018-13095`, :cve:`2018-13096`, :cve:`2018-13097`, :cve:`2018-13098`, :cve:`2018-13099`, :cve:`2018-13100`, :cve:`2018-13405`, :cve:`2018-13406`, :cve:`2018-14609`, :cve:`2018-14610`, :cve:`2018-14611`, :cve:`2018-14612`, :cve:`2018-14613`, :cve:`2018-14614`, :cve:`2018-14615`, :cve:`2018-14616`, :cve:`2018-14617`, :cve:`2018-14619`, :cve:`2018-14625`, :cve:`2018-14633`, :cve:`2018-14634`, :cve:`2018-14641`, :cve:`2018-14646`, :cve:`2018-14656`, :cve:`2018-14678`, :cve:`2018-14734`, :cve:`2018-15471`, :cve:`2018-15572`, :cve:`2018
 -15594`, :cve:`2018-16276`, :cve:`2018-16597`, :cve:`2018-16658`, :cve:`2018-16862`, :cve:`2018-16871`, :cve:`2018-16880`, :cve:`2018-16882`, :cve:`2018-16884`, :cve:`2018-17182`, :cve:`2018-17972`, :cve:`2018-18021`, :cve:`2018-18281`, :cve:`2018-18386`, :cve:`2018-18397`, :cve:`2018-18445`, :cve:`2018-18559`, :cve:`2018-18690`, :cve:`2018-18710`, :cve:`2018-18955`, :cve:`2018-19406`, :cve:`2018-19407`, :cve:`2018-19824`, :cve:`2018-19854`, :cve:`2018-19985`, :cve:`2018-20169`, :cve:`2018-20449`, :cve:`2018-20509`, :cve:`2018-20510`, :cve:`2018-20511`, :cve:`2018-20669`, :cve:`2018-20784`, :cve:`2018-20836`, :cve:`2018-20854`, :cve:`2018-20855`, :cve:`2018-20856`, :cve:`2018-20961`, :cve:`2018-20976`, :cve:`2018-21008`, :cve:`2018-25015`, :cve:`2018-25020`, :cve:`2018-3620`, :cve:`2018-3639`, :cve:`2018-3646`, :cve:`2018-3665`, :cve:`2018-3693`, :cve:`2018-5332`, :cve:`2018-5333`, :cve:`2018-5344`, :cve:`2018-5390`, :cve:`2018-5391`, :cve:`2018-5703`, :cve:`2018-5750`, :cve:`2018-5
 803`, :cve:`2018-5814`, :cve:`2018-5848`, :cve:`2018-5873`, :cve:`2018-5953`, :cve:`2018-5995`, :cve:`2018-6412`, :cve:`2018-6554`, :cve:`2018-6555`, :cve:`2018-6927`, :cve:`2018-7191`, :cve:`2018-7273`, :cve:`2018-7480`, :cve:`2018-7492`, :cve:`2018-7566`, :cve:`2018-7740`, :cve:`2018-7754`, :cve:`2018-7755`, :cve:`2018-7757`, :cve:`2018-7995`, :cve:`2018-8043`, :cve:`2018-8087`, :cve:`2018-8781`, :cve:`2018-8822`, :cve:`2018-8897`, :cve:`2018-9363`, :cve:`2018-9385`, :cve:`2018-9415`, :cve:`2018-9422`, :cve:`2018-9465`, :cve:`2018-9516`, :cve:`2018-9517`, :cve:`2018-9518`, :cve:`2018-9568`, :cve:`2019-0136`, :cve:`2019-0145`, :cve:`2019-0146`, :cve:`2019-0147`, :cve:`2019-0148`, :cve:`2019-0149`, :cve:`2019-0154`, :cve:`2019-0155`, :cve:`2019-10124`, :cve:`2019-10125`, :cve:`2019-10126`, :cve:`2019-10142`, :cve:`2019-10207`, :cve:`2019-10220`, :cve:`2019-10638`, :cve:`2019-10639`, :cve:`2019-11085`, :cve:`2019-11091`, :cve:`2019-11135`, :cve:`2019-11190`, :cve:`2019-11191`, :cve:`
 2019-1125`, :cve:`2019-11477`, :cve:`2019-11478`, :cve:`2019-11479`, :cve:`2019-11486`, :cve:`2019-11487`, :cve:`2019-11599`, :cve:`2019-11683`, :cve:`2019-11810`, :cve:`2019-11811`, :cve:`2019-11815`, :cve:`2019-11833`, :cve:`2019-11884`, :cve:`2019-12378`, :cve:`2019-12379`, :cve:`2019-12380`, :cve:`2019-12381`, :cve:`2019-12382`, :cve:`2019-12454`, :cve:`2019-12455`, :cve:`2019-12614`, :cve:`2019-12615`, :cve:`2019-12817`, :cve:`2019-12818`, :cve:`2019-12819`, :cve:`2019-12881`, :cve:`2019-12984`, :cve:`2019-13233`, :cve:`2019-13272`, :cve:`2019-13631`, :cve:`2019-13648`, :cve:`2019-14283`, :cve:`2019-14284`, :cve:`2019-14615`, :cve:`2019-14763`, :cve:`2019-14814`, :cve:`2019-14815`, :cve:`2019-14816`, :cve:`2019-14821`, :cve:`2019-14835`, :cve:`2019-14895`, :cve:`2019-14896`, :cve:`2019-14897`, :cve:`2019-14901`, :cve:`2019-15030`, :cve:`2019-15031`, :cve:`2019-15090`, :cve:`2019-15098`, :cve:`2019-15099`, :cve:`2019-15117`, :cve:`2019-15118`, :cve:`2019-15211`, :cve:`2019-15212
 `, :cve:`2019-15213`, :cve:`2019-15214`, :cve:`2019-15215`, :cve:`2019-15216`, :cve:`2019-15217`, :cve:`2019-15218`, :cve:`2019-15219`, :cve:`2019-15220`, :cve:`2019-15221`, :cve:`2019-15222`, :cve:`2019-15223`, :cve:`2019-15291`, :cve:`2019-15292`, :cve:`2019-15504`, :cve:`2019-15505`, :cve:`2019-15538`, :cve:`2019-15666`, :cve:`2019-15794`, :cve:`2019-15807`, :cve:`2019-15916`, :cve:`2019-15917`, :cve:`2019-15918`, :cve:`2019-15919`, :cve:`2019-15920`, :cve:`2019-15921`, :cve:`2019-15922`, :cve:`2019-15923`, :cve:`2019-15924`, :cve:`2019-15925`, :cve:`2019-15926`, :cve:`2019-15927`, :cve:`2019-16229`, :cve:`2019-16230`, :cve:`2019-16231`, :cve:`2019-16232`, :cve:`2019-16233`, :cve:`2019-16234`, :cve:`2019-16413`, :cve:`2019-16714`, :cve:`2019-16746`, :cve:`2019-16921`, :cve:`2019-16994`, :cve:`2019-16995`, :cve:`2019-17052`, :cve:`2019-17053`, :cve:`2019-17054`, :cve:`2019-17055`, :cve:`2019-17056`, :cve:`2019-17075`, :cve:`2019-17133`, :cve:`2019-17351`, :cve:`2019-17666`, :cve:`
 2019-18198`, :cve:`2019-18282`, :cve:`2019-18660`, :cve:`2019-18675`, :cve:`2019-18683`, :cve:`2019-18786`, :cve:`2019-18805`, :cve:`2019-18806`, :cve:`2019-18807`, :cve:`2019-18808`, :cve:`2019-18809`, :cve:`2019-18810`, :cve:`2019-18811`, :cve:`2019-18812`, :cve:`2019-18813`, :cve:`2019-18814`, :cve:`2019-18885`, :cve:`2019-19036`, :cve:`2019-19037`, :cve:`2019-19039`, :cve:`2019-19043`, :cve:`2019-19044`, :cve:`2019-19045`, :cve:`2019-19046`, :cve:`2019-19047`, :cve:`2019-19048`, :cve:`2019-19049`, :cve:`2019-19050`, :cve:`2019-19051`, :cve:`2019-19052`, :cve:`2019-19053`, :cve:`2019-19054`, :cve:`2019-19055`, :cve:`2019-19056`, :cve:`2019-19057`, :cve:`2019-19058`, :cve:`2019-19059`, :cve:`2019-19060`, :cve:`2019-19061`, :cve:`2019-19062`, :cve:`2019-19063`, :cve:`2019-19064`, :cve:`2019-19065`, :cve:`2019-19066`, :cve:`2019-19067`, :cve:`2019-19068`, :cve:`2019-19069`, :cve:`2019-19070`, :cve:`2019-19071`, :cve:`2019-19072`, :cve:`2019-19073`, :cve:`2019-19074`, :cve:`2019-1907
 5`, :cve:`2019-19076`, :cve:`2019-19077`, :cve:`2019-19078`, :cve:`2019-19079`, :cve:`2019-19080`, :cve:`2019-19081`, :cve:`2019-19082`, :cve:`2019-19083`, :cve:`2019-19227`, :cve:`2019-19241`, :cve:`2019-19252`, :cve:`2019-19318`, :cve:`2019-19319`, :cve:`2019-19332`, :cve:`2019-19338`, :cve:`2019-19377`, :cve:`2019-19447`, :cve:`2019-19448`, :cve:`2019-19449`, :cve:`2019-19462`, :cve:`2019-19523`, :cve:`2019-19524`, :cve:`2019-19525`, :cve:`2019-19526`, :cve:`2019-19527`, :cve:`2019-19528`, :cve:`2019-19529`, :cve:`2019-19530`, :cve:`2019-19531`, :cve:`2019-19532`, :cve:`2019-19533`, :cve:`2019-19534`, :cve:`2019-19535`, :cve:`2019-19536`, :cve:`2019-19537`, :cve:`2019-19543`, :cve:`2019-19602`, :cve:`2019-19767`, :cve:`2019-19768`, :cve:`2019-19769`, :cve:`2019-19770`, :cve:`2019-19807`, :cve:`2019-19813`, :cve:`2019-19815`, :cve:`2019-19816`, :cve:`2019-19922`, :cve:`2019-19927`, :cve:`2019-19947`, :cve:`2019-19965` and :cve:`2019-1999`
--  nasm: Fix :cve:`2020-21528`
--  ncurses: Fix :cve:`2023-29491`
--  nghttp2: Fix :cve:`2023-35945`
--  procps: Fix :cve:`2023-4016`
--  python3-certifi: Fix :cve:`2023-37920`
--  python3-git: Fix :cve:`2022-24439` and :cve:`2023-40267`
--  python3-pygments: Fix :cve:`2022-40896`
--  python3: Fix :cve:`2023-40217`
--  qemu: Fix :cve:`2020-14394`, :cve:`2021-3638`, :cve_mitre:`2023-2861`, :cve:`2023-3180` and :cve:`2023-3354`
--  tiff: fix :cve:`2023-2908`, :cve:`2023-3316` and :cve:`2023-3618`
--  vim: Fix :cve:`2023-3896`, :cve:`2023-4733`, :cve:`2023-4734`, :cve:`2023-4735`, :cve:`2023-4736`, :cve:`2023-4738`, :cve:`2023-4750` and :cve:`2023-4752`
--  webkitgtk: fix :cve:`2022-48503` and :cve:`2023-23529`
+-  inetutils: Fix :cve_nist:`2023-40303`
+-  json-c: Fix :cve_nist:`2021-32292`
+-  librsvg: Fix :cve_nist:`2023-38633`
+-  libssh2: Fix :cve_nist:`2020-22218`
+-  libtiff: Fix :cve_nist:`2023-26966`
+-  libxml2: Fix :cve_nist:`2023-39615`
+-  linux-yocto/5.15: Ignore :cve_nist:`2003-1604`, :cve_nist:`2004-0230`, :cve_nist:`2006-3635`, :cve_nist:`2006-5331`, :cve_nist:`2006-6128`, :cve_nist:`2007-4774`, :cve_nist:`2007-6761`, :cve_nist:`2007-6762`, :cve_nist:`2008-7316`, :cve_nist:`2009-2692`, :cve_nist:`2010-0008`, :cve_nist:`2010-3432`, :cve_nist:`2010-4648`, :cve_nist:`2010-5313`, :cve_nist:`2010-5328`, :cve_nist:`2010-5329`, :cve_nist:`2010-5331`, :cve_nist:`2010-5332`, :cve_nist:`2011-4098`, :cve_nist:`2011-4131`, :cve_nist:`2011-4915`, :cve_nist:`2011-5321`, :cve_nist:`2011-5327`, :cve_nist:`2012-0957`, :cve_nist:`2012-2119`, :cve_nist:`2012-2136`, :cve_nist:`2012-2137`, :cve_nist:`2012-2313`, :cve_nist:`2012-2319`, :cve_nist:`2012-2372`, :cve_nist:`2012-2375`, :cve_nist:`2012-2390`, :cve_nist:`2012-2669`, :cve_nist:`2012-2744`, :cve_nist:`2012-2745`, :cve_nist:`2012-3364`, :cve_nist:`2012-3375`, :cve_nist:`2012-3400`, :cve_nist:`2012-3412`, :cve_nist:`2012-3430`, :cve_nist:`2012-3510`, :cve_nist:`2012-3511`, :cv
 e_nist:`2012-3520`, :cve_nist:`2012-3552`, :cve_nist:`2012-4398`, :cve_nist:`2012-4444`, :cve_nist:`2012-4461`, :cve_nist:`2012-4467`, :cve_nist:`2012-4508`, :cve_nist:`2012-4530`, :cve_nist:`2012-4565`, :cve_nist:`2012-5374`, :cve_nist:`2012-5375`, :cve_nist:`2012-5517`, :cve_nist:`2012-6536`, :cve_nist:`2012-6537`, :cve_nist:`2012-6538`, :cve_nist:`2012-6539`, :cve_nist:`2012-6540`, :cve_nist:`2012-6541`, :cve_nist:`2012-6542`, :cve_nist:`2012-6543`, :cve_nist:`2012-6544`, :cve_nist:`2012-6545`, :cve_nist:`2012-6546`, :cve_nist:`2012-6547`, :cve_nist:`2012-6548`, :cve_nist:`2012-6549`, :cve_nist:`2012-6638`, :cve_nist:`2012-6647`, :cve_nist:`2012-6657`, :cve_nist:`2012-6689`, :cve_nist:`2012-6701`, :cve_nist:`2012-6703`, :cve_nist:`2012-6704`, :cve_nist:`2012-6712`, :cve_nist:`2013-0160`, :cve_nist:`2013-0190`, :cve_nist:`2013-0216`, :cve_nist:`2013-0217`, :cve_nist:`2013-0228`, :cve_nist:`2013-0231`, :cve_nist:`2013-0268`, :cve_nist:`2013-0290`, :cve_nist:`2013-0309`, :cve_nist:`
 2013-0310`, :cve_nist:`2013-0311`, :cve_nist:`2013-0313`, :cve_nist:`2013-0343`, :cve_nist:`2013-0349`, :cve_nist:`2013-0871`, :cve_nist:`2013-0913`, :cve_nist:`2013-0914`, :cve_nist:`2013-1059`, :cve_nist:`2013-1763`, :cve_nist:`2013-1767`, :cve_nist:`2013-1772`, :cve_nist:`2013-1773`, :cve_nist:`2013-1774`, :cve_nist:`2013-1792`, :cve_nist:`2013-1796`, :cve_nist:`2013-1797`, :cve_nist:`2013-1798`, :cve_nist:`2013-1819`, :cve_nist:`2013-1826`, :cve_nist:`2013-1827`, :cve_nist:`2013-1828`, :cve_nist:`2013-1848`, :cve_nist:`2013-1858`, :cve_nist:`2013-1860`, :cve_nist:`2013-1928`, :cve_nist:`2013-1929`, :cve_nist:`2013-1943`, :cve_nist:`2013-1956`, :cve_nist:`2013-1957`, :cve_nist:`2013-1958`, :cve_nist:`2013-1959`, :cve_nist:`2013-1979`, :cve_nist:`2013-2015`, :cve_nist:`2013-2017`, :cve_nist:`2013-2058`, :cve_nist:`2013-2094`, :cve_nist:`2013-2128`, :cve_nist:`2013-2140`, :cve_nist:`2013-2141`, :cve_nist:`2013-2146`, :cve_nist:`2013-2147`, :cve_nist:`2013-2148`, :cve_nist:`2013-216
 4`, :cve_nist:`2013-2206`, :cve_nist:`2013-2232`, :cve_nist:`2013-2234`, :cve_nist:`2013-2237`, :cve_nist:`2013-2546`, :cve_nist:`2013-2547`, :cve_nist:`2013-2548`, :cve_nist:`2013-2596`, :cve_nist:`2013-2634`, :cve_nist:`2013-2635`, :cve_nist:`2013-2636`, :cve_nist:`2013-2850`, :cve_nist:`2013-2851`, :cve_nist:`2013-2852`, :cve_nist:`2013-2888`, :cve_nist:`2013-2889`, :cve_nist:`2013-2890`, :cve_nist:`2013-2891`, :cve_nist:`2013-2892`, :cve_nist:`2013-2893`, :cve_nist:`2013-2894`, :cve_nist:`2013-2895`, :cve_nist:`2013-2896`, :cve_nist:`2013-2897`, :cve_nist:`2013-2898`, :cve_nist:`2013-2899`, :cve_nist:`2013-2929`, :cve_nist:`2013-2930`, :cve_nist:`2013-3076`, :cve_nist:`2013-3222`, :cve_nist:`2013-3223`, :cve_nist:`2013-3224`, :cve_nist:`2013-3225`, :cve_nist:`2013-3226`, :cve_nist:`2013-3227`, :cve_nist:`2013-3228`, :cve_nist:`2013-3229`, :cve_nist:`2013-3230`, :cve_nist:`2013-3231`, :cve_nist:`2013-3232`, :cve_nist:`2013-3233`, :cve_nist:`2013-3234`, :cve_nist:`2013-3235`, :cve
 _nist:`2013-3236`, :cve_nist:`2013-3237`, :cve_nist:`2013-3301`, :cve_nist:`2013-3302`, :cve_nist:`2013-4125`, :cve_nist:`2013-4127`, :cve_nist:`2013-4129`, :cve_nist:`2013-4162`, :cve_nist:`2013-4163`, :cve_nist:`2013-4205`, :cve_nist:`2013-4220`, :cve_nist:`2013-4247`, :cve_nist:`2013-4254`, :cve_nist:`2013-4270`, :cve_nist:`2013-4299`, :cve_nist:`2013-4300`, :cve_nist:`2013-4312`, :cve_nist:`2013-4343`, :cve_nist:`2013-4345`, :cve_nist:`2013-4348`, :cve_nist:`2013-4350`, :cve_nist:`2013-4387`, :cve_nist:`2013-4470`, :cve_nist:`2013-4483`, :cve_nist:`2013-4511`, :cve_nist:`2013-4512`, :cve_nist:`2013-4513`, :cve_nist:`2013-4514`, :cve_nist:`2013-4515`, :cve_nist:`2013-4516`, :cve_nist:`2013-4563`, :cve_nist:`2013-4579`, :cve_nist:`2013-4587`, :cve_nist:`2013-4588`, :cve_nist:`2013-4591`, :cve_nist:`2013-4592`, :cve_nist:`2013-5634`, :cve_nist:`2013-6282`, :cve_nist:`2013-6367`, :cve_nist:`2013-6368`, :cve_nist:`2013-6376`, :cve_nist:`2013-6378`, :cve_nist:`2013-6380`, :cve_nist:`2
 013-6381`, :cve_nist:`2013-6382`, :cve_nist:`2013-6383`, :cve_nist:`2013-6431`, :cve_nist:`2013-6432`, :cve_nist:`2013-6885`, :cve_nist:`2013-7026`, :cve_nist:`2013-7027`, :cve_nist:`2013-7263`, :cve_nist:`2013-7264`, :cve_nist:`2013-7265`, :cve_nist:`2013-7266`, :cve_nist:`2013-7267`, :cve_nist:`2013-7268`, :cve_nist:`2013-7269`, :cve_nist:`2013-7270`, :cve_nist:`2013-7271`, :cve_nist:`2013-7281`, :cve_nist:`2013-7339`, :cve_nist:`2013-7348`, :cve_nist:`2013-7421`, :cve_nist:`2013-7446`, :cve_nist:`2013-7470`, :cve_nist:`2014-0038`, :cve_nist:`2014-0049`, :cve_nist:`2014-0055`, :cve_nist:`2014-0069`, :cve_nist:`2014-0077`, :cve_nist:`2014-0100`, :cve_nist:`2014-0101`, :cve_nist:`2014-0102`, :cve_nist:`2014-0131`, :cve_nist:`2014-0155`, :cve_nist:`2014-0181`, :cve_nist:`2014-0196`, :cve_nist:`2014-0203`, :cve_nist:`2014-0205`, :cve_nist:`2014-0206`, :cve_nist:`2014-1438`, :cve_nist:`2014-1444`, :cve_nist:`2014-1445`, :cve_nist:`2014-1446`, :cve_nist:`2014-1690`, :cve_nist:`2014-1737
 `, :cve_nist:`2014-1738`, :cve_nist:`2014-1739`, :cve_nist:`2014-1874`, :cve_nist:`2014-2038`, :cve_nist:`2014-2039`, :cve_nist:`2014-2309`, :cve_nist:`2014-2523`, :cve_nist:`2014-2568`, :cve_nist:`2014-2580`, :cve_nist:`2014-2672`, :cve_nist:`2014-2673`, :cve_nist:`2014-2678`, :cve_nist:`2014-2706`, :cve_nist:`2014-2739`, :cve_nist:`2014-2851`, :cve_nist:`2014-2889`, :cve_nist:`2014-3122`, :cve_nist:`2014-3144`, :cve_nist:`2014-3145`, :cve_nist:`2014-3153`, :cve_nist:`2014-3180`, :cve_nist:`2014-3181`, :cve_nist:`2014-3182`, :cve_nist:`2014-3183`, :cve_nist:`2014-3184`, :cve_nist:`2014-3185`, :cve_nist:`2014-3186`, :cve_nist:`2014-3534`, :cve_nist:`2014-3535`, :cve_nist:`2014-3601`, :cve_nist:`2014-3610`, :cve_nist:`2014-3611`, :cve_nist:`2014-3631`, :cve_nist:`2014-3645`, :cve_nist:`2014-3646`, :cve_nist:`2014-3647`, :cve_nist:`2014-3673`, :cve_nist:`2014-3687`, :cve_nist:`2014-3688`, :cve_nist:`2014-3690`, :cve_nist:`2014-3917`, :cve_nist:`2014-3940`, :cve_nist:`2014-4014`, :cve_
 nist:`2014-4027`, :cve_nist:`2014-4157`, :cve_nist:`2014-4171`, :cve_nist:`2014-4508`, :cve_nist:`2014-4608`, :cve_nist:`2014-4611`, :cve_nist:`2014-4652`, :cve_nist:`2014-4653`, :cve_nist:`2014-4654`, :cve_nist:`2014-4655`, :cve_nist:`2014-4656`, :cve_nist:`2014-4667`, :cve_nist:`2014-4699`, :cve_nist:`2014-4943`, :cve_nist:`2014-5045`, :cve_nist:`2014-5077`, :cve_nist:`2014-5206`, :cve_nist:`2014-5207`, :cve_nist:`2014-5471`, :cve_nist:`2014-5472`, :cve_nist:`2014-6410`, :cve_nist:`2014-6416`, :cve_nist:`2014-6417`, :cve_nist:`2014-6418`, :cve_nist:`2014-7145`, :cve_nist:`2014-7283`, :cve_nist:`2014-7284`, :cve_nist:`2014-7822`, :cve_nist:`2014-7825`, :cve_nist:`2014-7826`, :cve_nist:`2014-7841`, :cve_nist:`2014-7842`, :cve_nist:`2014-7843`, :cve_nist:`2014-7970`, :cve_nist:`2014-7975`, :cve_nist:`2014-8086`, :cve_nist:`2014-8133`, :cve_nist:`2014-8134`, :cve_nist:`2014-8159`, :cve_nist:`2014-8160`, :cve_nist:`2014-8171`, :cve_nist:`2014-8172`, :cve_nist:`2014-8173`, :cve_nist:`20
 14-8369`, :cve_nist:`2014-8480`, :cve_nist:`2014-8481`, :cve_nist:`2014-8559`, :cve_nist:`2014-8709`, :cve_nist:`2014-8884`, :cve_nist:`2014-8989`, :cve_nist:`2014-9090`, :cve_nist:`2014-9322`, :cve_nist:`2014-9419`, :cve_nist:`2014-9420`, :cve_nist:`2014-9428`, :cve_nist:`2014-9529`, :cve_nist:`2014-9584`, :cve_nist:`2014-9585`, :cve_nist:`2014-9644`, :cve_nist:`2014-9683`, :cve_nist:`2014-9710`, :cve_nist:`2014-9715`, :cve_nist:`2014-9717`, :cve_nist:`2014-9728`, :cve_nist:`2014-9729`, :cve_nist:`2014-9730`, :cve_nist:`2014-9731`, :cve_nist:`2014-9803`, :cve_nist:`2014-9870`, :cve_nist:`2014-9888`, :cve_nist:`2014-9895`, :cve_nist:`2014-9903`, :cve_nist:`2014-9904`, :cve_nist:`2014-9914`, :cve_nist:`2014-9922`, :cve_nist:`2014-9940`, :cve_nist:`2015-0239`, :cve_nist:`2015-0274`, :cve_nist:`2015-0275`, :cve_nist:`2015-1333`, :cve_nist:`2015-1339`, :cve_nist:`2015-1350`, :cve_nist:`2015-1420`, :cve_nist:`2015-1421`, :cve_nist:`2015-1465`, :cve_nist:`2015-1573`, :cve_nist:`2015-1593`
 , :cve_nist:`2015-1805`, :cve_nist:`2015-2041`, :cve_nist:`2015-2042`, :cve_nist:`2015-2150`, :cve_nist:`2015-2666`, :cve_nist:`2015-2672`, :cve_nist:`2015-2686`, :cve_nist:`2015-2830`, :cve_nist:`2015-2922`, :cve_nist:`2015-2925`, :cve_nist:`2015-3212`, :cve_nist:`2015-3214`, :cve_nist:`2015-3288`, :cve_nist:`2015-3290`, :cve_nist:`2015-3291`, :cve_nist:`2015-3331`, :cve_nist:`2015-3339`, :cve_nist:`2015-3636`, :cve_nist:`2015-4001`, :cve_nist:`2015-4002`, :cve_nist:`2015-4003`, :cve_nist:`2015-4004`, :cve_nist:`2015-4036`, :cve_nist:`2015-4167`, :cve_nist:`2015-4170`, :cve_nist:`2015-4176`, :cve_nist:`2015-4177`, :cve_nist:`2015-4178`, :cve_nist:`2015-4692`, :cve_nist:`2015-4700`, :cve_nist:`2015-5156`, :cve_nist:`2015-5157`, :cve_nist:`2015-5257`, :cve_nist:`2015-5283`, :cve_nist:`2015-5307`, :cve_nist:`2015-5327`, :cve_nist:`2015-5364`, :cve_nist:`2015-5366`, :cve_nist:`2015-5697`, :cve_nist:`2015-5706`, :cve_nist:`2015-5707`, :cve_nist:`2015-6252`, :cve_nist:`2015-6526`, :cve_n
 ist:`2015-6937`, :cve_nist:`2015-7509`, :cve_nist:`2015-7513`, :cve_nist:`2015-7515`, :cve_nist:`2015-7550`, :cve_nist:`2015-7566`, :cve_nist:`2015-7613`, :cve_nist:`2015-7799`, :cve_nist:`2015-7833`, :cve_nist:`2015-7872`, :cve_nist:`2015-7884`, :cve_nist:`2015-7885`, :cve_nist:`2015-7990`, :cve_nist:`2015-8104`, :cve_nist:`2015-8215`, :cve_nist:`2015-8324`, :cve_nist:`2015-8374`, :cve_nist:`2015-8539`, :cve_nist:`2015-8543`, :cve_nist:`2015-8550`, :cve_nist:`2015-8551`, :cve_nist:`2015-8552`, :cve_nist:`2015-8553`, :cve_nist:`2015-8569`, :cve_nist:`2015-8575`, :cve_nist:`2015-8660`, :cve_nist:`2015-8709`, :cve_nist:`2015-8746`, :cve_nist:`2015-8767`, :cve_nist:`2015-8785`, :cve_nist:`2015-8787`, :cve_nist:`2015-8812`, :cve_nist:`2015-8816`, :cve_nist:`2015-8830`, :cve_nist:`2015-8839`, :cve_nist:`2015-8844`, :cve_nist:`2015-8845`, :cve_nist:`2015-8950`, :cve_nist:`2015-8952`, :cve_nist:`2015-8953`, :cve_nist:`2015-8955`, :cve_nist:`2015-8956`, :cve_nist:`2015-8961`, :cve_nist:`201
 5-8962`, :cve_nist:`2015-8963`, :cve_nist:`2015-8964`, :cve_nist:`2015-8966`, :cve_nist:`2015-8967`, :cve_nist:`2015-8970`, :cve_nist:`2015-9004`, :cve_nist:`2015-9016`, :cve_nist:`2015-9289`, :cve_nist:`2016-0617`, :cve_nist:`2016-0723`, :cve_nist:`2016-0728`, :cve_nist:`2016-0758`, :cve_nist:`2016-0821`, :cve_nist:`2016-0823`, :cve_nist:`2016-10044`, :cve_nist:`2016-10088`, :cve_nist:`2016-10147`, :cve_nist:`2016-10150`, :cve_nist:`2016-10153`, :cve_nist:`2016-10154`, :cve_nist:`2016-10200`, :cve_nist:`2016-10208`, :cve_nist:`2016-10229`, :cve_nist:`2016-10318`, :cve_nist:`2016-10723`, :cve_nist:`2016-10741`, :cve_nist:`2016-10764`, :cve_nist:`2016-10905`, :cve_nist:`2016-10906`, :cve_nist:`2016-10907`, :cve_nist:`2016-1237`, :cve_nist:`2016-1575`, :cve_nist:`2016-1576`, :cve_nist:`2016-1583`, :cve_nist:`2016-2053`, :cve_nist:`2016-2069`, :cve_nist:`2016-2070`, :cve_nist:`2016-2085`, :cve_nist:`2016-2117`, :cve_nist:`2016-2143`, :cve_nist:`2016-2184`, :cve_nist:`2016-2185`, :cve_n
 ist:`2016-2186`, :cve_nist:`2016-2187`, :cve_nist:`2016-2188`, :cve_nist:`2016-2383`, :cve_nist:`2016-2384`, :cve_nist:`2016-2543`, :cve_nist:`2016-2544`, :cve_nist:`2016-2545`, :cve_nist:`2016-2546`, :cve_nist:`2016-2547`, :cve_nist:`2016-2548`, :cve_nist:`2016-2549`, :cve_nist:`2016-2550`, :cve_nist:`2016-2782`, :cve_nist:`2016-2847`, :cve_nist:`2016-3044`, :cve_nist:`2016-3070`, :cve_nist:`2016-3134`, :cve_nist:`2016-3135`, :cve_nist:`2016-3136`, :cve_nist:`2016-3137`, :cve_nist:`2016-3138`, :cve_nist:`2016-3139`, :cve_nist:`2016-3140`, :cve_nist:`2016-3156`, :cve_nist:`2016-3157`, :cve_nist:`2016-3672`, :cve_nist:`2016-3689`, :cve_nist:`2016-3713`, :cve_nist:`2016-3841`, :cve_nist:`2016-3857`, :cve_nist:`2016-3951`, :cve_nist:`2016-3955`, :cve_nist:`2016-3961`, :cve_nist:`2016-4440`, :cve_nist:`2016-4470`, :cve_nist:`2016-4482`, :cve_nist:`2016-4485`, :cve_nist:`2016-4486`, :cve_nist:`2016-4557`, :cve_nist:`2016-4558`, :cve_nist:`2016-4565`, :cve_nist:`2016-4568`, :cve_nist:`201
 6-4569`, :cve_nist:`2016-4578`, :cve_nist:`2016-4580`, :cve_nist:`2016-4581`, :cve_nist:`2016-4794`, :cve_nist:`2016-4805`, :cve_nist:`2016-4913`, :cve_nist:`2016-4951`, :cve_nist:`2016-4997`, :cve_nist:`2016-4998`, :cve_nist:`2016-5195`, :cve_nist:`2016-5243`, :cve_nist:`2016-5244`, :cve_nist:`2016-5400`, :cve_nist:`2016-5412`, :cve_nist:`2016-5696`, :cve_nist:`2016-5728`, :cve_nist:`2016-5828`, :cve_nist:`2016-5829`, :cve_nist:`2016-6130`, :cve_nist:`2016-6136`, :cve_nist:`2016-6156`, :cve_nist:`2016-6162`, :cve_nist:`2016-6187`, :cve_nist:`2016-6197`, :cve_nist:`2016-6198`, :cve_nist:`2016-6213`, :cve_nist:`2016-6327`, :cve_nist:`2016-6480`, :cve_nist:`2016-6516`, :cve_nist:`2016-6786`, :cve_nist:`2016-6787`, :cve_nist:`2016-6828`, :cve_nist:`2016-7039`, :cve_nist:`2016-7042`, :cve_nist:`2016-7097`, :cve_nist:`2016-7117`, :cve_nist:`2016-7425`, :cve_nist:`2016-7910`, :cve_nist:`2016-7911`, :cve_nist:`2016-7912`, :cve_nist:`2016-7913`, :cve_nist:`2016-7914`, :cve_nist:`2016-7915`,
  :cve_nist:`2016-7916`, :cve_nist:`2016-7917`, :cve_nist:`2016-8399`, :cve_nist:`2016-8405`, :cve_nist:`2016-8630`, :cve_nist:`2016-8632`, :cve_nist:`2016-8633`, :cve_nist:`2016-8636`, :cve_nist:`2016-8645`, :cve_nist:`2016-8646`, :cve_nist:`2016-8650`, :cve_nist:`2016-8655`, :cve_nist:`2016-8658`, :cve_nist:`2016-8666`, :cve_nist:`2016-9083`, :cve_nist:`2016-9084`, :cve_nist:`2016-9120`, :cve_nist:`2016-9178`, :cve_nist:`2016-9191`, :cve_nist:`2016-9313`, :cve_nist:`2016-9555`, :cve_nist:`2016-9576`, :cve_nist:`2016-9588`, :cve_nist:`2016-9604`, :cve_nist:`2016-9685`, :cve_nist:`2016-9754`, :cve_nist:`2016-9755`, :cve_nist:`2016-9756`, :cve_nist:`2016-9777`, :cve_nist:`2016-9793`, :cve_nist:`2016-9794`, :cve_nist:`2016-9806`, :cve_nist:`2016-9919`, :cve_nist:`2017-0605`, :cve_nist:`2017-0627`, :cve_nist:`2017-0750`, :cve_nist:`2017-0786`, :cve_nist:`2017-0861`, :cve_nist:`2017-1000`, :cve_nist:`2017-1000111`, :cve_nist:`2017-1000112`, :cve_nist:`2017-1000251`, :cve_nist:`2017-10002
 52`, :cve_nist:`2017-1000253`, :cve_nist:`2017-1000255`, :cve_nist:`2017-1000363`, :cve_nist:`2017-1000364`, :cve_nist:`2017-1000365`, :cve_nist:`2017-1000370`, :cve_nist:`2017-1000371`, :cve_nist:`2017-1000379`, :cve_nist:`2017-1000380`, :cve_nist:`2017-1000405`, :cve_nist:`2017-1000407`, :cve_nist:`2017-1000410`, :cve_nist:`2017-10661`, :cve_nist:`2017-10662`, :cve_nist:`2017-10663`, :cve_nist:`2017-10810`, :cve_nist:`2017-10911`, :cve_nist:`2017-11089`, :cve_nist:`2017-11176`, :cve_nist:`2017-11472`, :cve_nist:`2017-11473`, :cve_nist:`2017-11600`, :cve_nist:`2017-12134`, :cve_nist:`2017-12146`, :cve_nist:`2017-12153`, :cve_nist:`2017-12154`, :cve_nist:`2017-12168`, :cve_nist:`2017-12188`, :cve_nist:`2017-12190`, :cve_nist:`2017-12192`, :cve_nist:`2017-12193`, :cve_nist:`2017-12762`, :cve_nist:`2017-13080`, :cve_nist:`2017-13166`, :cve_nist:`2017-13167`, :cve_nist:`2017-13168`, :cve_nist:`2017-13215`, :cve_nist:`2017-13216`, :cve_nist:`2017-13220`, :cve_nist:`2017-13305`, :cve_nis
 t:`2017-13686`, :cve_nist:`2017-13695`, :cve_nist:`2017-13715`, :cve_nist:`2017-14051`, :cve_nist:`2017-14106`, :cve_nist:`2017-14140`, :cve_nist:`2017-14156`, :cve_nist:`2017-14340`, :cve_nist:`2017-14489`, :cve_nist:`2017-14497`, :cve_nist:`2017-14954`, :cve_nist:`2017-14991`, :cve_nist:`2017-15102`, :cve_nist:`2017-15115`, :cve_nist:`2017-15116`, :cve_nist:`2017-15121`, :cve_nist:`2017-15126`, :cve_nist:`2017-15127`, :cve_nist:`2017-15128`, :cve_nist:`2017-15129`, :cve_nist:`2017-15265`, :cve_nist:`2017-15274`, :cve_nist:`2017-15299`, :cve_nist:`2017-15306`, :cve_nist:`2017-15537`, :cve_nist:`2017-15649`, :cve_nist:`2017-15868`, :cve_nist:`2017-15951`, :cve_nist:`2017-16525`, :cve_nist:`2017-16526`, :cve_nist:`2017-16527`, :cve_nist:`2017-16528`, :cve_nist:`2017-16529`, :cve_nist:`2017-16530`, :cve_nist:`2017-16531`, :cve_nist:`2017-16532`, :cve_nist:`2017-16533`, :cve_nist:`2017-16534`, :cve_nist:`2017-16535`, :cve_nist:`2017-16536`, :cve_nist:`2017-16537`, :cve_nist:`2017-16538
 `, :cve_nist:`2017-16643`, :cve_nist:`2017-16644`, :cve_nist:`2017-16645`, :cve_nist:`2017-16646`, :cve_nist:`2017-16647`, :cve_nist:`2017-16648`, :cve_nist:`2017-16649`, :cve_nist:`2017-16650`, :cve_nist:`2017-16911`, :cve_nist:`2017-16912`, :cve_nist:`2017-16913`, :cve_nist:`2017-16914`, :cve_nist:`2017-16939`, :cve_nist:`2017-16994`, :cve_nist:`2017-16995`, :cve_nist:`2017-16996`, :cve_nist:`2017-17052`, :cve_nist:`2017-17053`, :cve_nist:`2017-17448`, :cve_nist:`2017-17449`, :cve_nist:`2017-17450`, :cve_nist:`2017-17558`, :cve_nist:`2017-17712`, :cve_nist:`2017-17741`, :cve_nist:`2017-17805`, :cve_nist:`2017-17806`, :cve_nist:`2017-17807`, :cve_nist:`2017-17852`, :cve_nist:`2017-17853`, :cve_nist:`2017-17854`, :cve_nist:`2017-17855`, :cve_nist:`2017-17856`, :cve_nist:`2017-17857`, :cve_nist:`2017-17862`, :cve_nist:`2017-17863`, :cve_nist:`2017-17864`, :cve_nist:`2017-17975`, :cve_nist:`2017-18017`, :cve_nist:`2017-18075`, :cve_nist:`2017-18079`, :cve_nist:`2017-18174`, :cve_nist:
 `2017-18193`, :cve_nist:`2017-18200`, :cve_nist:`2017-18202`, :cve_nist:`2017-18203`, :cve_nist:`2017-18204`, :cve_nist:`2017-18208`, :cve_nist:`2017-18216`, :cve_nist:`2017-18218`, :cve_nist:`2017-18221`, :cve_nist:`2017-18222`, :cve_nist:`2017-18224`, :cve_nist:`2017-18232`, :cve_nist:`2017-18241`, :cve_nist:`2017-18249`, :cve_nist:`2017-18255`, :cve_nist:`2017-18257`, :cve_nist:`2017-18261`, :cve_nist:`2017-18270`, :cve_nist:`2017-18344`, :cve_nist:`2017-18360`, :cve_nist:`2017-18379`, :cve_nist:`2017-18509`, :cve_nist:`2017-18549`, :cve_nist:`2017-18550`, :cve_nist:`2017-18551`, :cve_nist:`2017-18552`, :cve_nist:`2017-18595`, :cve_nist:`2017-2583`, :cve_nist:`2017-2584`, :cve_nist:`2017-2596`, :cve_nist:`2017-2618`, :cve_nist:`2017-2634`, :cve_nist:`2017-2636`, :cve_nist:`2017-2647`, :cve_nist:`2017-2671`, :cve_nist:`2017-5123`, :cve_nist:`2017-5546`, :cve_nist:`2017-5547`, :cve_nist:`2017-5548`, :cve_nist:`2017-5549`, :cve_nist:`2017-5550`, :cve_nist:`2017-5551`, :cve_nist:`201
 7-5576`, :cve_nist:`2017-5577`, :cve_nist:`2017-5669`, :cve_nist:`2017-5715`, :cve_nist:`2017-5753`, :cve_nist:`2017-5754`, :cve_nist:`2017-5897`, :cve_nist:`2017-5967`, :cve_nist:`2017-5970`, :cve_nist:`2017-5972`, :cve_nist:`2017-5986`, :cve_nist:`2017-6001`, :cve_nist:`2017-6074`, :cve_nist:`2017-6214`, :cve_nist:`2017-6345`, :cve_nist:`2017-6346`, :cve_nist:`2017-6347`, :cve_nist:`2017-6348`, :cve_nist:`2017-6353`, :cve_nist:`2017-6874`, :cve_nist:`2017-6951`, :cve_nist:`2017-7184`, :cve_nist:`2017-7187`, :cve_nist:`2017-7261`, :cve_nist:`2017-7273`, :cve_nist:`2017-7277`, :cve_nist:`2017-7294`, :cve_nist:`2017-7308`, :cve_nist:`2017-7346`, :cve_nist:`2017-7374`, :cve_nist:`2017-7472`, :cve_nist:`2017-7477`, :cve_nist:`2017-7482`, :cve_nist:`2017-7487`, :cve_nist:`2017-7495`, :cve_nist:`2017-7518`, :cve_nist:`2017-7533`, :cve_nist:`2017-7541`, :cve_nist:`2017-7542`, :cve_nist:`2017-7558`, :cve_nist:`2017-7616`, :cve_nist:`2017-7618`, :cve_nist:`2017-7645`, :cve_nist:`2017-7889`,
  :cve_nist:`2017-7895`, :cve_nist:`2017-7979`, :cve_nist:`2017-8061`, :cve_nist:`2017-8062`, :cve_nist:`2017-8063`, :cve_nist:`2017-8064`, :cve_nist:`2017-8065`, :cve_nist:`2017-8066`, :cve_nist:`2017-8067`, :cve_nist:`2017-8068`, :cve_nist:`2017-8069`, :cve_nist:`2017-8070`, :cve_nist:`2017-8071`, :cve_nist:`2017-8072`, :cve_nist:`2017-8106`, :cve_nist:`2017-8240`, :cve_nist:`2017-8797`, :cve_nist:`2017-8824`, :cve_nist:`2017-8831`, :cve_nist:`2017-8890`, :cve_nist:`2017-8924`, :cve_nist:`2017-8925`, :cve_nist:`2017-9059`, :cve_nist:`2017-9074`, :cve_nist:`2017-9075`, :cve_nist:`2017-9076`, :cve_nist:`2017-9077`, :cve_nist:`2017-9150`, :cve_nist:`2017-9211`, :cve_nist:`2017-9242`, :cve_nist:`2017-9605`, :cve_nist:`2017-9725`, :cve_nist:`2017-9984`, :cve_nist:`2017-9985`, :cve_nist:`2017-9986`, :cve_nist:`2018-1000004`, :cve_nist:`2018-1000026`, :cve_nist:`2018-1000028`, :cve_nist:`2018-1000199`, :cve_nist:`2018-1000200`, :cve_nist:`2018-1000204`, :cve_nist:`2018-10021`, :cve_nist:`
 2018-10074`, :cve_nist:`2018-10087`, :cve_nist:`2018-10124`, :cve_nist:`2018-10322`, :cve_nist:`2018-10323`, :cve_nist:`2018-1065`, :cve_nist:`2018-1066`, :cve_nist:`2018-10675`, :cve_nist:`2018-1068`, :cve_nist:`2018-10840`, :cve_nist:`2018-10853`, :cve_nist:`2018-1087`, :cve_nist:`2018-10876`, :cve_nist:`2018-10877`, :cve_nist:`2018-10878`, :cve_nist:`2018-10879`, :cve_nist:`2018-10880`, :cve_nist:`2018-10881`, :cve_nist:`2018-10882`, :cve_nist:`2018-10883`, :cve_nist:`2018-10901`, :cve_nist:`2018-10902`, :cve_nist:`2018-1091`, :cve_nist:`2018-1092`, :cve_nist:`2018-1093`, :cve_nist:`2018-10938`, :cve_nist:`2018-1094`, :cve_nist:`2018-10940`, :cve_nist:`2018-1095`, :cve_nist:`2018-1108`, :cve_nist:`2018-1118`, :cve_nist:`2018-1120`, :cve_nist:`2018-11232`, :cve_nist:`2018-1128`, :cve_nist:`2018-1129`, :cve_nist:`2018-1130`, :cve_nist:`2018-11412`, :cve_nist:`2018-11506`, :cve_nist:`2018-11508`, :cve_nist:`2018-12126`, :cve_nist:`2018-12127`, :cve_nist:`2018-12130`, :cve_nist:`2018
 -12207`, :cve_nist:`2018-12232`, :cve_nist:`2018-12233`, :cve_nist:`2018-12633`, :cve_nist:`2018-12714`, :cve_nist:`2018-12896`, :cve_nist:`2018-12904`, :cve_nist:`2018-13053`, :cve_nist:`2018-13093`, :cve_nist:`2018-13094`, :cve_nist:`2018-13095`, :cve_nist:`2018-13096`, :cve_nist:`2018-13097`, :cve_nist:`2018-13098`, :cve_nist:`2018-13099`, :cve_nist:`2018-13100`, :cve_nist:`2018-13405`, :cve_nist:`2018-13406`, :cve_nist:`2018-14609`, :cve_nist:`2018-14610`, :cve_nist:`2018-14611`, :cve_nist:`2018-14612`, :cve_nist:`2018-14613`, :cve_nist:`2018-14614`, :cve_nist:`2018-14615`, :cve_nist:`2018-14616`, :cve_nist:`2018-14617`, :cve_nist:`2018-14619`, :cve_nist:`2018-14625`, :cve_nist:`2018-14633`, :cve_nist:`2018-14634`, :cve_nist:`2018-14641`, :cve_nist:`2018-14646`, :cve_nist:`2018-14656`, :cve_nist:`2018-14678`, :cve_nist:`2018-14734`, :cve_nist:`2018-15471`, :cve_nist:`2018-15572`, :cve_nist:`2018-15594`, :cve_nist:`2018-16276`, :cve_nist:`2018-16597`, :cve_nist:`2018-16658`, :cve
 _nist:`2018-16862`, :cve_nist:`2018-16871`, :cve_nist:`2018-16880`, :cve_nist:`2018-16882`, :cve_nist:`2018-16884`, :cve_nist:`2018-17182`, :cve_nist:`2018-17972`, :cve_nist:`2018-18021`, :cve_nist:`2018-18281`, :cve_nist:`2018-18386`, :cve_nist:`2018-18397`, :cve_nist:`2018-18445`, :cve_nist:`2018-18559`, :cve_nist:`2018-18690`, :cve_nist:`2018-18710`, :cve_nist:`2018-18955`, :cve_nist:`2018-19406`, :cve_nist:`2018-19407`, :cve_nist:`2018-19824`, :cve_nist:`2018-19854`, :cve_nist:`2018-19985`, :cve_nist:`2018-20169`, :cve_nist:`2018-20449`, :cve_nist:`2018-20509`, :cve_nist:`2018-20510`, :cve_nist:`2018-20511`, :cve_nist:`2018-20669`, :cve_nist:`2018-20784`, :cve_nist:`2018-20836`, :cve_nist:`2018-20854`, :cve_nist:`2018-20855`, :cve_nist:`2018-20856`, :cve_nist:`2018-20961`, :cve_nist:`2018-20976`, :cve_nist:`2018-21008`, :cve_nist:`2018-25015`, :cve_nist:`2018-25020`, :cve_nist:`2018-3620`, :cve_nist:`2018-3639`, :cve_nist:`2018-3646`, :cve_nist:`2018-3665`, :cve_nist:`2018-3693`
 , :cve_nist:`2018-5332`, :cve_nist:`2018-5333`, :cve_nist:`2018-5344`, :cve_nist:`2018-5390`, :cve_nist:`2018-5391`, :cve_nist:`2018-5703`, :cve_nist:`2018-5750`, :cve_nist:`2018-5803`, :cve_nist:`2018-5814`, :cve_nist:`2018-5848`, :cve_nist:`2018-5873`, :cve_nist:`2018-5953`, :cve_nist:`2018-5995`, :cve_nist:`2018-6412`, :cve_nist:`2018-6554`, :cve_nist:`2018-6555`, :cve_nist:`2018-6927`, :cve_nist:`2018-7191`, :cve_nist:`2018-7273`, :cve_nist:`2018-7480`, :cve_nist:`2018-7492`, :cve_nist:`2018-7566`, :cve_nist:`2018-7740`, :cve_nist:`2018-7754`, :cve_nist:`2018-7755`, :cve_nist:`2018-7757`, :cve_nist:`2018-7995`, :cve_nist:`2018-8043`, :cve_nist:`2018-8087`, :cve_nist:`2018-8781`, :cve_nist:`2018-8822`, :cve_nist:`2018-8897`, :cve_nist:`2018-9363`, :cve_nist:`2018-9385`, :cve_nist:`2018-9415`, :cve_nist:`2018-9422`, :cve_nist:`2018-9465`, :cve_nist:`2018-9516`, :cve_nist:`2018-9517`, :cve_nist:`2018-9518`, :cve_nist:`2018-9568`, :cve_nist:`2019-0136`, :cve_nist:`2019-0145`, :cve_n
 ist:`2019-0146`, :cve_nist:`2019-0147`, :cve_nist:`2019-0148`, :cve_nist:`2019-0149`, :cve_nist:`2019-0154`, :cve_nist:`2019-0155`, :cve_nist:`2019-10124`, :cve_nist:`2019-10125`, :cve_nist:`2019-10126`, :cve_nist:`2019-10142`, :cve_nist:`2019-10207`, :cve_nist:`2019-10220`, :cve_nist:`2019-10638`, :cve_nist:`2019-10639`, :cve_nist:`2019-11085`, :cve_nist:`2019-11091`, :cve_nist:`2019-11135`, :cve_nist:`2019-11190`, :cve_nist:`2019-11191`, :cve_nist:`2019-1125`, :cve_nist:`2019-11477`, :cve_nist:`2019-11478`, :cve_nist:`2019-11479`, :cve_nist:`2019-11486`, :cve_nist:`2019-11487`, :cve_nist:`2019-11599`, :cve_nist:`2019-11683`, :cve_nist:`2019-11810`, :cve_nist:`2019-11811`, :cve_nist:`2019-11815`, :cve_nist:`2019-11833`, :cve_nist:`2019-11884`, :cve_nist:`2019-12378`, :cve_nist:`2019-12379`, :cve_nist:`2019-12380`, :cve_nist:`2019-12381`, :cve_nist:`2019-12382`, :cve_nist:`2019-12454`, :cve_nist:`2019-12455`, :cve_nist:`2019-12614`, :cve_nist:`2019-12615`, :cve_nist:`2019-12817`, :c
 ve_nist:`2019-12818`, :cve_nist:`2019-12819`, :cve_nist:`2019-12881`, :cve_nist:`2019-12984`, :cve_nist:`2019-13233`, :cve_nist:`2019-13272`, :cve_nist:`2019-13631`, :cve_nist:`2019-13648`, :cve_nist:`2019-14283`, :cve_nist:`2019-14284`, :cve_nist:`2019-14615`, :cve_nist:`2019-14763`, :cve_nist:`2019-14814`, :cve_nist:`2019-14815`, :cve_nist:`2019-14816`, :cve_nist:`2019-14821`, :cve_nist:`2019-14835`, :cve_nist:`2019-14895`, :cve_nist:`2019-14896`, :cve_nist:`2019-14897`, :cve_nist:`2019-14901`, :cve_nist:`2019-15030`, :cve_nist:`2019-15031`, :cve_nist:`2019-15090`, :cve_nist:`2019-15098`, :cve_nist:`2019-15099`, :cve_nist:`2019-15117`, :cve_nist:`2019-15118`, :cve_nist:`2019-15211`, :cve_nist:`2019-15212`, :cve_nist:`2019-15213`, :cve_nist:`2019-15214`, :cve_nist:`2019-15215`, :cve_nist:`2019-15216`, :cve_nist:`2019-15217`, :cve_nist:`2019-15218`, :cve_nist:`2019-15219`, :cve_nist:`2019-15220`, :cve_nist:`2019-15221`, :cve_nist:`2019-15222`, :cve_nist:`2019-15223`, :cve_nist:`2019
 -15291`, :cve_nist:`2019-15292`, :cve_nist:`2019-15504`, :cve_nist:`2019-15505`, :cve_nist:`2019-15538`, :cve_nist:`2019-15666`, :cve_nist:`2019-15794`, :cve_nist:`2019-15807`, :cve_nist:`2019-15916`, :cve_nist:`2019-15917`, :cve_nist:`2019-15918`, :cve_nist:`2019-15919`, :cve_nist:`2019-15920`, :cve_nist:`2019-15921`, :cve_nist:`2019-15922`, :cve_nist:`2019-15923`, :cve_nist:`2019-15924`, :cve_nist:`2019-15925`, :cve_nist:`2019-15926`, :cve_nist:`2019-15927`, :cve_nist:`2019-16229`, :cve_nist:`2019-16230`, :cve_nist:`2019-16231`, :cve_nist:`2019-16232`, :cve_nist:`2019-16233`, :cve_nist:`2019-16234`, :cve_nist:`2019-16413`, :cve_nist:`2019-16714`, :cve_nist:`2019-16746`, :cve_nist:`2019-16921`, :cve_nist:`2019-16994`, :cve_nist:`2019-16995`, :cve_nist:`2019-17052`, :cve_nist:`2019-17053`, :cve_nist:`2019-17054`, :cve_nist:`2019-17055`, :cve_nist:`2019-17056`, :cve_nist:`2019-17075`, :cve_nist:`2019-17133`, :cve_nist:`2019-17351`, :cve_nist:`2019-17666`, :cve_nist:`2019-18198`, :cve
 _nist:`2019-18282`, :cve_nist:`2019-18660`, :cve_nist:`2019-18675`, :cve_nist:`2019-18683`, :cve_nist:`2019-18786`, :cve_nist:`2019-18805`, :cve_nist:`2019-18806`, :cve_nist:`2019-18807`, :cve_nist:`2019-18808`, :cve_nist:`2019-18809`, :cve_nist:`2019-18810`, :cve_nist:`2019-18811`, :cve_nist:`2019-18812`, :cve_nist:`2019-18813`, :cve_nist:`2019-18814`, :cve_nist:`2019-18885`, :cve_nist:`2019-19036`, :cve_nist:`2019-19037`, :cve_nist:`2019-19039`, :cve_nist:`2019-19043`, :cve_nist:`2019-19044`, :cve_nist:`2019-19045`, :cve_nist:`2019-19046`, :cve_nist:`2019-19047`, :cve_nist:`2019-19048`, :cve_nist:`2019-19049`, :cve_nist:`2019-19050`, :cve_nist:`2019-19051`, :cve_nist:`2019-19052`, :cve_nist:`2019-19053`, :cve_nist:`2019-19054`, :cve_nist:`2019-19055`, :cve_nist:`2019-19056`, :cve_nist:`2019-19057`, :cve_nist:`2019-19058`, :cve_nist:`2019-19059`, :cve_nist:`2019-19060`, :cve_nist:`2019-19061`, :cve_nist:`2019-19062`, :cve_nist:`2019-19063`, :cve_nist:`2019-19064`, :cve_nist:`2019-1
 9065`, :cve_nist:`2019-19066`, :cve_nist:`2019-19067`, :cve_nist:`2019-19068`, :cve_nist:`2019-19069`, :cve_nist:`2019-19070`, :cve_nist:`2019-19071`, :cve_nist:`2019-19072`, :cve_nist:`2019-19073`, :cve_nist:`2019-19074`, :cve_nist:`2019-19075`, :cve_nist:`2019-19076`, :cve_nist:`2019-19077`, :cve_nist:`2019-19078`, :cve_nist:`2019-19079`, :cve_nist:`2019-19080`, :cve_nist:`2019-19081`, :cve_nist:`2019-19082`, :cve_nist:`2019-19083`, :cve_nist:`2019-19227`, :cve_nist:`2019-19241`, :cve_nist:`2019-19252`, :cve_nist:`2019-19318`, :cve_nist:`2019-19319`, :cve_nist:`2019-19332`, :cve_nist:`2019-19338`, :cve_nist:`2019-19377`, :cve_nist:`2019-19447`, :cve_nist:`2019-19448`, :cve_nist:`2019-19449`, :cve_nist:`2019-19462`, :cve_nist:`2019-19523`, :cve_nist:`2019-19524`, :cve_nist:`2019-19525`, :cve_nist:`2019-19526`, :cve_nist:`2019-19527`, :cve_nist:`2019-19528`, :cve_nist:`2019-19529`, :cve_nist:`2019-19530`, :cve_nist:`2019-19531`, :cve_nist:`2019-19532`, :cve_nist:`2019-19533`, :cve_n
 ist:`2019-19534`, :cve_nist:`2019-19535`, :cve_nist:`2019-19536`, :cve_nist:`2019-19537`, :cve_nist:`2019-19543`, :cve_nist:`2019-19602`, :cve_nist:`2019-19767`, :cve_nist:`2019-19768`, :cve_nist:`2019-19769`, :cve_nist:`2019-19770`, :cve_nist:`2019-19807`, :cve_nist:`2019-19813`, :cve_nist:`2019-19815`, :cve_nist:`2019-19816`, :cve_nist:`2019-19922`, :cve_nist:`2019-19927`, :cve_nist:`2019-19947`, :cve_nist:`2019-19965` and :cve_nist:`2019-1999`
+-  nasm: Fix :cve_nist:`2020-21528`
+-  ncurses: Fix :cve_nist:`2023-29491`
+-  nghttp2: Fix :cve_nist:`2023-35945`
+-  procps: Fix :cve_nist:`2023-4016`
+-  python3-certifi: Fix :cve_nist:`2023-37920`
+-  python3-git: Fix :cve_nist:`2022-24439` and :cve_nist:`2023-40267`
+-  python3-pygments: Fix :cve_nist:`2022-40896`
+-  python3: Fix :cve_nist:`2023-40217`
+-  qemu: Fix :cve_nist:`2020-14394`, :cve_nist:`2021-3638`, :cve_mitre:`2023-2861`, :cve_nist:`2023-3180` and :cve_nist:`2023-3354`
+-  tiff: fix :cve_nist:`2023-2908`, :cve_nist:`2023-3316` and :cve_nist:`2023-3618`
+-  vim: Fix :cve_nist:`2023-3896`, :cve_nist:`2023-4733`, :cve_nist:`2023-4734`, :cve_nist:`2023-4735`, :cve_nist:`2023-4736`, :cve_nist:`2023-4738`, :cve_nist:`2023-4750` and :cve_nist:`2023-4752`
+-  webkitgtk: fix :cve_nist:`2022-48503` and :cve_nist:`2023-23529`
 
 
 
diff --git a/documentation/migration-guides/release-notes-4.0.14.rst b/documentation/migration-guides/release-notes-4.0.14.rst
index 02253f33f7e44e1ffb0acb36329c4734a90a6843..ad6590a887781c2d66de9c5cb9dbc0c685819883 100644
--- a/documentation/migration-guides/release-notes-4.0.14.rst
+++ b/documentation/migration-guides/release-notes-4.0.14.rst
@@ -6,37 +6,37 @@ Release notes for Yocto-4.0.14 (Kirkstone)
 Security Fixes in Yocto-4.0.14
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2023-3341` and :cve:`2023-4236`
--  binutils: Fix :cve:`2022-44840`, :cve:`2022-45703`, :cve:`2022-47008`, :cve:`2022-47011`, :cve:`2022-47673`, :cve:`2022-47695`, :cve:`2022-47696` and :cve:`2022-48063`
--  cups: Fix :cve:`2023-4504`
--  curl: Fix :cve:`2023-38545` and :cve:`2023-38546`
--  gawk: Fix :cve:`2023-4156`
--  ghostscript: Fix :cve:`2023-43115`
--  glibc: Fix :cve:`2023-4806`, :cve:`2023-4813`, :cve:`2023-4911` and :cve:`2023-5156`
--  glibc: Ignore :cve:`2023-4527`
--  go: Fix :cve:`2023-24538` and :cve:`2023-39318`
+-  bind: Fix :cve_nist:`2023-3341` and :cve_nist:`2023-4236`
+-  binutils: Fix :cve_nist:`2022-44840`, :cve_nist:`2022-45703`, :cve_nist:`2022-47008`, :cve_nist:`2022-47011`, :cve_nist:`2022-47673`, :cve_nist:`2022-47695`, :cve_nist:`2022-47696` and :cve_nist:`2022-48063`
+-  cups: Fix :cve_nist:`2023-4504`
+-  curl: Fix :cve_nist:`2023-38545` and :cve_nist:`2023-38546`
+-  gawk: Fix :cve_nist:`2023-4156`
+-  ghostscript: Fix :cve_nist:`2023-43115`
+-  glibc: Fix :cve_nist:`2023-4806`, :cve_nist:`2023-4813`, :cve_nist:`2023-4911` and :cve_nist:`2023-5156`
+-  glibc: Ignore :cve_nist:`2023-4527`
+-  go: Fix :cve_nist:`2023-24538` and :cve_nist:`2023-39318`
 -  gstreamer1.0-plugins-bad: fix :cve_mitre:`2023-40474`, :cve_mitre:`2023-40475` and :cve_mitre:`2023-40476`
--  libtiff: Fix :cve:`2022-40090` and :cve:`2023-1916`
--  libwebp: Fix :cve:`2023-5129`
--  libx11: Fix :cve:`2023-43785`, :cve:`2023-43786` and :cve:`2023-43787`
--  libxml2: Fix :cve:`2023-45322`
--  libxpm: Fix :cve:`2023-43788` and :cve:`2023-43789`
--  linux-firmware: Fix :cve:`2022-40982`, :cve:`2023-20569` and :cve:`2023-20593`
+-  libtiff: Fix :cve_nist:`2022-40090` and :cve_nist:`2023-1916`
+-  libwebp: Fix :cve_nist:`2023-5129`
+-  libx11: Fix :cve_nist:`2023-43785`, :cve_nist:`2023-43786` and :cve_nist:`2023-43787`
+-  libxml2: Fix :cve_nist:`2023-45322`
+-  libxpm: Fix :cve_nist:`2023-43788` and :cve_nist:`2023-43789`
+-  linux-firmware: Fix :cve_nist:`2022-40982`, :cve_nist:`2023-20569` and :cve_nist:`2023-20593`
 -  linux-yocto: update CVE exclusions
--  linux-yocto/5.10: Ignore :cve:`2003-1604`, :cve:`2004-0230`, :cve:`2006-3635`, :cve:`2006-5331`, :cve:`2006-6128`, :cve:`2007-4774`, :cve:`2007-6761`, :cve:`2007-6762`, :cve:`2008-7316`, :cve:`2009-2692`, :cve:`2010-0008`, :cve:`2010-3432`, :cve:`2010-4648`, :cve:`2010-5313`, :cve:`2010-5328`, :cve:`2010-5329`, :cve:`2010-5331`, :cve:`2010-5332`, :cve:`2011-4098`, :cve:`2011-4131`, :cve:`2011-4915`, :cve:`2011-5321`, :cve:`2011-5327`, :cve:`2012-0957`, :cve:`2012-2119`, :cve:`2012-2136`, :cve:`2012-2137`, :cve:`2012-2313`, :cve:`2012-2319`, :cve:`2012-2372`, :cve:`2012-2375`, :cve:`2012-2390`, :cve:`2012-2669`, :cve:`2012-2744`, :cve:`2012-2745`, :cve:`2012-3364`, :cve:`2012-3375`, :cve:`2012-3400`, :cve:`2012-3412`, :cve:`2012-3430`, :cve:`2012-3510`, :cve:`2012-3511`, :cve:`2012-3520`, :cve:`2012-3552`, :cve:`2012-4398`, :cve:`2012-4444`, :cve:`2012-4461`, :cve:`2012-4467`, :cve:`2012-4508`, :cve:`2012-4530`, :cve:`2012-4565`, :cve:`2012-5374`, :cve:`2012-5375`, :cve:`2012-5517
 `, :cve:`2012-6536`, :cve:`2012-6537`, :cve:`2012-6538`, :cve:`2012-6539`, :cve:`2012-6540`, :cve:`2012-6541`, :cve:`2012-6542`, :cve:`2012-6543`, :cve:`2012-6544`, :cve:`2012-6545`, :cve:`2012-6546`, :cve:`2012-6547`, :cve:`2012-6548`, :cve:`2012-6549`, :cve:`2012-6638`, :cve:`2012-6647`, :cve:`2012-6657`, :cve:`2012-6689`, :cve:`2012-6701`, :cve:`2012-6703`, :cve:`2012-6704`, :cve:`2012-6712`, :cve:`2013-0160`, :cve:`2013-0190`, :cve:`2013-0216`, :cve:`2013-0217`, :cve:`2013-0228`, :cve:`2013-0231`, :cve:`2013-0268`, :cve:`2013-0290`, :cve:`2013-0309`, :cve:`2013-0310`, :cve:`2013-0311`, :cve:`2013-0313`, :cve:`2013-0343`, :cve:`2013-0349`, :cve:`2013-0871`, :cve:`2013-0913`, :cve:`2013-0914`, :cve:`2013-1059`, :cve:`2013-1763`, :cve:`2013-1767`, :cve:`2013-1772`, :cve:`2013-1773`, :cve:`2013-1774`, :cve:`2013-1792`, :cve:`2013-1796`, :cve:`2013-1797`, :cve:`2013-1798`, :cve:`2013-1819`, :cve:`2013-1826`, :cve:`2013-1827`, :cve:`2013-1828`, :cve:`2013-1848`, :cve:`2013-1858`, :cve
 :`2013-1860`, :cve:`2013-1928`, :cve:`2013-1929`, :cve:`2013-1943`, :cve:`2013-1956`, :cve:`2013-1957`, :cve:`2013-1958`, :cve:`2013-1959`, :cve:`2013-1979`, :cve:`2013-2015`, :cve:`2013-2017`, :cve:`2013-2058`, :cve:`2013-2094`, :cve:`2013-2128`, :cve:`2013-2140`, :cve:`2013-2141`, :cve:`2013-2146`, :cve:`2013-2147`, :cve:`2013-2148`, :cve:`2013-2164`, :cve:`2013-2206`, :cve:`2013-2232`, :cve:`2013-2234`, :cve:`2013-2237`, :cve:`2013-2546`, :cve:`2013-2547`, :cve:`2013-2548`, :cve:`2013-2596`, :cve:`2013-2634`, :cve:`2013-2635`, :cve:`2013-2636`, :cve:`2013-2850`, :cve:`2013-2851`, :cve:`2013-2852`, :cve:`2013-2888`, :cve:`2013-2889`, :cve:`2013-2890`, :cve:`2013-2891`, :cve:`2013-2892`, :cve:`2013-2893`, :cve:`2013-2894`, :cve:`2013-2895`, :cve:`2013-2896`, :cve:`2013-2897`, :cve:`2013-2898`, :cve:`2013-2899`, :cve:`2013-2929`, :cve:`2013-2930`, :cve:`2013-3076`, :cve:`2013-3222`, :cve:`2013-3223`, :cve:`2013-3224`, :cve:`2013-3225`, :cve:`2013-3226`, :cve:`2013-3227`, :cve:`2013-
 3228`, :cve:`2013-3229`, :cve:`2013-3230`, :cve:`2013-3231`, :cve:`2013-3232`, :cve:`2013-3233`, :cve:`2013-3234`, :cve:`2013-3235`, :cve:`2013-3236`, :cve:`2013-3237`, :cve:`2013-3301`, :cve:`2013-3302`, :cve:`2013-4125`, :cve:`2013-4127`, :cve:`2013-4129`, :cve:`2013-4162`, :cve:`2013-4163`, :cve:`2013-4205`, :cve:`2013-4220`, :cve:`2013-4247`, :cve:`2013-4254`, :cve:`2013-4270`, :cve:`2013-4299`, :cve:`2013-4300`, :cve:`2013-4312`, :cve:`2013-4343`, :cve:`2013-4345`, :cve:`2013-4348`, :cve:`2013-4350`, :cve:`2013-4387`, :cve:`2013-4470`, :cve:`2013-4483`, :cve:`2013-4511`, :cve:`2013-4512`, :cve:`2013-4513`, :cve:`2013-4514`, :cve:`2013-4515`, :cve:`2013-4516`, :cve:`2013-4563`, :cve:`2013-4579`, :cve:`2013-4587`, :cve:`2013-4588`, :cve:`2013-4591`, :cve:`2013-4592`, :cve:`2013-5634`, :cve:`2013-6282`, :cve:`2013-6367`, :cve:`2013-6368`, :cve:`2013-6376`, :cve:`2013-6378`, :cve:`2013-6380`, :cve:`2013-6381`, :cve:`2013-6382`, :cve:`2013-6383`, :cve:`2013-6431`, :cve:`2013-6432`, 
 :cve:`2013-6885`, :cve:`2013-7026`, :cve:`2013-7027`, :cve:`2013-7263`, :cve:`2013-7264`, :cve:`2013-7265`, :cve:`2013-7266`, :cve:`2013-7267`, :cve:`2013-7268`, :cve:`2013-7269`, :cve:`2013-7270`, :cve:`2013-7271`, :cve:`2013-7281`, :cve:`2013-7339`, :cve:`2013-7348`, :cve:`2013-7421`, :cve:`2013-7446`, :cve:`2013-7470`, :cve:`2014-0038`, :cve:`2014-0049`, :cve:`2014-0055`, :cve:`2014-0069`, :cve:`2014-0077`, :cve:`2014-0100`, :cve:`2014-0101`, :cve:`2014-0102`, :cve:`2014-0131`, :cve:`2014-0155`, :cve:`2014-0181`, :cve:`2014-0196`, :cve:`2014-0203`, :cve:`2014-0205`, :cve:`2014-0206`, :cve:`2014-1438`, :cve:`2014-1444`, :cve:`2014-1445`, :cve:`2014-1446`, :cve:`2014-1690`, :cve:`2014-1737`, :cve:`2014-1738`, :cve:`2014-1739`, :cve:`2014-1874`, :cve:`2014-2038`, :cve:`2014-2039`, :cve:`2014-2309`, :cve:`2014-2523`, :cve:`2014-2568`, :cve:`2014-2580`, :cve:`2014-2672`, :cve:`2014-2673`, :cve:`2014-2678`, :cve:`2014-2706`, :cve:`2014-2739`, :cve:`2014-2851`, :cve:`2014-2889`, :cve:`2
 014-3122`, :cve:`2014-3144`, :cve:`2014-3145`, :cve:`2014-3153`, :cve:`2014-3180`, :cve:`2014-3181`, :cve:`2014-3182`, :cve:`2014-3183`, :cve:`2014-3184`, :cve:`2014-3185`, :cve:`2014-3186`, :cve:`2014-3534`, :cve:`2014-3535`, :cve:`2014-3601`, :cve:`2014-3610`, :cve:`2014-3611`, :cve:`2014-3631`, :cve:`2014-3645`, :cve:`2014-3646`, :cve:`2014-3647`, :cve:`2014-3673`, :cve:`2014-3687`, :cve:`2014-3688`, :cve:`2014-3690`, :cve:`2014-3917`, :cve:`2014-3940`, :cve:`2014-4014`, :cve:`2014-4027`, :cve:`2014-4157`, :cve:`2014-4171`, :cve:`2014-4508`, :cve:`2014-4608`, :cve:`2014-4611`, :cve:`2014-4652`, :cve:`2014-4653`, :cve:`2014-4654`, :cve:`2014-4655`, :cve:`2014-4656`, :cve:`2014-4667`, :cve:`2014-4699`, :cve:`2014-4943`, :cve:`2014-5045`, :cve:`2014-5077`, :cve:`2014-5206`, :cve:`2014-5207`, :cve:`2014-5471`, :cve:`2014-5472`, :cve:`2014-6410`, :cve:`2014-6416`, :cve:`2014-6417`, :cve:`2014-6418`, :cve:`2014-7145`, :cve:`2014-7283`, :cve:`2014-7284`, :cve:`2014-7822`, :cve:`2014-782
 5`, :cve:`2014-7826`, :cve:`2014-7841`, :cve:`2014-7842`, :cve:`2014-7843`, :cve:`2014-7970`, :cve:`2014-7975`, :cve:`2014-8086`, :cve:`2014-8133`, :cve:`2014-8134`, :cve:`2014-8159`, :cve:`2014-8160`, :cve:`2014-8171`, :cve:`2014-8172`, :cve:`2014-8173`, :cve:`2014-8369`, :cve:`2014-8480`, :cve:`2014-8481`, :cve:`2014-8559`, :cve:`2014-8709`, :cve:`2014-8884`, :cve:`2014-8989`, :cve:`2014-9090`, :cve:`2014-9322`, :cve:`2014-9419`, :cve:`2014-9420`, :cve:`2014-9428`, :cve:`2014-9529`, :cve:`2014-9584`, :cve:`2014-9585`, :cve:`2014-9644`, :cve:`2014-9683`, :cve:`2014-9710`, :cve:`2014-9715`, :cve:`2014-9717`, :cve:`2014-9728`, :cve:`2014-9729`, :cve:`2014-9730`, :cve:`2014-9731`, :cve:`2014-9803`, :cve:`2014-9870`, :cve:`2014-9888`, :cve:`2014-9895`, :cve:`2014-9903`, :cve:`2014-9904`, :cve:`2014-9914`, :cve:`2014-9922`, :cve:`2014-9940`, :cve:`2015-0239`, :cve:`2015-0274`, :cve:`2015-0275`, :cve:`2015-1333`, :cve:`2015-1339`, :cve:`2015-1350`, :cve:`2015-1420`, :cve:`2015-1421`, :cv
 e:`2015-1465`, :cve:`2015-1573`, :cve:`2015-1593`, :cve:`2015-1805`, :cve:`2015-2041`, :cve:`2015-2042`, :cve:`2015-2150`, :cve:`2015-2666`, :cve:`2015-2672`, :cve:`2015-2686`, :cve:`2015-2830`, :cve:`2015-2922`, :cve:`2015-2925`, :cve:`2015-3212`, :cve:`2015-3214`, :cve:`2015-3288`, :cve:`2015-3290`, :cve:`2015-3291`, :cve:`2015-3331`, :cve:`2015-3339`, :cve:`2015-3636`, :cve:`2015-4001`, :cve:`2015-4002`, :cve:`2015-4003`, :cve:`2015-4004`, :cve:`2015-4036`, :cve:`2015-4167`, :cve:`2015-4170`, :cve:`2015-4176`, :cve:`2015-4177`, :cve:`2015-4178`, :cve:`2015-4692`, :cve:`2015-4700`, :cve:`2015-5156`, :cve:`2015-5157`, :cve:`2015-5257`, :cve:`2015-5283`, :cve:`2015-5307`, :cve:`2015-5327`, :cve:`2015-5364`, :cve:`2015-5366`, :cve:`2015-5697`, :cve:`2015-5706`, :cve:`2015-5707`, :cve:`2015-6252`, :cve:`2015-6526`, :cve:`2015-6937`, :cve:`2015-7509`, :cve:`2015-7513`, :cve:`2015-7515`, :cve:`2015-7550`, :cve:`2015-7566`, :cve:`2015-7613`, :cve:`2015-7799`, :cve:`2015-7833`, :cve:`2015
 -7872`, :cve:`2015-7884`, :cve:`2015-7885`, :cve:`2015-7990`, :cve:`2015-8104`, :cve:`2015-8215`, :cve:`2015-8324`, :cve:`2015-8374`, :cve:`2015-8539`, :cve:`2015-8543`, :cve:`2015-8550`, :cve:`2015-8551`, :cve:`2015-8552`, :cve:`2015-8553`, :cve:`2015-8569`, :cve:`2015-8575`, :cve:`2015-8660`, :cve:`2015-8709`, :cve:`2015-8746`, :cve:`2015-8767`, :cve:`2015-8785`, :cve:`2015-8787`, :cve:`2015-8812`, :cve:`2015-8816`, :cve:`2015-8830`, :cve:`2015-8839`, :cve:`2015-8844`, :cve:`2015-8845`, :cve:`2015-8950`, :cve:`2015-8952`, :cve:`2015-8953`, :cve:`2015-8955`, :cve:`2015-8956`, :cve:`2015-8961`, :cve:`2015-8962`, :cve:`2015-8963`, :cve:`2015-8964`, :cve:`2015-8966`, :cve:`2015-8967`, :cve:`2015-8970`, :cve:`2015-9004`, :cve:`2015-9016`, :cve:`2015-9289`, :cve:`2016-0617`, :cve:`2016-0723`, :cve:`2016-0728`, :cve:`2016-0758`, :cve:`2016-0821`, :cve:`2016-0823`, :cve:`2016-10044`, :cve:`2016-10088`, :cve:`2016-10147`, :cve:`2016-10150`, :cve:`2016-10153`, :cve:`2016-10154`, :cve:`2016-
 10200`, :cve:`2016-10208`, :cve:`2016-10229`, :cve:`2016-10318`, :cve:`2016-10723`, :cve:`2016-10741`, :cve:`2016-10764`, :cve:`2016-10905`, :cve:`2016-10906`, :cve:`2016-10907`, :cve:`2016-1237`, :cve:`2016-1575`, :cve:`2016-1576`, :cve:`2016-1583`, :cve:`2016-2053`, :cve:`2016-2069`, :cve:`2016-2070`, :cve:`2016-2085`, :cve:`2016-2117`, :cve:`2016-2143`, :cve:`2016-2184`, :cve:`2016-2185`, :cve:`2016-2186`, :cve:`2016-2187`, :cve:`2016-2188`, :cve:`2016-2383`, :cve:`2016-2384`, :cve:`2016-2543`, :cve:`2016-2544`, :cve:`2016-2545`, :cve:`2016-2546`, :cve:`2016-2547`, :cve:`2016-2548`, :cve:`2016-2549`, :cve:`2016-2550`, :cve:`2016-2782`, :cve:`2016-2847`, :cve:`2016-3044`, :cve:`2016-3070`, :cve:`2016-3134`, :cve:`2016-3135`, :cve:`2016-3136`, :cve:`2016-3137`, :cve:`2016-3138`, :cve:`2016-3139`, :cve:`2016-3140`, :cve:`2016-3156`, :cve:`2016-3157`, :cve:`2016-3672`, :cve:`2016-3689`, :cve:`2016-3713`, :cve:`2016-3841`, :cve:`2016-3857`, :cve:`2016-3951`, :cve:`2016-3955`, :cve:`20
 16-3961`, :cve:`2016-4440`, :cve:`2016-4470`, :cve:`2016-4482`, :cve:`2016-4485`, :cve:`2016-4486`, :cve:`2016-4557`, :cve:`2016-4558`, :cve:`2016-4565`, :cve:`2016-4568`, :cve:`2016-4569`, :cve:`2016-4578`, :cve:`2016-4580`, :cve:`2016-4581`, :cve:`2016-4794`, :cve:`2016-4805`, :cve:`2016-4913`, :cve:`2016-4951`, :cve:`2016-4997`, :cve:`2016-4998`, :cve:`2016-5195`, :cve:`2016-5243`, :cve:`2016-5244`, :cve:`2016-5400`, :cve:`2016-5412`, :cve:`2016-5696`, :cve:`2016-5728`, :cve:`2016-5828`, :cve:`2016-5829`, :cve:`2016-6130`, :cve:`2016-6136`, :cve:`2016-6156`, :cve:`2016-6162`, :cve:`2016-6187`, :cve:`2016-6197`, :cve:`2016-6198`, :cve:`2016-6213`, :cve:`2016-6327`, :cve:`2016-6480`, :cve:`2016-6516`, :cve:`2016-6786`, :cve:`2016-6787`, :cve:`2016-6828`, :cve:`2016-7039`, :cve:`2016-7042`, :cve:`2016-7097`, :cve:`2016-7117`, :cve:`2016-7425`, :cve:`2016-7910`, :cve:`2016-7911`, :cve:`2016-7912`, :cve:`2016-7913`, :cve:`2016-7914`, :cve:`2016-7915`, :cve:`2016-7916`, :cve:`2016-7917
 `, :cve:`2016-8399`, :cve:`2016-8405`, :cve:`2016-8630`, :cve:`2016-8632`, :cve:`2016-8633`, :cve:`2016-8636`, :cve:`2016-8645`, :cve:`2016-8646`, :cve:`2016-8650`, :cve:`2016-8655`, :cve:`2016-8658`, :cve:`2016-8666`, :cve:`2016-9083`, :cve:`2016-9084`, :cve:`2016-9120`, :cve:`2016-9178`, :cve:`2016-9191`, :cve:`2016-9313`, :cve:`2016-9555`, :cve:`2016-9576`, :cve:`2016-9588`, :cve:`2016-9604`, :cve:`2016-9685`, :cve:`2016-9754`, :cve:`2016-9755`, :cve:`2016-9756`, :cve:`2016-9777`, :cve:`2016-9793`, :cve:`2016-9794`, :cve:`2016-9806`, :cve:`2016-9919`, :cve:`2017-0605`, :cve:`2017-0627`, :cve:`2017-0750`, :cve:`2017-0786`, :cve:`2017-0861`, :cve:`2017-1000`, :cve:`2017-1000111`, :cve:`2017-1000112`, :cve:`2017-1000251`, :cve:`2017-1000252`, :cve:`2017-1000253`, :cve:`2017-1000255`, :cve:`2017-1000363`, :cve:`2017-1000364`, :cve:`2017-1000365`, :cve:`2017-1000370`, :cve:`2017-1000371`, :cve:`2017-1000379`, :cve:`2017-1000380`, :cve:`2017-1000405`, :cve:`2017-1000407`, :cve:`2017-10
 00410`, :cve:`2017-10661`, :cve:`2017-10662`, :cve:`2017-10663`, :cve:`2017-10810`, :cve:`2017-10911`, :cve:`2017-11089`, :cve:`2017-11176`, :cve:`2017-11472`, :cve:`2017-11473`, :cve:`2017-11600`, :cve:`2017-12134`, :cve:`2017-12146`, :cve:`2017-12153`, :cve:`2017-12154`, :cve:`2017-12168`, :cve:`2017-12188`, :cve:`2017-12190`, :cve:`2017-12192`, :cve:`2017-12193`, :cve:`2017-12762`, :cve:`2017-13080`, :cve:`2017-13166`, :cve:`2017-13167`, :cve:`2017-13168`, :cve:`2017-13215`, :cve:`2017-13216`, :cve:`2017-13220`, :cve:`2017-13305`, :cve:`2017-13686`, :cve:`2017-13695`, :cve:`2017-13715`, :cve:`2017-14051`, :cve:`2017-14106`, :cve:`2017-14140`, :cve:`2017-14156`, :cve:`2017-14340`, :cve:`2017-14489`, :cve:`2017-14497`, :cve:`2017-14954`, :cve:`2017-14991`, :cve:`2017-15102`, :cve:`2017-15115`, :cve:`2017-15116`, :cve:`2017-15121`, :cve:`2017-15126`, :cve:`2017-15127`, :cve:`2017-15128`, :cve:`2017-15129`, :cve:`2017-15265`, :cve:`2017-15274`, :cve:`2017-15299`, :cve:`2017-15306`, :
 cve:`2017-15537`, :cve:`2017-15649`, :cve:`2017-15868`, :cve:`2017-15951`, :cve:`2017-16525`, :cve:`2017-16526`, :cve:`2017-16527`, :cve:`2017-16528`, :cve:`2017-16529`, :cve:`2017-16530`, :cve:`2017-16531`, :cve:`2017-16532`, :cve:`2017-16533`, :cve:`2017-16534`, :cve:`2017-16535`, :cve:`2017-16536`, :cve:`2017-16537`, :cve:`2017-16538`, :cve:`2017-16643`, :cve:`2017-16644`, :cve:`2017-16645`, :cve:`2017-16646`, :cve:`2017-16647`, :cve:`2017-16648`, :cve:`2017-16649`, :cve:`2017-16650`, :cve:`2017-16911`, :cve:`2017-16912`, :cve:`2017-16913`, :cve:`2017-16914`, :cve:`2017-16939`, :cve:`2017-16994`, :cve:`2017-16995`, :cve:`2017-16996`, :cve:`2017-17052`, :cve:`2017-17053`, :cve:`2017-17448`, :cve:`2017-17449`, :cve:`2017-17450`, :cve:`2017-17558`, :cve:`2017-17712`, :cve:`2017-17741`, :cve:`2017-17805`, :cve:`2017-17806`, :cve:`2017-17807`, :cve:`2017-17852`, :cve:`2017-17853`, :cve:`2017-17854`, :cve:`2017-17855`, :cve:`2017-17856`, :cve:`2017-17857`, :cve:`2017-17862`, :cve:`2017
 -17863`, :cve:`2017-17864`, :cve:`2017-17975`, :cve:`2017-18017`, :cve:`2017-18075`, :cve:`2017-18079`, :cve:`2017-18174`, :cve:`2017-18193`, :cve:`2017-18200`, :cve:`2017-18202`, :cve:`2017-18203`, :cve:`2017-18204`, :cve:`2017-18208`, :cve:`2017-18216`, :cve:`2017-18218`, :cve:`2017-18221`, :cve:`2017-18222`, :cve:`2017-18224`, :cve:`2017-18232`, :cve:`2017-18241`, :cve:`2017-18249`, :cve:`2017-18255`, :cve:`2017-18257`, :cve:`2017-18261`, :cve:`2017-18270`, :cve:`2017-18344`, :cve:`2017-18360`, :cve:`2017-18379`, :cve:`2017-18509`, :cve:`2017-18549`, :cve:`2017-18550`, :cve:`2017-18551`, :cve:`2017-18552`, :cve:`2017-18595`, :cve:`2017-2583`, :cve:`2017-2584`, :cve:`2017-2596`, :cve:`2017-2618`, :cve:`2017-2634`, :cve:`2017-2636`, :cve:`2017-2647`, :cve:`2017-2671`, :cve:`2017-5123`, :cve:`2017-5546`, :cve:`2017-5547`, :cve:`2017-5548`, :cve:`2017-5549`, :cve:`2017-5550`, :cve:`2017-5551`, :cve:`2017-5576`, :cve:`2017-5577`, :cve:`2017-5669`, :cve:`2017-5715`, :cve:`2017-5753`, :
 cve:`2017-5754`, :cve:`2017-5897`, :cve:`2017-5967`, :cve:`2017-5970`, :cve:`2017-5972`, :cve:`2017-5986`, :cve:`2017-6001`, :cve:`2017-6074`, :cve:`2017-6214`, :cve:`2017-6345`, :cve:`2017-6346`, :cve:`2017-6347`, :cve:`2017-6348`, :cve:`2017-6353`, :cve:`2017-6874`, :cve:`2017-6951`, :cve:`2017-7184`, :cve:`2017-7187`, :cve:`2017-7261`, :cve:`2017-7273`, :cve:`2017-7277`, :cve:`2017-7294`, :cve:`2017-7308`, :cve:`2017-7346`, :cve:`2017-7374`, :cve:`2017-7472`, :cve:`2017-7477`, :cve:`2017-7482`, :cve:`2017-7487`, :cve:`2017-7495`, :cve:`2017-7518`, :cve:`2017-7533`, :cve:`2017-7541`, :cve:`2017-7542`, :cve:`2017-7558`, :cve:`2017-7616`, :cve:`2017-7618`, :cve:`2017-7645`, :cve:`2017-7889`, :cve:`2017-7895`, :cve:`2017-7979`, :cve:`2017-8061`, :cve:`2017-8062`, :cve:`2017-8063`, :cve:`2017-8064`, :cve:`2017-8065`, :cve:`2017-8066`, :cve:`2017-8067`, :cve:`2017-8068`, :cve:`2017-8069`, :cve:`2017-8070`, :cve:`2017-8071`, :cve:`2017-8072`, :cve:`2017-8106`, :cve:`2017-8240`, :cve:`20
 17-8797`, :cve:`2017-8824`, :cve:`2017-8831`, :cve:`2017-8890`, :cve:`2017-8924`, :cve:`2017-8925`, :cve:`2017-9059`, :cve:`2017-9074`, :cve:`2017-9075`, :cve:`2017-9076`, :cve:`2017-9077`, :cve:`2017-9150`, :cve:`2017-9211`, :cve:`2017-9242`, :cve:`2017-9605`, :cve:`2017-9725`, :cve:`2017-9984`, :cve:`2017-9985`, :cve:`2017-9986`, :cve:`2018-1000004`, :cve:`2018-1000026`, :cve:`2018-1000028`, :cve:`2018-1000199`, :cve:`2018-1000200`, :cve:`2018-1000204`, :cve:`2018-10021`, :cve:`2018-10074`, :cve:`2018-10087`, :cve:`2018-10124`, :cve:`2018-10322`, :cve:`2018-10323`, :cve:`2018-1065`, :cve:`2018-1066`, :cve:`2018-10675`, :cve:`2018-1068`, :cve:`2018-10840`, :cve:`2018-10853`, :cve:`2018-1087`, :cve:`2018-10876`, :cve:`2018-10877`, :cve:`2018-10878`, :cve:`2018-10879`, :cve:`2018-10880`, :cve:`2018-10881`, :cve:`2018-10882`, :cve:`2018-10883`, :cve:`2018-10901`, :cve:`2018-10902`, :cve:`2018-1091`, :cve:`2018-1092`, :cve:`2018-1093`, :cve:`2018-10938`, :cve:`2018-1094`, :cve:`2018-10
 940`, :cve:`2018-1095`, :cve:`2018-1108`, :cve:`2018-1118`, :cve:`2018-1120`, :cve:`2018-11232`, :cve:`2018-1128`, :cve:`2018-1129`, :cve:`2018-1130`, :cve:`2018-11412`, :cve:`2018-11506`, :cve:`2018-11508`, :cve:`2018-12126`, :cve:`2018-12127`, :cve:`2018-12130`, :cve:`2018-12207`, :cve:`2018-12232`, :cve:`2018-12233`, :cve:`2018-12633`, :cve:`2018-12714`, :cve:`2018-12896`, :cve:`2018-12904`, :cve:`2018-13053`, :cve:`2018-13093`, :cve:`2018-13094`, :cve:`2018-13095`, :cve:`2018-13096`, :cve:`2018-13097`, :cve:`2018-13098`, :cve:`2018-13099`, :cve:`2018-13100`, :cve:`2018-13405`, :cve:`2018-13406`, :cve:`2018-14609`, :cve:`2018-14610`, :cve:`2018-14611`, :cve:`2018-14612`, :cve:`2018-14613`, :cve:`2018-14614`, :cve:`2018-14615`, :cve:`2018-14616`, :cve:`2018-14617`, :cve:`2018-14619`, :cve:`2018-14625`, :cve:`2018-14633`, :cve:`2018-14634`, :cve:`2018-14641`, :cve:`2018-14646`, :cve:`2018-14656`, :cve:`2018-14678`, :cve:`2018-14734`, :cve:`2018-15471`, :cve:`2018-15572`, :cve:`2018
 -15594`, :cve:`2018-16276`, :cve:`2018-16597`, :cve:`2018-16658`, :cve:`2018-16862`, :cve:`2018-16871`, :cve:`2018-16880`, :cve:`2018-16882`, :cve:`2018-16884`, :cve:`2018-17182`, :cve:`2018-17972`, :cve:`2018-18021`, :cve:`2018-18281`, :cve:`2018-18386`, :cve:`2018-18397`, :cve:`2018-18445`, :cve:`2018-18559`, :cve:`2018-18690`, :cve:`2018-18710`, :cve:`2018-18955`, :cve:`2018-19406`, :cve:`2018-19407`, :cve:`2018-19824`, :cve:`2018-19854`, :cve:`2018-19985`, :cve:`2018-20169`, :cve:`2018-20449`, :cve:`2018-20509`, :cve:`2018-20510`, :cve:`2018-20511`, :cve:`2018-20669`, :cve:`2018-20784`, :cve:`2018-20836`, :cve:`2018-20854`, :cve:`2018-20855`, :cve:`2018-20856`, :cve:`2018-20961`, :cve:`2018-20976`, :cve:`2018-21008`, :cve:`2018-25015`, :cve:`2018-25020`, :cve:`2018-3620`, :cve:`2018-3639`, :cve:`2018-3646`, :cve:`2018-3665`, :cve:`2018-3693`, :cve:`2018-5332`, :cve:`2018-5333`, :cve:`2018-5344`, :cve:`2018-5390`, :cve:`2018-5391`, :cve:`2018-5703`, :cve:`2018-5750`, :cve:`2018-5
 803`, :cve:`2018-5814`, :cve:`2018-5848`, :cve:`2018-5873`, :cve:`2018-5953`, :cve:`2018-5995`, :cve:`2018-6412`, :cve:`2018-6554`, :cve:`2018-6555`, :cve:`2018-6927`, :cve:`2018-7191`, :cve:`2018-7273`, :cve:`2018-7480`, :cve:`2018-7492`, :cve:`2018-7566`, :cve:`2018-7740`, :cve:`2018-7754`, :cve:`2018-7755`, :cve:`2018-7757`, :cve:`2018-7995`, :cve:`2018-8043`, :cve:`2018-8087`, :cve:`2018-8781`, :cve:`2018-8822`, :cve:`2018-8897`, :cve:`2018-9363`, :cve:`2018-9385`, :cve:`2018-9415`, :cve:`2018-9422`, :cve:`2018-9465`, :cve:`2018-9516`, :cve:`2018-9517`, :cve:`2018-9518`, :cve:`2018-9568`, :cve:`2019-0136`, :cve:`2019-0145`, :cve:`2019-0146`, :cve:`2019-0147`, :cve:`2019-0148`, :cve:`2019-0149`, :cve:`2019-0154`, :cve:`2019-0155`, :cve:`2019-10124`, :cve:`2019-10125`, :cve:`2019-10126`, :cve:`2019-10142`, :cve:`2019-10207`, :cve:`2019-10220`, :cve:`2019-10638`, :cve:`2019-10639`, :cve:`2019-11085`, :cve:`2019-11091`, :cve:`2019-11135`, :cve:`2019-11190`, :cve:`2019-11191`, :cve:`
 2019-1125`, :cve:`2019-11477`, :cve:`2019-11478`, :cve:`2019-11479`, :cve:`2019-11486`, :cve:`2019-11487`, :cve:`2019-11599`, :cve:`2019-11683`, :cve:`2019-11810`, :cve:`2019-11811`, :cve:`2019-11815`, :cve:`2019-11833`, :cve:`2019-11884`, :cve:`2019-12378`, :cve:`2019-12379`, :cve:`2019-12380`, :cve:`2019-12381`, :cve:`2019-12382`, :cve:`2019-12454`, :cve:`2019-12455`, :cve:`2019-12614`, :cve:`2019-12615`, :cve:`2019-12817`, :cve:`2019-12818`, :cve:`2019-12819`, :cve:`2019-12881`, :cve:`2019-12984`, :cve:`2019-13233`, :cve:`2019-13272`, :cve:`2019-13631`, :cve:`2019-13648`, :cve:`2019-14283`, :cve:`2019-14284`, :cve:`2019-14615`, :cve:`2019-14763`, :cve:`2019-14814`, :cve:`2019-14815`, :cve:`2019-14816`, :cve:`2019-14821`, :cve:`2019-14835`, :cve:`2019-14895`, :cve:`2019-14896`, :cve:`2019-14897`, :cve:`2019-14901`, :cve:`2019-15030`, :cve:`2019-15031`, :cve:`2019-15090`, :cve:`2019-15098`, :cve:`2019-15099`, :cve:`2019-15117`, :cve:`2019-15118`, :cve:`2019-15211`, :cve:`2019-15212
 `, :cve:`2019-15213`, :cve:`2019-15214`, :cve:`2019-15215`, :cve:`2019-15216`, :cve:`2019-15217`, :cve:`2019-15218`, :cve:`2019-15219`, :cve:`2019-15220`, :cve:`2019-15221`, :cve:`2019-15222`, :cve:`2019-15223`, :cve:`2019-15291`, :cve:`2019-15292`, :cve:`2019-15504`, :cve:`2019-15505`, :cve:`2019-15538`, :cve:`2019-15666`, :cve:`2019-15807`, :cve:`2019-15916`, :cve:`2019-15917`, :cve:`2019-15918`, :cve:`2019-15919`, :cve:`2019-15920`, :cve:`2019-15921`, :cve:`2019-15922`, :cve:`2019-15923`, :cve:`2019-15924`, :cve:`2019-15925`, :cve:`2019-15926`, :cve:`2019-15927`, :cve:`2019-16229`, :cve:`2019-16230`, :cve:`2019-16231`, :cve:`2019-16232`, :cve:`2019-16233`, :cve:`2019-16234`, :cve:`2019-16413`, :cve:`2019-16714`, :cve:`2019-16746`, :cve:`2019-16921`, :cve:`2019-16994`, :cve:`2019-16995`, :cve:`2019-17052`, :cve:`2019-17053`, :cve:`2019-17054`, :cve:`2019-17055`, :cve:`2019-17056`, :cve:`2019-17075`, :cve:`2019-17133`, :cve:`2019-17351`, :cve:`2019-17666`, :cve:`2019-18198`, :cve:`
 2019-18282`, :cve:`2019-18660`, :cve:`2019-18675`, :cve:`2019-18683`, :cve:`2019-18786`, :cve:`2019-18805`, :cve:`2019-18806`, :cve:`2019-18807`, :cve:`2019-18808`, :cve:`2019-18809`, :cve:`2019-18810`, :cve:`2019-18811`, :cve:`2019-18812`, :cve:`2019-18813`, :cve:`2019-18814`, :cve:`2019-18885`, :cve:`2019-19036`, :cve:`2019-19037`, :cve:`2019-19039`, :cve:`2019-19043`, :cve:`2019-19044`, :cve:`2019-19045`, :cve:`2019-19046`, :cve:`2019-19047`, :cve:`2019-19048`, :cve:`2019-19049`, :cve:`2019-19050`, :cve:`2019-19051`, :cve:`2019-19052`, :cve:`2019-19053`, :cve:`2019-19054`, :cve:`2019-19055`, :cve:`2019-19056`, :cve:`2019-19057`, :cve:`2019-19058`, :cve:`2019-19059`, :cve:`2019-19060`, :cve:`2019-19061`, :cve:`2019-19062`, :cve:`2019-19063`, :cve:`2019-19064`, :cve:`2019-19065`, :cve:`2019-19066`, :cve:`2019-19067`, :cve:`2019-19068`, :cve:`2019-19069`, :cve:`2019-19070`, :cve:`2019-19071`, :cve:`2019-19072`, :cve:`2019-19073`, :cve:`2019-19074`, :cve:`2019-19075`, :cve:`2019-1907
 6`, :cve:`2019-19077`, :cve:`2019-19078`, :cve:`2019-19079`, :cve:`2019-19080`, :cve:`2019-19081`, :cve:`2019-19082`, :cve:`2019-19083`, :cve:`2019-19227`, :cve:`2019-19241`, :cve:`2019-19252`, :cve:`2019-19318`, :cve:`2019-19319`, :cve:`2019-19332`, :cve:`2019-19338`, :cve:`2019-19377`, :cve:`2019-19447`, :cve:`2019-19448`, :cve:`2019-19449`, :cve:`2019-19462`, :cve:`2019-19523`, :cve:`2019-19524`, :cve:`2019-19525`, :cve:`2019-19526`, :cve:`2019-19527`, :cve:`2019-19528`, :cve:`2019-19529`, :cve:`2019-19530`, :cve:`2019-19531`, :cve:`2019-19532`, :cve:`2019-19533`, :cve:`2019-19534`, :cve:`2019-19535`, :cve:`2019-19536`, :cve:`2019-19537`, :cve:`2019-19543`, :cve:`2019-19602`, :cve:`2019-19767`, :cve:`2019-19768`, :cve:`2019-19769`, :cve:`2019-19770`, :cve:`2019-19807`, :cve:`2019-19813`, :cve:`2019-19815`, :cve:`2019-19816`, :cve:`2019-19922`, :cve:`2019-19927`, :cve:`2019-19947`, :cve:`2019-19965`, :cve:`2019-19966`, :cve:`2019-1999`, :cve:`2019-20054`, :cve:`2019-20095`, :cve:`
 2019-20096`, :cve:`2019-2024`, :cve:`2019-2025`, :cve:`2019-20422`, :cve:`2019-2054`, :cve:`2019-20636`, :cve:`2019-20806`, :cve:`2019-20810`, :cve:`2019-20811`, :cve:`2019-20812`, :cve:`2019-20908`, :cve:`2019-20934`, :cve:`2019-2101`, :cve:`2019-2181`, :cve:`2019-2182`, :cve:`2019-2213`, :cve:`2019-2214`, :cve:`2019-2215`, :cve:`2019-25044`, :cve:`2019-25045`, :cve:`2019-3016`, :cve:`2019-3459`, :cve:`2019-3460`, :cve:`2019-3701`, :cve:`2019-3819`, :cve:`2019-3837`, :cve:`2019-3846`, :cve:`2019-3874`, :cve:`2019-3882`, :cve:`2019-3887`, :cve:`2019-3892`, :cve:`2019-3896`, :cve:`2019-3900`, :cve:`2019-3901`, :cve:`2019-5108`, :cve:`2019-6133`, :cve:`2019-6974`, :cve:`2019-7221`, :cve:`2019-7222`, :cve:`2019-7308`, :cve:`2019-8912`, :cve:`2019-8956`, :cve:`2019-8980`, :cve:`2019-9003`, :cve:`2019-9162`, :cve:`2019-9213`, :cve:`2019-9245`, :cve:`2019-9444`, :cve:`2019-9445`, :cve:`2019-9453`, :cve:`2019-9454`, :cve:`2019-9455`, :cve:`2019-9456`, :cve:`2019-9457`, :cve:`2019-9458`, :c
 ve:`2019-9466`, :cve:`2019-9500`, :cve:`2019-9503`, :cve:`2019-9506`, :cve:`2019-9857`, :cve:`2020-0009`, :cve:`2020-0030`, :cve:`2020-0041`, :cve:`2020-0066`, :cve:`2020-0067`, :cve:`2020-0110`, :cve:`2020-0255`, :cve:`2020-0305`, :cve:`2020-0404`, :cve:`2020-0423`, :cve:`2020-0427`, :cve:`2020-0429`, :cve:`2020-0430`, :cve:`2020-0431`, :cve:`2020-0432`, :cve:`2020-0433`, :cve:`2020-0435`, :cve:`2020-0444`, :cve:`2020-0465`, :cve:`2020-0466`, :cve:`2020-0543`, :cve:`2020-10135`, :cve:`2020-10690`, :cve:`2020-10711`, :cve:`2020-10720`, :cve:`2020-10732`, :cve:`2020-10742`, :cve:`2020-10751`, :cve:`2020-10757`, :cve:`2020-10766`, :cve:`2020-10767`, :cve:`2020-10768`, :cve:`2020-10769`, :cve:`2020-10773`, :cve:`2020-10781`, :cve:`2020-10942`, :cve:`2020-11494`, :cve:`2020-11565`, :cve:`2020-11608`, :cve:`2020-11609`, :cve:`2020-11668`, :cve:`2020-11669`, :cve:`2020-11884`, :cve:`2020-12114`, :cve:`2020-12351`, :cve:`2020-12352`, :cve:`2020-12464`, :cve:`2020-12465`, :cve:`2020-12652`,
  :cve:`2020-12653`, :cve:`2020-12654`, :cve:`2020-12655`, :cve:`2020-12656`, :cve:`2020-12657`, :cve:`2020-12659`, :cve:`2020-12768`, :cve:`2020-12769`, :cve:`2020-12770`, :cve:`2020-12771`, :cve:`2020-12826`, :cve:`2020-12888`, :cve:`2020-12912`, :cve:`2020-13143`, :cve:`2020-13974`, :cve:`2020-14305`, :cve:`2020-14314`, :cve:`2020-14331`, :cve:`2020-14351`, :cve:`2020-14353`, :cve:`2020-14356`, :cve:`2020-14381`, :cve:`2020-14385`, :cve:`2020-14386`, :cve:`2020-14390`, :cve:`2020-14416`, :cve:`2020-15393`, :cve:`2020-15436`, :cve:`2020-15437`, :cve:`2020-15780`, :cve:`2020-15852`, :cve:`2020-16119`, :cve:`2020-16120`, :cve:`2020-16166`, :cve:`2020-1749`, :cve:`2020-24394`, :cve:`2020-24490`, :cve:`2020-24586`, :cve:`2020-24587`, :cve:`2020-24588`, :cve:`2020-25211`, :cve:`2020-25212`, :cve:`2020-25221`, :cve:`2020-25284`, :cve:`2020-25285`, :cve:`2020-25639`, :cve:`2020-25641`, :cve:`2020-25643`, :cve:`2020-25645`, :cve:`2020-25656`, :cve:`2020-25668`, :cve:`2020-25669`, :cve:`202
 0-25670`, :cve:`2020-25671`, :cve:`2020-25672`, :cve:`2020-25673`, :cve:`2020-25704`, :cve:`2020-25705`, :cve:`2020-26088`, :cve:`2020-26139`, :cve:`2020-26141`, :cve:`2020-26145`, :cve:`2020-26147`, :cve:`2020-26541`, :cve:`2020-26555`, :cve:`2020-26558`, :cve:`2020-27066`, :cve:`2020-27067`, :cve:`2020-27068`, :cve:`2020-27152`, :cve:`2020-27170`, :cve:`2020-27171`, :cve:`2020-27194`, :cve:`2020-2732`, :cve:`2020-27418`, :cve:`2020-27673`, :cve:`2020-27675`, :cve:`2020-27777`, :cve:`2020-27784`, :cve:`2020-27786`, :cve:`2020-27815`, :cve:`2020-27820`, :cve:`2020-27825`, :cve:`2020-27830`, :cve:`2020-27835`, :cve:`2020-28097`, :cve:`2020-28374`, :cve:`2020-28588`, :cve:`2020-28915`, :cve:`2020-28941`, :cve:`2020-28974`, :cve:`2020-29368`, :cve:`2020-29369`, :cve:`2020-29370`, :cve:`2020-29371`, :cve:`2020-29372`, :cve:`2020-29373`, :cve:`2020-29374`, :cve:`2020-29534`, :cve:`2020-29568`, :cve:`2020-29569`, :cve:`2020-29660`, :cve:`2020-29661`, :cve:`2020-35499`, :cve:`2020-35508`, 
 :cve:`2020-35513`, :cve:`2020-35519`, :cve:`2020-36158`, :cve:`2020-36310`, :cve:`2020-36311`, :cve:`2020-36312`, :cve:`2020-36313`, :cve:`2020-36322`, :cve:`2020-36385`, :cve:`2020-36386`, :cve:`2020-36387`, :cve:`2020-36516`, :cve:`2020-36557`, :cve:`2020-36558`, :cve:`2020-36691`, :cve:`2020-36694`, :cve:`2020-36766`, :cve:`2020-3702`, :cve:`2020-4788`, :cve:`2020-7053`, :cve:`2020-8428`, :cve:`2020-8647`, :cve:`2020-8648`, :cve:`2020-8649`, :cve:`2020-8694`, :cve:`2020-8834`, :cve:`2020-8835`, :cve:`2020-8992`, :cve:`2020-9383`, :cve:`2020-9391`, :cve:`2021-0129`, :cve:`2021-0342`, :cve_mitre:`2021-0447`, :cve_mitre:`2021-0448`, :cve:`2021-0512`, :cve:`2021-0605`, :cve:`2021-0707`, :cve:`2021-0920`, :cve:`2021-0929`, :cve:`2021-0935`, :cve_mitre:`2021-0937`, :cve:`2021-0938`, :cve:`2021-0941`, :cve:`2021-1048`, :cve:`2021-20177`, :cve:`2021-20194`, :cve:`2021-20226`, :cve:`2021-20239`, :cve:`2021-20261`, :cve:`2021-20265`, :cve:`2021-20268`, :cve:`2021-20292`, :cve:`2021-20317`,
  :cve:`2021-20320`, :cve:`2021-20321`, :cve:`2021-20322`, :cve:`2021-21781`, :cve:`2021-22543`, :cve:`2021-22555`, :cve:`2021-22600`, :cve:`2021-23133`, :cve:`2021-23134`, :cve:`2021-26401`, :cve:`2021-26708`, :cve:`2021-26930`, :cve:`2021-26931`, :cve:`2021-26932`, :cve:`2021-27363`, :cve:`2021-27364`, :cve:`2021-27365`, :cve:`2021-28038`, :cve:`2021-28039`, :cve:`2021-28375`, :cve:`2021-28660`, :cve:`2021-28688`, :cve:`2021-28691`, :cve:`2021-28711`, :cve:`2021-28712`, :cve:`2021-28713`, :cve:`2021-28714`, :cve:`2021-28715`, :cve:`2021-28950`, :cve:`2021-28951`, :cve:`2021-28952`, :cve:`2021-28964`, :cve:`2021-28971`, :cve:`2021-28972`, :cve:`2021-29154`, :cve:`2021-29155`, :cve:`2021-29264`, :cve:`2021-29265`, :cve:`2021-29266`, :cve:`2021-29646`, :cve:`2021-29647`, :cve:`2021-29648`, :cve:`2021-29649`, :cve:`2021-29650`, :cve:`2021-29657`, :cve:`2021-30002`, :cve:`2021-30178`, :cve:`2021-31440`, :cve:`2021-3178`, :cve:`2021-31829`, :cve:`2021-31916`, :cve:`2021-32399`, :cve:`202
 1-32606`, :cve:`2021-33033`, :cve:`2021-33034`, :cve:`2021-33098`, :cve:`2021-33135`, :cve:`2021-33200`, :cve:`2021-3347`, :cve:`2021-3348`, :cve:`2021-33624`, :cve:`2021-33655`, :cve:`2021-33656`, :cve:`2021-33909`, :cve:`2021-3411`, :cve:`2021-3428`, :cve:`2021-3444`, :cve:`2021-34556`, :cve:`2021-34693`, :cve:`2021-3483`, :cve:`2021-34866`, :cve:`2021-3489`, :cve:`2021-3490`, :cve:`2021-3491`, :cve_mitre:`2021-34981`, :cve:`2021-3501`, :cve:`2021-35039`, :cve:`2021-3506`, :cve:`2021-3543`, :cve:`2021-35477`, :cve:`2021-3564`, :cve:`2021-3573`, :cve:`2021-3587`, :cve_mitre:`2021-3600`, :cve:`2021-3609`, :cve:`2021-3612`, :cve:`2021-3635`, :cve:`2021-3640`, :cve:`2021-3653`, :cve:`2021-3655`, :cve:`2021-3656`, :cve:`2021-3659`, :cve:`2021-3679`, :cve:`2021-3715`, :cve:`2021-37159`, :cve:`2021-3732`, :cve:`2021-3736`, :cve:`2021-3739`, :cve:`2021-3743`, :cve:`2021-3744`, :cve:`2021-3752`, :cve:`2021-3753`, :cve:`2021-37576`, :cve:`2021-3759`, :cve:`2021-3760`, :cve:`2021-3764`, :cve
 :`2021-3772`, :cve:`2021-38160`, :cve:`2021-38166`, :cve:`2021-38198`, :cve:`2021-38199`, :cve:`2021-38200`, :cve:`2021-38201`, :cve:`2021-38202`, :cve:`2021-38203`, :cve:`2021-38204`, :cve:`2021-38205`, :cve:`2021-38206`, :cve:`2021-38207`, :cve:`2021-38208`, :cve:`2021-38209`, :cve:`2021-38300`, :cve:`2021-3894`, :cve:`2021-3896`, :cve:`2021-3923`, :cve:`2021-39633`, :cve:`2021-39634`, :cve:`2021-39636`, :cve:`2021-39648`, :cve:`2021-39656`, :cve:`2021-39657`, :cve:`2021-39685`, :cve:`2021-39686`, :cve:`2021-39698`, :cve:`2021-39711`, :cve:`2021-39713`, :cve:`2021-39714`, :cve:`2021-4001`, :cve:`2021-4002`, :cve:`2021-4028`, :cve:`2021-4032`, :cve:`2021-4037`, :cve:`2021-40490`, :cve:`2021-4083`, :cve:`2021-4090`, :cve:`2021-4093`, :cve:`2021-4095`, :cve:`2021-41073`, :cve:`2021-4135`, :cve:`2021-4148`, :cve:`2021-4149`, :cve:`2021-4154`, :cve:`2021-4155`, :cve:`2021-4157`, :cve:`2021-4159`, :cve:`2021-41864`, :cve:`2021-4197`, :cve:`2021-42008`, :cve:`2021-4202`, :cve:`2021-4203`
 , :cve:`2021-4218`, :cve:`2021-42252`, :cve:`2021-42327`, :cve:`2021-42739`, :cve:`2021-43056`, :cve:`2021-43057`, :cve:`2021-43267`, :cve:`2021-43389`, :cve:`2021-43975`, :cve:`2021-43976`, :cve:`2021-44733`, :cve:`2021-45095`, :cve:`2021-45100`, :cve:`2021-45402`, :cve:`2021-45469`, :cve:`2021-45480`, :cve:`2021-45485`, :cve:`2021-45486`, :cve:`2021-45868`, :cve:`2021-46283`, :cve:`2022-0001`, :cve:`2022-0002`, :cve:`2022-0168`, :cve:`2022-0171`, :cve:`2022-0185`, :cve:`2022-0264`, :cve:`2022-0286`, :cve:`2022-0322`, :cve:`2022-0330`, :cve:`2022-0433`, :cve:`2022-0435`, :cve:`2022-0487`, :cve:`2022-0492`, :cve:`2022-0494`, :cve:`2022-0516`, :cve:`2022-0617`, :cve:`2022-0644`, :cve:`2022-0646`, :cve:`2022-0742`, :cve:`2022-0812`, :cve:`2022-0847`, :cve:`2022-0850`, :cve:`2022-0854`, :cve:`2022-0995`, :cve:`2022-1011`, :cve:`2022-1012`, :cve:`2022-1015`, :cve:`2022-1016`, :cve:`2022-1043`, :cve:`2022-1048`, :cve:`2022-1055`, :cve:`2022-1158`, :cve:`2022-1184`, :cve:`2022-1195`, :cve
 :`2022-1198`, :cve:`2022-1199`, :cve:`2022-1204`, :cve:`2022-1205`, :cve:`2022-1353`, :cve:`2022-1419`, :cve:`2022-1462`, :cve:`2022-1516`, :cve:`2022-1651`, :cve:`2022-1652`, :cve:`2022-1671`, :cve:`2022-1678`, :cve:`2022-1679`, :cve:`2022-1729`, :cve:`2022-1734`, :cve:`2022-1786`, :cve:`2022-1789`, :cve:`2022-1836`, :cve:`2022-1852`, :cve:`2022-1882`, :cve:`2022-1943`, :cve:`2022-1966`, :cve:`2022-1972`, :cve:`2022-1973`, :cve:`2022-1974`, :cve:`2022-1975`, :cve:`2022-1976`, :cve:`2022-1998`, :cve:`2022-20008`, :cve:`2022-20132`, :cve:`2022-20141`, :cve:`2022-20153`, :cve:`2022-20154`, :cve:`2022-20158`, :cve:`2022-20166`, :cve:`2022-20368`, :cve:`2022-20369`, :cve:`2022-20421`, :cve:`2022-20422`, :cve:`2022-20423`, :cve_mitre:`2022-20565`, :cve:`2022-20566`, :cve:`2022-20567`, :cve:`2022-20572`, :cve:`2022-2078`, :cve:`2022-21123`, :cve:`2022-21125`, :cve:`2022-21166`, :cve:`2022-21385`, :cve:`2022-21499`, :cve_mitre:`2022-21505`, :cve:`2022-2153`, :cve:`2022-2196`, :cve_mitre:`2
 022-22942`, :cve:`2022-23036`, :cve:`2022-23037`, :cve:`2022-23038`, :cve:`2022-23039`, :cve:`2022-23040`, :cve:`2022-23041`, :cve:`2022-23042`, :cve:`2022-2308`, :cve:`2022-2318`, :cve:`2022-2380`, :cve:`2022-23816`, :cve:`2022-23960`, :cve:`2022-24122`, :cve:`2022-24448`, :cve:`2022-24958`, :cve:`2022-24959`, :cve:`2022-2503`, :cve:`2022-25258`, :cve:`2022-25375`, :cve:`2022-25636`, :cve_mitre:`2022-2585`, :cve_mitre:`2022-2586`, :cve_mitre:`2022-2588`, :cve:`2022-2590`, :cve_mitre:`2022-2602`, :cve:`2022-26365`, :cve:`2022-26373`, :cve:`2022-2639`, :cve:`2022-26490`, :cve:`2022-2663`, :cve:`2022-26966`, :cve:`2022-27223`, :cve:`2022-27666`, :cve:`2022-2785`, :cve:`2022-27950`, :cve:`2022-28356`, :cve:`2022-28388`, :cve:`2022-28389`, :cve:`2022-28390`, :cve:`2022-2873`, :cve:`2022-28796`, :cve:`2022-28893`, :cve:`2022-2905`, :cve:`2022-29156`, :cve:`2022-2938`, :cve:`2022-29581`, :cve:`2022-29582`, :cve:`2022-2959`, :cve:`2022-2964`, :cve:`2022-2977`, :cve:`2022-2978`, :cve:`2022-
 29900`, :cve:`2022-29901`, :cve:`2022-29968`, :cve:`2022-3028`, :cve:`2022-30594`, :cve:`2022-3061`, :cve:`2022-3077`, :cve:`2022-3078`, :cve:`2022-3103`, :cve:`2022-3104`, :cve:`2022-3105`, :cve:`2022-3106`, :cve:`2022-3107`, :cve:`2022-3110`, :cve:`2022-3111`, :cve:`2022-3112`, :cve:`2022-3113`, :cve:`2022-3114`, :cve:`2022-3115`, :cve:`2022-3169`, :cve:`2022-3170`, :cve:`2022-3202`, :cve:`2022-32250`, :cve:`2022-32296`, :cve:`2022-3239`, :cve:`2022-32981`, :cve:`2022-3303`, :cve:`2022-33740`, :cve:`2022-33741`, :cve:`2022-33742`, :cve:`2022-33743`, :cve:`2022-33744`, :cve:`2022-33981`, :cve:`2022-3424`, :cve:`2022-3435`, :cve:`2022-34494`, :cve:`2022-34495`, :cve:`2022-34918`, :cve:`2022-3521`, :cve:`2022-3524`, :cve:`2022-3526`, :cve:`2022-3531`, :cve:`2022-3532`, :cve:`2022-3534`, :cve:`2022-3535`, :cve:`2022-3541`, :cve:`2022-3542`, :cve:`2022-3543`, :cve:`2022-3545`, :cve:`2022-3564`, :cve:`2022-3565`, :cve:`2022-3577`, :cve:`2022-3586`, :cve:`2022-3594`, :cve:`2022-36123`, :
 cve:`2022-3619`, :cve:`2022-3621`, :cve:`2022-3623`, :cve:`2022-3625`, :cve:`2022-3628`, :cve:`2022-36280`, :cve:`2022-3629`, :cve:`2022-3630`, :cve:`2022-3633`, :cve:`2022-3635`, :cve:`2022-3640`, :cve:`2022-3643`, :cve:`2022-3646`, :cve:`2022-3649`, :cve:`2022-36879`, :cve:`2022-36946`, :cve:`2022-3707`, :cve:`2022-3910`, :cve:`2022-39189`, :cve:`2022-39190`, :cve:`2022-3977`, :cve:`2022-39842`, :cve:`2022-40307`, :cve:`2022-40476`, :cve:`2022-40768`, :cve:`2022-4095`, :cve:`2022-40982`, :cve:`2022-41218`, :cve:`2022-41222`, :cve:`2022-4127`, :cve:`2022-4128`, :cve:`2022-4129`, :cve:`2022-4139`, :cve:`2022-41674`, :cve:`2022-41849`, :cve:`2022-41850`, :cve:`2022-41858`, :cve:`2022-42328`, :cve:`2022-42329`, :cve:`2022-42432`, :cve:`2022-4269`, :cve:`2022-42703`, :cve:`2022-42719`, :cve:`2022-42720`, :cve:`2022-42721`, :cve:`2022-42722`, :cve:`2022-42895`, :cve:`2022-42896`, :cve:`2022-43750`, :cve:`2022-4378`, :cve:`2022-4379`, :cve:`2022-4382`, :cve:`2022-43945`, :cve:`2022-45869
 `, :cve:`2022-45886`, :cve:`2022-45887`, :cve:`2022-45888`, :cve:`2022-45919`, :cve:`2022-45934`, :cve:`2022-4662`, :cve:`2022-4744`, :cve:`2022-47518`, :cve:`2022-47519`, :cve:`2022-47520`, :cve:`2022-47521`, :cve:`2022-47929`, :cve:`2022-47938`, :cve:`2022-47939`, :cve:`2022-47940`, :cve:`2022-47941`, :cve:`2022-47942`, :cve:`2022-47943`, :cve:`2022-4842`, :cve:`2022-48423`, :cve:`2022-48424`, :cve:`2022-48425`, :cve:`2022-48502`, :cve:`2023-0030`, :cve:`2023-0045`, :cve:`2023-0047`, :cve:`2023-0122`, :cve:`2023-0160`, :cve:`2023-0179`, :cve:`2023-0210`, :cve:`2023-0240`, :cve:`2023-0266`, :cve:`2023-0394`, :cve:`2023-0458`, :cve:`2023-0459`, :cve:`2023-0461`, :cve:`2023-0468`, :cve:`2023-0469`, :cve:`2023-0590`, :cve:`2023-0615`, :cve_mitre:`2023-1032`, :cve:`2023-1073`, :cve:`2023-1074`, :cve:`2023-1076`, :cve:`2023-1077`, :cve:`2023-1078`, :cve:`2023-1079`, :cve:`2023-1095`, :cve:`2023-1118`, :cve:`2023-1192`, :cve:`2023-1194`, :cve:`2023-1195`, :cve:`2023-1206`, :cve:`2023-124
 9`, :cve:`2023-1252`, :cve:`2023-1281`, :cve:`2023-1380`, :cve:`2023-1382`, :cve:`2023-1390`, :cve:`2023-1513`, :cve:`2023-1582`, :cve:`2023-1583`, :cve:`2023-1611`, :cve:`2023-1637`, :cve:`2023-1652`, :cve:`2023-1670`, :cve:`2023-1829`, :cve:`2023-1838`, :cve:`2023-1855`, :cve:`2023-1859`, :cve:`2023-1989`, :cve:`2023-1990`, :cve:`2023-1998`, :cve:`2023-2002`, :cve:`2023-2006`, :cve:`2023-2008`, :cve:`2023-2019`, :cve:`2023-20569`, :cve:`2023-20588`, :cve:`2023-20593`, :cve:`2023-20938`, :cve:`2023-21102`, :cve:`2023-21106`, :cve:`2023-2124`, :cve:`2023-21255`, :cve:`2023-21264`, :cve:`2023-2156`, :cve:`2023-2162`, :cve:`2023-2163`, :cve:`2023-2166`, :cve:`2023-2177`, :cve:`2023-2194`, :cve:`2023-2235`, :cve:`2023-2236`, :cve:`2023-2248`, :cve:`2023-2269`, :cve:`2023-22996`, :cve:`2023-22997`, :cve:`2023-22998`, :cve:`2023-22999`, :cve:`2023-23001`, :cve:`2023-23002`, :cve:`2023-23003`, :cve:`2023-23004`, :cve:`2023-23005`, :cve:`2023-23006`, :cve:`2023-23454`, :cve:`2023-23455`, :
 cve:`2023-23559`, :cve:`2023-2483`, :cve:`2023-25012`, :cve:`2023-2513`, :cve:`2023-25775`, :cve:`2023-2598`, :cve:`2023-26544`, :cve:`2023-26545`, :cve:`2023-26605`, :cve:`2023-26606`, :cve:`2023-26607`, :cve:`2023-28327`, :cve:`2023-28328`, :cve:`2023-28410`, :cve:`2023-28464`, :cve:`2023-28466`, :cve:`2023-2860`, :cve:`2023-28772`, :cve:`2023-28866`, :cve:`2023-2898`, :cve:`2023-2985`, :cve:`2023-3006`, :cve:`2023-30456`, :cve:`2023-30772`, :cve:`2023-3090`, :cve:`2023-3106`, :cve:`2023-3111`, :cve:`2023-3117`, :cve:`2023-31248`, :cve:`2023-3141`, :cve:`2023-31436`, :cve:`2023-3159`, :cve:`2023-3161`, :cve:`2023-3212`, :cve:`2023-3220`, :cve:`2023-32233`, :cve:`2023-32247`, :cve:`2023-32248`, :cve:`2023-32250`, :cve:`2023-32252`, :cve:`2023-32254`, :cve:`2023-32257`, :cve:`2023-32258`, :cve:`2023-32269`, :cve:`2023-3268`, :cve:`2023-3269`, :cve:`2023-3312`, :cve:`2023-3317`, :cve:`2023-33203`, :cve:`2023-33250`, :cve:`2023-33288`, :cve:`2023-3338`, :cve:`2023-3355`, :cve:`2023-33
 57`, :cve:`2023-3358`, :cve:`2023-3359`, :cve:`2023-3390`, :cve:`2023-33951`, :cve:`2023-33952`, :cve:`2023-34255`, :cve:`2023-34256`, :cve:`2023-34319`, :cve:`2023-3439`, :cve:`2023-35001`, :cve:`2023-3567`, :cve:`2023-35788`, :cve:`2023-35823`, :cve:`2023-35824`, :cve:`2023-35826`, :cve:`2023-35828`, :cve:`2023-35829`, :cve:`2023-3609`, :cve:`2023-3610`, :cve:`2023-3611`, :cve:`2023-37453`, :cve:`2023-3772`, :cve:`2023-3773`, :cve:`2023-3776`, :cve:`2023-3777`, :cve:`2023-3812`, :cve:`2023-38409`, :cve:`2023-38426`, :cve:`2023-38427`, :cve:`2023-38428`, :cve:`2023-38429`, :cve:`2023-38430`, :cve:`2023-38431`, :cve:`2023-38432`, :cve:`2023-3863`, :cve_mitre:`2023-3865`, :cve_mitre:`2023-3866`, :cve_mitre:`2023-3867`, :cve:`2023-39189`, :cve:`2023-39192`, :cve:`2023-39193`, :cve:`2023-39194`, :cve:`2023-4004`, :cve:`2023-4015`, :cve:`2023-40283`, :cve:`2023-4128`, :cve:`2023-4132`, :cve:`2023-4147`, :cve:`2023-4155`, :cve:`2023-4194`, :cve:`2023-4206`, :cve:`2023-4207`, :cve:`2023-4
 208`, :cve:`2023-4273`, :cve:`2023-42752`, :cve:`2023-42753`, :cve:`2023-42755`, :cve:`2023-42756`, :cve:`2023-4385`, :cve:`2023-4387`, :cve:`2023-4389`, :cve:`2023-4394`, :cve:`2023-44466`, :cve:`2023-4459`, :cve:`2023-4569`, :cve:`2023-45862`, :cve:`2023-45871`, :cve:`2023-4611`, :cve:`2023-4623`, :cve:`2023-4732`, :cve:`2023-4921` and :cve:`2023-5345`
--  linux-yocto/5.15: Ignore :cve:`2022-45886`, :cve:`2022-45887`, :cve:`2022-45919`, :cve:`2022-48502`, :cve:`2023-0160`, :cve:`2023-1206`, :cve:`2023-20593`, :cve:`2023-21264`, :cve:`2023-2898`, :cve:`2023-31248`, :cve:`2023-33250`, :cve:`2023-34319`, :cve:`2023-35001`, :cve:`2023-3611`, :cve:`2023-37453`, :cve:`2023-3773`, :cve:`2023-3776`, :cve:`2023-3777`, :cve:`2023-38432`, :cve:`2023-3863`, :cve_mitre:`2023-3865`, :cve_mitre:`2023-3866`, :cve:`2023-4004`, :cve:`2023-4015`, :cve:`2023-4132`, :cve:`2023-4147`, :cve:`2023-4194`, :cve:`2023-4385`, :cve:`2023-4387`, :cve:`2023-4389`, :cve:`2023-4394`, :cve:`2023-4459` and :cve:`2023-4611`
--  openssl: Fix :cve:`2023-4807` and :cve:`2023-5363`
--  python3-git: Fix :cve:`2023-40590` and :cve:`2023-41040`
--  python3-urllib3: Fix :cve:`2023-43804`
--  qemu: Ignore :cve:`2023-2680`
--  ruby: Fix :cve:`2023-36617`
+-  linux-yocto/5.10: Ignore :cve_nist:`2003-1604`, :cve_nist:`2004-0230`, :cve_nist:`2006-3635`, :cve_nist:`2006-5331`, :cve_nist:`2006-6128`, :cve_nist:`2007-4774`, :cve_nist:`2007-6761`, :cve_nist:`2007-6762`, :cve_nist:`2008-7316`, :cve_nist:`2009-2692`, :cve_nist:`2010-0008`, :cve_nist:`2010-3432`, :cve_nist:`2010-4648`, :cve_nist:`2010-5313`, :cve_nist:`2010-5328`, :cve_nist:`2010-5329`, :cve_nist:`2010-5331`, :cve_nist:`2010-5332`, :cve_nist:`2011-4098`, :cve_nist:`2011-4131`, :cve_nist:`2011-4915`, :cve_nist:`2011-5321`, :cve_nist:`2011-5327`, :cve_nist:`2012-0957`, :cve_nist:`2012-2119`, :cve_nist:`2012-2136`, :cve_nist:`2012-2137`, :cve_nist:`2012-2313`, :cve_nist:`2012-2319`, :cve_nist:`2012-2372`, :cve_nist:`2012-2375`, :cve_nist:`2012-2390`, :cve_nist:`2012-2669`, :cve_nist:`2012-2744`, :cve_nist:`2012-2745`, :cve_nist:`2012-3364`, :cve_nist:`2012-3375`, :cve_nist:`2012-3400`, :cve_nist:`2012-3412`, :cve_nist:`2012-3430`, :cve_nist:`2012-3510`, :cve_nist:`2012-3511`, :cv
 e_nist:`2012-3520`, :cve_nist:`2012-3552`, :cve_nist:`2012-4398`, :cve_nist:`2012-4444`, :cve_nist:`2012-4461`, :cve_nist:`2012-4467`, :cve_nist:`2012-4508`, :cve_nist:`2012-4530`, :cve_nist:`2012-4565`, :cve_nist:`2012-5374`, :cve_nist:`2012-5375`, :cve_nist:`2012-5517`, :cve_nist:`2012-6536`, :cve_nist:`2012-6537`, :cve_nist:`2012-6538`, :cve_nist:`2012-6539`, :cve_nist:`2012-6540`, :cve_nist:`2012-6541`, :cve_nist:`2012-6542`, :cve_nist:`2012-6543`, :cve_nist:`2012-6544`, :cve_nist:`2012-6545`, :cve_nist:`2012-6546`, :cve_nist:`2012-6547`, :cve_nist:`2012-6548`, :cve_nist:`2012-6549`, :cve_nist:`2012-6638`, :cve_nist:`2012-6647`, :cve_nist:`2012-6657`, :cve_nist:`2012-6689`, :cve_nist:`2012-6701`, :cve_nist:`2012-6703`, :cve_nist:`2012-6704`, :cve_nist:`2012-6712`, :cve_nist:`2013-0160`, :cve_nist:`2013-0190`, :cve_nist:`2013-0216`, :cve_nist:`2013-0217`, :cve_nist:`2013-0228`, :cve_nist:`2013-0231`, :cve_nist:`2013-0268`, :cve_nist:`2013-0290`, :cve_nist:`2013-0309`, :cve_nist:`
 2013-0310`, :cve_nist:`2013-0311`, :cve_nist:`2013-0313`, :cve_nist:`2013-0343`, :cve_nist:`2013-0349`, :cve_nist:`2013-0871`, :cve_nist:`2013-0913`, :cve_nist:`2013-0914`, :cve_nist:`2013-1059`, :cve_nist:`2013-1763`, :cve_nist:`2013-1767`, :cve_nist:`2013-1772`, :cve_nist:`2013-1773`, :cve_nist:`2013-1774`, :cve_nist:`2013-1792`, :cve_nist:`2013-1796`, :cve_nist:`2013-1797`, :cve_nist:`2013-1798`, :cve_nist:`2013-1819`, :cve_nist:`2013-1826`, :cve_nist:`2013-1827`, :cve_nist:`2013-1828`, :cve_nist:`2013-1848`, :cve_nist:`2013-1858`, :cve_nist:`2013-1860`, :cve_nist:`2013-1928`, :cve_nist:`2013-1929`, :cve_nist:`2013-1943`, :cve_nist:`2013-1956`, :cve_nist:`2013-1957`, :cve_nist:`2013-1958`, :cve_nist:`2013-1959`, :cve_nist:`2013-1979`, :cve_nist:`2013-2015`, :cve_nist:`2013-2017`, :cve_nist:`2013-2058`, :cve_nist:`2013-2094`, :cve_nist:`2013-2128`, :cve_nist:`2013-2140`, :cve_nist:`2013-2141`, :cve_nist:`2013-2146`, :cve_nist:`2013-2147`, :cve_nist:`2013-2148`, :cve_nist:`2013-216
 4`, :cve_nist:`2013-2206`, :cve_nist:`2013-2232`, :cve_nist:`2013-2234`, :cve_nist:`2013-2237`, :cve_nist:`2013-2546`, :cve_nist:`2013-2547`, :cve_nist:`2013-2548`, :cve_nist:`2013-2596`, :cve_nist:`2013-2634`, :cve_nist:`2013-2635`, :cve_nist:`2013-2636`, :cve_nist:`2013-2850`, :cve_nist:`2013-2851`, :cve_nist:`2013-2852`, :cve_nist:`2013-2888`, :cve_nist:`2013-2889`, :cve_nist:`2013-2890`, :cve_nist:`2013-2891`, :cve_nist:`2013-2892`, :cve_nist:`2013-2893`, :cve_nist:`2013-2894`, :cve_nist:`2013-2895`, :cve_nist:`2013-2896`, :cve_nist:`2013-2897`, :cve_nist:`2013-2898`, :cve_nist:`2013-2899`, :cve_nist:`2013-2929`, :cve_nist:`2013-2930`, :cve_nist:`2013-3076`, :cve_nist:`2013-3222`, :cve_nist:`2013-3223`, :cve_nist:`2013-3224`, :cve_nist:`2013-3225`, :cve_nist:`2013-3226`, :cve_nist:`2013-3227`, :cve_nist:`2013-3228`, :cve_nist:`2013-3229`, :cve_nist:`2013-3230`, :cve_nist:`2013-3231`, :cve_nist:`2013-3232`, :cve_nist:`2013-3233`, :cve_nist:`2013-3234`, :cve_nist:`2013-3235`, :cve
 _nist:`2013-3236`, :cve_nist:`2013-3237`, :cve_nist:`2013-3301`, :cve_nist:`2013-3302`, :cve_nist:`2013-4125`, :cve_nist:`2013-4127`, :cve_nist:`2013-4129`, :cve_nist:`2013-4162`, :cve_nist:`2013-4163`, :cve_nist:`2013-4205`, :cve_nist:`2013-4220`, :cve_nist:`2013-4247`, :cve_nist:`2013-4254`, :cve_nist:`2013-4270`, :cve_nist:`2013-4299`, :cve_nist:`2013-4300`, :cve_nist:`2013-4312`, :cve_nist:`2013-4343`, :cve_nist:`2013-4345`, :cve_nist:`2013-4348`, :cve_nist:`2013-4350`, :cve_nist:`2013-4387`, :cve_nist:`2013-4470`, :cve_nist:`2013-4483`, :cve_nist:`2013-4511`, :cve_nist:`2013-4512`, :cve_nist:`2013-4513`, :cve_nist:`2013-4514`, :cve_nist:`2013-4515`, :cve_nist:`2013-4516`, :cve_nist:`2013-4563`, :cve_nist:`2013-4579`, :cve_nist:`2013-4587`, :cve_nist:`2013-4588`, :cve_nist:`2013-4591`, :cve_nist:`2013-4592`, :cve_nist:`2013-5634`, :cve_nist:`2013-6282`, :cve_nist:`2013-6367`, :cve_nist:`2013-6368`, :cve_nist:`2013-6376`, :cve_nist:`2013-6378`, :cve_nist:`2013-6380`, :cve_nist:`2
 013-6381`, :cve_nist:`2013-6382`, :cve_nist:`2013-6383`, :cve_nist:`2013-6431`, :cve_nist:`2013-6432`, :cve_nist:`2013-6885`, :cve_nist:`2013-7026`, :cve_nist:`2013-7027`, :cve_nist:`2013-7263`, :cve_nist:`2013-7264`, :cve_nist:`2013-7265`, :cve_nist:`2013-7266`, :cve_nist:`2013-7267`, :cve_nist:`2013-7268`, :cve_nist:`2013-7269`, :cve_nist:`2013-7270`, :cve_nist:`2013-7271`, :cve_nist:`2013-7281`, :cve_nist:`2013-7339`, :cve_nist:`2013-7348`, :cve_nist:`2013-7421`, :cve_nist:`2013-7446`, :cve_nist:`2013-7470`, :cve_nist:`2014-0038`, :cve_nist:`2014-0049`, :cve_nist:`2014-0055`, :cve_nist:`2014-0069`, :cve_nist:`2014-0077`, :cve_nist:`2014-0100`, :cve_nist:`2014-0101`, :cve_nist:`2014-0102`, :cve_nist:`2014-0131`, :cve_nist:`2014-0155`, :cve_nist:`2014-0181`, :cve_nist:`2014-0196`, :cve_nist:`2014-0203`, :cve_nist:`2014-0205`, :cve_nist:`2014-0206`, :cve_nist:`2014-1438`, :cve_nist:`2014-1444`, :cve_nist:`2014-1445`, :cve_nist:`2014-1446`, :cve_nist:`2014-1690`, :cve_nist:`2014-1737
 `, :cve_nist:`2014-1738`, :cve_nist:`2014-1739`, :cve_nist:`2014-1874`, :cve_nist:`2014-2038`, :cve_nist:`2014-2039`, :cve_nist:`2014-2309`, :cve_nist:`2014-2523`, :cve_nist:`2014-2568`, :cve_nist:`2014-2580`, :cve_nist:`2014-2672`, :cve_nist:`2014-2673`, :cve_nist:`2014-2678`, :cve_nist:`2014-2706`, :cve_nist:`2014-2739`, :cve_nist:`2014-2851`, :cve_nist:`2014-2889`, :cve_nist:`2014-3122`, :cve_nist:`2014-3144`, :cve_nist:`2014-3145`, :cve_nist:`2014-3153`, :cve_nist:`2014-3180`, :cve_nist:`2014-3181`, :cve_nist:`2014-3182`, :cve_nist:`2014-3183`, :cve_nist:`2014-3184`, :cve_nist:`2014-3185`, :cve_nist:`2014-3186`, :cve_nist:`2014-3534`, :cve_nist:`2014-3535`, :cve_nist:`2014-3601`, :cve_nist:`2014-3610`, :cve_nist:`2014-3611`, :cve_nist:`2014-3631`, :cve_nist:`2014-3645`, :cve_nist:`2014-3646`, :cve_nist:`2014-3647`, :cve_nist:`2014-3673`, :cve_nist:`2014-3687`, :cve_nist:`2014-3688`, :cve_nist:`2014-3690`, :cve_nist:`2014-3917`, :cve_nist:`2014-3940`, :cve_nist:`2014-4014`, :cve_
 nist:`2014-4027`, :cve_nist:`2014-4157`, :cve_nist:`2014-4171`, :cve_nist:`2014-4508`, :cve_nist:`2014-4608`, :cve_nist:`2014-4611`, :cve_nist:`2014-4652`, :cve_nist:`2014-4653`, :cve_nist:`2014-4654`, :cve_nist:`2014-4655`, :cve_nist:`2014-4656`, :cve_nist:`2014-4667`, :cve_nist:`2014-4699`, :cve_nist:`2014-4943`, :cve_nist:`2014-5045`, :cve_nist:`2014-5077`, :cve_nist:`2014-5206`, :cve_nist:`2014-5207`, :cve_nist:`2014-5471`, :cve_nist:`2014-5472`, :cve_nist:`2014-6410`, :cve_nist:`2014-6416`, :cve_nist:`2014-6417`, :cve_nist:`2014-6418`, :cve_nist:`2014-7145`, :cve_nist:`2014-7283`, :cve_nist:`2014-7284`, :cve_nist:`2014-7822`, :cve_nist:`2014-7825`, :cve_nist:`2014-7826`, :cve_nist:`2014-7841`, :cve_nist:`2014-7842`, :cve_nist:`2014-7843`, :cve_nist:`2014-7970`, :cve_nist:`2014-7975`, :cve_nist:`2014-8086`, :cve_nist:`2014-8133`, :cve_nist:`2014-8134`, :cve_nist:`2014-8159`, :cve_nist:`2014-8160`, :cve_nist:`2014-8171`, :cve_nist:`2014-8172`, :cve_nist:`2014-8173`, :cve_nist:`20
 14-8369`, :cve_nist:`2014-8480`, :cve_nist:`2014-8481`, :cve_nist:`2014-8559`, :cve_nist:`2014-8709`, :cve_nist:`2014-8884`, :cve_nist:`2014-8989`, :cve_nist:`2014-9090`, :cve_nist:`2014-9322`, :cve_nist:`2014-9419`, :cve_nist:`2014-9420`, :cve_nist:`2014-9428`, :cve_nist:`2014-9529`, :cve_nist:`2014-9584`, :cve_nist:`2014-9585`, :cve_nist:`2014-9644`, :cve_nist:`2014-9683`, :cve_nist:`2014-9710`, :cve_nist:`2014-9715`, :cve_nist:`2014-9717`, :cve_nist:`2014-9728`, :cve_nist:`2014-9729`, :cve_nist:`2014-9730`, :cve_nist:`2014-9731`, :cve_nist:`2014-9803`, :cve_nist:`2014-9870`, :cve_nist:`2014-9888`, :cve_nist:`2014-9895`, :cve_nist:`2014-9903`, :cve_nist:`2014-9904`, :cve_nist:`2014-9914`, :cve_nist:`2014-9922`, :cve_nist:`2014-9940`, :cve_nist:`2015-0239`, :cve_nist:`2015-0274`, :cve_nist:`2015-0275`, :cve_nist:`2015-1333`, :cve_nist:`2015-1339`, :cve_nist:`2015-1350`, :cve_nist:`2015-1420`, :cve_nist:`2015-1421`, :cve_nist:`2015-1465`, :cve_nist:`2015-1573`, :cve_nist:`2015-1593`
 , :cve_nist:`2015-1805`, :cve_nist:`2015-2041`, :cve_nist:`2015-2042`, :cve_nist:`2015-2150`, :cve_nist:`2015-2666`, :cve_nist:`2015-2672`, :cve_nist:`2015-2686`, :cve_nist:`2015-2830`, :cve_nist:`2015-2922`, :cve_nist:`2015-2925`, :cve_nist:`2015-3212`, :cve_nist:`2015-3214`, :cve_nist:`2015-3288`, :cve_nist:`2015-3290`, :cve_nist:`2015-3291`, :cve_nist:`2015-3331`, :cve_nist:`2015-3339`, :cve_nist:`2015-3636`, :cve_nist:`2015-4001`, :cve_nist:`2015-4002`, :cve_nist:`2015-4003`, :cve_nist:`2015-4004`, :cve_nist:`2015-4036`, :cve_nist:`2015-4167`, :cve_nist:`2015-4170`, :cve_nist:`2015-4176`, :cve_nist:`2015-4177`, :cve_nist:`2015-4178`, :cve_nist:`2015-4692`, :cve_nist:`2015-4700`, :cve_nist:`2015-5156`, :cve_nist:`2015-5157`, :cve_nist:`2015-5257`, :cve_nist:`2015-5283`, :cve_nist:`2015-5307`, :cve_nist:`2015-5327`, :cve_nist:`2015-5364`, :cve_nist:`2015-5366`, :cve_nist:`2015-5697`, :cve_nist:`2015-5706`, :cve_nist:`2015-5707`, :cve_nist:`2015-6252`, :cve_nist:`2015-6526`, :cve_n
 ist:`2015-6937`, :cve_nist:`2015-7509`, :cve_nist:`2015-7513`, :cve_nist:`2015-7515`, :cve_nist:`2015-7550`, :cve_nist:`2015-7566`, :cve_nist:`2015-7613`, :cve_nist:`2015-7799`, :cve_nist:`2015-7833`, :cve_nist:`2015-7872`, :cve_nist:`2015-7884`, :cve_nist:`2015-7885`, :cve_nist:`2015-7990`, :cve_nist:`2015-8104`, :cve_nist:`2015-8215`, :cve_nist:`2015-8324`, :cve_nist:`2015-8374`, :cve_nist:`2015-8539`, :cve_nist:`2015-8543`, :cve_nist:`2015-8550`, :cve_nist:`2015-8551`, :cve_nist:`2015-8552`, :cve_nist:`2015-8553`, :cve_nist:`2015-8569`, :cve_nist:`2015-8575`, :cve_nist:`2015-8660`, :cve_nist:`2015-8709`, :cve_nist:`2015-8746`, :cve_nist:`2015-8767`, :cve_nist:`2015-8785`, :cve_nist:`2015-8787`, :cve_nist:`2015-8812`, :cve_nist:`2015-8816`, :cve_nist:`2015-8830`, :cve_nist:`2015-8839`, :cve_nist:`2015-8844`, :cve_nist:`2015-8845`, :cve_nist:`2015-8950`, :cve_nist:`2015-8952`, :cve_nist:`2015-8953`, :cve_nist:`2015-8955`, :cve_nist:`2015-8956`, :cve_nist:`2015-8961`, :cve_nist:`201
 5-8962`, :cve_nist:`2015-8963`, :cve_nist:`2015-8964`, :cve_nist:`2015-8966`, :cve_nist:`2015-8967`, :cve_nist:`2015-8970`, :cve_nist:`2015-9004`, :cve_nist:`2015-9016`, :cve_nist:`2015-9289`, :cve_nist:`2016-0617`, :cve_nist:`2016-0723`, :cve_nist:`2016-0728`, :cve_nist:`2016-0758`, :cve_nist:`2016-0821`, :cve_nist:`2016-0823`, :cve_nist:`2016-10044`, :cve_nist:`2016-10088`, :cve_nist:`2016-10147`, :cve_nist:`2016-10150`, :cve_nist:`2016-10153`, :cve_nist:`2016-10154`, :cve_nist:`2016-10200`, :cve_nist:`2016-10208`, :cve_nist:`2016-10229`, :cve_nist:`2016-10318`, :cve_nist:`2016-10723`, :cve_nist:`2016-10741`, :cve_nist:`2016-10764`, :cve_nist:`2016-10905`, :cve_nist:`2016-10906`, :cve_nist:`2016-10907`, :cve_nist:`2016-1237`, :cve_nist:`2016-1575`, :cve_nist:`2016-1576`, :cve_nist:`2016-1583`, :cve_nist:`2016-2053`, :cve_nist:`2016-2069`, :cve_nist:`2016-2070`, :cve_nist:`2016-2085`, :cve_nist:`2016-2117`, :cve_nist:`2016-2143`, :cve_nist:`2016-2184`, :cve_nist:`2016-2185`, :cve_n
 ist:`2016-2186`, :cve_nist:`2016-2187`, :cve_nist:`2016-2188`, :cve_nist:`2016-2383`, :cve_nist:`2016-2384`, :cve_nist:`2016-2543`, :cve_nist:`2016-2544`, :cve_nist:`2016-2545`, :cve_nist:`2016-2546`, :cve_nist:`2016-2547`, :cve_nist:`2016-2548`, :cve_nist:`2016-2549`, :cve_nist:`2016-2550`, :cve_nist:`2016-2782`, :cve_nist:`2016-2847`, :cve_nist:`2016-3044`, :cve_nist:`2016-3070`, :cve_nist:`2016-3134`, :cve_nist:`2016-3135`, :cve_nist:`2016-3136`, :cve_nist:`2016-3137`, :cve_nist:`2016-3138`, :cve_nist:`2016-3139`, :cve_nist:`2016-3140`, :cve_nist:`2016-3156`, :cve_nist:`2016-3157`, :cve_nist:`2016-3672`, :cve_nist:`2016-3689`, :cve_nist:`2016-3713`, :cve_nist:`2016-3841`, :cve_nist:`2016-3857`, :cve_nist:`2016-3951`, :cve_nist:`2016-3955`, :cve_nist:`2016-3961`, :cve_nist:`2016-4440`, :cve_nist:`2016-4470`, :cve_nist:`2016-4482`, :cve_nist:`2016-4485`, :cve_nist:`2016-4486`, :cve_nist:`2016-4557`, :cve_nist:`2016-4558`, :cve_nist:`2016-4565`, :cve_nist:`2016-4568`, :cve_nist:`201
 6-4569`, :cve_nist:`2016-4578`, :cve_nist:`2016-4580`, :cve_nist:`2016-4581`, :cve_nist:`2016-4794`, :cve_nist:`2016-4805`, :cve_nist:`2016-4913`, :cve_nist:`2016-4951`, :cve_nist:`2016-4997`, :cve_nist:`2016-4998`, :cve_nist:`2016-5195`, :cve_nist:`2016-5243`, :cve_nist:`2016-5244`, :cve_nist:`2016-5400`, :cve_nist:`2016-5412`, :cve_nist:`2016-5696`, :cve_nist:`2016-5728`, :cve_nist:`2016-5828`, :cve_nist:`2016-5829`, :cve_nist:`2016-6130`, :cve_nist:`2016-6136`, :cve_nist:`2016-6156`, :cve_nist:`2016-6162`, :cve_nist:`2016-6187`, :cve_nist:`2016-6197`, :cve_nist:`2016-6198`, :cve_nist:`2016-6213`, :cve_nist:`2016-6327`, :cve_nist:`2016-6480`, :cve_nist:`2016-6516`, :cve_nist:`2016-6786`, :cve_nist:`2016-6787`, :cve_nist:`2016-6828`, :cve_nist:`2016-7039`, :cve_nist:`2016-7042`, :cve_nist:`2016-7097`, :cve_nist:`2016-7117`, :cve_nist:`2016-7425`, :cve_nist:`2016-7910`, :cve_nist:`2016-7911`, :cve_nist:`2016-7912`, :cve_nist:`2016-7913`, :cve_nist:`2016-7914`, :cve_nist:`2016-7915`,
  :cve_nist:`2016-7916`, :cve_nist:`2016-7917`, :cve_nist:`2016-8399`, :cve_nist:`2016-8405`, :cve_nist:`2016-8630`, :cve_nist:`2016-8632`, :cve_nist:`2016-8633`, :cve_nist:`2016-8636`, :cve_nist:`2016-8645`, :cve_nist:`2016-8646`, :cve_nist:`2016-8650`, :cve_nist:`2016-8655`, :cve_nist:`2016-8658`, :cve_nist:`2016-8666`, :cve_nist:`2016-9083`, :cve_nist:`2016-9084`, :cve_nist:`2016-9120`, :cve_nist:`2016-9178`, :cve_nist:`2016-9191`, :cve_nist:`2016-9313`, :cve_nist:`2016-9555`, :cve_nist:`2016-9576`, :cve_nist:`2016-9588`, :cve_nist:`2016-9604`, :cve_nist:`2016-9685`, :cve_nist:`2016-9754`, :cve_nist:`2016-9755`, :cve_nist:`2016-9756`, :cve_nist:`2016-9777`, :cve_nist:`2016-9793`, :cve_nist:`2016-9794`, :cve_nist:`2016-9806`, :cve_nist:`2016-9919`, :cve_nist:`2017-0605`, :cve_nist:`2017-0627`, :cve_nist:`2017-0750`, :cve_nist:`2017-0786`, :cve_nist:`2017-0861`, :cve_nist:`2017-1000`, :cve_nist:`2017-1000111`, :cve_nist:`2017-1000112`, :cve_nist:`2017-1000251`, :cve_nist:`2017-10002
 52`, :cve_nist:`2017-1000253`, :cve_nist:`2017-1000255`, :cve_nist:`2017-1000363`, :cve_nist:`2017-1000364`, :cve_nist:`2017-1000365`, :cve_nist:`2017-1000370`, :cve_nist:`2017-1000371`, :cve_nist:`2017-1000379`, :cve_nist:`2017-1000380`, :cve_nist:`2017-1000405`, :cve_nist:`2017-1000407`, :cve_nist:`2017-1000410`, :cve_nist:`2017-10661`, :cve_nist:`2017-10662`, :cve_nist:`2017-10663`, :cve_nist:`2017-10810`, :cve_nist:`2017-10911`, :cve_nist:`2017-11089`, :cve_nist:`2017-11176`, :cve_nist:`2017-11472`, :cve_nist:`2017-11473`, :cve_nist:`2017-11600`, :cve_nist:`2017-12134`, :cve_nist:`2017-12146`, :cve_nist:`2017-12153`, :cve_nist:`2017-12154`, :cve_nist:`2017-12168`, :cve_nist:`2017-12188`, :cve_nist:`2017-12190`, :cve_nist:`2017-12192`, :cve_nist:`2017-12193`, :cve_nist:`2017-12762`, :cve_nist:`2017-13080`, :cve_nist:`2017-13166`, :cve_nist:`2017-13167`, :cve_nist:`2017-13168`, :cve_nist:`2017-13215`, :cve_nist:`2017-13216`, :cve_nist:`2017-13220`, :cve_nist:`2017-13305`, :cve_nis
 t:`2017-13686`, :cve_nist:`2017-13695`, :cve_nist:`2017-13715`, :cve_nist:`2017-14051`, :cve_nist:`2017-14106`, :cve_nist:`2017-14140`, :cve_nist:`2017-14156`, :cve_nist:`2017-14340`, :cve_nist:`2017-14489`, :cve_nist:`2017-14497`, :cve_nist:`2017-14954`, :cve_nist:`2017-14991`, :cve_nist:`2017-15102`, :cve_nist:`2017-15115`, :cve_nist:`2017-15116`, :cve_nist:`2017-15121`, :cve_nist:`2017-15126`, :cve_nist:`2017-15127`, :cve_nist:`2017-15128`, :cve_nist:`2017-15129`, :cve_nist:`2017-15265`, :cve_nist:`2017-15274`, :cve_nist:`2017-15299`, :cve_nist:`2017-15306`, :cve_nist:`2017-15537`, :cve_nist:`2017-15649`, :cve_nist:`2017-15868`, :cve_nist:`2017-15951`, :cve_nist:`2017-16525`, :cve_nist:`2017-16526`, :cve_nist:`2017-16527`, :cve_nist:`2017-16528`, :cve_nist:`2017-16529`, :cve_nist:`2017-16530`, :cve_nist:`2017-16531`, :cve_nist:`2017-16532`, :cve_nist:`2017-16533`, :cve_nist:`2017-16534`, :cve_nist:`2017-16535`, :cve_nist:`2017-16536`, :cve_nist:`2017-16537`, :cve_nist:`2017-16538
 `, :cve_nist:`2017-16643`, :cve_nist:`2017-16644`, :cve_nist:`2017-16645`, :cve_nist:`2017-16646`, :cve_nist:`2017-16647`, :cve_nist:`2017-16648`, :cve_nist:`2017-16649`, :cve_nist:`2017-16650`, :cve_nist:`2017-16911`, :cve_nist:`2017-16912`, :cve_nist:`2017-16913`, :cve_nist:`2017-16914`, :cve_nist:`2017-16939`, :cve_nist:`2017-16994`, :cve_nist:`2017-16995`, :cve_nist:`2017-16996`, :cve_nist:`2017-17052`, :cve_nist:`2017-17053`, :cve_nist:`2017-17448`, :cve_nist:`2017-17449`, :cve_nist:`2017-17450`, :cve_nist:`2017-17558`, :cve_nist:`2017-17712`, :cve_nist:`2017-17741`, :cve_nist:`2017-17805`, :cve_nist:`2017-17806`, :cve_nist:`2017-17807`, :cve_nist:`2017-17852`, :cve_nist:`2017-17853`, :cve_nist:`2017-17854`, :cve_nist:`2017-17855`, :cve_nist:`2017-17856`, :cve_nist:`2017-17857`, :cve_nist:`2017-17862`, :cve_nist:`2017-17863`, :cve_nist:`2017-17864`, :cve_nist:`2017-17975`, :cve_nist:`2017-18017`, :cve_nist:`2017-18075`, :cve_nist:`2017-18079`, :cve_nist:`2017-18174`, :cve_nist:
 `2017-18193`, :cve_nist:`2017-18200`, :cve_nist:`2017-18202`, :cve_nist:`2017-18203`, :cve_nist:`2017-18204`, :cve_nist:`2017-18208`, :cve_nist:`2017-18216`, :cve_nist:`2017-18218`, :cve_nist:`2017-18221`, :cve_nist:`2017-18222`, :cve_nist:`2017-18224`, :cve_nist:`2017-18232`, :cve_nist:`2017-18241`, :cve_nist:`2017-18249`, :cve_nist:`2017-18255`, :cve_nist:`2017-18257`, :cve_nist:`2017-18261`, :cve_nist:`2017-18270`, :cve_nist:`2017-18344`, :cve_nist:`2017-18360`, :cve_nist:`2017-18379`, :cve_nist:`2017-18509`, :cve_nist:`2017-18549`, :cve_nist:`2017-18550`, :cve_nist:`2017-18551`, :cve_nist:`2017-18552`, :cve_nist:`2017-18595`, :cve_nist:`2017-2583`, :cve_nist:`2017-2584`, :cve_nist:`2017-2596`, :cve_nist:`2017-2618`, :cve_nist:`2017-2634`, :cve_nist:`2017-2636`, :cve_nist:`2017-2647`, :cve_nist:`2017-2671`, :cve_nist:`2017-5123`, :cve_nist:`2017-5546`, :cve_nist:`2017-5547`, :cve_nist:`2017-5548`, :cve_nist:`2017-5549`, :cve_nist:`2017-5550`, :cve_nist:`2017-5551`, :cve_nist:`201
 7-5576`, :cve_nist:`2017-5577`, :cve_nist:`2017-5669`, :cve_nist:`2017-5715`, :cve_nist:`2017-5753`, :cve_nist:`2017-5754`, :cve_nist:`2017-5897`, :cve_nist:`2017-5967`, :cve_nist:`2017-5970`, :cve_nist:`2017-5972`, :cve_nist:`2017-5986`, :cve_nist:`2017-6001`, :cve_nist:`2017-6074`, :cve_nist:`2017-6214`, :cve_nist:`2017-6345`, :cve_nist:`2017-6346`, :cve_nist:`2017-6347`, :cve_nist:`2017-6348`, :cve_nist:`2017-6353`, :cve_nist:`2017-6874`, :cve_nist:`2017-6951`, :cve_nist:`2017-7184`, :cve_nist:`2017-7187`, :cve_nist:`2017-7261`, :cve_nist:`2017-7273`, :cve_nist:`2017-7277`, :cve_nist:`2017-7294`, :cve_nist:`2017-7308`, :cve_nist:`2017-7346`, :cve_nist:`2017-7374`, :cve_nist:`2017-7472`, :cve_nist:`2017-7477`, :cve_nist:`2017-7482`, :cve_nist:`2017-7487`, :cve_nist:`2017-7495`, :cve_nist:`2017-7518`, :cve_nist:`2017-7533`, :cve_nist:`2017-7541`, :cve_nist:`2017-7542`, :cve_nist:`2017-7558`, :cve_nist:`2017-7616`, :cve_nist:`2017-7618`, :cve_nist:`2017-7645`, :cve_nist:`2017-7889`,
  :cve_nist:`2017-7895`, :cve_nist:`2017-7979`, :cve_nist:`2017-8061`, :cve_nist:`2017-8062`, :cve_nist:`2017-8063`, :cve_nist:`2017-8064`, :cve_nist:`2017-8065`, :cve_nist:`2017-8066`, :cve_nist:`2017-8067`, :cve_nist:`2017-8068`, :cve_nist:`2017-8069`, :cve_nist:`2017-8070`, :cve_nist:`2017-8071`, :cve_nist:`2017-8072`, :cve_nist:`2017-8106`, :cve_nist:`2017-8240`, :cve_nist:`2017-8797`, :cve_nist:`2017-8824`, :cve_nist:`2017-8831`, :cve_nist:`2017-8890`, :cve_nist:`2017-8924`, :cve_nist:`2017-8925`, :cve_nist:`2017-9059`, :cve_nist:`2017-9074`, :cve_nist:`2017-9075`, :cve_nist:`2017-9076`, :cve_nist:`2017-9077`, :cve_nist:`2017-9150`, :cve_nist:`2017-9211`, :cve_nist:`2017-9242`, :cve_nist:`2017-9605`, :cve_nist:`2017-9725`, :cve_nist:`2017-9984`, :cve_nist:`2017-9985`, :cve_nist:`2017-9986`, :cve_nist:`2018-1000004`, :cve_nist:`2018-1000026`, :cve_nist:`2018-1000028`, :cve_nist:`2018-1000199`, :cve_nist:`2018-1000200`, :cve_nist:`2018-1000204`, :cve_nist:`2018-10021`, :cve_nist:`
 2018-10074`, :cve_nist:`2018-10087`, :cve_nist:`2018-10124`, :cve_nist:`2018-10322`, :cve_nist:`2018-10323`, :cve_nist:`2018-1065`, :cve_nist:`2018-1066`, :cve_nist:`2018-10675`, :cve_nist:`2018-1068`, :cve_nist:`2018-10840`, :cve_nist:`2018-10853`, :cve_nist:`2018-1087`, :cve_nist:`2018-10876`, :cve_nist:`2018-10877`, :cve_nist:`2018-10878`, :cve_nist:`2018-10879`, :cve_nist:`2018-10880`, :cve_nist:`2018-10881`, :cve_nist:`2018-10882`, :cve_nist:`2018-10883`, :cve_nist:`2018-10901`, :cve_nist:`2018-10902`, :cve_nist:`2018-1091`, :cve_nist:`2018-1092`, :cve_nist:`2018-1093`, :cve_nist:`2018-10938`, :cve_nist:`2018-1094`, :cve_nist:`2018-10940`, :cve_nist:`2018-1095`, :cve_nist:`2018-1108`, :cve_nist:`2018-1118`, :cve_nist:`2018-1120`, :cve_nist:`2018-11232`, :cve_nist:`2018-1128`, :cve_nist:`2018-1129`, :cve_nist:`2018-1130`, :cve_nist:`2018-11412`, :cve_nist:`2018-11506`, :cve_nist:`2018-11508`, :cve_nist:`2018-12126`, :cve_nist:`2018-12127`, :cve_nist:`2018-12130`, :cve_nist:`2018
 -12207`, :cve_nist:`2018-12232`, :cve_nist:`2018-12233`, :cve_nist:`2018-12633`, :cve_nist:`2018-12714`, :cve_nist:`2018-12896`, :cve_nist:`2018-12904`, :cve_nist:`2018-13053`, :cve_nist:`2018-13093`, :cve_nist:`2018-13094`, :cve_nist:`2018-13095`, :cve_nist:`2018-13096`, :cve_nist:`2018-13097`, :cve_nist:`2018-13098`, :cve_nist:`2018-13099`, :cve_nist:`2018-13100`, :cve_nist:`2018-13405`, :cve_nist:`2018-13406`, :cve_nist:`2018-14609`, :cve_nist:`2018-14610`, :cve_nist:`2018-14611`, :cve_nist:`2018-14612`, :cve_nist:`2018-14613`, :cve_nist:`2018-14614`, :cve_nist:`2018-14615`, :cve_nist:`2018-14616`, :cve_nist:`2018-14617`, :cve_nist:`2018-14619`, :cve_nist:`2018-14625`, :cve_nist:`2018-14633`, :cve_nist:`2018-14634`, :cve_nist:`2018-14641`, :cve_nist:`2018-14646`, :cve_nist:`2018-14656`, :cve_nist:`2018-14678`, :cve_nist:`2018-14734`, :cve_nist:`2018-15471`, :cve_nist:`2018-15572`, :cve_nist:`2018-15594`, :cve_nist:`2018-16276`, :cve_nist:`2018-16597`, :cve_nist:`2018-16658`, :cve
 _nist:`2018-16862`, :cve_nist:`2018-16871`, :cve_nist:`2018-16880`, :cve_nist:`2018-16882`, :cve_nist:`2018-16884`, :cve_nist:`2018-17182`, :cve_nist:`2018-17972`, :cve_nist:`2018-18021`, :cve_nist:`2018-18281`, :cve_nist:`2018-18386`, :cve_nist:`2018-18397`, :cve_nist:`2018-18445`, :cve_nist:`2018-18559`, :cve_nist:`2018-18690`, :cve_nist:`2018-18710`, :cve_nist:`2018-18955`, :cve_nist:`2018-19406`, :cve_nist:`2018-19407`, :cve_nist:`2018-19824`, :cve_nist:`2018-19854`, :cve_nist:`2018-19985`, :cve_nist:`2018-20169`, :cve_nist:`2018-20449`, :cve_nist:`2018-20509`, :cve_nist:`2018-20510`, :cve_nist:`2018-20511`, :cve_nist:`2018-20669`, :cve_nist:`2018-20784`, :cve_nist:`2018-20836`, :cve_nist:`2018-20854`, :cve_nist:`2018-20855`, :cve_nist:`2018-20856`, :cve_nist:`2018-20961`, :cve_nist:`2018-20976`, :cve_nist:`2018-21008`, :cve_nist:`2018-25015`, :cve_nist:`2018-25020`, :cve_nist:`2018-3620`, :cve_nist:`2018-3639`, :cve_nist:`2018-3646`, :cve_nist:`2018-3665`, :cve_nist:`2018-3693`
 , :cve_nist:`2018-5332`, :cve_nist:`2018-5333`, :cve_nist:`2018-5344`, :cve_nist:`2018-5390`, :cve_nist:`2018-5391`, :cve_nist:`2018-5703`, :cve_nist:`2018-5750`, :cve_nist:`2018-5803`, :cve_nist:`2018-5814`, :cve_nist:`2018-5848`, :cve_nist:`2018-5873`, :cve_nist:`2018-5953`, :cve_nist:`2018-5995`, :cve_nist:`2018-6412`, :cve_nist:`2018-6554`, :cve_nist:`2018-6555`, :cve_nist:`2018-6927`, :cve_nist:`2018-7191`, :cve_nist:`2018-7273`, :cve_nist:`2018-7480`, :cve_nist:`2018-7492`, :cve_nist:`2018-7566`, :cve_nist:`2018-7740`, :cve_nist:`2018-7754`, :cve_nist:`2018-7755`, :cve_nist:`2018-7757`, :cve_nist:`2018-7995`, :cve_nist:`2018-8043`, :cve_nist:`2018-8087`, :cve_nist:`2018-8781`, :cve_nist:`2018-8822`, :cve_nist:`2018-8897`, :cve_nist:`2018-9363`, :cve_nist:`2018-9385`, :cve_nist:`2018-9415`, :cve_nist:`2018-9422`, :cve_nist:`2018-9465`, :cve_nist:`2018-9516`, :cve_nist:`2018-9517`, :cve_nist:`2018-9518`, :cve_nist:`2018-9568`, :cve_nist:`2019-0136`, :cve_nist:`2019-0145`, :cve_n
 ist:`2019-0146`, :cve_nist:`2019-0147`, :cve_nist:`2019-0148`, :cve_nist:`2019-0149`, :cve_nist:`2019-0154`, :cve_nist:`2019-0155`, :cve_nist:`2019-10124`, :cve_nist:`2019-10125`, :cve_nist:`2019-10126`, :cve_nist:`2019-10142`, :cve_nist:`2019-10207`, :cve_nist:`2019-10220`, :cve_nist:`2019-10638`, :cve_nist:`2019-10639`, :cve_nist:`2019-11085`, :cve_nist:`2019-11091`, :cve_nist:`2019-11135`, :cve_nist:`2019-11190`, :cve_nist:`2019-11191`, :cve_nist:`2019-1125`, :cve_nist:`2019-11477`, :cve_nist:`2019-11478`, :cve_nist:`2019-11479`, :cve_nist:`2019-11486`, :cve_nist:`2019-11487`, :cve_nist:`2019-11599`, :cve_nist:`2019-11683`, :cve_nist:`2019-11810`, :cve_nist:`2019-11811`, :cve_nist:`2019-11815`, :cve_nist:`2019-11833`, :cve_nist:`2019-11884`, :cve_nist:`2019-12378`, :cve_nist:`2019-12379`, :cve_nist:`2019-12380`, :cve_nist:`2019-12381`, :cve_nist:`2019-12382`, :cve_nist:`2019-12454`, :cve_nist:`2019-12455`, :cve_nist:`2019-12614`, :cve_nist:`2019-12615`, :cve_nist:`2019-12817`, :c
 ve_nist:`2019-12818`, :cve_nist:`2019-12819`, :cve_nist:`2019-12881`, :cve_nist:`2019-12984`, :cve_nist:`2019-13233`, :cve_nist:`2019-13272`, :cve_nist:`2019-13631`, :cve_nist:`2019-13648`, :cve_nist:`2019-14283`, :cve_nist:`2019-14284`, :cve_nist:`2019-14615`, :cve_nist:`2019-14763`, :cve_nist:`2019-14814`, :cve_nist:`2019-14815`, :cve_nist:`2019-14816`, :cve_nist:`2019-14821`, :cve_nist:`2019-14835`, :cve_nist:`2019-14895`, :cve_nist:`2019-14896`, :cve_nist:`2019-14897`, :cve_nist:`2019-14901`, :cve_nist:`2019-15030`, :cve_nist:`2019-15031`, :cve_nist:`2019-15090`, :cve_nist:`2019-15098`, :cve_nist:`2019-15099`, :cve_nist:`2019-15117`, :cve_nist:`2019-15118`, :cve_nist:`2019-15211`, :cve_nist:`2019-15212`, :cve_nist:`2019-15213`, :cve_nist:`2019-15214`, :cve_nist:`2019-15215`, :cve_nist:`2019-15216`, :cve_nist:`2019-15217`, :cve_nist:`2019-15218`, :cve_nist:`2019-15219`, :cve_nist:`2019-15220`, :cve_nist:`2019-15221`, :cve_nist:`2019-15222`, :cve_nist:`2019-15223`, :cve_nist:`2019
 -15291`, :cve_nist:`2019-15292`, :cve_nist:`2019-15504`, :cve_nist:`2019-15505`, :cve_nist:`2019-15538`, :cve_nist:`2019-15666`, :cve_nist:`2019-15807`, :cve_nist:`2019-15916`, :cve_nist:`2019-15917`, :cve_nist:`2019-15918`, :cve_nist:`2019-15919`, :cve_nist:`2019-15920`, :cve_nist:`2019-15921`, :cve_nist:`2019-15922`, :cve_nist:`2019-15923`, :cve_nist:`2019-15924`, :cve_nist:`2019-15925`, :cve_nist:`2019-15926`, :cve_nist:`2019-15927`, :cve_nist:`2019-16229`, :cve_nist:`2019-16230`, :cve_nist:`2019-16231`, :cve_nist:`2019-16232`, :cve_nist:`2019-16233`, :cve_nist:`2019-16234`, :cve_nist:`2019-16413`, :cve_nist:`2019-16714`, :cve_nist:`2019-16746`, :cve_nist:`2019-16921`, :cve_nist:`2019-16994`, :cve_nist:`2019-16995`, :cve_nist:`2019-17052`, :cve_nist:`2019-17053`, :cve_nist:`2019-17054`, :cve_nist:`2019-17055`, :cve_nist:`2019-17056`, :cve_nist:`2019-17075`, :cve_nist:`2019-17133`, :cve_nist:`2019-17351`, :cve_nist:`2019-17666`, :cve_nist:`2019-18198`, :cve_nist:`2019-18282`, :cve
 _nist:`2019-18660`, :cve_nist:`2019-18675`, :cve_nist:`2019-18683`, :cve_nist:`2019-18786`, :cve_nist:`2019-18805`, :cve_nist:`2019-18806`, :cve_nist:`2019-18807`, :cve_nist:`2019-18808`, :cve_nist:`2019-18809`, :cve_nist:`2019-18810`, :cve_nist:`2019-18811`, :cve_nist:`2019-18812`, :cve_nist:`2019-18813`, :cve_nist:`2019-18814`, :cve_nist:`2019-18885`, :cve_nist:`2019-19036`, :cve_nist:`2019-19037`, :cve_nist:`2019-19039`, :cve_nist:`2019-19043`, :cve_nist:`2019-19044`, :cve_nist:`2019-19045`, :cve_nist:`2019-19046`, :cve_nist:`2019-19047`, :cve_nist:`2019-19048`, :cve_nist:`2019-19049`, :cve_nist:`2019-19050`, :cve_nist:`2019-19051`, :cve_nist:`2019-19052`, :cve_nist:`2019-19053`, :cve_nist:`2019-19054`, :cve_nist:`2019-19055`, :cve_nist:`2019-19056`, :cve_nist:`2019-19057`, :cve_nist:`2019-19058`, :cve_nist:`2019-19059`, :cve_nist:`2019-19060`, :cve_nist:`2019-19061`, :cve_nist:`2019-19062`, :cve_nist:`2019-19063`, :cve_nist:`2019-19064`, :cve_nist:`2019-19065`, :cve_nist:`2019-1
 9066`, :cve_nist:`2019-19067`, :cve_nist:`2019-19068`, :cve_nist:`2019-19069`, :cve_nist:`2019-19070`, :cve_nist:`2019-19071`, :cve_nist:`2019-19072`, :cve_nist:`2019-19073`, :cve_nist:`2019-19074`, :cve_nist:`2019-19075`, :cve_nist:`2019-19076`, :cve_nist:`2019-19077`, :cve_nist:`2019-19078`, :cve_nist:`2019-19079`, :cve_nist:`2019-19080`, :cve_nist:`2019-19081`, :cve_nist:`2019-19082`, :cve_nist:`2019-19083`, :cve_nist:`2019-19227`, :cve_nist:`2019-19241`, :cve_nist:`2019-19252`, :cve_nist:`2019-19318`, :cve_nist:`2019-19319`, :cve_nist:`2019-19332`, :cve_nist:`2019-19338`, :cve_nist:`2019-19377`, :cve_nist:`2019-19447`, :cve_nist:`2019-19448`, :cve_nist:`2019-19449`, :cve_nist:`2019-19462`, :cve_nist:`2019-19523`, :cve_nist:`2019-19524`, :cve_nist:`2019-19525`, :cve_nist:`2019-19526`, :cve_nist:`2019-19527`, :cve_nist:`2019-19528`, :cve_nist:`2019-19529`, :cve_nist:`2019-19530`, :cve_nist:`2019-19531`, :cve_nist:`2019-19532`, :cve_nist:`2019-19533`, :cve_nist:`2019-19534`, :cve_n
 ist:`2019-19535`, :cve_nist:`2019-19536`, :cve_nist:`2019-19537`, :cve_nist:`2019-19543`, :cve_nist:`2019-19602`, :cve_nist:`2019-19767`, :cve_nist:`2019-19768`, :cve_nist:`2019-19769`, :cve_nist:`2019-19770`, :cve_nist:`2019-19807`, :cve_nist:`2019-19813`, :cve_nist:`2019-19815`, :cve_nist:`2019-19816`, :cve_nist:`2019-19922`, :cve_nist:`2019-19927`, :cve_nist:`2019-19947`, :cve_nist:`2019-19965`, :cve_nist:`2019-19966`, :cve_nist:`2019-1999`, :cve_nist:`2019-20054`, :cve_nist:`2019-20095`, :cve_nist:`2019-20096`, :cve_nist:`2019-2024`, :cve_nist:`2019-2025`, :cve_nist:`2019-20422`, :cve_nist:`2019-2054`, :cve_nist:`2019-20636`, :cve_nist:`2019-20806`, :cve_nist:`2019-20810`, :cve_nist:`2019-20811`, :cve_nist:`2019-20812`, :cve_nist:`2019-20908`, :cve_nist:`2019-20934`, :cve_nist:`2019-2101`, :cve_nist:`2019-2181`, :cve_nist:`2019-2182`, :cve_nist:`2019-2213`, :cve_nist:`2019-2214`, :cve_nist:`2019-2215`, :cve_nist:`2019-25044`, :cve_nist:`2019-25045`, :cve_nist:`2019-3016`, :cve_n
 ist:`2019-3459`, :cve_nist:`2019-3460`, :cve_nist:`2019-3701`, :cve_nist:`2019-3819`, :cve_nist:`2019-3837`, :cve_nist:`2019-3846`, :cve_nist:`2019-3874`, :cve_nist:`2019-3882`, :cve_nist:`2019-3887`, :cve_nist:`2019-3892`, :cve_nist:`2019-3896`, :cve_nist:`2019-3900`, :cve_nist:`2019-3901`, :cve_nist:`2019-5108`, :cve_nist:`2019-6133`, :cve_nist:`2019-6974`, :cve_nist:`2019-7221`, :cve_nist:`2019-7222`, :cve_nist:`2019-7308`, :cve_nist:`2019-8912`, :cve_nist:`2019-8956`, :cve_nist:`2019-8980`, :cve_nist:`2019-9003`, :cve_nist:`2019-9162`, :cve_nist:`2019-9213`, :cve_nist:`2019-9245`, :cve_nist:`2019-9444`, :cve_nist:`2019-9445`, :cve_nist:`2019-9453`, :cve_nist:`2019-9454`, :cve_nist:`2019-9455`, :cve_nist:`2019-9456`, :cve_nist:`2019-9457`, :cve_nist:`2019-9458`, :cve_nist:`2019-9466`, :cve_nist:`2019-9500`, :cve_nist:`2019-9503`, :cve_nist:`2019-9506`, :cve_nist:`2019-9857`, :cve_nist:`2020-0009`, :cve_nist:`2020-0030`, :cve_nist:`2020-0041`, :cve_nist:`2020-0066`, :cve_nist:`202
 0-0067`, :cve_nist:`2020-0110`, :cve_nist:`2020-0255`, :cve_nist:`2020-0305`, :cve_nist:`2020-0404`, :cve_nist:`2020-0423`, :cve_nist:`2020-0427`, :cve_nist:`2020-0429`, :cve_nist:`2020-0430`, :cve_nist:`2020-0431`, :cve_nist:`2020-0432`, :cve_nist:`2020-0433`, :cve_nist:`2020-0435`, :cve_nist:`2020-0444`, :cve_nist:`2020-0465`, :cve_nist:`2020-0466`, :cve_nist:`2020-0543`, :cve_nist:`2020-10135`, :cve_nist:`2020-10690`, :cve_nist:`2020-10711`, :cve_nist:`2020-10720`, :cve_nist:`2020-10732`, :cve_nist:`2020-10742`, :cve_nist:`2020-10751`, :cve_nist:`2020-10757`, :cve_nist:`2020-10766`, :cve_nist:`2020-10767`, :cve_nist:`2020-10768`, :cve_nist:`2020-10769`, :cve_nist:`2020-10773`, :cve_nist:`2020-10781`, :cve_nist:`2020-10942`, :cve_nist:`2020-11494`, :cve_nist:`2020-11565`, :cve_nist:`2020-11608`, :cve_nist:`2020-11609`, :cve_nist:`2020-11668`, :cve_nist:`2020-11669`, :cve_nist:`2020-11884`, :cve_nist:`2020-12114`, :cve_nist:`2020-12351`, :cve_nist:`2020-12352`, :cve_nist:`2020-1246
 4`, :cve_nist:`2020-12465`, :cve_nist:`2020-12652`, :cve_nist:`2020-12653`, :cve_nist:`2020-12654`, :cve_nist:`2020-12655`, :cve_nist:`2020-12656`, :cve_nist:`2020-12657`, :cve_nist:`2020-12659`, :cve_nist:`2020-12768`, :cve_nist:`2020-12769`, :cve_nist:`2020-12770`, :cve_nist:`2020-12771`, :cve_nist:`2020-12826`, :cve_nist:`2020-12888`, :cve_nist:`2020-12912`, :cve_nist:`2020-13143`, :cve_nist:`2020-13974`, :cve_nist:`2020-14305`, :cve_nist:`2020-14314`, :cve_nist:`2020-14331`, :cve_nist:`2020-14351`, :cve_nist:`2020-14353`, :cve_nist:`2020-14356`, :cve_nist:`2020-14381`, :cve_nist:`2020-14385`, :cve_nist:`2020-14386`, :cve_nist:`2020-14390`, :cve_nist:`2020-14416`, :cve_nist:`2020-15393`, :cve_nist:`2020-15436`, :cve_nist:`2020-15437`, :cve_nist:`2020-15780`, :cve_nist:`2020-15852`, :cve_nist:`2020-16119`, :cve_nist:`2020-16120`, :cve_nist:`2020-16166`, :cve_nist:`2020-1749`, :cve_nist:`2020-24394`, :cve_nist:`2020-24490`, :cve_nist:`2020-24586`, :cve_nist:`2020-24587`, :cve_nist:
 `2020-24588`, :cve_nist:`2020-25211`, :cve_nist:`2020-25212`, :cve_nist:`2020-25221`, :cve_nist:`2020-25284`, :cve_nist:`2020-25285`, :cve_nist:`2020-25639`, :cve_nist:`2020-25641`, :cve_nist:`2020-25643`, :cve_nist:`2020-25645`, :cve_nist:`2020-25656`, :cve_nist:`2020-25668`, :cve_nist:`2020-25669`, :cve_nist:`2020-25670`, :cve_nist:`2020-25671`, :cve_nist:`2020-25672`, :cve_nist:`2020-25673`, :cve_nist:`2020-25704`, :cve_nist:`2020-25705`, :cve_nist:`2020-26088`, :cve_nist:`2020-26139`, :cve_nist:`2020-26141`, :cve_nist:`2020-26145`, :cve_nist:`2020-26147`, :cve_nist:`2020-26541`, :cve_nist:`2020-26555`, :cve_nist:`2020-26558`, :cve_nist:`2020-27066`, :cve_nist:`2020-27067`, :cve_nist:`2020-27068`, :cve_nist:`2020-27152`, :cve_nist:`2020-27170`, :cve_nist:`2020-27171`, :cve_nist:`2020-27194`, :cve_nist:`2020-2732`, :cve_nist:`2020-27418`, :cve_nist:`2020-27673`, :cve_nist:`2020-27675`, :cve_nist:`2020-27777`, :cve_nist:`2020-27784`, :cve_nist:`2020-27786`, :cve_nist:`2020-27815`, 
 :cve_nist:`2020-27820`, :cve_nist:`2020-27825`, :cve_nist:`2020-27830`, :cve_nist:`2020-27835`, :cve_nist:`2020-28097`, :cve_nist:`2020-28374`, :cve_nist:`2020-28588`, :cve_nist:`2020-28915`, :cve_nist:`2020-28941`, :cve_nist:`2020-28974`, :cve_nist:`2020-29368`, :cve_nist:`2020-29369`, :cve_nist:`2020-29370`, :cve_nist:`2020-29371`, :cve_nist:`2020-29372`, :cve_nist:`2020-29373`, :cve_nist:`2020-29374`, :cve_nist:`2020-29534`, :cve_nist:`2020-29568`, :cve_nist:`2020-29569`, :cve_nist:`2020-29660`, :cve_nist:`2020-29661`, :cve_nist:`2020-35499`, :cve_nist:`2020-35508`, :cve_nist:`2020-35513`, :cve_nist:`2020-35519`, :cve_nist:`2020-36158`, :cve_nist:`2020-36310`, :cve_nist:`2020-36311`, :cve_nist:`2020-36312`, :cve_nist:`2020-36313`, :cve_nist:`2020-36322`, :cve_nist:`2020-36385`, :cve_nist:`2020-36386`, :cve_nist:`2020-36387`, :cve_nist:`2020-36516`, :cve_nist:`2020-36557`, :cve_nist:`2020-36558`, :cve_nist:`2020-36691`, :cve_nist:`2020-36694`, :cve_nist:`2020-36766`, :cve_nist:`20
 20-3702`, :cve_nist:`2020-4788`, :cve_nist:`2020-7053`, :cve_nist:`2020-8428`, :cve_nist:`2020-8647`, :cve_nist:`2020-8648`, :cve_nist:`2020-8649`, :cve_nist:`2020-8694`, :cve_nist:`2020-8834`, :cve_nist:`2020-8835`, :cve_nist:`2020-8992`, :cve_nist:`2020-9383`, :cve_nist:`2020-9391`, :cve_nist:`2021-0129`, :cve_nist:`2021-0342`, :cve_mitre:`2021-0447`, :cve_mitre:`2021-0448`, :cve_nist:`2021-0512`, :cve_nist:`2021-0605`, :cve_nist:`2021-0707`, :cve_nist:`2021-0920`, :cve_nist:`2021-0929`, :cve_nist:`2021-0935`, :cve_mitre:`2021-0937`, :cve_nist:`2021-0938`, :cve_nist:`2021-0941`, :cve_nist:`2021-1048`, :cve_nist:`2021-20177`, :cve_nist:`2021-20194`, :cve_nist:`2021-20226`, :cve_nist:`2021-20239`, :cve_nist:`2021-20261`, :cve_nist:`2021-20265`, :cve_nist:`2021-20268`, :cve_nist:`2021-20292`, :cve_nist:`2021-20317`, :cve_nist:`2021-20320`, :cve_nist:`2021-20321`, :cve_nist:`2021-20322`, :cve_nist:`2021-21781`, :cve_nist:`2021-22543`, :cve_nist:`2021-22555`, :cve_nist:`2021-22600`, :c
 ve_nist:`2021-23133`, :cve_nist:`2021-23134`, :cve_nist:`2021-26401`, :cve_nist:`2021-26708`, :cve_nist:`2021-26930`, :cve_nist:`2021-26931`, :cve_nist:`2021-26932`, :cve_nist:`2021-27363`, :cve_nist:`2021-27364`, :cve_nist:`2021-27365`, :cve_nist:`2021-28038`, :cve_nist:`2021-28039`, :cve_nist:`2021-28375`, :cve_nist:`2021-28660`, :cve_nist:`2021-28688`, :cve_nist:`2021-28691`, :cve_nist:`2021-28711`, :cve_nist:`2021-28712`, :cve_nist:`2021-28713`, :cve_nist:`2021-28714`, :cve_nist:`2021-28715`, :cve_nist:`2021-28950`, :cve_nist:`2021-28951`, :cve_nist:`2021-28952`, :cve_nist:`2021-28964`, :cve_nist:`2021-28971`, :cve_nist:`2021-28972`, :cve_nist:`2021-29154`, :cve_nist:`2021-29155`, :cve_nist:`2021-29264`, :cve_nist:`2021-29265`, :cve_nist:`2021-29266`, :cve_nist:`2021-29646`, :cve_nist:`2021-29647`, :cve_nist:`2021-29648`, :cve_nist:`2021-29649`, :cve_nist:`2021-29650`, :cve_nist:`2021-29657`, :cve_nist:`2021-30002`, :cve_nist:`2021-30178`, :cve_nist:`2021-31440`, :cve_nist:`2021
 -3178`, :cve_nist:`2021-31829`, :cve_nist:`2021-31916`, :cve_nist:`2021-32399`, :cve_nist:`2021-32606`, :cve_nist:`2021-33033`, :cve_nist:`2021-33034`, :cve_nist:`2021-33098`, :cve_nist:`2021-33135`, :cve_nist:`2021-33200`, :cve_nist:`2021-3347`, :cve_nist:`2021-3348`, :cve_nist:`2021-33624`, :cve_nist:`2021-33655`, :cve_nist:`2021-33656`, :cve_nist:`2021-33909`, :cve_nist:`2021-3411`, :cve_nist:`2021-3428`, :cve_nist:`2021-3444`, :cve_nist:`2021-34556`, :cve_nist:`2021-34693`, :cve_nist:`2021-3483`, :cve_nist:`2021-34866`, :cve_nist:`2021-3489`, :cve_nist:`2021-3490`, :cve_nist:`2021-3491`, :cve_mitre:`2021-34981`, :cve_nist:`2021-3501`, :cve_nist:`2021-35039`, :cve_nist:`2021-3506`, :cve_nist:`2021-3543`, :cve_nist:`2021-35477`, :cve_nist:`2021-3564`, :cve_nist:`2021-3573`, :cve_nist:`2021-3587`, :cve_mitre:`2021-3600`, :cve_nist:`2021-3609`, :cve_nist:`2021-3612`, :cve_nist:`2021-3635`, :cve_nist:`2021-3640`, :cve_nist:`2021-3653`, :cve_nist:`2021-3655`, :cve_nist:`2021-3656`, :c
 ve_nist:`2021-3659`, :cve_nist:`2021-3679`, :cve_nist:`2021-3715`, :cve_nist:`2021-37159`, :cve_nist:`2021-3732`, :cve_nist:`2021-3736`, :cve_nist:`2021-3739`, :cve_nist:`2021-3743`, :cve_nist:`2021-3744`, :cve_nist:`2021-3752`, :cve_nist:`2021-3753`, :cve_nist:`2021-37576`, :cve_nist:`2021-3759`, :cve_nist:`2021-3760`, :cve_nist:`2021-3764`, :cve_nist:`2021-3772`, :cve_nist:`2021-38160`, :cve_nist:`2021-38166`, :cve_nist:`2021-38198`, :cve_nist:`2021-38199`, :cve_nist:`2021-38200`, :cve_nist:`2021-38201`, :cve_nist:`2021-38202`, :cve_nist:`2021-38203`, :cve_nist:`2021-38204`, :cve_nist:`2021-38205`, :cve_nist:`2021-38206`, :cve_nist:`2021-38207`, :cve_nist:`2021-38208`, :cve_nist:`2021-38209`, :cve_nist:`2021-38300`, :cve_nist:`2021-3894`, :cve_nist:`2021-3896`, :cve_nist:`2021-3923`, :cve_nist:`2021-39633`, :cve_nist:`2021-39634`, :cve_nist:`2021-39636`, :cve_nist:`2021-39648`, :cve_nist:`2021-39656`, :cve_nist:`2021-39657`, :cve_nist:`2021-39685`, :cve_nist:`2021-39686`, :cve_nis
 t:`2021-39698`, :cve_nist:`2021-39711`, :cve_nist:`2021-39713`, :cve_nist:`2021-39714`, :cve_nist:`2021-4001`, :cve_nist:`2021-4002`, :cve_nist:`2021-4028`, :cve_nist:`2021-4032`, :cve_nist:`2021-4037`, :cve_nist:`2021-40490`, :cve_nist:`2021-4083`, :cve_nist:`2021-4090`, :cve_nist:`2021-4093`, :cve_nist:`2021-4095`, :cve_nist:`2021-41073`, :cve_nist:`2021-4135`, :cve_nist:`2021-4148`, :cve_nist:`2021-4149`, :cve_nist:`2021-4154`, :cve_nist:`2021-4155`, :cve_nist:`2021-4157`, :cve_nist:`2021-4159`, :cve_nist:`2021-41864`, :cve_nist:`2021-4197`, :cve_nist:`2021-42008`, :cve_nist:`2021-4202`, :cve_nist:`2021-4203`, :cve_nist:`2021-4218`, :cve_nist:`2021-42252`, :cve_nist:`2021-42327`, :cve_nist:`2021-42739`, :cve_nist:`2021-43056`, :cve_nist:`2021-43057`, :cve_nist:`2021-43267`, :cve_nist:`2021-43389`, :cve_nist:`2021-43975`, :cve_nist:`2021-43976`, :cve_nist:`2021-44733`, :cve_nist:`2021-45095`, :cve_nist:`2021-45100`, :cve_nist:`2021-45402`, :cve_nist:`2021-45469`, :cve_nist:`2021-4
 5480`, :cve_nist:`2021-45485`, :cve_nist:`2021-45486`, :cve_nist:`2021-45868`, :cve_nist:`2021-46283`, :cve_nist:`2022-0001`, :cve_nist:`2022-0002`, :cve_nist:`2022-0168`, :cve_nist:`2022-0171`, :cve_nist:`2022-0185`, :cve_nist:`2022-0264`, :cve_nist:`2022-0286`, :cve_nist:`2022-0322`, :cve_nist:`2022-0330`, :cve_nist:`2022-0433`, :cve_nist:`2022-0435`, :cve_nist:`2022-0487`, :cve_nist:`2022-0492`, :cve_nist:`2022-0494`, :cve_nist:`2022-0516`, :cve_nist:`2022-0617`, :cve_nist:`2022-0644`, :cve_nist:`2022-0646`, :cve_nist:`2022-0742`, :cve_nist:`2022-0812`, :cve_nist:`2022-0847`, :cve_nist:`2022-0850`, :cve_nist:`2022-0854`, :cve_nist:`2022-0995`, :cve_nist:`2022-1011`, :cve_nist:`2022-1012`, :cve_nist:`2022-1015`, :cve_nist:`2022-1016`, :cve_nist:`2022-1043`, :cve_nist:`2022-1048`, :cve_nist:`2022-1055`, :cve_nist:`2022-1158`, :cve_nist:`2022-1184`, :cve_nist:`2022-1195`, :cve_nist:`2022-1198`, :cve_nist:`2022-1199`, :cve_nist:`2022-1204`, :cve_nist:`2022-1205`, :cve_nist:`2022-1353
 `, :cve_nist:`2022-1419`, :cve_nist:`2022-1462`, :cve_nist:`2022-1516`, :cve_nist:`2022-1651`, :cve_nist:`2022-1652`, :cve_nist:`2022-1671`, :cve_nist:`2022-1678`, :cve_nist:`2022-1679`, :cve_nist:`2022-1729`, :cve_nist:`2022-1734`, :cve_nist:`2022-1786`, :cve_nist:`2022-1789`, :cve_nist:`2022-1836`, :cve_nist:`2022-1852`, :cve_nist:`2022-1882`, :cve_nist:`2022-1943`, :cve_nist:`2022-1966`, :cve_nist:`2022-1972`, :cve_nist:`2022-1973`, :cve_nist:`2022-1974`, :cve_nist:`2022-1975`, :cve_nist:`2022-1976`, :cve_nist:`2022-1998`, :cve_nist:`2022-20008`, :cve_nist:`2022-20132`, :cve_nist:`2022-20141`, :cve_nist:`2022-20153`, :cve_nist:`2022-20154`, :cve_nist:`2022-20158`, :cve_nist:`2022-20166`, :cve_nist:`2022-20368`, :cve_nist:`2022-20369`, :cve_nist:`2022-20421`, :cve_nist:`2022-20422`, :cve_nist:`2022-20423`, :cve_mitre:`2022-20565`, :cve_nist:`2022-20566`, :cve_nist:`2022-20567`, :cve_nist:`2022-20572`, :cve_nist:`2022-2078`, :cve_nist:`2022-21123`, :cve_nist:`2022-21125`, :cve_nist
 :`2022-21166`, :cve_nist:`2022-21385`, :cve_nist:`2022-21499`, :cve_mitre:`2022-21505`, :cve_nist:`2022-2153`, :cve_nist:`2022-2196`, :cve_mitre:`2022-22942`, :cve_nist:`2022-23036`, :cve_nist:`2022-23037`, :cve_nist:`2022-23038`, :cve_nist:`2022-23039`, :cve_nist:`2022-23040`, :cve_nist:`2022-23041`, :cve_nist:`2022-23042`, :cve_nist:`2022-2308`, :cve_nist:`2022-2318`, :cve_nist:`2022-2380`, :cve_nist:`2022-23816`, :cve_nist:`2022-23960`, :cve_nist:`2022-24122`, :cve_nist:`2022-24448`, :cve_nist:`2022-24958`, :cve_nist:`2022-24959`, :cve_nist:`2022-2503`, :cve_nist:`2022-25258`, :cve_nist:`2022-25375`, :cve_nist:`2022-25636`, :cve_mitre:`2022-2585`, :cve_mitre:`2022-2586`, :cve_mitre:`2022-2588`, :cve_nist:`2022-2590`, :cve_mitre:`2022-2602`, :cve_nist:`2022-26365`, :cve_nist:`2022-26373`, :cve_nist:`2022-2639`, :cve_nist:`2022-26490`, :cve_nist:`2022-2663`, :cve_nist:`2022-26966`, :cve_nist:`2022-27223`, :cve_nist:`2022-27666`, :cve_nist:`2022-2785`, :cve_nist:`2022-27950`, :cve_n
 ist:`2022-28356`, :cve_nist:`2022-28388`, :cve_nist:`2022-28389`, :cve_nist:`2022-28390`, :cve_nist:`2022-2873`, :cve_nist:`2022-28796`, :cve_nist:`2022-28893`, :cve_nist:`2022-2905`, :cve_nist:`2022-29156`, :cve_nist:`2022-2938`, :cve_nist:`2022-29581`, :cve_nist:`2022-29582`, :cve_nist:`2022-2959`, :cve_nist:`2022-2964`, :cve_nist:`2022-2977`, :cve_nist:`2022-2978`, :cve_nist:`2022-29900`, :cve_nist:`2022-29901`, :cve_nist:`2022-29968`, :cve_nist:`2022-3028`, :cve_nist:`2022-30594`, :cve_nist:`2022-3061`, :cve_nist:`2022-3077`, :cve_nist:`2022-3078`, :cve_nist:`2022-3103`, :cve_nist:`2022-3104`, :cve_nist:`2022-3105`, :cve_nist:`2022-3106`, :cve_nist:`2022-3107`, :cve_nist:`2022-3110`, :cve_nist:`2022-3111`, :cve_nist:`2022-3112`, :cve_nist:`2022-3113`, :cve_nist:`2022-3114`, :cve_nist:`2022-3115`, :cve_nist:`2022-3169`, :cve_nist:`2022-3170`, :cve_nist:`2022-3202`, :cve_nist:`2022-32250`, :cve_nist:`2022-32296`, :cve_nist:`2022-3239`, :cve_nist:`2022-32981`, :cve_nist:`2022-3303`
 , :cve_nist:`2022-33740`, :cve_nist:`2022-33741`, :cve_nist:`2022-33742`, :cve_nist:`2022-33743`, :cve_nist:`2022-33744`, :cve_nist:`2022-33981`, :cve_nist:`2022-3424`, :cve_nist:`2022-3435`, :cve_nist:`2022-34494`, :cve_nist:`2022-34495`, :cve_nist:`2022-34918`, :cve_nist:`2022-3521`, :cve_nist:`2022-3524`, :cve_nist:`2022-3526`, :cve_nist:`2022-3531`, :cve_nist:`2022-3532`, :cve_nist:`2022-3534`, :cve_nist:`2022-3535`, :cve_nist:`2022-3541`, :cve_nist:`2022-3542`, :cve_nist:`2022-3543`, :cve_nist:`2022-3545`, :cve_nist:`2022-3564`, :cve_nist:`2022-3565`, :cve_nist:`2022-3577`, :cve_nist:`2022-3586`, :cve_nist:`2022-3594`, :cve_nist:`2022-36123`, :cve_nist:`2022-3619`, :cve_nist:`2022-3621`, :cve_nist:`2022-3623`, :cve_nist:`2022-3625`, :cve_nist:`2022-3628`, :cve_nist:`2022-36280`, :cve_nist:`2022-3629`, :cve_nist:`2022-3630`, :cve_nist:`2022-3633`, :cve_nist:`2022-3635`, :cve_nist:`2022-3640`, :cve_nist:`2022-3643`, :cve_nist:`2022-3646`, :cve_nist:`2022-3649`, :cve_nist:`2022-36
 879`, :cve_nist:`2022-36946`, :cve_nist:`2022-3707`, :cve_nist:`2022-3910`, :cve_nist:`2022-39189`, :cve_nist:`2022-39190`, :cve_nist:`2022-3977`, :cve_nist:`2022-39842`, :cve_nist:`2022-40307`, :cve_nist:`2022-40476`, :cve_nist:`2022-40768`, :cve_nist:`2022-4095`, :cve_nist:`2022-40982`, :cve_nist:`2022-41218`, :cve_nist:`2022-41222`, :cve_nist:`2022-4127`, :cve_nist:`2022-4128`, :cve_nist:`2022-4129`, :cve_nist:`2022-4139`, :cve_nist:`2022-41674`, :cve_nist:`2022-41849`, :cve_nist:`2022-41850`, :cve_nist:`2022-41858`, :cve_nist:`2022-42328`, :cve_nist:`2022-42329`, :cve_nist:`2022-42432`, :cve_nist:`2022-4269`, :cve_nist:`2022-42703`, :cve_nist:`2022-42719`, :cve_nist:`2022-42720`, :cve_nist:`2022-42721`, :cve_nist:`2022-42722`, :cve_nist:`2022-42895`, :cve_nist:`2022-42896`, :cve_nist:`2022-43750`, :cve_nist:`2022-4378`, :cve_nist:`2022-4379`, :cve_nist:`2022-4382`, :cve_nist:`2022-43945`, :cve_nist:`2022-45869`, :cve_nist:`2022-45886`, :cve_nist:`2022-45887`, :cve_nist:`2022-458
 88`, :cve_nist:`2022-45919`, :cve_nist:`2022-45934`, :cve_nist:`2022-4662`, :cve_nist:`2022-4744`, :cve_nist:`2022-47518`, :cve_nist:`2022-47519`, :cve_nist:`2022-47520`, :cve_nist:`2022-47521`, :cve_nist:`2022-47929`, :cve_nist:`2022-47938`, :cve_nist:`2022-47939`, :cve_nist:`2022-47940`, :cve_nist:`2022-47941`, :cve_nist:`2022-47942`, :cve_nist:`2022-47943`, :cve_nist:`2022-4842`, :cve_nist:`2022-48423`, :cve_nist:`2022-48424`, :cve_nist:`2022-48425`, :cve_nist:`2022-48502`, :cve_nist:`2023-0030`, :cve_nist:`2023-0045`, :cve_nist:`2023-0047`, :cve_nist:`2023-0122`, :cve_nist:`2023-0160`, :cve_nist:`2023-0179`, :cve_nist:`2023-0210`, :cve_nist:`2023-0240`, :cve_nist:`2023-0266`, :cve_nist:`2023-0394`, :cve_nist:`2023-0458`, :cve_nist:`2023-0459`, :cve_nist:`2023-0461`, :cve_nist:`2023-0468`, :cve_nist:`2023-0469`, :cve_nist:`2023-0590`, :cve_nist:`2023-0615`, :cve_mitre:`2023-1032`, :cve_nist:`2023-1073`, :cve_nist:`2023-1074`, :cve_nist:`2023-1076`, :cve_nist:`2023-1077`, :cve_nis
 t:`2023-1078`, :cve_nist:`2023-1079`, :cve_nist:`2023-1095`, :cve_nist:`2023-1118`, :cve_nist:`2023-1192`, :cve_nist:`2023-1194`, :cve_nist:`2023-1195`, :cve_nist:`2023-1206`, :cve_nist:`2023-1249`, :cve_nist:`2023-1252`, :cve_nist:`2023-1281`, :cve_nist:`2023-1380`, :cve_nist:`2023-1382`, :cve_nist:`2023-1390`, :cve_nist:`2023-1513`, :cve_nist:`2023-1582`, :cve_nist:`2023-1583`, :cve_nist:`2023-1611`, :cve_nist:`2023-1637`, :cve_nist:`2023-1652`, :cve_nist:`2023-1670`, :cve_nist:`2023-1829`, :cve_nist:`2023-1838`, :cve_nist:`2023-1855`, :cve_nist:`2023-1859`, :cve_nist:`2023-1989`, :cve_nist:`2023-1990`, :cve_nist:`2023-1998`, :cve_nist:`2023-2002`, :cve_nist:`2023-2006`, :cve_nist:`2023-2008`, :cve_nist:`2023-2019`, :cve_nist:`2023-20569`, :cve_nist:`2023-20588`, :cve_nist:`2023-20593`, :cve_nist:`2023-20938`, :cve_nist:`2023-21102`, :cve_nist:`2023-21106`, :cve_nist:`2023-2124`, :cve_nist:`2023-21255`, :cve_nist:`2023-21264`, :cve_nist:`2023-2156`, :cve_nist:`2023-2162`, :cve_nis
 t:`2023-2163`, :cve_nist:`2023-2166`, :cve_nist:`2023-2177`, :cve_nist:`2023-2194`, :cve_nist:`2023-2235`, :cve_nist:`2023-2236`, :cve_nist:`2023-2248`, :cve_nist:`2023-2269`, :cve_nist:`2023-22996`, :cve_nist:`2023-22997`, :cve_nist:`2023-22998`, :cve_nist:`2023-22999`, :cve_nist:`2023-23001`, :cve_nist:`2023-23002`, :cve_nist:`2023-23003`, :cve_nist:`2023-23004`, :cve_nist:`2023-23005`, :cve_nist:`2023-23006`, :cve_nist:`2023-23454`, :cve_nist:`2023-23455`, :cve_nist:`2023-23559`, :cve_nist:`2023-2483`, :cve_nist:`2023-25012`, :cve_nist:`2023-2513`, :cve_nist:`2023-25775`, :cve_nist:`2023-2598`, :cve_nist:`2023-26544`, :cve_nist:`2023-26545`, :cve_nist:`2023-26605`, :cve_nist:`2023-26606`, :cve_nist:`2023-26607`, :cve_nist:`2023-28327`, :cve_nist:`2023-28328`, :cve_nist:`2023-28410`, :cve_nist:`2023-28464`, :cve_nist:`2023-28466`, :cve_nist:`2023-2860`, :cve_nist:`2023-28772`, :cve_nist:`2023-28866`, :cve_nist:`2023-2898`, :cve_nist:`2023-2985`, :cve_nist:`2023-3006`, :cve_nist:`2
 023-30456`, :cve_nist:`2023-30772`, :cve_nist:`2023-3090`, :cve_nist:`2023-3106`, :cve_nist:`2023-3111`, :cve_nist:`2023-3117`, :cve_nist:`2023-31248`, :cve_nist:`2023-3141`, :cve_nist:`2023-31436`, :cve_nist:`2023-3159`, :cve_nist:`2023-3161`, :cve_nist:`2023-3212`, :cve_nist:`2023-3220`, :cve_nist:`2023-32233`, :cve_nist:`2023-32247`, :cve_nist:`2023-32248`, :cve_nist:`2023-32250`, :cve_nist:`2023-32252`, :cve_nist:`2023-32254`, :cve_nist:`2023-32257`, :cve_nist:`2023-32258`, :cve_nist:`2023-32269`, :cve_nist:`2023-3268`, :cve_nist:`2023-3269`, :cve_nist:`2023-3312`, :cve_nist:`2023-3317`, :cve_nist:`2023-33203`, :cve_nist:`2023-33250`, :cve_nist:`2023-33288`, :cve_nist:`2023-3338`, :cve_nist:`2023-3355`, :cve_nist:`2023-3357`, :cve_nist:`2023-3358`, :cve_nist:`2023-3359`, :cve_nist:`2023-3390`, :cve_nist:`2023-33951`, :cve_nist:`2023-33952`, :cve_nist:`2023-34255`, :cve_nist:`2023-34256`, :cve_nist:`2023-34319`, :cve_nist:`2023-3439`, :cve_nist:`2023-35001`, :cve_nist:`2023-3567`
 , :cve_nist:`2023-35788`, :cve_nist:`2023-35823`, :cve_nist:`2023-35824`, :cve_nist:`2023-35826`, :cve_nist:`2023-35828`, :cve_nist:`2023-35829`, :cve_nist:`2023-3609`, :cve_nist:`2023-3610`, :cve_nist:`2023-3611`, :cve_nist:`2023-37453`, :cve_nist:`2023-3772`, :cve_nist:`2023-3773`, :cve_nist:`2023-3776`, :cve_nist:`2023-3777`, :cve_nist:`2023-3812`, :cve_nist:`2023-38409`, :cve_nist:`2023-38426`, :cve_nist:`2023-38427`, :cve_nist:`2023-38428`, :cve_nist:`2023-38429`, :cve_nist:`2023-38430`, :cve_nist:`2023-38431`, :cve_nist:`2023-38432`, :cve_nist:`2023-3863`, :cve_mitre:`2023-3865`, :cve_mitre:`2023-3866`, :cve_mitre:`2023-3867`, :cve_nist:`2023-39189`, :cve_nist:`2023-39192`, :cve_nist:`2023-39193`, :cve_nist:`2023-39194`, :cve_nist:`2023-4004`, :cve_nist:`2023-4015`, :cve_nist:`2023-40283`, :cve_nist:`2023-4128`, :cve_nist:`2023-4132`, :cve_nist:`2023-4147`, :cve_nist:`2023-4155`, :cve_nist:`2023-4194`, :cve_nist:`2023-4206`, :cve_nist:`2023-4207`, :cve_nist:`2023-4208`, :cve_n
 ist:`2023-4273`, :cve_nist:`2023-42752`, :cve_nist:`2023-42753`, :cve_nist:`2023-42755`, :cve_nist:`2023-42756`, :cve_nist:`2023-4385`, :cve_nist:`2023-4387`, :cve_nist:`2023-4389`, :cve_nist:`2023-4394`, :cve_nist:`2023-44466`, :cve_nist:`2023-4459`, :cve_nist:`2023-4569`, :cve_nist:`2023-45862`, :cve_nist:`2023-45871`, :cve_nist:`2023-4611`, :cve_nist:`2023-4623`, :cve_nist:`2023-4732`, :cve_nist:`2023-4921` and :cve_nist:`2023-5345`
+-  linux-yocto/5.15: Ignore :cve_nist:`2022-45886`, :cve_nist:`2022-45887`, :cve_nist:`2022-45919`, :cve_nist:`2022-48502`, :cve_nist:`2023-0160`, :cve_nist:`2023-1206`, :cve_nist:`2023-20593`, :cve_nist:`2023-21264`, :cve_nist:`2023-2898`, :cve_nist:`2023-31248`, :cve_nist:`2023-33250`, :cve_nist:`2023-34319`, :cve_nist:`2023-35001`, :cve_nist:`2023-3611`, :cve_nist:`2023-37453`, :cve_nist:`2023-3773`, :cve_nist:`2023-3776`, :cve_nist:`2023-3777`, :cve_nist:`2023-38432`, :cve_nist:`2023-3863`, :cve_mitre:`2023-3865`, :cve_mitre:`2023-3866`, :cve_nist:`2023-4004`, :cve_nist:`2023-4015`, :cve_nist:`2023-4132`, :cve_nist:`2023-4147`, :cve_nist:`2023-4194`, :cve_nist:`2023-4385`, :cve_nist:`2023-4387`, :cve_nist:`2023-4389`, :cve_nist:`2023-4394`, :cve_nist:`2023-4459` and :cve_nist:`2023-4611`
+-  openssl: Fix :cve_nist:`2023-4807` and :cve_nist:`2023-5363`
+-  python3-git: Fix :cve_nist:`2023-40590` and :cve_nist:`2023-41040`
+-  python3-urllib3: Fix :cve_nist:`2023-43804`
+-  qemu: Ignore :cve_nist:`2023-2680`
+-  ruby: Fix :cve_nist:`2023-36617`
 -  shadow: Fix :cve_mitre:`2023-4641`
--  tiff: Fix :cve:`2023-3576` and :cve:`2023-40745`
--  vim: Fix :cve:`2023-5441` and :cve:`2023-5535`
--  webkitgtk: Fix :cve:`2023-32439`
--  xdg-utils: Fix :cve:`2022-4055`
--  xserver-xorg: ignore :cve:`2022-3553` (XQuartz-specific)
--  zlib: Fix :cve:`2023-45853`
+-  tiff: Fix :cve_nist:`2023-3576` and :cve_nist:`2023-40745`
+-  vim: Fix :cve_nist:`2023-5441` and :cve_nist:`2023-5535`
+-  webkitgtk: Fix :cve_nist:`2023-32439`
+-  xdg-utils: Fix :cve_nist:`2022-4055`
+-  xserver-xorg: ignore :cve_nist:`2022-3553` (XQuartz-specific)
+-  zlib: Fix :cve_nist:`2023-45853`
 
 
 
diff --git a/documentation/migration-guides/release-notes-4.0.15.rst b/documentation/migration-guides/release-notes-4.0.15.rst
index b2731530e84a6682d495e829454fabd32abd8296..e05cd6f143a9e7ee05c05f55a645ea37eb79b8fd 100644
--- a/documentation/migration-guides/release-notes-4.0.15.rst
+++ b/documentation/migration-guides/release-notes-4.0.15.rst
@@ -6,24 +6,24 @@ Release notes for Yocto-4.0.15 (Kirkstone)
 Security Fixes in Yocto-4.0.15
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  avahi: Fix :cve:`2023-1981`, :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, :cve:`2023-38472` and :cve:`2023-38473`
--  binutils: Fix :cve:`2022-47007`, :cve:`2022-47010` and :cve:`2022-48064`
--  bluez5: Fix :cve:`2023-45866`
--  ghostscript: Ignore GhostPCL :cve:`2023-38560`
--  gnutls: Fix :cve:`2023-5981`
--  go: Ignore :cve:`2023-45283` and :cve:`2023-45284`
--  grub: Fix :cve:`2023-4692` and :cve:`2023-4693`
+-  avahi: Fix :cve_nist:`2023-1981`, :cve_nist:`2023-38469`, :cve_nist:`2023-38470`, :cve_nist:`2023-38471`, :cve_nist:`2023-38472` and :cve_nist:`2023-38473`
+-  binutils: Fix :cve_nist:`2022-47007`, :cve_nist:`2022-47010` and :cve_nist:`2022-48064`
+-  bluez5: Fix :cve_nist:`2023-45866`
+-  ghostscript: Ignore GhostPCL :cve_nist:`2023-38560`
+-  gnutls: Fix :cve_nist:`2023-5981`
+-  go: Ignore :cve_nist:`2023-45283` and :cve_nist:`2023-45284`
+-  grub: Fix :cve_nist:`2023-4692` and :cve_nist:`2023-4693`
 -  gstreamer1.0-plugins-bad: Fix :cve_mitre:`2023-44429`
--  libsndfile: Fix :cve:`2022-33065`
--  libwebp: Fix :cve:`2023-4863`
--  openssl: Fix :cve:`2023-5678`
--  python3-cryptography: Fix :cve:`2023-49083`
--  qemu: Fix :cve:`2023-1544`
--  sudo: :cve:`2023-42456` and :cve_mitre:`2023-42465`
--  tiff: Fix :cve:`2023-41175`
--  vim: Fix :cve:`2023-46246`, :cve:`2023-48231`, :cve:`2023-48232`, :cve:`2023-48233`, :cve:`2023-48234`, :cve:`2023-48235`, :cve:`2023-48236`, :cve:`2023-48237` and :cve:`2023-48706`
--  xserver-xorg: Fix :cve:`2023-5367` and :cve:`2023-5380`
--  xwayland: Fix :cve:`2023-5367`
+-  libsndfile: Fix :cve_nist:`2022-33065`
+-  libwebp: Fix :cve_nist:`2023-4863`
+-  openssl: Fix :cve_nist:`2023-5678`
+-  python3-cryptography: Fix :cve_nist:`2023-49083`
+-  qemu: Fix :cve_nist:`2023-1544`
+-  sudo: :cve_nist:`2023-42456` and :cve_mitre:`2023-42465`
+-  tiff: Fix :cve_nist:`2023-41175`
+-  vim: Fix :cve_nist:`2023-46246`, :cve_nist:`2023-48231`, :cve_nist:`2023-48232`, :cve_nist:`2023-48233`, :cve_nist:`2023-48234`, :cve_nist:`2023-48235`, :cve_nist:`2023-48236`, :cve_nist:`2023-48237` and :cve_nist:`2023-48706`
+-  xserver-xorg: Fix :cve_nist:`2023-5367` and :cve_nist:`2023-5380`
+-  xwayland: Fix :cve_nist:`2023-5367`
 
 
 Fixes in Yocto-4.0.15
diff --git a/documentation/migration-guides/release-notes-4.0.16.rst b/documentation/migration-guides/release-notes-4.0.16.rst
index 0eb31832abab5f02366aec8b24f1b0738ac9113f..dea5b4c2bff294116766794caba1c06ec0043206 100644
--- a/documentation/migration-guides/release-notes-4.0.16.rst
+++ b/documentation/migration-guides/release-notes-4.0.16.rst
@@ -8,22 +8,22 @@ Security Fixes in Yocto-4.0.16
 
 -  cpio: Fix :cve_mitre:`2023-7207`
 -  curl: Revert "curl: Backport fix CVE-2023-32001"
--  curl: Fix :cve:`2023-46218`
--  dropbear:Fix :cve:`2023-48795`
--  ffmpeg: Fix :cve:`2022-3964` and :cve:`2022-3965`
--  ghostscript: Fix :cve:`2023-46751`
--  gnutls: Fix :cve:`2024-0553` and :cve:`2024-0567`
--  go: Fix :cve:`2023-39326`
--  openssh: Fix :cve:`2023-48795`, :cve:`2023-51384` and :cve:`2023-51385`
--  openssl: Fix :cve:`2023-6129` and :cve_mitre:`2023-6237`
+-  curl: Fix :cve_nist:`2023-46218`
+-  dropbear:Fix :cve_nist:`2023-48795`
+-  ffmpeg: Fix :cve_nist:`2022-3964` and :cve_nist:`2022-3965`
+-  ghostscript: Fix :cve_nist:`2023-46751`
+-  gnutls: Fix :cve_nist:`2024-0553` and :cve_nist:`2024-0567`
+-  go: Fix :cve_nist:`2023-39326`
+-  openssh: Fix :cve_nist:`2023-48795`, :cve_nist:`2023-51384` and :cve_nist:`2023-51385`
+-  openssl: Fix :cve_nist:`2023-6129` and :cve_mitre:`2023-6237`
 -  pam: Fix :cve_mitre:`2024-22365`
--  perl: Fix :cve:`2023-47038`
--  qemu: Fix :cve:`2023-5088`
--  sqlite3: Fix :cve:`2023-7104`
--  systemd: Fix :cve:`2023-7008`
--  tiff: Fix :cve:`2023-6228`
--  xserver-xorg: Fix :cve:`2023-6377`, :cve:`2023-6478`, :cve:`2023-6816`, :cve_mitre:`2024-0229`, :cve:`2024-0408`, :cve:`2024-0409`, :cve_mitre:`2024-21885` and :cve_mitre:`2024-21886`
--  zlib: Ignore :cve:`2023-6992`
+-  perl: Fix :cve_nist:`2023-47038`
+-  qemu: Fix :cve_nist:`2023-5088`
+-  sqlite3: Fix :cve_nist:`2023-7104`
+-  systemd: Fix :cve_nist:`2023-7008`
+-  tiff: Fix :cve_nist:`2023-6228`
+-  xserver-xorg: Fix :cve_nist:`2023-6377`, :cve_nist:`2023-6478`, :cve_nist:`2023-6816`, :cve_mitre:`2024-0229`, :cve_nist:`2024-0408`, :cve_nist:`2024-0409`, :cve_mitre:`2024-21885` and :cve_mitre:`2024-21886`
+-  zlib: Ignore :cve_nist:`2023-6992`
 
 
 Fixes in Yocto-4.0.16
diff --git a/documentation/migration-guides/release-notes-4.0.17.rst b/documentation/migration-guides/release-notes-4.0.17.rst
index 07242584b8bf8d3231e1eec9b76e7b384895be0a..e917dc9bf81b558fbab445eaa2ab781b2842bc41 100644
--- a/documentation/migration-guides/release-notes-4.0.17.rst
+++ b/documentation/migration-guides/release-notes-4.0.17.rst
@@ -6,27 +6,27 @@ Release notes for Yocto-4.0.17 (Kirkstone)
 Security Fixes in Yocto-4.0.17
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2023-4408`, :cve:`2023-5517`, :cve:`2023-5679`, :cve:`2023-50868` and :cve:`2023-50387`
--  binutils: Fix :cve:`2023-39129` and :cve:`2023-39130`
--  curl: Fix :cve:`2023-46219`
--  curl: Ignore :cve:`2023-42915`
--  gcc: Ignore :cve:`2023-4039`
--  gdb: Fix :cve:`2023-39129` and :cve:`2023-39130`
--  glibc: Ignore :cve:`2023-0687`
--  go: Fix :cve:`2023-29406`, :cve:`2023-45285`, :cve:`2023-45287`, :cve:`2023-45289`, :cve:`2023-45290`, :cve:`2024-24784` and :cve:`2024-24785`
--  less: Fix :cve:`2022-48624`
--  libgit2: Fix :cve:`2024-24575` and :cve:`2024-24577`
--  libuv: fix :cve:`2024-24806`
--  libxml2: Fix for :cve:`2024-25062`
--  linux-yocto/5.15: Fix :cve:`2022-36402`, :cve:`2022-40982`, :cve:`2022-47940`, :cve:`2023-1193`, :cve:`2023-1194`, :cve:`2023-3772`, :cve_mitre:`2023-3867`, :cve:`2023-4128`, :cve:`2023-4206`, :cve:`2023-4207`, :cve:`2023-4208`, :cve:`2023-4244`, :cve:`2023-4273`, :cve:`2023-4563`, :cve:`2023-4569`, :cve:`2023-4623`, :cve:`2023-4881`, :cve:`2023-4921`, :cve:`2023-5158`, :cve:`2023-5717`, :cve:`2023-6040`, :cve:`2023-6121`, :cve:`2023-6176`, :cve:`2023-6546`, :cve:`2023-6606`, :cve:`2023-6622`, :cve:`2023-6817`, :cve:`2023-6915`, :cve:`2023-6931`, :cve:`2023-6932`, :cve:`2023-20569`, :cve:`2023-20588`, :cve:`2023-25775`, :cve:`2023-31085`, :cve:`2023-32247`, :cve:`2023-32250`, :cve:`2023-32252`, :cve:`2023-32254`, :cve:`2023-32257`, :cve:`2023-32258`, :cve:`2023-34324`, :cve:`2023-35827`, :cve:`2023-38427`, :cve:`2023-38430`, :cve:`2023-38431`, :cve:`2023-39189`, :cve:`2023-39192`, :cve:`2023-39193`, :cve:`2023-39194`, :cve:`2023-39198`, :cve:`2023-40283`, :cve:`2023-42752`, :cve:
 `2023-42753`, :cve:`2023-42754`, :cve:`2023-42755`, :cve:`2023-45871`, :cve:`2023-46343`, :cve:`2023-46813`, :cve:`2023-46838`, :cve:`2023-46862`, :cve:`2023-51042`, :cve:`2023-51779`, :cve_mitre:`2023-52340`, :cve:`2023-52429`, :cve:`2023-52435`, :cve:`2023-52436`, :cve:`2023-52438`, :cve:`2023-52439`, :cve:`2023-52441`, :cve:`2023-52442`, :cve:`2023-52443`, :cve:`2023-52444`, :cve:`2023-52445`, :cve:`2023-52448`, :cve:`2023-52449`, :cve:`2023-52451`, :cve:`2023-52454`, :cve:`2023-52456`, :cve:`2023-52457`, :cve:`2023-52458`, :cve:`2023-52463`, :cve:`2023-52464`, :cve:`2024-0340`, :cve:`2024-0584`, :cve:`2024-0607`, :cve:`2024-0641`, :cve:`2024-0646`, :cve:`2024-1085`, :cve:`2024-1086`, :cve:`2024-1151`, :cve:`2024-22705`, :cve:`2024-23849`, :cve:`2024-23850`, :cve:`2024-23851`, :cve:`2024-24860`, :cve:`2024-26586`, :cve:`2024-26589`, :cve:`2024-26591`, :cve:`2024-26592`, :cve:`2024-26593`, :cve:`2024-26594`, :cve:`2024-26597` and :cve:`2024-26598`
--  linux-yocto/5.15: Ignore :cve:`2020-27418`, :cve:`2020-36766`, :cve:`2021-33630`, :cve:`2021-33631`, :cve:`2022-48619`, :cve:`2023-2430`, :cve:`2023-4610`, :cve:`2023-4732`, :cve:`2023-5090`, :cve:`2023-5178`, :cve:`2023-5197`, :cve:`2023-5345`, :cve:`2023-5633`, :cve:`2023-5972`, :cve:`2023-6111`, :cve:`2023-6200`, :cve:`2023-6531`, :cve:`2023-6679`, :cve:`2023-7192`, :cve:`2023-40791`, :cve:`2023-42756`, :cve:`2023-44466`, :cve:`2023-45862`, :cve:`2023-45863`, :cve:`2023-45898`, :cve:`2023-51043`, :cve:`2023-51780`, :cve:`2023-51781`, :cve:`2023-51782`, :cve:`2023-52433`, :cve:`2023-52440`, :cve:`2023-52446`, :cve:`2023-52450`, :cve:`2023-52453`, :cve:`2023-52455`, :cve:`2023-52459`, :cve:`2023-52460`, :cve:`2023-52461`, :cve:`2023-52462`, :cve:`2024-0193`, :cve:`2024-0443`, :cve:`2024-0562`, :cve:`2024-0582`, :cve:`2024-0639`, :cve:`2024-0775`, :cve:`2024-26581`, :cve:`2024-26582`, :cve:`2024-26590`, :cve:`2024-26596` and :cve:`2024-26599`
--  linux-yocto/5.10: Fix :cve:`2023-6040`, :cve:`2023-6121`, :cve:`2023-6606`, :cve:`2023-6817`, :cve:`2023-6915`, :cve:`2023-6931`, :cve:`2023-6932`, :cve:`2023-39198`, :cve:`2023-46838`, :cve:`2023-51779`, :cve:`2023-51780`, :cve:`2023-51781`, :cve:`2023-51782`, :cve_mitre:`2023-52340`, :cve:`2024-0584` and :cve:`2024-0646`
--  linux-yocto/5.10: Ignore :cve:`2021-33630`, :cve:`2021-33631`, :cve:`2022-1508`, :cve:`2022-36402`, :cve:`2022-48619`, :cve:`2023-2430`, :cve:`2023-4610`, :cve:`2023-5972`, :cve:`2023-6039`, :cve:`2023-6200`, :cve:`2023-6531`, :cve:`2023-6546`, :cve:`2023-6622`, :cve:`2023-6679`, :cve:`2023-7192`, :cve:`2023-46343`, :cve:`2023-51042`, :cve:`2023-51043`, :cve:`2024-0193`, :cve:`2024-0443`, :cve:`2024-0562`, :cve:`2024-0582`, :cve:`2024-0639`, :cve:`2024-0641`, :cve:`2024-0775`, :cve:`2024-1085` and :cve:`2024-22705`
--  openssl: Fix :cve:`2024-0727`
--  python3-pycryptodome: Fix :cve:`2023-52323`
--  qemu: Fix :cve:`2023-6693`, :cve:`2023-42467` and :cve:`2024-24474`
--  vim: Fix :cve:`2024-22667`
--  xwayland: Fix :cve:`2023-6377` and :cve:`2023-6478`
+-  bind: Fix :cve_nist:`2023-4408`, :cve_nist:`2023-5517`, :cve_nist:`2023-5679`, :cve_nist:`2023-50868` and :cve_nist:`2023-50387`
+-  binutils: Fix :cve_nist:`2023-39129` and :cve_nist:`2023-39130`
+-  curl: Fix :cve_nist:`2023-46219`
+-  curl: Ignore :cve_nist:`2023-42915`
+-  gcc: Ignore :cve_nist:`2023-4039`
+-  gdb: Fix :cve_nist:`2023-39129` and :cve_nist:`2023-39130`
+-  glibc: Ignore :cve_nist:`2023-0687`
+-  go: Fix :cve_nist:`2023-29406`, :cve_nist:`2023-45285`, :cve_nist:`2023-45287`, :cve_nist:`2023-45289`, :cve_nist:`2023-45290`, :cve_nist:`2024-24784` and :cve_nist:`2024-24785`
+-  less: Fix :cve_nist:`2022-48624`
+-  libgit2: Fix :cve_nist:`2024-24575` and :cve_nist:`2024-24577`
+-  libuv: fix :cve_nist:`2024-24806`
+-  libxml2: Fix for :cve_nist:`2024-25062`
+-  linux-yocto/5.15: Fix :cve_nist:`2022-36402`, :cve_nist:`2022-40982`, :cve_nist:`2022-47940`, :cve_nist:`2023-1193`, :cve_nist:`2023-1194`, :cve_nist:`2023-3772`, :cve_mitre:`2023-3867`, :cve_nist:`2023-4128`, :cve_nist:`2023-4206`, :cve_nist:`2023-4207`, :cve_nist:`2023-4208`, :cve_nist:`2023-4244`, :cve_nist:`2023-4273`, :cve_nist:`2023-4563`, :cve_nist:`2023-4569`, :cve_nist:`2023-4623`, :cve_nist:`2023-4881`, :cve_nist:`2023-4921`, :cve_nist:`2023-5158`, :cve_nist:`2023-5717`, :cve_nist:`2023-6040`, :cve_nist:`2023-6121`, :cve_nist:`2023-6176`, :cve_nist:`2023-6546`, :cve_nist:`2023-6606`, :cve_nist:`2023-6622`, :cve_nist:`2023-6817`, :cve_nist:`2023-6915`, :cve_nist:`2023-6931`, :cve_nist:`2023-6932`, :cve_nist:`2023-20569`, :cve_nist:`2023-20588`, :cve_nist:`2023-25775`, :cve_nist:`2023-31085`, :cve_nist:`2023-32247`, :cve_nist:`2023-32250`, :cve_nist:`2023-32252`, :cve_nist:`2023-32254`, :cve_nist:`2023-32257`, :cve_nist:`2023-32258`, :cve_nist:`2023-34324`, :cve_nist:`202
 3-35827`, :cve_nist:`2023-38427`, :cve_nist:`2023-38430`, :cve_nist:`2023-38431`, :cve_nist:`2023-39189`, :cve_nist:`2023-39192`, :cve_nist:`2023-39193`, :cve_nist:`2023-39194`, :cve_nist:`2023-39198`, :cve_nist:`2023-40283`, :cve_nist:`2023-42752`, :cve_nist:`2023-42753`, :cve_nist:`2023-42754`, :cve_nist:`2023-42755`, :cve_nist:`2023-45871`, :cve_nist:`2023-46343`, :cve_nist:`2023-46813`, :cve_nist:`2023-46838`, :cve_nist:`2023-46862`, :cve_nist:`2023-51042`, :cve_nist:`2023-51779`, :cve_mitre:`2023-52340`, :cve_nist:`2023-52429`, :cve_nist:`2023-52435`, :cve_nist:`2023-52436`, :cve_nist:`2023-52438`, :cve_nist:`2023-52439`, :cve_nist:`2023-52441`, :cve_nist:`2023-52442`, :cve_nist:`2023-52443`, :cve_nist:`2023-52444`, :cve_nist:`2023-52445`, :cve_nist:`2023-52448`, :cve_nist:`2023-52449`, :cve_nist:`2023-52451`, :cve_nist:`2023-52454`, :cve_nist:`2023-52456`, :cve_nist:`2023-52457`, :cve_nist:`2023-52458`, :cve_nist:`2023-52463`, :cve_nist:`2023-52464`, :cve_nist:`2024-0340`, :cv
 e_nist:`2024-0584`, :cve_nist:`2024-0607`, :cve_nist:`2024-0641`, :cve_nist:`2024-0646`, :cve_nist:`2024-1085`, :cve_nist:`2024-1086`, :cve_nist:`2024-1151`, :cve_nist:`2024-22705`, :cve_nist:`2024-23849`, :cve_nist:`2024-23850`, :cve_nist:`2024-23851`, :cve_nist:`2024-24860`, :cve_nist:`2024-26586`, :cve_nist:`2024-26589`, :cve_nist:`2024-26591`, :cve_nist:`2024-26592`, :cve_nist:`2024-26593`, :cve_nist:`2024-26594`, :cve_nist:`2024-26597` and :cve_nist:`2024-26598`
+-  linux-yocto/5.15: Ignore :cve_nist:`2020-27418`, :cve_nist:`2020-36766`, :cve_nist:`2021-33630`, :cve_nist:`2021-33631`, :cve_nist:`2022-48619`, :cve_nist:`2023-2430`, :cve_nist:`2023-4610`, :cve_nist:`2023-4732`, :cve_nist:`2023-5090`, :cve_nist:`2023-5178`, :cve_nist:`2023-5197`, :cve_nist:`2023-5345`, :cve_nist:`2023-5633`, :cve_nist:`2023-5972`, :cve_nist:`2023-6111`, :cve_nist:`2023-6200`, :cve_nist:`2023-6531`, :cve_nist:`2023-6679`, :cve_nist:`2023-7192`, :cve_nist:`2023-40791`, :cve_nist:`2023-42756`, :cve_nist:`2023-44466`, :cve_nist:`2023-45862`, :cve_nist:`2023-45863`, :cve_nist:`2023-45898`, :cve_nist:`2023-51043`, :cve_nist:`2023-51780`, :cve_nist:`2023-51781`, :cve_nist:`2023-51782`, :cve_nist:`2023-52433`, :cve_nist:`2023-52440`, :cve_nist:`2023-52446`, :cve_nist:`2023-52450`, :cve_nist:`2023-52453`, :cve_nist:`2023-52455`, :cve_nist:`2023-52459`, :cve_nist:`2023-52460`, :cve_nist:`2023-52461`, :cve_nist:`2023-52462`, :cve_nist:`2024-0193`, :cve_nist:`2024-0443`, :
 cve_nist:`2024-0562`, :cve_nist:`2024-0582`, :cve_nist:`2024-0639`, :cve_nist:`2024-0775`, :cve_nist:`2024-26581`, :cve_nist:`2024-26582`, :cve_nist:`2024-26590`, :cve_nist:`2024-26596` and :cve_nist:`2024-26599`
+-  linux-yocto/5.10: Fix :cve_nist:`2023-6040`, :cve_nist:`2023-6121`, :cve_nist:`2023-6606`, :cve_nist:`2023-6817`, :cve_nist:`2023-6915`, :cve_nist:`2023-6931`, :cve_nist:`2023-6932`, :cve_nist:`2023-39198`, :cve_nist:`2023-46838`, :cve_nist:`2023-51779`, :cve_nist:`2023-51780`, :cve_nist:`2023-51781`, :cve_nist:`2023-51782`, :cve_mitre:`2023-52340`, :cve_nist:`2024-0584` and :cve_nist:`2024-0646`
+-  linux-yocto/5.10: Ignore :cve_nist:`2021-33630`, :cve_nist:`2021-33631`, :cve_nist:`2022-1508`, :cve_nist:`2022-36402`, :cve_nist:`2022-48619`, :cve_nist:`2023-2430`, :cve_nist:`2023-4610`, :cve_nist:`2023-5972`, :cve_nist:`2023-6039`, :cve_nist:`2023-6200`, :cve_nist:`2023-6531`, :cve_nist:`2023-6546`, :cve_nist:`2023-6622`, :cve_nist:`2023-6679`, :cve_nist:`2023-7192`, :cve_nist:`2023-46343`, :cve_nist:`2023-51042`, :cve_nist:`2023-51043`, :cve_nist:`2024-0193`, :cve_nist:`2024-0443`, :cve_nist:`2024-0562`, :cve_nist:`2024-0582`, :cve_nist:`2024-0639`, :cve_nist:`2024-0641`, :cve_nist:`2024-0775`, :cve_nist:`2024-1085` and :cve_nist:`2024-22705`
+-  openssl: Fix :cve_nist:`2024-0727`
+-  python3-pycryptodome: Fix :cve_nist:`2023-52323`
+-  qemu: Fix :cve_nist:`2023-6693`, :cve_nist:`2023-42467` and :cve_nist:`2024-24474`
+-  vim: Fix :cve_nist:`2024-22667`
+-  xwayland: Fix :cve_nist:`2023-6377` and :cve_nist:`2023-6478`
 
 
 Fixes in Yocto-4.0.17
diff --git a/documentation/migration-guides/release-notes-4.0.18.rst b/documentation/migration-guides/release-notes-4.0.18.rst
index d5a2a7f6ce402aae49dd8a7a012f6505e60a0c65..624aae127ba4f48e4a9f9df7e8f20552ae3d1b42 100644
--- a/documentation/migration-guides/release-notes-4.0.18.rst
+++ b/documentation/migration-guides/release-notes-4.0.18.rst
@@ -6,22 +6,22 @@ Release notes for Yocto-4.0.18 (Kirkstone)
 Security Fixes in Yocto-4.0.18
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  curl: Fix :cve:`2024-2398`
--  expat: fix :cve:`2023-52426` and :cve:`2024-28757`
--  libssh2: fix :cve:`2023-48795`
--  ncurses: Fix :cve:`2023-50495`
--  nghttp2: Fix :cve:`2024-28182` and :cve:`2023-44487`
--  openssh: Ignore :cve:`2023-51767`
--  openssl: Fix :cve:`2024-2511`
--  perl: Ignore :cve:`2023-47100`
--  python3-cryptography: Fix :cve:`2024-26130`
--  python3-urllib3: Fix :cve:`2023-45803`
--  qemu: Fix :cve:`2023-6683`
+-  curl: Fix :cve_nist:`2024-2398`
+-  expat: fix :cve_nist:`2023-52426` and :cve_nist:`2024-28757`
+-  libssh2: fix :cve_nist:`2023-48795`
+-  ncurses: Fix :cve_nist:`2023-50495`
+-  nghttp2: Fix :cve_nist:`2024-28182` and :cve_nist:`2023-44487`
+-  openssh: Ignore :cve_nist:`2023-51767`
+-  openssl: Fix :cve_nist:`2024-2511`
+-  perl: Ignore :cve_nist:`2023-47100`
+-  python3-cryptography: Fix :cve_nist:`2024-26130`
+-  python3-urllib3: Fix :cve_nist:`2023-45803`
+-  qemu: Fix :cve_nist:`2023-6683`
 -  ruby: fix :cve_mitre:`2024-27281`
--  rust: Ignore :cve:`2024-24576`
--  tiff: Fix :cve:`2023-52356` and :cve:`2023-6277`
--  xserver-xorg: Fix :cve:`2024-31080` and :cve:`2024-31081`
--  xwayland: Fix :cve:`2023-6816`, :cve:`2024-0408` and :cve:`2024-0409`
+-  rust: Ignore :cve_nist:`2024-24576`
+-  tiff: Fix :cve_nist:`2023-52356` and :cve_nist:`2023-6277`
+-  xserver-xorg: Fix :cve_nist:`2024-31080` and :cve_nist:`2024-31081`
+-  xwayland: Fix :cve_nist:`2023-6816`, :cve_nist:`2024-0408` and :cve_nist:`2024-0409`
 
 
 Fixes in Yocto-4.0.18
@@ -31,7 +31,7 @@ Fixes in Yocto-4.0.18
 -  common-licenses: backport LGPL-3.0-with-zeromq-exception license
 -  contributor-guide: add notes for tests
 -  contributor-guide: be more specific about meta-* trees
--  cups: fix typo in :cve:`2023-32360` backport patch
+-  cups: fix typo in :cve_nist:`2023-32360` backport patch
 -  cve-update-nvd2-native: Add an age threshold for incremental update
 -  cve-update-nvd2-native: Fix CVE configuration update
 -  cve-update-nvd2-native: Fix typo in comment
diff --git a/documentation/migration-guides/release-notes-4.0.19.rst b/documentation/migration-guides/release-notes-4.0.19.rst
index 5dcc977252426611988b855d451323e1f4bfa3a9..e363f05d7d26fca78a91459a3b2432605e754ba4 100644
--- a/documentation/migration-guides/release-notes-4.0.19.rst
+++ b/documentation/migration-guides/release-notes-4.0.19.rst
@@ -6,30 +6,30 @@ Release notes for Yocto-4.0.19 (Kirkstone)
 Security Fixes in Yocto-4.0.19
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bluez5: Fix :cve:`2023-27349`, :cve:`2023-50229` and :cve:`2023-50230`
--  ghostscript: Fix :cve:`2023-52722`, :cve_mitre:`2024-29510`, :cve_mitre:`2024-33869`, :cve_mitre:`2024-33870` and :cve_mitre:`2024-33871`
--  git: Fix :cve:`2024-32002`, :cve:`2024-32004`, :cve:`2024-32020`, :cve:`2024-32021` and :cve:`2024-32465`
--  glibc: Fix :cve:`2024-2961`, :cve:`2024-33599`, :cve:`2024-33600`, :cve:`2024-33601` and :cve:`2024-33602`
--  gnutls: Fix :cve:`2024-28834` and :cve:`2024-28835`
--  go: Fix :cve:`2023-45288`
--  gstreamer1.0-plugins-bad: Fix :cve:`2023-44446`, :cve:`2023-50186` and :cve_mitre:`2024-0444`
--  less: Fix :cve:`2024-32487`
--  libarchive: Fix :cve:`2024-26256`
+-  bluez5: Fix :cve_nist:`2023-27349`, :cve_nist:`2023-50229` and :cve_nist:`2023-50230`
+-  ghostscript: Fix :cve_nist:`2023-52722`, :cve_mitre:`2024-29510`, :cve_mitre:`2024-33869`, :cve_mitre:`2024-33870` and :cve_mitre:`2024-33871`
+-  git: Fix :cve_nist:`2024-32002`, :cve_nist:`2024-32004`, :cve_nist:`2024-32020`, :cve_nist:`2024-32021` and :cve_nist:`2024-32465`
+-  glibc: Fix :cve_nist:`2024-2961`, :cve_nist:`2024-33599`, :cve_nist:`2024-33600`, :cve_nist:`2024-33601` and :cve_nist:`2024-33602`
+-  gnutls: Fix :cve_nist:`2024-28834` and :cve_nist:`2024-28835`
+-  go: Fix :cve_nist:`2023-45288`
+-  gstreamer1.0-plugins-bad: Fix :cve_nist:`2023-44446`, :cve_nist:`2023-50186` and :cve_mitre:`2024-0444`
+-  less: Fix :cve_nist:`2024-32487`
+-  libarchive: Fix :cve_nist:`2024-26256`
 -  libarchive: Fix multiple null deference and heap overflow in pax writer (no CVE assigned)
--  linux-yocto/5.15: Fix :cve:`2023-6270`, :cve:`2023-7042`, :cve:`2023-52447`, :cve:`2023-52620`, :cve:`2024-22099`, :cve:`2024-26622`, :cve:`2024-26651`, :cve:`2024-26659`, :cve:`2024-26688`, :cve:`2024-26782`, :cve:`2024-26787`, :cve:`2024-26788`, :cve:`2024-26790`, :cve:`2024-26791`, :cve:`2024-26793`, :cve:`2024-26795`, :cve:`2024-26798`, :cve:`2024-26801`, :cve:`2024-26802`, :cve:`2024-26803`, :cve:`2024-26804`, :cve:`2024-26805` and :cve:`2024-26809`
--  linux-yocto/5.15: Ignore :cve:`2019-25160`, :cve:`2019-25162`, :cve:`2020-36775`, :cve:`2020-36776`, :cve:`2020-36777`, :cve:`2020-36778`, :cve:`2020-36779`, :cve:`2020-36780`, :cve:`2020-36781`, :cve:`2020-36782`, :cve:`2020-36783`, :cve:`2020-36784`, :cve:`2020-36785`, :cve:`2020-36786`, :cve:`2020-36787`, :cve:`2021-46904`, :cve:`2021-46905`, :cve:`2021-46906`, :cve:`2021-46908`, :cve:`2021-46909`, :cve:`2021-46910`, :cve:`2021-46911`, :cve:`2021-46912`, :cve:`2021-46913`, :cve:`2021-46914`, :cve:`2021-46915`, :cve:`2021-46916`, :cve:`2021-46917`, :cve:`2021-46918`, :cve:`2021-46919`, :cve:`2021-46920`, :cve:`2021-46921`, :cve:`2021-46922`, :cve:`2021-46923`, :cve:`2021-46924`, :cve:`2021-46925`, :cve:`2021-46926`, :cve:`2021-46927`, :cve:`2021-46928`, :cve:`2021-46929`, :cve:`2021-46930`, :cve:`2021-46931`, :cve:`2021-46932`, :cve:`2021-46933`, :cve:`2021-46934`, :cve:`2021-46935`, :cve:`2021-46936`, :cve:`2021-46937`, :cve:`2021-46938`, :cve:`2021-46939`, :cve:`2021-46940`, 
 :cve:`2021-46941`, :cve:`2021-46942`, :cve:`2021-46943`, :cve:`2021-46944`, :cve:`2021-46945`, :cve:`2021-46947`, :cve:`2021-46948`, :cve:`2021-46949`, :cve:`2021-46950`, :cve:`2021-46951`, :cve:`2021-46952`, :cve:`2021-46953`, :cve:`2021-46954`, :cve:`2021-46955`, :cve:`2021-46956`, :cve:`2021-46957`, :cve:`2021-46958`, :cve:`2021-46959`, :cve:`2021-46960`, :cve:`2021-46961`, :cve:`2021-46962`, :cve:`2021-46963`, :cve:`2021-46964`, :cve:`2021-46965`, :cve:`2021-46966`, :cve:`2021-46967`, :cve:`2021-46968`, :cve:`2021-46969`, :cve:`2021-46970`, :cve:`2021-46971`, :cve:`2021-46972`, :cve:`2021-46973`, :cve:`2021-46974`, :cve:`2021-46976`, :cve:`2021-46977`, :cve:`2021-46978`, :cve:`2021-46979`, :cve:`2021-46980`, :cve:`2021-46981`, :cve:`2021-46982`, :cve:`2021-46983`, :cve:`2021-46984`, :cve:`2021-46985`, :cve:`2021-46986`, :cve:`2021-46987`, :cve:`2021-46988`, :cve:`2021-46989`, :cve:`2021-46990`, :cve:`2021-46991`, :cve:`2021-46992`, :cve:`2021-46993`, :cve:`2021-46994`, :cve:`202
 1-46995`, :cve:`2021-46996`, :cve:`2021-46997`, :cve:`2021-46998`, :cve:`2021-46999`, :cve:`2021-47000`, :cve:`2021-47001`, :cve:`2021-47002`, :cve:`2021-47003`, :cve:`2021-47004`, :cve:`2021-47005`, :cve:`2021-47006`, :cve:`2021-47007`, :cve:`2021-47008`, :cve:`2021-47009`, :cve:`2021-47010`, :cve:`2021-47011`, :cve:`2021-47012`, :cve:`2021-47013`, :cve:`2021-47014`, :cve:`2021-47015`, :cve:`2021-47016`, :cve:`2021-47017`, :cve:`2021-47018`, :cve:`2021-47019`, :cve:`2021-47020`, :cve:`2021-47021`, :cve:`2021-47022`, :cve:`2021-47023`, :cve:`2021-47024`, :cve:`2021-47025`, :cve:`2021-47026`, :cve:`2021-47027`, :cve:`2021-47028`, :cve:`2021-47029`, :cve:`2021-47030`, :cve:`2021-47031`, :cve:`2021-47032`, :cve:`2021-47033`, :cve:`2021-47034`, :cve:`2021-47035`, :cve:`2021-47036`, :cve:`2021-47037`, :cve:`2021-47038`, :cve:`2021-47039`, :cve:`2021-47040`, :cve:`2021-47041`, :cve:`2021-47042`, :cve:`2021-47043`, :cve:`2021-47044`, :cve:`2021-47045`, :cve:`2021-47046`, :cve:`2021-47047`,
  :cve:`2021-47048`, :cve:`2021-47049`, :cve:`2021-47050`, :cve:`2021-47051`, :cve:`2021-47052`, :cve:`2021-47053`, :cve:`2021-47054`, :cve:`2021-47055`, :cve:`2021-47056`, :cve:`2021-47057`, :cve:`2021-47058`, :cve:`2021-47059`, :cve:`2021-47060`, :cve:`2021-47061`, :cve:`2021-47062`, :cve:`2021-47063`, :cve:`2021-47064`, :cve:`2021-47065`, :cve:`2021-47066`, :cve:`2021-47067`, :cve:`2021-47068`, :cve:`2021-47069`, :cve:`2021-47070`, :cve:`2021-47071`, :cve:`2021-47072`, :cve:`2021-47073`, :cve:`2021-47074`, :cve:`2021-47075`, :cve:`2021-47076`, :cve:`2021-47077`, :cve:`2021-47078`, :cve:`2021-47079`, :cve:`2021-47080`, :cve:`2021-47081`, :cve:`2021-47082`, :cve:`2021-47083`, :cve:`2021-47086`, :cve:`2021-47087`, :cve:`2021-47088`, :cve:`2021-47089`, :cve:`2021-47090`, :cve:`2021-47091`, :cve:`2021-47092`, :cve:`2021-47093`, :cve:`2021-47094`, :cve:`2021-47095`, :cve:`2021-47096`, :cve:`2021-47097`, :cve:`2021-47098`, :cve:`2021-47099`, :cve:`2021-47100`, :cve:`2021-47101`, :cve:`20
 21-47102`, :cve:`2021-47103`, :cve:`2021-47104`, :cve:`2021-47105`, :cve:`2021-47106`, :cve:`2021-47107`, :cve:`2021-47108`, :cve:`2021-47109`, :cve:`2021-47110`, :cve:`2021-47111`, :cve:`2021-47112`, :cve:`2021-47113`, :cve:`2021-47114`, :cve:`2021-47116`, :cve:`2021-47117`, :cve:`2021-47118`, :cve:`2021-47119`, :cve:`2021-47120`, :cve:`2021-47121`, :cve:`2021-47122`, :cve:`2021-47123`, :cve:`2021-47124`, :cve:`2021-47125`, :cve:`2021-47126`, :cve:`2021-47127`, :cve:`2021-47128`, :cve:`2021-47129`, :cve:`2021-47130`, :cve:`2021-47131`, :cve:`2021-47132`, :cve:`2021-47133`, :cve:`2021-47134`, :cve:`2021-47135`, :cve:`2021-47136`, :cve:`2021-47137`, :cve:`2021-47138`, :cve:`2021-47139`, :cve:`2021-47140`, :cve:`2021-47141`, :cve:`2021-47142`, :cve:`2021-47143`, :cve:`2021-47144`, :cve:`2021-47145`, :cve:`2021-47146`, :cve:`2021-47147`, :cve:`2021-47148`, :cve:`2021-47149`, :cve:`2021-47150`, :cve:`2021-47151`, :cve:`2021-47152`, :cve:`2021-47153`, :cve:`2021-47158`, :cve:`2021-47159`
 , :cve:`2021-47160`, :cve:`2021-47161`, :cve:`2021-47162`, :cve:`2021-47163`, :cve:`2021-47164`, :cve:`2021-47165`, :cve:`2021-47166`, :cve:`2021-47167`, :cve:`2021-47168`, :cve:`2021-47169`, :cve:`2021-47170`, :cve:`2021-47171`, :cve:`2021-47172`, :cve:`2021-47173`, :cve:`2021-47174`, :cve:`2021-47175`, :cve:`2021-47176`, :cve:`2021-47177`, :cve:`2021-47178`, :cve:`2021-47179` and :cve:`2021-47180`
--  linux-yocto/5.15 (cont.): Ignore :cve:`2022-48626`, :cve:`2022-48627`, :cve:`2022-48629`, :cve:`2022-48630`, :cve:`2023-6356`, :cve:`2023-6536`, :cve:`2023-52434`, :cve:`2023-52465`, :cve:`2023-52467`, :cve:`2023-52468`, :cve:`2023-52469`, :cve:`2023-52470`, :cve:`2023-52471`, :cve:`2023-52472`, :cve:`2023-52473`, :cve:`2023-52474`, :cve:`2023-52475`, :cve:`2023-52476`, :cve:`2023-52477`, :cve:`2023-52478`, :cve:`2023-52479`, :cve:`2023-52480`, :cve:`2023-52482`, :cve:`2023-52483`, :cve:`2023-52484`, :cve:`2023-52486`, :cve:`2023-52487`, :cve:`2023-52489`, :cve:`2023-52490`, :cve:`2023-52491`, :cve:`2023-52492`, :cve:`2023-52493`, :cve:`2023-52494`, :cve:`2023-52495`, :cve:`2023-52497`, :cve:`2023-52498`, :cve:`2023-52499`, :cve:`2023-52500`, :cve:`2023-52501`, :cve:`2023-52502`, :cve:`2023-52503`, :cve:`2023-52504`, :cve:`2023-52505`, :cve:`2023-52507`, :cve:`2023-52509`, :cve:`2023-52510`, :cve:`2023-52511`, :cve:`2023-52512`, :cve:`2023-52513`, :cve:`2023-52515`, :cve:`2023-52
 516`, :cve:`2023-52517`, :cve:`2023-52518`, :cve:`2023-52519`, :cve:`2023-52520`, :cve:`2023-52522`, :cve:`2023-52523`, :cve:`2023-52524`, :cve:`2023-52525`, :cve:`2023-52526`, :cve:`2023-52527`, :cve:`2023-52528`, :cve:`2023-52529`, :cve:`2023-52531`, :cve:`2023-52559`, :cve:`2023-52560`, :cve:`2023-52562`, :cve:`2023-52563`, :cve:`2023-52564`, :cve:`2023-52566`, :cve:`2023-52567`, :cve:`2023-52570`, :cve:`2023-52573`, :cve:`2023-52574`, :cve:`2023-52575`, :cve:`2023-52577`, :cve:`2023-52578`, :cve:`2023-52580`, :cve:`2023-52581`, :cve:`2023-52583`, :cve:`2023-52587`, :cve:`2023-52588`, :cve:`2023-52594`, :cve:`2023-52595`, :cve:`2023-52597`, :cve:`2023-52598`, :cve:`2023-52599`, :cve:`2023-52600`, :cve:`2023-52601`, :cve:`2023-52602`, :cve:`2023-52603`, :cve:`2023-52604`, :cve:`2023-52606`, :cve:`2023-52607`, :cve:`2023-52608`, :cve:`2023-52609`, :cve:`2023-52610`, :cve:`2023-52611`, :cve:`2023-52612`, :cve:`2023-52613`, :cve:`2023-52614`, :cve:`2023-52615`, :cve:`2023-52616`, :cv
 e:`2023-52617`, :cve:`2023-52618`, :cve:`2023-52619`, :cve:`2023-52622`, :cve:`2023-52623`, :cve:`2023-52626`, :cve:`2023-52627`, :cve:`2023-52628`, :cve:`2023-52630`, :cve:`2023-52631`, :cve:`2023-52633`, :cve:`2023-52635`, :cve:`2023-52636`, :cve:`2023-52637`, :cve:`2023-52638`, :cve:`2023-52640`, :cve:`2023-52641`, :cve:`2024-0565`, :cve:`2024-0841`, :cve:`2024-23196`, :cve:`2024-26587`, :cve:`2024-26588`, :cve:`2024-26600`, :cve:`2024-26601`, :cve:`2024-26602`, :cve:`2024-26603`, :cve:`2024-26604`, :cve:`2024-26605`, :cve:`2024-26606`, :cve:`2024-26608`, :cve:`2024-26610`, :cve:`2024-26611`, :cve:`2024-26612`, :cve:`2024-26614`, :cve:`2024-26615`, :cve:`2024-26616`, :cve:`2024-26617`, :cve:`2024-26618`, :cve:`2024-26619`, :cve:`2024-26620`, :cve:`2024-26621`, :cve:`2024-26625`, :cve:`2024-26626`, :cve:`2024-26627`, :cve:`2024-26629`, :cve:`2024-26630`, :cve:`2024-26631`, :cve:`2024-26632`, :cve:`2024-26633`, :cve:`2024-26634`, :cve:`2024-26635`, :cve:`2024-26636`, :cve:`2024-266
 37`, :cve:`2024-26638`, :cve:`2024-26639`, :cve:`2024-26640`, :cve:`2024-26641`, :cve:`2024-26643`, :cve:`2024-26644`, :cve:`2024-26645`, :cve:`2024-26649`, :cve:`2024-26652`, :cve:`2024-26653`, :cve:`2024-26657`, :cve:`2024-26660`, :cve:`2024-26663`, :cve:`2024-26664`, :cve:`2024-26665`, :cve:`2024-26666`, :cve:`2024-26667`, :cve:`2024-26668`, :cve:`2024-26670`, :cve:`2024-26671`, :cve:`2024-26673`, :cve:`2024-26674`, :cve:`2024-26675`, :cve:`2024-26676`, :cve:`2024-26678`, :cve:`2024-26679`, :cve:`2024-26681`, :cve:`2024-26682`, :cve:`2024-26683`, :cve:`2024-26684`, :cve:`2024-26685`, :cve:`2024-26689`, :cve:`2024-26690`, :cve:`2024-26692`, :cve:`2024-26693`, :cve:`2024-26694`, :cve:`2024-26695`, :cve:`2024-26696`, :cve:`2024-26697`, :cve:`2024-26698`, :cve:`2024-26702`, :cve:`2024-26703`, :cve:`2024-26704`, :cve:`2024-26705`, :cve:`2024-26707`, :cve:`2024-26708`, :cve:`2024-26709`, :cve:`2024-26710`, :cve:`2024-26711`, :cve:`2024-26712`, :cve:`2024-26715`, :cve:`2024-26716`, :cve
 :`2024-26717`, :cve:`2024-26720`, :cve:`2024-26721`, :cve:`2024-26722`, :cve:`2024-26723`, :cve:`2024-26724`, :cve:`2024-26725`, :cve:`2024-26727`, :cve:`2024-26728`, :cve:`2024-26729`, :cve:`2024-26730`, :cve:`2024-26731`, :cve:`2024-26732`, :cve:`2024-26733`, :cve:`2024-26734`, :cve:`2024-26735`, :cve:`2024-26736`, :cve:`2024-26737`, :cve:`2024-26741`, :cve:`2024-26742`, :cve:`2024-26743`, :cve:`2024-26744`, :cve:`2024-26746`, :cve:`2024-26747`, :cve:`2024-26748`, :cve:`2024-26749`, :cve:`2024-26750`, :cve:`2024-26751`, :cve:`2024-26752`, :cve:`2024-26753`, :cve:`2024-26754`, :cve:`2024-26755`, :cve:`2024-26760`, :cve:`2024-26761`, :cve:`2024-26762`, :cve:`2024-26763`, :cve:`2024-26764`, :cve:`2024-26766`, :cve:`2024-26769`, :cve:`2024-26771`, :cve:`2024-26772`, :cve:`2024-26773`, :cve:`2024-26774`, :cve:`2024-26776`, :cve:`2024-26777`, :cve:`2024-26778`, :cve:`2024-26779`, :cve:`2024-26780`, :cve:`2024-26781`, :cve:`2024-26783`, :cve:`2024-26785`, :cve:`2024-26786`, :cve:`2024-26
 792`, :cve:`2024-26794`, :cve:`2024-26796`, :cve:`2024-26799`, :cve:`2024-26800`, :cve:`2024-26807` and :cve:`2024-26808`
--  ncurses: Fix :cve:`2023-45918`
--  ofono: Fix :cve:`2023-4233` and :cve:`2023-4234`
--  openssl: Fix :cve:`2024-4603`
--  util-linux: Fix :cve:`2024-28085`
--  xserver-xorg: Fix :cve:`2024-31082` and :cve:`2024-31083`
+-  linux-yocto/5.15: Fix :cve_nist:`2023-6270`, :cve_nist:`2023-7042`, :cve_nist:`2023-52447`, :cve_nist:`2023-52620`, :cve_nist:`2024-22099`, :cve_nist:`2024-26622`, :cve_nist:`2024-26651`, :cve_nist:`2024-26659`, :cve_nist:`2024-26688`, :cve_nist:`2024-26782`, :cve_nist:`2024-26787`, :cve_nist:`2024-26788`, :cve_nist:`2024-26790`, :cve_nist:`2024-26791`, :cve_nist:`2024-26793`, :cve_nist:`2024-26795`, :cve_nist:`2024-26798`, :cve_nist:`2024-26801`, :cve_nist:`2024-26802`, :cve_nist:`2024-26803`, :cve_nist:`2024-26804`, :cve_nist:`2024-26805` and :cve_nist:`2024-26809`
+-  linux-yocto/5.15: Ignore :cve_nist:`2019-25160`, :cve_nist:`2019-25162`, :cve_nist:`2020-36775`, :cve_nist:`2020-36776`, :cve_nist:`2020-36777`, :cve_nist:`2020-36778`, :cve_nist:`2020-36779`, :cve_nist:`2020-36780`, :cve_nist:`2020-36781`, :cve_nist:`2020-36782`, :cve_nist:`2020-36783`, :cve_nist:`2020-36784`, :cve_nist:`2020-36785`, :cve_nist:`2020-36786`, :cve_nist:`2020-36787`, :cve_nist:`2021-46904`, :cve_nist:`2021-46905`, :cve_nist:`2021-46906`, :cve_nist:`2021-46908`, :cve_nist:`2021-46909`, :cve_nist:`2021-46910`, :cve_nist:`2021-46911`, :cve_nist:`2021-46912`, :cve_nist:`2021-46913`, :cve_nist:`2021-46914`, :cve_nist:`2021-46915`, :cve_nist:`2021-46916`, :cve_nist:`2021-46917`, :cve_nist:`2021-46918`, :cve_nist:`2021-46919`, :cve_nist:`2021-46920`, :cve_nist:`2021-46921`, :cve_nist:`2021-46922`, :cve_nist:`2021-46923`, :cve_nist:`2021-46924`, :cve_nist:`2021-46925`, :cve_nist:`2021-46926`, :cve_nist:`2021-46927`, :cve_nist:`2021-46928`, :cve_nist:`2021-46929`, :cve_nist
 :`2021-46930`, :cve_nist:`2021-46931`, :cve_nist:`2021-46932`, :cve_nist:`2021-46933`, :cve_nist:`2021-46934`, :cve_nist:`2021-46935`, :cve_nist:`2021-46936`, :cve_nist:`2021-46937`, :cve_nist:`2021-46938`, :cve_nist:`2021-46939`, :cve_nist:`2021-46940`, :cve_nist:`2021-46941`, :cve_nist:`2021-46942`, :cve_nist:`2021-46943`, :cve_nist:`2021-46944`, :cve_nist:`2021-46945`, :cve_nist:`2021-46947`, :cve_nist:`2021-46948`, :cve_nist:`2021-46949`, :cve_nist:`2021-46950`, :cve_nist:`2021-46951`, :cve_nist:`2021-46952`, :cve_nist:`2021-46953`, :cve_nist:`2021-46954`, :cve_nist:`2021-46955`, :cve_nist:`2021-46956`, :cve_nist:`2021-46957`, :cve_nist:`2021-46958`, :cve_nist:`2021-46959`, :cve_nist:`2021-46960`, :cve_nist:`2021-46961`, :cve_nist:`2021-46962`, :cve_nist:`2021-46963`, :cve_nist:`2021-46964`, :cve_nist:`2021-46965`, :cve_nist:`2021-46966`, :cve_nist:`2021-46967`, :cve_nist:`2021-46968`, :cve_nist:`2021-46969`, :cve_nist:`2021-46970`, :cve_nist:`2021-46971`, :cve_nist:`2021-46972`
 , :cve_nist:`2021-46973`, :cve_nist:`2021-46974`, :cve_nist:`2021-46976`, :cve_nist:`2021-46977`, :cve_nist:`2021-46978`, :cve_nist:`2021-46979`, :cve_nist:`2021-46980`, :cve_nist:`2021-46981`, :cve_nist:`2021-46982`, :cve_nist:`2021-46983`, :cve_nist:`2021-46984`, :cve_nist:`2021-46985`, :cve_nist:`2021-46986`, :cve_nist:`2021-46987`, :cve_nist:`2021-46988`, :cve_nist:`2021-46989`, :cve_nist:`2021-46990`, :cve_nist:`2021-46991`, :cve_nist:`2021-46992`, :cve_nist:`2021-46993`, :cve_nist:`2021-46994`, :cve_nist:`2021-46995`, :cve_nist:`2021-46996`, :cve_nist:`2021-46997`, :cve_nist:`2021-46998`, :cve_nist:`2021-46999`, :cve_nist:`2021-47000`, :cve_nist:`2021-47001`, :cve_nist:`2021-47002`, :cve_nist:`2021-47003`, :cve_nist:`2021-47004`, :cve_nist:`2021-47005`, :cve_nist:`2021-47006`, :cve_nist:`2021-47007`, :cve_nist:`2021-47008`, :cve_nist:`2021-47009`, :cve_nist:`2021-47010`, :cve_nist:`2021-47011`, :cve_nist:`2021-47012`, :cve_nist:`2021-47013`, :cve_nist:`2021-47014`, :cve_nist:`
 2021-47015`, :cve_nist:`2021-47016`, :cve_nist:`2021-47017`, :cve_nist:`2021-47018`, :cve_nist:`2021-47019`, :cve_nist:`2021-47020`, :cve_nist:`2021-47021`, :cve_nist:`2021-47022`, :cve_nist:`2021-47023`, :cve_nist:`2021-47024`, :cve_nist:`2021-47025`, :cve_nist:`2021-47026`, :cve_nist:`2021-47027`, :cve_nist:`2021-47028`, :cve_nist:`2021-47029`, :cve_nist:`2021-47030`, :cve_nist:`2021-47031`, :cve_nist:`2021-47032`, :cve_nist:`2021-47033`, :cve_nist:`2021-47034`, :cve_nist:`2021-47035`, :cve_nist:`2021-47036`, :cve_nist:`2021-47037`, :cve_nist:`2021-47038`, :cve_nist:`2021-47039`, :cve_nist:`2021-47040`, :cve_nist:`2021-47041`, :cve_nist:`2021-47042`, :cve_nist:`2021-47043`, :cve_nist:`2021-47044`, :cve_nist:`2021-47045`, :cve_nist:`2021-47046`, :cve_nist:`2021-47047`, :cve_nist:`2021-47048`, :cve_nist:`2021-47049`, :cve_nist:`2021-47050`, :cve_nist:`2021-47051`, :cve_nist:`2021-47052`, :cve_nist:`2021-47053`, :cve_nist:`2021-47054`, :cve_nist:`2021-47055`, :cve_nist:`2021-47056`, 
 :cve_nist:`2021-47057`, :cve_nist:`2021-47058`, :cve_nist:`2021-47059`, :cve_nist:`2021-47060`, :cve_nist:`2021-47061`, :cve_nist:`2021-47062`, :cve_nist:`2021-47063`, :cve_nist:`2021-47064`, :cve_nist:`2021-47065`, :cve_nist:`2021-47066`, :cve_nist:`2021-47067`, :cve_nist:`2021-47068`, :cve_nist:`2021-47069`, :cve_nist:`2021-47070`, :cve_nist:`2021-47071`, :cve_nist:`2021-47072`, :cve_nist:`2021-47073`, :cve_nist:`2021-47074`, :cve_nist:`2021-47075`, :cve_nist:`2021-47076`, :cve_nist:`2021-47077`, :cve_nist:`2021-47078`, :cve_nist:`2021-47079`, :cve_nist:`2021-47080`, :cve_nist:`2021-47081`, :cve_nist:`2021-47082`, :cve_nist:`2021-47083`, :cve_nist:`2021-47086`, :cve_nist:`2021-47087`, :cve_nist:`2021-47088`, :cve_nist:`2021-47089`, :cve_nist:`2021-47090`, :cve_nist:`2021-47091`, :cve_nist:`2021-47092`, :cve_nist:`2021-47093`, :cve_nist:`2021-47094`, :cve_nist:`2021-47095`, :cve_nist:`2021-47096`, :cve_nist:`2021-47097`, :cve_nist:`2021-47098`, :cve_nist:`2021-47099`, :cve_nist:`20
 21-47100`, :cve_nist:`2021-47101`, :cve_nist:`2021-47102`, :cve_nist:`2021-47103`, :cve_nist:`2021-47104`, :cve_nist:`2021-47105`, :cve_nist:`2021-47106`, :cve_nist:`2021-47107`, :cve_nist:`2021-47108`, :cve_nist:`2021-47109`, :cve_nist:`2021-47110`, :cve_nist:`2021-47111`, :cve_nist:`2021-47112`, :cve_nist:`2021-47113`, :cve_nist:`2021-47114`, :cve_nist:`2021-47116`, :cve_nist:`2021-47117`, :cve_nist:`2021-47118`, :cve_nist:`2021-47119`, :cve_nist:`2021-47120`, :cve_nist:`2021-47121`, :cve_nist:`2021-47122`, :cve_nist:`2021-47123`, :cve_nist:`2021-47124`, :cve_nist:`2021-47125`, :cve_nist:`2021-47126`, :cve_nist:`2021-47127`, :cve_nist:`2021-47128`, :cve_nist:`2021-47129`, :cve_nist:`2021-47130`, :cve_nist:`2021-47131`, :cve_nist:`2021-47132`, :cve_nist:`2021-47133`, :cve_nist:`2021-47134`, :cve_nist:`2021-47135`, :cve_nist:`2021-47136`, :cve_nist:`2021-47137`, :cve_nist:`2021-47138`, :cve_nist:`2021-47139`, :cve_nist:`2021-47140`, :cve_nist:`2021-47141`, :cve_nist:`2021-47142`, :c
 ve_nist:`2021-47143`, :cve_nist:`2021-47144`, :cve_nist:`2021-47145`, :cve_nist:`2021-47146`, :cve_nist:`2021-47147`, :cve_nist:`2021-47148`, :cve_nist:`2021-47149`, :cve_nist:`2021-47150`, :cve_nist:`2021-47151`, :cve_nist:`2021-47152`, :cve_nist:`2021-47153`, :cve_nist:`2021-47158`, :cve_nist:`2021-47159`, :cve_nist:`2021-47160`, :cve_nist:`2021-47161`, :cve_nist:`2021-47162`, :cve_nist:`2021-47163`, :cve_nist:`2021-47164`, :cve_nist:`2021-47165`, :cve_nist:`2021-47166`, :cve_nist:`2021-47167`, :cve_nist:`2021-47168`, :cve_nist:`2021-47169`, :cve_nist:`2021-47170`, :cve_nist:`2021-47171`, :cve_nist:`2021-47172`, :cve_nist:`2021-47173`, :cve_nist:`2021-47174`, :cve_nist:`2021-47175`, :cve_nist:`2021-47176`, :cve_nist:`2021-47177`, :cve_nist:`2021-47178`, :cve_nist:`2021-47179` and :cve_nist:`2021-47180`
+-  linux-yocto/5.15 (cont.): Ignore :cve_nist:`2022-48626`, :cve_nist:`2022-48627`, :cve_nist:`2022-48629`, :cve_nist:`2022-48630`, :cve_nist:`2023-6356`, :cve_nist:`2023-6536`, :cve_nist:`2023-52434`, :cve_nist:`2023-52465`, :cve_nist:`2023-52467`, :cve_nist:`2023-52468`, :cve_nist:`2023-52469`, :cve_nist:`2023-52470`, :cve_nist:`2023-52471`, :cve_nist:`2023-52472`, :cve_nist:`2023-52473`, :cve_nist:`2023-52474`, :cve_nist:`2023-52475`, :cve_nist:`2023-52476`, :cve_nist:`2023-52477`, :cve_nist:`2023-52478`, :cve_nist:`2023-52479`, :cve_nist:`2023-52480`, :cve_nist:`2023-52482`, :cve_nist:`2023-52483`, :cve_nist:`2023-52484`, :cve_nist:`2023-52486`, :cve_nist:`2023-52487`, :cve_nist:`2023-52489`, :cve_nist:`2023-52490`, :cve_nist:`2023-52491`, :cve_nist:`2023-52492`, :cve_nist:`2023-52493`, :cve_nist:`2023-52494`, :cve_nist:`2023-52495`, :cve_nist:`2023-52497`, :cve_nist:`2023-52498`, :cve_nist:`2023-52499`, :cve_nist:`2023-52500`, :cve_nist:`2023-52501`, :cve_nist:`2023-52502`, :cv
 e_nist:`2023-52503`, :cve_nist:`2023-52504`, :cve_nist:`2023-52505`, :cve_nist:`2023-52507`, :cve_nist:`2023-52509`, :cve_nist:`2023-52510`, :cve_nist:`2023-52511`, :cve_nist:`2023-52512`, :cve_nist:`2023-52513`, :cve_nist:`2023-52515`, :cve_nist:`2023-52516`, :cve_nist:`2023-52517`, :cve_nist:`2023-52518`, :cve_nist:`2023-52519`, :cve_nist:`2023-52520`, :cve_nist:`2023-52522`, :cve_nist:`2023-52523`, :cve_nist:`2023-52524`, :cve_nist:`2023-52525`, :cve_nist:`2023-52526`, :cve_nist:`2023-52527`, :cve_nist:`2023-52528`, :cve_nist:`2023-52529`, :cve_nist:`2023-52531`, :cve_nist:`2023-52559`, :cve_nist:`2023-52560`, :cve_nist:`2023-52562`, :cve_nist:`2023-52563`, :cve_nist:`2023-52564`, :cve_nist:`2023-52566`, :cve_nist:`2023-52567`, :cve_nist:`2023-52570`, :cve_nist:`2023-52573`, :cve_nist:`2023-52574`, :cve_nist:`2023-52575`, :cve_nist:`2023-52577`, :cve_nist:`2023-52578`, :cve_nist:`2023-52580`, :cve_nist:`2023-52581`, :cve_nist:`2023-52583`, :cve_nist:`2023-52587`, :cve_nist:`2023-
 52588`, :cve_nist:`2023-52594`, :cve_nist:`2023-52595`, :cve_nist:`2023-52597`, :cve_nist:`2023-52598`, :cve_nist:`2023-52599`, :cve_nist:`2023-52600`, :cve_nist:`2023-52601`, :cve_nist:`2023-52602`, :cve_nist:`2023-52603`, :cve_nist:`2023-52604`, :cve_nist:`2023-52606`, :cve_nist:`2023-52607`, :cve_nist:`2023-52608`, :cve_nist:`2023-52609`, :cve_nist:`2023-52610`, :cve_nist:`2023-52611`, :cve_nist:`2023-52612`, :cve_nist:`2023-52613`, :cve_nist:`2023-52614`, :cve_nist:`2023-52615`, :cve_nist:`2023-52616`, :cve_nist:`2023-52617`, :cve_nist:`2023-52618`, :cve_nist:`2023-52619`, :cve_nist:`2023-52622`, :cve_nist:`2023-52623`, :cve_nist:`2023-52626`, :cve_nist:`2023-52627`, :cve_nist:`2023-52628`, :cve_nist:`2023-52630`, :cve_nist:`2023-52631`, :cve_nist:`2023-52633`, :cve_nist:`2023-52635`, :cve_nist:`2023-52636`, :cve_nist:`2023-52637`, :cve_nist:`2023-52638`, :cve_nist:`2023-52640`, :cve_nist:`2023-52641`, :cve_nist:`2024-0565`, :cve_nist:`2024-0841`, :cve_nist:`2024-23196`, :cve_ni
 st:`2024-26587`, :cve_nist:`2024-26588`, :cve_nist:`2024-26600`, :cve_nist:`2024-26601`, :cve_nist:`2024-26602`, :cve_nist:`2024-26603`, :cve_nist:`2024-26604`, :cve_nist:`2024-26605`, :cve_nist:`2024-26606`, :cve_nist:`2024-26608`, :cve_nist:`2024-26610`, :cve_nist:`2024-26611`, :cve_nist:`2024-26612`, :cve_nist:`2024-26614`, :cve_nist:`2024-26615`, :cve_nist:`2024-26616`, :cve_nist:`2024-26617`, :cve_nist:`2024-26618`, :cve_nist:`2024-26619`, :cve_nist:`2024-26620`, :cve_nist:`2024-26621`, :cve_nist:`2024-26625`, :cve_nist:`2024-26626`, :cve_nist:`2024-26627`, :cve_nist:`2024-26629`, :cve_nist:`2024-26630`, :cve_nist:`2024-26631`, :cve_nist:`2024-26632`, :cve_nist:`2024-26633`, :cve_nist:`2024-26634`, :cve_nist:`2024-26635`, :cve_nist:`2024-26636`, :cve_nist:`2024-26637`, :cve_nist:`2024-26638`, :cve_nist:`2024-26639`, :cve_nist:`2024-26640`, :cve_nist:`2024-26641`, :cve_nist:`2024-26643`, :cve_nist:`2024-26644`, :cve_nist:`2024-26645`, :cve_nist:`2024-26649`, :cve_nist:`2024-2665
 2`, :cve_nist:`2024-26653`, :cve_nist:`2024-26657`, :cve_nist:`2024-26660`, :cve_nist:`2024-26663`, :cve_nist:`2024-26664`, :cve_nist:`2024-26665`, :cve_nist:`2024-26666`, :cve_nist:`2024-26667`, :cve_nist:`2024-26668`, :cve_nist:`2024-26670`, :cve_nist:`2024-26671`, :cve_nist:`2024-26673`, :cve_nist:`2024-26674`, :cve_nist:`2024-26675`, :cve_nist:`2024-26676`, :cve_nist:`2024-26678`, :cve_nist:`2024-26679`, :cve_nist:`2024-26681`, :cve_nist:`2024-26682`, :cve_nist:`2024-26683`, :cve_nist:`2024-26684`, :cve_nist:`2024-26685`, :cve_nist:`2024-26689`, :cve_nist:`2024-26690`, :cve_nist:`2024-26692`, :cve_nist:`2024-26693`, :cve_nist:`2024-26694`, :cve_nist:`2024-26695`, :cve_nist:`2024-26696`, :cve_nist:`2024-26697`, :cve_nist:`2024-26698`, :cve_nist:`2024-26702`, :cve_nist:`2024-26703`, :cve_nist:`2024-26704`, :cve_nist:`2024-26705`, :cve_nist:`2024-26707`, :cve_nist:`2024-26708`, :cve_nist:`2024-26709`, :cve_nist:`2024-26710`, :cve_nist:`2024-26711`, :cve_nist:`2024-26712`, :cve_nist
 :`2024-26715`, :cve_nist:`2024-26716`, :cve_nist:`2024-26717`, :cve_nist:`2024-26720`, :cve_nist:`2024-26721`, :cve_nist:`2024-26722`, :cve_nist:`2024-26723`, :cve_nist:`2024-26724`, :cve_nist:`2024-26725`, :cve_nist:`2024-26727`, :cve_nist:`2024-26728`, :cve_nist:`2024-26729`, :cve_nist:`2024-26730`, :cve_nist:`2024-26731`, :cve_nist:`2024-26732`, :cve_nist:`2024-26733`, :cve_nist:`2024-26734`, :cve_nist:`2024-26735`, :cve_nist:`2024-26736`, :cve_nist:`2024-26737`, :cve_nist:`2024-26741`, :cve_nist:`2024-26742`, :cve_nist:`2024-26743`, :cve_nist:`2024-26744`, :cve_nist:`2024-26746`, :cve_nist:`2024-26747`, :cve_nist:`2024-26748`, :cve_nist:`2024-26749`, :cve_nist:`2024-26750`, :cve_nist:`2024-26751`, :cve_nist:`2024-26752`, :cve_nist:`2024-26753`, :cve_nist:`2024-26754`, :cve_nist:`2024-26755`, :cve_nist:`2024-26760`, :cve_nist:`2024-26761`, :cve_nist:`2024-26762`, :cve_nist:`2024-26763`, :cve_nist:`2024-26764`, :cve_nist:`2024-26766`, :cve_nist:`2024-26769`, :cve_nist:`2024-26771`
 , :cve_nist:`2024-26772`, :cve_nist:`2024-26773`, :cve_nist:`2024-26774`, :cve_nist:`2024-26776`, :cve_nist:`2024-26777`, :cve_nist:`2024-26778`, :cve_nist:`2024-26779`, :cve_nist:`2024-26780`, :cve_nist:`2024-26781`, :cve_nist:`2024-26783`, :cve_nist:`2024-26785`, :cve_nist:`2024-26786`, :cve_nist:`2024-26792`, :cve_nist:`2024-26794`, :cve_nist:`2024-26796`, :cve_nist:`2024-26799`, :cve_nist:`2024-26800`, :cve_nist:`2024-26807` and :cve_nist:`2024-26808`
+-  ncurses: Fix :cve_nist:`2023-45918`
+-  ofono: Fix :cve_nist:`2023-4233` and :cve_nist:`2023-4234`
+-  openssl: Fix :cve_nist:`2024-4603`
+-  util-linux: Fix :cve_nist:`2024-28085`
+-  xserver-xorg: Fix :cve_nist:`2024-31082` and :cve_nist:`2024-31083`
 
 
 Fixes in Yocto-4.0.19
 ~~~~~~~~~~~~~~~~~~~~~
 
--  binutils: Rename CVE-2022-38126 patch to :cve:`2022-35205`
+-  binutils: Rename CVE-2022-38126 patch to :cve_nist:`2022-35205`
 -  bitbake: parse: Improve/fix cache invalidation via mtime
 -  build-appliance-image: Update to kirkstone head revision
 -  go-mod.bbclass: do not pack go mod cache
diff --git a/documentation/migration-guides/release-notes-4.0.2.rst b/documentation/migration-guides/release-notes-4.0.2.rst
index 2f724e33c491f3b60e9c39dc257ee2d79f14e4a1..57881fa35991e739aa4b87b517673e03c28b93c0 100644
--- a/documentation/migration-guides/release-notes-4.0.2.rst
+++ b/documentation/migration-guides/release-notes-4.0.2.rst
@@ -6,13 +6,13 @@ Release notes for Yocto-4.0.2 (Kirkstone)
 Security Fixes in Yocto-4.0.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  libxslt: Mark :cve:`2022-29824` as not applying
--  tiff: Add jbig :term:`PACKAGECONFIG` and clarify IGNORE :cve:`2022-1210`
--  tiff: mark :cve:`2022-1622` and :cve:`2022-1623` as invalid
--  pcre2:fix :cve:`2022-1586` Out-of-bounds read
--  curl: fix :cve:`2022-22576`, :cve:`2022-27775`, :cve:`2022-27776`, :cve:`2022-27774`, :cve:`2022-30115`, :cve:`2022-27780`, :cve:`2022-27781`, :cve:`2022-27779` and :cve:`2022-27782`
--  qemu: fix :cve:`2021-4206` and :cve:`2021-4207`
--  freetype: fix :cve:`2022-27404`, :cve:`2022-27405` and :cve:`2022-27406`
+-  libxslt: Mark :cve_nist:`2022-29824` as not applying
+-  tiff: Add jbig :term:`PACKAGECONFIG` and clarify IGNORE :cve_nist:`2022-1210`
+-  tiff: mark :cve_nist:`2022-1622` and :cve_nist:`2022-1623` as invalid
+-  pcre2:fix :cve_nist:`2022-1586` Out-of-bounds read
+-  curl: fix :cve_nist:`2022-22576`, :cve_nist:`2022-27775`, :cve_nist:`2022-27776`, :cve_nist:`2022-27774`, :cve_nist:`2022-30115`, :cve_nist:`2022-27780`, :cve_nist:`2022-27781`, :cve_nist:`2022-27779` and :cve_nist:`2022-27782`
+-  qemu: fix :cve_nist:`2021-4206` and :cve_nist:`2021-4207`
+-  freetype: fix :cve_nist:`2022-27404`, :cve_nist:`2022-27405` and :cve_nist:`2022-27406`
 
 Fixes in Yocto-4.0.2
 ~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-4.0.20.rst b/documentation/migration-guides/release-notes-4.0.20.rst
index 97e0a3e91d2535efdf8f0b978ffa587f438dcb68..d0f95fff504e2fc2d14534f6aa0b4d0385aab4d8 100644
--- a/documentation/migration-guides/release-notes-4.0.20.rst
+++ b/documentation/migration-guides/release-notes-4.0.20.rst
@@ -6,14 +6,14 @@ Release notes for Yocto-4.0.20 (Kirkstone)
 Security Fixes in Yocto-4.0.20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  acpica: Fix :cve:`2024-24856`
--  glib-2.0: Fix :cve:`2024-34397`
--  gstreamer1.0-plugins-base: Fix :cve:`2024-4453`
--  libxml2: Fix :cve:`2024-34459`
--  openssh: fix :cve:`2024-6387`
--  openssl: Fix :cve_mitre:`2024-4741` and :cve:`2024-5535`
--  ruby: fix :cve:`2024-27280`
--  wget: Fix for :cve:`2024-38428`
+-  acpica: Fix :cve_nist:`2024-24856`
+-  glib-2.0: Fix :cve_nist:`2024-34397`
+-  gstreamer1.0-plugins-base: Fix :cve_nist:`2024-4453`
+-  libxml2: Fix :cve_nist:`2024-34459`
+-  openssh: fix :cve_nist:`2024-6387`
+-  openssl: Fix :cve_mitre:`2024-4741` and :cve_nist:`2024-5535`
+-  ruby: fix :cve_nist:`2024-27280`
+-  wget: Fix for :cve_nist:`2024-38428`
 
 
 Fixes in Yocto-4.0.20
diff --git a/documentation/migration-guides/release-notes-4.0.21.rst b/documentation/migration-guides/release-notes-4.0.21.rst
index a12f4b247644f51835edd2b6af10eb8cb5f1b40f..abf2199ee500f3a3018a407a2d4c0ed34165bb35 100644
--- a/documentation/migration-guides/release-notes-4.0.21.rst
+++ b/documentation/migration-guides/release-notes-4.0.21.rst
@@ -6,28 +6,28 @@ Release notes for Yocto-4.0.21 (Kirkstone)
 Security Fixes in Yocto-4.0.21
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2024-4076`, :cve:`2024-1737`, :cve:`2024-0760` and :cve:`2024-1975`
--  apr: Fix :cve:`2023-49582`
--  busybox: Fix :cve:`2023-42363`, :cve:`2023-42364`, :cve:`2023-42365`, :cve:`2023-42366` and :cve:`2021-42380`
--  curl: Ignore :cve:`2024-32928`
--  curl: Fix :cve:`2024-7264`
--  ghostscript: Fix :cve:`2024-29506`, :cve:`2024-29509` and :cve:`2024-29511`
--  go: Fix :cve:`2024-24789` and :cve:`2024-24791`
--  gtk+3: Fix :cve:`2024-6655`
--  libarchive: Ignore :cve:`2024-37407`
--  libyaml: Ignore :cve:`2024-35325`, :cve:`2024-35326` and :cve:`2024-35328`
--  linux-yocto/5.15: Fix :cve:`2022-48772`, :cve:`2024-35972`, :cve:`2024-35984`, :cve:`2024-35990`, :cve:`2024-35997`, :cve:`2024-36008`, :cve:`2024-36270`, :cve:`2024-36489`, :cve:`2024-36897`, :cve:`2024-36938`, :cve:`2024-36965`, :cve:`2024-36967`, :cve:`2024-36969`, :cve:`2024-36971`, :cve:`2024-36978`, :cve:`2024-38546`, :cve:`2024-38547`, :cve:`2024-38549`, :cve:`2024-38552`, :cve:`2024-38555`, :cve:`2024-38571`, :cve:`2024-38583`, :cve:`2024-38591`, :cve:`2024-38597`, :cve:`2024-38598`, :cve:`2024-38600`, :cve:`2024-38627`, :cve:`2024-38633`, :cve:`2024-38661`, :cve:`2024-38662`, :cve:`2024-38780`, :cve:`2024-39277`, :cve:`2024-39292`, :cve:`2024-39301`, :cve:`2024-39466`, :cve:`2024-39468`, :cve:`2024-39471`, :cve:`2024-39475`, :cve:`2024-39476`, :cve:`2024-39480`, :cve:`2024-39482`, :cve:`2024-39484`, :cve:`2024-39487`, :cve:`2024-39489`, :cve:`2024-39493`, :cve:`2024-39495`, :cve:`2024-39506`, :cve:`2024-40902`, :cve:`2024-40911`, :cve:`2024-40912`, :cve:`2024-40932`, :cv
 e:`2024-40934`, :cve:`2024-40954`, :cve:`2024-40956`, :cve:`2024-40957`, :cve:`2024-40958`, :cve:`2024-40959`, :cve:`2024-40960`, :cve:`2024-40961`, :cve:`2024-40967`, :cve:`2024-40970`, :cve:`2024-40980`, :cve:`2024-40981`, :cve:`2024-40994`, :cve:`2024-40995`, :cve:`2024-41000`, :cve:`2024-41002`, :cve:`2024-41006`, :cve:`2024-41007`, :cve:`2024-41046`, :cve:`2024-41049`, :cve:`2024-41055`, :cve:`2024-41064`, :cve:`2024-41070`, :cve:`2024-41073`, :cve:`2024-41087`, :cve:`2024-41089`, :cve:`2024-41092`, :cve:`2024-41093`, :cve:`2024-41095`, :cve:`2024-41097`, :cve:`2024-42068`, :cve:`2024-42070`, :cve:`2024-42076`, :cve:`2024-42077`, :cve:`2024-42080`, :cve:`2024-42082`, :cve:`2024-42085`, :cve:`2024-42090`, :cve:`2024-42093`, :cve:`2024-42094`, :cve:`2024-42101`, :cve:`2024-42102`, :cve:`2024-42104`, :cve:`2024-42109`, :cve:`2024-42140`, :cve:`2024-42148`, :cve:`2024-42152`, :cve:`2024-42153`, :cve:`2024-42154`, :cve:`2024-42157`, :cve:`2024-42161`, :cve:`2024-42223`, :cve:`2024-4
 2224`, :cve:`2024-42225`, :cve:`2024-42229`, :cve:`2024-42232`, :cve:`2024-42236`, :cve:`2024-42244` and :cve:`2024-42247`
--  llvm: Fix :cve:`2023-46049` and :cve:`2024-31852`
--  ofono: fix :cve:`2023-2794`
--  orc: Fix :cve:`2024-40897`
--  python3-certifi: Fix :cve:`2024-39689`
--  python3-jinja2: Fix :cve:`2024-34064`
--  python3: Fix :cve:`2024-8088`
--  qemu: Fix :cve:`2024-7409`
--  ruby: Fix for :cve:`2024-27282`
--  tiff: Fix :cve:`2024-7006`
--  vim: Fix :cve:`2024-22667`, :cve:`2024-41957`, :cve:`2024-41965` and :cve:`2024-43374`
--  wpa-supplicant: Fix :cve:`2023-52160`
+-  bind: Fix :cve_nist:`2024-4076`, :cve_nist:`2024-1737`, :cve_nist:`2024-0760` and :cve_nist:`2024-1975`
+-  apr: Fix :cve_nist:`2023-49582`
+-  busybox: Fix :cve_nist:`2023-42363`, :cve_nist:`2023-42364`, :cve_nist:`2023-42365`, :cve_nist:`2023-42366` and :cve_nist:`2021-42380`
+-  curl: Ignore :cve_nist:`2024-32928`
+-  curl: Fix :cve_nist:`2024-7264`
+-  ghostscript: Fix :cve_nist:`2024-29506`, :cve_nist:`2024-29509` and :cve_nist:`2024-29511`
+-  go: Fix :cve_nist:`2024-24789` and :cve_nist:`2024-24791`
+-  gtk+3: Fix :cve_nist:`2024-6655`
+-  libarchive: Ignore :cve_nist:`2024-37407`
+-  libyaml: Ignore :cve_nist:`2024-35325`, :cve_nist:`2024-35326` and :cve_nist:`2024-35328`
+-  linux-yocto/5.15: Fix :cve_nist:`2022-48772`, :cve_nist:`2024-35972`, :cve_nist:`2024-35984`, :cve_nist:`2024-35990`, :cve_nist:`2024-35997`, :cve_nist:`2024-36008`, :cve_nist:`2024-36270`, :cve_nist:`2024-36489`, :cve_nist:`2024-36897`, :cve_nist:`2024-36938`, :cve_nist:`2024-36965`, :cve_nist:`2024-36967`, :cve_nist:`2024-36969`, :cve_nist:`2024-36971`, :cve_nist:`2024-36978`, :cve_nist:`2024-38546`, :cve_nist:`2024-38547`, :cve_nist:`2024-38549`, :cve_nist:`2024-38552`, :cve_nist:`2024-38555`, :cve_nist:`2024-38571`, :cve_nist:`2024-38583`, :cve_nist:`2024-38591`, :cve_nist:`2024-38597`, :cve_nist:`2024-38598`, :cve_nist:`2024-38600`, :cve_nist:`2024-38627`, :cve_nist:`2024-38633`, :cve_nist:`2024-38661`, :cve_nist:`2024-38662`, :cve_nist:`2024-38780`, :cve_nist:`2024-39277`, :cve_nist:`2024-39292`, :cve_nist:`2024-39301`, :cve_nist:`2024-39466`, :cve_nist:`2024-39468`, :cve_nist:`2024-39471`, :cve_nist:`2024-39475`, :cve_nist:`2024-39476`, :cve_nist:`2024-39480`, :cve_nist:`2
 024-39482`, :cve_nist:`2024-39484`, :cve_nist:`2024-39487`, :cve_nist:`2024-39489`, :cve_nist:`2024-39493`, :cve_nist:`2024-39495`, :cve_nist:`2024-39506`, :cve_nist:`2024-40902`, :cve_nist:`2024-40911`, :cve_nist:`2024-40912`, :cve_nist:`2024-40932`, :cve_nist:`2024-40934`, :cve_nist:`2024-40954`, :cve_nist:`2024-40956`, :cve_nist:`2024-40957`, :cve_nist:`2024-40958`, :cve_nist:`2024-40959`, :cve_nist:`2024-40960`, :cve_nist:`2024-40961`, :cve_nist:`2024-40967`, :cve_nist:`2024-40970`, :cve_nist:`2024-40980`, :cve_nist:`2024-40981`, :cve_nist:`2024-40994`, :cve_nist:`2024-40995`, :cve_nist:`2024-41000`, :cve_nist:`2024-41002`, :cve_nist:`2024-41006`, :cve_nist:`2024-41007`, :cve_nist:`2024-41046`, :cve_nist:`2024-41049`, :cve_nist:`2024-41055`, :cve_nist:`2024-41064`, :cve_nist:`2024-41070`, :cve_nist:`2024-41073`, :cve_nist:`2024-41087`, :cve_nist:`2024-41089`, :cve_nist:`2024-41092`, :cve_nist:`2024-41093`, :cve_nist:`2024-41095`, :cve_nist:`2024-41097`, :cve_nist:`2024-42068`, :
 cve_nist:`2024-42070`, :cve_nist:`2024-42076`, :cve_nist:`2024-42077`, :cve_nist:`2024-42080`, :cve_nist:`2024-42082`, :cve_nist:`2024-42085`, :cve_nist:`2024-42090`, :cve_nist:`2024-42093`, :cve_nist:`2024-42094`, :cve_nist:`2024-42101`, :cve_nist:`2024-42102`, :cve_nist:`2024-42104`, :cve_nist:`2024-42109`, :cve_nist:`2024-42140`, :cve_nist:`2024-42148`, :cve_nist:`2024-42152`, :cve_nist:`2024-42153`, :cve_nist:`2024-42154`, :cve_nist:`2024-42157`, :cve_nist:`2024-42161`, :cve_nist:`2024-42223`, :cve_nist:`2024-42224`, :cve_nist:`2024-42225`, :cve_nist:`2024-42229`, :cve_nist:`2024-42232`, :cve_nist:`2024-42236`, :cve_nist:`2024-42244` and :cve_nist:`2024-42247`
+-  llvm: Fix :cve_nist:`2023-46049` and :cve_nist:`2024-31852`
+-  ofono: fix :cve_nist:`2023-2794`
+-  orc: Fix :cve_nist:`2024-40897`
+-  python3-certifi: Fix :cve_nist:`2024-39689`
+-  python3-jinja2: Fix :cve_nist:`2024-34064`
+-  python3: Fix :cve_nist:`2024-8088`
+-  qemu: Fix :cve_nist:`2024-7409`
+-  ruby: Fix for :cve_nist:`2024-27282`
+-  tiff: Fix :cve_nist:`2024-7006`
+-  vim: Fix :cve_nist:`2024-22667`, :cve_nist:`2024-41957`, :cve_nist:`2024-41965` and :cve_nist:`2024-43374`
+-  wpa-supplicant: Fix :cve_nist:`2023-52160`
 
 
 Fixes in Yocto-4.0.21
@@ -51,8 +51,8 @@ Fixes in Yocto-4.0.21
 -  python3-pycryptodome(x): use python_setuptools_build_meta build class
 -  python3: add PACKAGECONFIG[editline]
 -  ref-manual: fix typo and move :term:`SYSROOT_DIRS` example
--  sqlite3: CVE_ID correction for :cve:`2023-7104` as patched
--  sqlite3: Rename patch for :cve:`2022-35737`
+-  sqlite3: CVE_ID correction for :cve_nist:`2023-7104` as patched
+-  sqlite3: Rename patch for :cve_nist:`2022-35737`
 -  uboot-sign: Fix index error in concat_dtb_helper() with multiple configs
 -  vim: upgrade to 9.1.0682
 -  wireless-regdb: upgrade to 2024.07.04
diff --git a/documentation/migration-guides/release-notes-4.0.22.rst b/documentation/migration-guides/release-notes-4.0.22.rst
index 7cde5d32aeca9745638eb89a5628816d73429515..b2b98bd9074066cdfd0018d419fb668945ef9121 100644
--- a/documentation/migration-guides/release-notes-4.0.22.rst
+++ b/documentation/migration-guides/release-notes-4.0.22.rst
@@ -6,21 +6,21 @@ Release notes for Yocto-4.0.22 (Kirkstone)
 Security Fixes in Yocto-4.0.22
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  cups: Fix :cve:`2024-35235` and :cve:`2024-47175`
--  curl: Fix :cve:`2024-8096`
--  expat: Fix :cve:`2024-45490`, :cve:`2024-45491` and :cve:`2024-45492`
--  gnupg: Ignore :cve:`2022-3219`
--  libpcap: Fix :cve:`2023-7256` and :cve:`2024-8006`
--  linux-yocto/5.10: Fix :cve:`2022-48772`, :cve:`2023-52434`, :cve:`2023-52447`, :cve:`2023-52458`, :cve:`2024-0841`, :cve:`2024-26601`, :cve:`2024-26882`, :cve:`2024-26883`, :cve:`2024-26884`, :cve:`2024-26885`, :cve:`2024-26898`, :cve:`2024-26901`, :cve:`2024-26903`, :cve:`2024-26907`, :cve:`2024-26934`, :cve:`2024-26978`, :cve:`2024-27013`, :cve:`2024-27020`, :cve:`2024-35972`, :cve:`2024-35978`, :cve:`2024-35982`, :cve:`2024-35984`, :cve:`2024-35990`, :cve:`2024-35997`, :cve:`2024-36008`, :cve:`2024-36270`, :cve:`2024-36489`, :cve:`2024-36902`, :cve:`2024-36971`, :cve:`2024-36978`, :cve:`2024-38546`, :cve:`2024-38547`, :cve:`2024-38549`, :cve:`2024-38552`, :cve:`2024-38555`, :cve:`2024-38583`, :cve:`2024-38590`, :cve:`2024-38597`, :cve:`2024-38598`, :cve:`2024-38627`, :cve:`2024-38633`, :cve:`2024-38661`, :cve:`2024-38662`, :cve:`2024-38780`, :cve:`2024-39292`, :cve:`2024-39301`, :cve:`2024-39468`, :cve:`2024-39471`, :cve:`2024-39475`, :cve:`2024-39476`, :cve:`2024-39480`, :cve
 :`2024-39482`, :cve:`2024-39484`, :cve:`2024-39487`, :cve:`2024-39489`, :cve:`2024-39495`, :cve:`2024-39506`, :cve:`2024-40902`, :cve:`2024-40904`, :cve:`2024-40905`, :cve:`2024-40912`, :cve:`2024-40932`, :cve:`2024-40934`, :cve:`2024-40958`, :cve:`2024-40959`, :cve:`2024-40960`, :cve:`2024-40961`, :cve:`2024-40980`, :cve:`2024-40981`, :cve:`2024-40995`, :cve:`2024-41000`, :cve:`2024-41006`, :cve:`2024-41007`, :cve:`2024-41012`, :cve:`2024-41040`, :cve:`2024-41046`, :cve:`2024-41049`, :cve:`2024-41059`, :cve:`2024-41063`, :cve:`2024-41064`, :cve:`2024-41070`, :cve:`2024-41087`, :cve:`2024-41089`, :cve:`2024-41092`, :cve:`2024-41095`, :cve:`2024-41097`, :cve:`2024-42070`, :cve:`2024-42076`, :cve:`2024-42077`, :cve:`2024-42082`, :cve:`2024-42090`, :cve:`2024-42093`, :cve:`2024-42094`, :cve:`2024-42101`, :cve:`2024-42102`, :cve:`2024-42104`, :cve:`2024-42131`, :cve:`2024-42137`, :cve:`2024-42148`, :cve:`2024-42152`, :cve:`2024-42153`, :cve:`2024-42154`, :cve:`2024-42157`, :cve:`2024-42
 161`, :cve:`2024-42223`, :cve:`2024-42224`, :cve:`2024-42229`, :cve:`2024-42232`, :cve:`2024-42236`, :cve:`2024-42244` and :cve:`2024-42247`
--  linux-yocto/5.15: Fix :cve:`2023-52889`, :cve:`2024-41011`, :cve:`2024-42114`, :cve:`2024-42259`, :cve:`2024-42271`, :cve:`2024-42272`, :cve:`2024-42277`, :cve:`2024-42280`, :cve:`2024-42283`, :cve:`2024-42284`, :cve:`2024-42285`, :cve:`2024-42286`, :cve:`2024-42287`, :cve:`2024-42288`, :cve:`2024-42289`, :cve:`2024-42301`, :cve:`2024-42302`, :cve:`2024-42309`, :cve:`2024-42310`, :cve:`2024-42311`, :cve:`2024-42313`, :cve:`2024-43817`, :cve:`2024-43828`, :cve:`2024-43854`, :cve:`2024-43856`, :cve:`2024-43858`, :cve:`2024-43860`, :cve:`2024-43861`, :cve:`2024-43863`, :cve:`2024-43871`, :cve:`2024-43873`, :cve:`2024-43882`, :cve:`2024-43889`, :cve:`2024-43890`, :cve:`2024-43893`, :cve:`2024-43894`, :cve:`2024-43902`, :cve:`2024-43907`, :cve:`2024-43908`, :cve:`2024-43909`, :cve:`2024-43914`, :cve:`2024-44934`, :cve:`2024-44935`, :cve:`2024-44944`, :cve:`2024-44947`, :cve:`2024-44952`, :cve:`2024-44954`, :cve:`2024-44958`, :cve:`2024-44960`, :cve:`2024-44965`, :cve:`2024-44966`, :cv
 e:`2024-44969`, :cve:`2024-44971`, :cve:`2024-44982`, :cve:`2024-44983`, :cve:`2024-44985`, :cve:`2024-44986`, :cve:`2024-44987`, :cve:`2024-44988`, :cve:`2024-44989`, :cve:`2024-44990`, :cve:`2024-44995`, :cve:`2024-44998`, :cve:`2024-44999`, :cve:`2024-45003`, :cve:`2024-45006`, :cve:`2024-45011`, :cve:`2024-45016`, :cve:`2024-45018`, :cve:`2024-45021`, :cve:`2024-45025`, :cve:`2024-45026`, :cve:`2024-45028`, :cve:`2024-46673`, :cve:`2024-46674`, :cve:`2024-46675`, :cve:`2024-46676`, :cve:`2024-46677`, :cve:`2024-46679`, :cve:`2024-46685`, :cve:`2024-46689`, :cve:`2024-46702` and :cve:`2024-46707`
--  openssl: Fix :cve:`2024-6119`
--  procps: Fix :cve:`2023-4016`
--  python3: Fix :cve:`2023-27043`, :cve:`2024-4030`, :cve:`2024-4032`, :cve:`2024-6923`, :cve:`2024-6232`, :cve:`2024-7592` and :cve:`2024-8088`
--  qemu: Fix :cve:`2024-4467`
--  rust: Ignore :cve:`2024-43402`
--  webkitgtk: Fix :cve:`2024-40779`
--  wpa-supplicant: Ignore :cve:`2024-5290`
--  wpa-supplicant: Fix :cve:`2024-3596`
+-  cups: Fix :cve_nist:`2024-35235` and :cve_nist:`2024-47175`
+-  curl: Fix :cve_nist:`2024-8096`
+-  expat: Fix :cve_nist:`2024-45490`, :cve_nist:`2024-45491` and :cve_nist:`2024-45492`
+-  gnupg: Ignore :cve_nist:`2022-3219`
+-  libpcap: Fix :cve_nist:`2023-7256` and :cve_nist:`2024-8006`
+-  linux-yocto/5.10: Fix :cve_nist:`2022-48772`, :cve_nist:`2023-52434`, :cve_nist:`2023-52447`, :cve_nist:`2023-52458`, :cve_nist:`2024-0841`, :cve_nist:`2024-26601`, :cve_nist:`2024-26882`, :cve_nist:`2024-26883`, :cve_nist:`2024-26884`, :cve_nist:`2024-26885`, :cve_nist:`2024-26898`, :cve_nist:`2024-26901`, :cve_nist:`2024-26903`, :cve_nist:`2024-26907`, :cve_nist:`2024-26934`, :cve_nist:`2024-26978`, :cve_nist:`2024-27013`, :cve_nist:`2024-27020`, :cve_nist:`2024-35972`, :cve_nist:`2024-35978`, :cve_nist:`2024-35982`, :cve_nist:`2024-35984`, :cve_nist:`2024-35990`, :cve_nist:`2024-35997`, :cve_nist:`2024-36008`, :cve_nist:`2024-36270`, :cve_nist:`2024-36489`, :cve_nist:`2024-36902`, :cve_nist:`2024-36971`, :cve_nist:`2024-36978`, :cve_nist:`2024-38546`, :cve_nist:`2024-38547`, :cve_nist:`2024-38549`, :cve_nist:`2024-38552`, :cve_nist:`2024-38555`, :cve_nist:`2024-38583`, :cve_nist:`2024-38590`, :cve_nist:`2024-38597`, :cve_nist:`2024-38598`, :cve_nist:`2024-38627`, :cve_nist:`20
 24-38633`, :cve_nist:`2024-38661`, :cve_nist:`2024-38662`, :cve_nist:`2024-38780`, :cve_nist:`2024-39292`, :cve_nist:`2024-39301`, :cve_nist:`2024-39468`, :cve_nist:`2024-39471`, :cve_nist:`2024-39475`, :cve_nist:`2024-39476`, :cve_nist:`2024-39480`, :cve_nist:`2024-39482`, :cve_nist:`2024-39484`, :cve_nist:`2024-39487`, :cve_nist:`2024-39489`, :cve_nist:`2024-39495`, :cve_nist:`2024-39506`, :cve_nist:`2024-40902`, :cve_nist:`2024-40904`, :cve_nist:`2024-40905`, :cve_nist:`2024-40912`, :cve_nist:`2024-40932`, :cve_nist:`2024-40934`, :cve_nist:`2024-40958`, :cve_nist:`2024-40959`, :cve_nist:`2024-40960`, :cve_nist:`2024-40961`, :cve_nist:`2024-40980`, :cve_nist:`2024-40981`, :cve_nist:`2024-40995`, :cve_nist:`2024-41000`, :cve_nist:`2024-41006`, :cve_nist:`2024-41007`, :cve_nist:`2024-41012`, :cve_nist:`2024-41040`, :cve_nist:`2024-41046`, :cve_nist:`2024-41049`, :cve_nist:`2024-41059`, :cve_nist:`2024-41063`, :cve_nist:`2024-41064`, :cve_nist:`2024-41070`, :cve_nist:`2024-41087`, :c
 ve_nist:`2024-41089`, :cve_nist:`2024-41092`, :cve_nist:`2024-41095`, :cve_nist:`2024-41097`, :cve_nist:`2024-42070`, :cve_nist:`2024-42076`, :cve_nist:`2024-42077`, :cve_nist:`2024-42082`, :cve_nist:`2024-42090`, :cve_nist:`2024-42093`, :cve_nist:`2024-42094`, :cve_nist:`2024-42101`, :cve_nist:`2024-42102`, :cve_nist:`2024-42104`, :cve_nist:`2024-42131`, :cve_nist:`2024-42137`, :cve_nist:`2024-42148`, :cve_nist:`2024-42152`, :cve_nist:`2024-42153`, :cve_nist:`2024-42154`, :cve_nist:`2024-42157`, :cve_nist:`2024-42161`, :cve_nist:`2024-42223`, :cve_nist:`2024-42224`, :cve_nist:`2024-42229`, :cve_nist:`2024-42232`, :cve_nist:`2024-42236`, :cve_nist:`2024-42244` and :cve_nist:`2024-42247`
+-  linux-yocto/5.15: Fix :cve_nist:`2023-52889`, :cve_nist:`2024-41011`, :cve_nist:`2024-42114`, :cve_nist:`2024-42259`, :cve_nist:`2024-42271`, :cve_nist:`2024-42272`, :cve_nist:`2024-42277`, :cve_nist:`2024-42280`, :cve_nist:`2024-42283`, :cve_nist:`2024-42284`, :cve_nist:`2024-42285`, :cve_nist:`2024-42286`, :cve_nist:`2024-42287`, :cve_nist:`2024-42288`, :cve_nist:`2024-42289`, :cve_nist:`2024-42301`, :cve_nist:`2024-42302`, :cve_nist:`2024-42309`, :cve_nist:`2024-42310`, :cve_nist:`2024-42311`, :cve_nist:`2024-42313`, :cve_nist:`2024-43817`, :cve_nist:`2024-43828`, :cve_nist:`2024-43854`, :cve_nist:`2024-43856`, :cve_nist:`2024-43858`, :cve_nist:`2024-43860`, :cve_nist:`2024-43861`, :cve_nist:`2024-43863`, :cve_nist:`2024-43871`, :cve_nist:`2024-43873`, :cve_nist:`2024-43882`, :cve_nist:`2024-43889`, :cve_nist:`2024-43890`, :cve_nist:`2024-43893`, :cve_nist:`2024-43894`, :cve_nist:`2024-43902`, :cve_nist:`2024-43907`, :cve_nist:`2024-43908`, :cve_nist:`2024-43909`, :cve_nist:`2
 024-43914`, :cve_nist:`2024-44934`, :cve_nist:`2024-44935`, :cve_nist:`2024-44944`, :cve_nist:`2024-44947`, :cve_nist:`2024-44952`, :cve_nist:`2024-44954`, :cve_nist:`2024-44958`, :cve_nist:`2024-44960`, :cve_nist:`2024-44965`, :cve_nist:`2024-44966`, :cve_nist:`2024-44969`, :cve_nist:`2024-44971`, :cve_nist:`2024-44982`, :cve_nist:`2024-44983`, :cve_nist:`2024-44985`, :cve_nist:`2024-44986`, :cve_nist:`2024-44987`, :cve_nist:`2024-44988`, :cve_nist:`2024-44989`, :cve_nist:`2024-44990`, :cve_nist:`2024-44995`, :cve_nist:`2024-44998`, :cve_nist:`2024-44999`, :cve_nist:`2024-45003`, :cve_nist:`2024-45006`, :cve_nist:`2024-45011`, :cve_nist:`2024-45016`, :cve_nist:`2024-45018`, :cve_nist:`2024-45021`, :cve_nist:`2024-45025`, :cve_nist:`2024-45026`, :cve_nist:`2024-45028`, :cve_nist:`2024-46673`, :cve_nist:`2024-46674`, :cve_nist:`2024-46675`, :cve_nist:`2024-46676`, :cve_nist:`2024-46677`, :cve_nist:`2024-46679`, :cve_nist:`2024-46685`, :cve_nist:`2024-46689`, :cve_nist:`2024-46702` an
 d :cve_nist:`2024-46707`
+-  openssl: Fix :cve_nist:`2024-6119`
+-  procps: Fix :cve_nist:`2023-4016`
+-  python3: Fix :cve_nist:`2023-27043`, :cve_nist:`2024-4030`, :cve_nist:`2024-4032`, :cve_nist:`2024-6923`, :cve_nist:`2024-6232`, :cve_nist:`2024-7592` and :cve_nist:`2024-8088`
+-  qemu: Fix :cve_nist:`2024-4467`
+-  rust: Ignore :cve_nist:`2024-43402`
+-  webkitgtk: Fix :cve_nist:`2024-40779`
+-  wpa-supplicant: Ignore :cve_nist:`2024-5290`
+-  wpa-supplicant: Fix :cve_nist:`2024-3596`
 
 
 Fixes in Yocto-4.0.22
diff --git a/documentation/migration-guides/release-notes-4.0.3.rst b/documentation/migration-guides/release-notes-4.0.3.rst
index 46fe858cb76129955e5baf823dc0c5df1b11aae0..1b9559a962697f122f859407d2204bd97f77c02f 100644
--- a/documentation/migration-guides/release-notes-4.0.3.rst
+++ b/documentation/migration-guides/release-notes-4.0.3.rst
@@ -6,21 +6,21 @@ Release notes for Yocto-4.0.3 (Kirkstone)
 Security Fixes in Yocto-4.0.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  binutils: fix :cve:`2019-1010204`
--  busybox: fix :cve:`2022-30065`
--  cups: ignore :cve:`2022-26691`
--  curl: Fix :cve:`2022-32205`, :cve:`2022-32206`, :cve:`2022-32207` and :cve:`2022-32208`
--  dpkg: fix :cve:`2022-1664`
--  ghostscript: fix :cve:`2022-2085`
--  harfbuzz: fix :cve:`2022-33068`
--  libtirpc: fix :cve:`2021-46828`
--  lua: fix :cve:`2022-33099`
--  nasm: ignore :cve:`2020-18974`
--  qemu: fix :cve:`2022-35414`
--  qemu: ignore :cve:`2021-20255` and :cve:`2019-12067`
--  tiff: fix :cve:`2022-1354`, :cve:`2022-1355`, :cve:`2022-2056`, :cve:`2022-2057` and :cve:`2022-2058`
--  u-boot: fix :cve:`2022-34835`
--  unzip: fix :cve:`2022-0529` and :cve:`2022-0530`
+-  binutils: fix :cve_nist:`2019-1010204`
+-  busybox: fix :cve_nist:`2022-30065`
+-  cups: ignore :cve_nist:`2022-26691`
+-  curl: Fix :cve_nist:`2022-32205`, :cve_nist:`2022-32206`, :cve_nist:`2022-32207` and :cve_nist:`2022-32208`
+-  dpkg: fix :cve_nist:`2022-1664`
+-  ghostscript: fix :cve_nist:`2022-2085`
+-  harfbuzz: fix :cve_nist:`2022-33068`
+-  libtirpc: fix :cve_nist:`2021-46828`
+-  lua: fix :cve_nist:`2022-33099`
+-  nasm: ignore :cve_nist:`2020-18974`
+-  qemu: fix :cve_nist:`2022-35414`
+-  qemu: ignore :cve_nist:`2021-20255` and :cve_nist:`2019-12067`
+-  tiff: fix :cve_nist:`2022-1354`, :cve_nist:`2022-1355`, :cve_nist:`2022-2056`, :cve_nist:`2022-2057` and :cve_nist:`2022-2058`
+-  u-boot: fix :cve_nist:`2022-34835`
+-  unzip: fix :cve_nist:`2022-0529` and :cve_nist:`2022-0530`
 
 
 Fixes in Yocto-4.0.3
diff --git a/documentation/migration-guides/release-notes-4.0.4.rst b/documentation/migration-guides/release-notes-4.0.4.rst
index 1d6e525bbc5060922ebfd85c2390fc6af6cda085..41ef095c456eb0fef0a0f9aaaecb810556708ea3 100644
--- a/documentation/migration-guides/release-notes-4.0.4.rst
+++ b/documentation/migration-guides/release-notes-4.0.4.rst
@@ -6,17 +6,17 @@ Release notes for Yocto-4.0.4 (Kirkstone)
 Security Fixes in Yocto-4.0.4
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  binutils : fix :cve:`2022-38533`
--  curl: fix :cve:`2022-35252`
--  sqlite: fix :cve:`2022-35737`
--  grub2: fix :cve:`2021-3695`, :cve:`2021-3696`, :cve:`2021-3697`, :cve:`2022-28733`, :cve:`2022-28734` and :cve:`2022-28735`
--  u-boot: fix :cve:`2022-30552` and :cve:`2022-33967`
--  libxml2: Ignore :cve:`2016-3709`
--  libtiff: fix :cve:`2022-34526`
--  zlib: fix :cve:`2022-37434`
--  gnutls: fix :cve:`2022-2509`
--  u-boot: fix :cve:`2022-33103`
--  qemu: fix :cve:`2021-3507`, :cve:`2021-3929`, :cve:`2021-4158`, :cve:`2022-0216` and :cve:`2022-0358`
+-  binutils : fix :cve_nist:`2022-38533`
+-  curl: fix :cve_nist:`2022-35252`
+-  sqlite: fix :cve_nist:`2022-35737`
+-  grub2: fix :cve_nist:`2021-3695`, :cve_nist:`2021-3696`, :cve_nist:`2021-3697`, :cve_nist:`2022-28733`, :cve_nist:`2022-28734` and :cve_nist:`2022-28735`
+-  u-boot: fix :cve_nist:`2022-30552` and :cve_nist:`2022-33967`
+-  libxml2: Ignore :cve_nist:`2016-3709`
+-  libtiff: fix :cve_nist:`2022-34526`
+-  zlib: fix :cve_nist:`2022-37434`
+-  gnutls: fix :cve_nist:`2022-2509`
+-  u-boot: fix :cve_nist:`2022-33103`
+-  qemu: fix :cve_nist:`2021-3507`, :cve_nist:`2021-3929`, :cve_nist:`2021-4158`, :cve_nist:`2022-0216` and :cve_nist:`2022-0358`
 
 
 Fixes in Yocto-4.0.4
diff --git a/documentation/migration-guides/release-notes-4.0.5.rst b/documentation/migration-guides/release-notes-4.0.5.rst
index cdfe85b750e0dbb01e2d56f6901c8d99764488e6..ae061ed6333a7e6be4b2e5584aa8e3f970573443 100644
--- a/documentation/migration-guides/release-notes-4.0.5.rst
+++ b/documentation/migration-guides/release-notes-4.0.5.rst
@@ -6,11 +6,11 @@ Release notes for Yocto-4.0.5 (Kirkstone)
 Security Fixes in Yocto-4.0.5
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  qemu: fix :cve:`2021-3750`, :cve:`2021-3611` and :cve:`2022-2962`
--  binutils : fix :cve:`2022-38126`, :cve:`2022-38127` and :cve:`2022-38128`
--  tff: fix :cve:`2022-2867`, :cve:`2022-2868` and :cve:`2022-2869`
--  inetutils: fix :cve:`2022-39028`
--  go: fix :cve:`2022-27664`
+-  qemu: fix :cve_nist:`2021-3750`, :cve_nist:`2021-3611` and :cve_nist:`2022-2962`
+-  binutils : fix :cve_nist:`2022-38126`, :cve_nist:`2022-38127` and :cve_nist:`2022-38128`
+-  tff: fix :cve_nist:`2022-2867`, :cve_nist:`2022-2868` and :cve_nist:`2022-2869`
+-  inetutils: fix :cve_nist:`2022-39028`
+-  go: fix :cve_nist:`2022-27664`
 
 Fixes in Yocto-4.0.5
 ~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-4.0.6.rst b/documentation/migration-guides/release-notes-4.0.6.rst
index 76d23fcf0cd59f1ed1e475020415df2845ac17d3..e0c0cc09b9a96d6b1349a0fdad2660dd5d3c35ab 100644
--- a/documentation/migration-guides/release-notes-4.0.6.rst
+++ b/documentation/migration-guides/release-notes-4.0.6.rst
@@ -6,28 +6,28 @@ Release notes for Yocto-4.0.6 (Kirkstone)
 Security Fixes in Yocto-4.0.6
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bash: Fix :cve:`2022-3715`
--  curl: Fix :cve:`2022-32221`, :cve:`2022-42915` and :cve:`2022-42916`
--  dbus: Fix :cve:`2022-42010`, :cve:`2022-42011` and :cve:`2022-42012`
--  dropbear: Fix :cve:`2021-36369`
--  ffmpeg: Fix :cve:`2022-3964`, :cve:`2022-3965`
--  go: Fix :cve:`2022-2880`
--  grub2: Fix :cve:`2022-2601`, :cve:`2022-3775` and :cve:`2022-28736`
--  libarchive: Fix :cve:`2022-36227`
--  libpam: Fix :cve:`2022-28321`
--  libsndfile1: Fix :cve:`2021-4156`
--  lighttpd: Fix :cve:`2022-41556`
--  openssl: Fix :cve:`2022-3358`
--  pixman: Fix :cve:`2022-44638`
--  python3-mako: Fix :cve:`2022-40023`
--  python3: Fix :cve:`2022-42919`
--  qemu: Fix :cve:`2022-3165`
--  sysstat: Fix :cve:`2022-39377`
--  systemd: Fix :cve:`2022-3821`
--  tiff: Fix :cve:`2022-2953`, :cve:`2022-3599`, :cve:`2022-3597`, :cve:`2022-3626`, :cve:`2022-3627`, :cve:`2022-3570`, :cve:`2022-3598` and :cve:`2022-3970`
--  vim: Fix :cve:`2022-3352`, :cve:`2022-3705` and :cve:`2022-4141`
--  wayland: Fix :cve:`2021-3782`
--  xserver-xorg: Fix :cve:`2022-3550` and :cve:`2022-3551`
+-  bash: Fix :cve_nist:`2022-3715`
+-  curl: Fix :cve_nist:`2022-32221`, :cve_nist:`2022-42915` and :cve_nist:`2022-42916`
+-  dbus: Fix :cve_nist:`2022-42010`, :cve_nist:`2022-42011` and :cve_nist:`2022-42012`
+-  dropbear: Fix :cve_nist:`2021-36369`
+-  ffmpeg: Fix :cve_nist:`2022-3964`, :cve_nist:`2022-3965`
+-  go: Fix :cve_nist:`2022-2880`
+-  grub2: Fix :cve_nist:`2022-2601`, :cve_nist:`2022-3775` and :cve_nist:`2022-28736`
+-  libarchive: Fix :cve_nist:`2022-36227`
+-  libpam: Fix :cve_nist:`2022-28321`
+-  libsndfile1: Fix :cve_nist:`2021-4156`
+-  lighttpd: Fix :cve_nist:`2022-41556`
+-  openssl: Fix :cve_nist:`2022-3358`
+-  pixman: Fix :cve_nist:`2022-44638`
+-  python3-mako: Fix :cve_nist:`2022-40023`
+-  python3: Fix :cve_nist:`2022-42919`
+-  qemu: Fix :cve_nist:`2022-3165`
+-  sysstat: Fix :cve_nist:`2022-39377`
+-  systemd: Fix :cve_nist:`2022-3821`
+-  tiff: Fix :cve_nist:`2022-2953`, :cve_nist:`2022-3599`, :cve_nist:`2022-3597`, :cve_nist:`2022-3626`, :cve_nist:`2022-3627`, :cve_nist:`2022-3570`, :cve_nist:`2022-3598` and :cve_nist:`2022-3970`
+-  vim: Fix :cve_nist:`2022-3352`, :cve_nist:`2022-3705` and :cve_nist:`2022-4141`
+-  wayland: Fix :cve_nist:`2021-3782`
+-  xserver-xorg: Fix :cve_nist:`2022-3550` and :cve_nist:`2022-3551`
 
 
 Fixes in Yocto-4.0.6
diff --git a/documentation/migration-guides/release-notes-4.0.7.rst b/documentation/migration-guides/release-notes-4.0.7.rst
index c3885d9e0eb158de04ea0d08e52d0f5fe246b6b0..a11a29889d3e8cc42d8b123f8b8ee930f81c7177 100644
--- a/documentation/migration-guides/release-notes-4.0.7.rst
+++ b/documentation/migration-guides/release-notes-4.0.7.rst
@@ -6,25 +6,25 @@ Release notes for Yocto-4.0.7 (Kirkstone)
 Security Fixes in Yocto-4.0.7
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  binutils: Fix :cve:`2022-4285`
--  curl: Fix :cve:`2022-43551` and :cve_mitre:`2022-43552`
--  ffmpeg: Fix :cve:`2022-3109` and :cve:`2022-3341`
--  go: Fix :cve:`2022-41715` and :cve:`2022-41717`
--  libX11: Fix :cve:`2022-3554` and :cve:`2022-3555`
--  libarchive: Fix :cve:`2022-36227`
--  libksba: Fix :cve:`2022-47629`
--  libpng: Fix :cve:`2019-6129`
--  libxml2: Fix :cve:`2022-40303` and :cve:`2022-40304`
--  openssl: Fix :cve:`2022-3996`
--  python3: Fix :cve:`2022-45061`
--  python3-git: Fix :cve:`2022-24439`
--  python3-setuptools: Fix :cve:`2022-40897`
--  python3-wheel: Fix :cve:`2022-40898`
--  qemu: Fix :cve:`2022-4144`
--  sqlite: Fix :cve:`2022-46908`
--  systemd: Fix :cve:`2022-45873`
--  vim: Fix :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054` and :cve:`2023-0088`
--  webkitgtk: Fix :cve:`2022-32886`, :cve_mitre:`2022-32891` and :cve:`2022-32912`
+-  binutils: Fix :cve_nist:`2022-4285`
+-  curl: Fix :cve_nist:`2022-43551` and :cve_mitre:`2022-43552`
+-  ffmpeg: Fix :cve_nist:`2022-3109` and :cve_nist:`2022-3341`
+-  go: Fix :cve_nist:`2022-41715` and :cve_nist:`2022-41717`
+-  libX11: Fix :cve_nist:`2022-3554` and :cve_nist:`2022-3555`
+-  libarchive: Fix :cve_nist:`2022-36227`
+-  libksba: Fix :cve_nist:`2022-47629`
+-  libpng: Fix :cve_nist:`2019-6129`
+-  libxml2: Fix :cve_nist:`2022-40303` and :cve_nist:`2022-40304`
+-  openssl: Fix :cve_nist:`2022-3996`
+-  python3: Fix :cve_nist:`2022-45061`
+-  python3-git: Fix :cve_nist:`2022-24439`
+-  python3-setuptools: Fix :cve_nist:`2022-40897`
+-  python3-wheel: Fix :cve_nist:`2022-40898`
+-  qemu: Fix :cve_nist:`2022-4144`
+-  sqlite: Fix :cve_nist:`2022-46908`
+-  systemd: Fix :cve_nist:`2022-45873`
+-  vim: Fix :cve_nist:`2023-0049`, :cve_nist:`2023-0051`, :cve_nist:`2023-0054` and :cve_nist:`2023-0088`
+-  webkitgtk: Fix :cve_nist:`2022-32886`, :cve_mitre:`2022-32891` and :cve_nist:`2022-32912`
 
 
 Fixes in Yocto-4.0.7
@@ -39,7 +39,7 @@ Fixes in Yocto-4.0.7
 -  busybox: always start do_compile with orig config files
 -  busybox: rm temporary files if do_compile was interrupted
 -  cairo: fix CVE patches assigned wrong CVE number
--  cairo: update patch for :cve:`2019-6461` with upstream solution
+-  cairo: update patch for :cve_nist:`2019-6461` with upstream solution
 -  classes/create-spdx: Add SPDX_PRETTY option
 -  classes: image: Set empty weak default IMAGE_LINGUAS
 -  combo-layer: add sync-revs command
diff --git a/documentation/migration-guides/release-notes-4.0.8.rst b/documentation/migration-guides/release-notes-4.0.8.rst
index 223b74fbaf7612d6cd4e0b57096f5aee1bab73cd..af58d0462ca3ad6b1c5e7e93944c49676ff20e21 100644
--- a/documentation/migration-guides/release-notes-4.0.8.rst
+++ b/documentation/migration-guides/release-notes-4.0.8.rst
@@ -6,16 +6,16 @@ Release notes for Yocto-4.0.8 (Kirkstone)
 Security Fixes in Yocto-4.0.8
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  apr-util: Fix :cve:`2022-25147`
--  apr: Fix :cve:`2022-24963`, :cve:`2022-28331` and :cve:`2021-35940`
--  bind: Fix :cve:`2022-3094`, :cve:`2022-3736` and :cve:`2022-3924`
--  git: Ignore :cve:`2022-41953`
--  git: Fix :cve:`2022-23521` and :cve:`2022-41903`
--  libgit2: Fix :cve:`2023-22742`
--  ppp: Fix :cve:`2022-4603`
--  python3-certifi: Fix :cve:`2022-23491`
--  sudo: Fix :cve:`2023-22809`
--  tar: Fix :cve:`2022-48303`
+-  apr-util: Fix :cve_nist:`2022-25147`
+-  apr: Fix :cve_nist:`2022-24963`, :cve_nist:`2022-28331` and :cve_nist:`2021-35940`
+-  bind: Fix :cve_nist:`2022-3094`, :cve_nist:`2022-3736` and :cve_nist:`2022-3924`
+-  git: Ignore :cve_nist:`2022-41953`
+-  git: Fix :cve_nist:`2022-23521` and :cve_nist:`2022-41903`
+-  libgit2: Fix :cve_nist:`2023-22742`
+-  ppp: Fix :cve_nist:`2022-4603`
+-  python3-certifi: Fix :cve_nist:`2022-23491`
+-  sudo: Fix :cve_nist:`2023-22809`
+-  tar: Fix :cve_nist:`2022-48303`
 
 
 Fixes in Yocto-4.0.8
diff --git a/documentation/migration-guides/release-notes-4.0.9.rst b/documentation/migration-guides/release-notes-4.0.9.rst
index 236477443a9a82f36fd88dc0e3fce7bba3efe1f1..a571e957246fae7d2b4435fa06d84b2ed63d287c 100644
--- a/documentation/migration-guides/release-notes-4.0.9.rst
+++ b/documentation/migration-guides/release-notes-4.0.9.rst
@@ -6,26 +6,26 @@ Release notes for Yocto-4.0.9 (Kirkstone)
 Security Fixes in Yocto-4.0.9
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  binutils: Fix :cve:`2023-22608`
--  curl: Fix :cve:`2023-23914`, :cve:`2023-23915` and :cve:`2023-23916`
--  epiphany: Fix :cve:`2023-26081`
--  git: Ignore :cve:`2023-22743`
--  glibc: Fix  :cve:`2023-0687`
--  gnutls: Fix :cve:`2023-0361`
--  go: Fix :cve:`2022-2879`, :cve:`2022-41720` and :cve:`2022-41723`
--  harfbuzz: Fix :cve:`2023-25193`
--  less: Fix :cve:`2022-46663`
--  libmicrohttpd: Fix :cve:`2023-27371`
--  libsdl2: Fix :cve:`2022-4743`
--  openssl: Fix :cve:`2022-3996`, :cve:`2023-0464`, :cve:`2023-0465` and :cve:`2023-0466`
--  pkgconf: Fix :cve:`2023-24056`
--  python3: Fix :cve:`2023-24329`
--  shadow: Ignore :cve:`2016-15024`
--  systemd: Fix :cve:`2022-4415`
--  tiff: Fix :cve:`2023-0800`, :cve:`2023-0801`, :cve:`2023-0802`, :cve:`2023-0803` and :cve:`2023-0804`
--  vim: Fix :cve:`2023-0433`, :cve:`2023-0512`, :cve:`2023-1127`, :cve:`2023-1170`, :cve:`2023-1175`, :cve:`2023-1264` and :cve:`2023-1355`
--  xserver-xorg: Fix :cve:`2023-0494`
--  xwayland: Fix :cve:`2023-0494`
+-  binutils: Fix :cve_nist:`2023-22608`
+-  curl: Fix :cve_nist:`2023-23914`, :cve_nist:`2023-23915` and :cve_nist:`2023-23916`
+-  epiphany: Fix :cve_nist:`2023-26081`
+-  git: Ignore :cve_nist:`2023-22743`
+-  glibc: Fix  :cve_nist:`2023-0687`
+-  gnutls: Fix :cve_nist:`2023-0361`
+-  go: Fix :cve_nist:`2022-2879`, :cve_nist:`2022-41720` and :cve_nist:`2022-41723`
+-  harfbuzz: Fix :cve_nist:`2023-25193`
+-  less: Fix :cve_nist:`2022-46663`
+-  libmicrohttpd: Fix :cve_nist:`2023-27371`
+-  libsdl2: Fix :cve_nist:`2022-4743`
+-  openssl: Fix :cve_nist:`2022-3996`, :cve_nist:`2023-0464`, :cve_nist:`2023-0465` and :cve_nist:`2023-0466`
+-  pkgconf: Fix :cve_nist:`2023-24056`
+-  python3: Fix :cve_nist:`2023-24329`
+-  shadow: Ignore :cve_nist:`2016-15024`
+-  systemd: Fix :cve_nist:`2022-4415`
+-  tiff: Fix :cve_nist:`2023-0800`, :cve_nist:`2023-0801`, :cve_nist:`2023-0802`, :cve_nist:`2023-0803` and :cve_nist:`2023-0804`
+-  vim: Fix :cve_nist:`2023-0433`, :cve_nist:`2023-0512`, :cve_nist:`2023-1127`, :cve_nist:`2023-1170`, :cve_nist:`2023-1175`, :cve_nist:`2023-1264` and :cve_nist:`2023-1355`
+-  xserver-xorg: Fix :cve_nist:`2023-0494`
+-  xwayland: Fix :cve_nist:`2023-0494`
 
 
 Fixes in Yocto-4.0.9
@@ -90,7 +90,7 @@ Fixes in Yocto-4.0.9
 -  pybootchartui: Fix python syntax issue
 -  python3-git: fix indent error
 -  python3-setuptools-rust-native: Add direct dependency of native python3 modules
--  qemu: Revert "fix :cve:`2021-3507`" as not applicable for qemu 6.2
+-  qemu: Revert "fix :cve_nist:`2021-3507`" as not applicable for qemu 6.2
 -  rsync: Add missing prototypes to function declarations
 -  rsync: Turn on -pedantic-errors at the end of 'configure'
 -  runqemu: kill qemu if it hangs
diff --git a/documentation/migration-guides/release-notes-4.0.rst b/documentation/migration-guides/release-notes-4.0.rst
index a50aae26f99b58041da3239b1fb5dd217596ad89..e9e69495279978c3230b82d09428e20992403fac 100644
--- a/documentation/migration-guides/release-notes-4.0.rst
+++ b/documentation/migration-guides/release-notes-4.0.rst
@@ -337,37 +337,37 @@ Other license-related notes:
 Security Fixes in 4.0
 ~~~~~~~~~~~~~~~~~~~~~
 
-- binutils: :cve:`2021-42574`, :cve:`2021-45078`
-- curl: :cve:`2021-22945`, :cve:`2021-22946`, :cve:`2021-22947`
-- epiphany: :cve:`2021-45085`, :cve:`2021-45086`, :cve:`2021-45087`, :cve:`2021-45088`
-- expat: :cve:`2021-45960`, :cve:`2021-46143`, :cve:`2022-22822`, :cve:`2022-22823`, :cve:`2022-22824`, :cve:`2022-22825`, :cve:`2022-22826`, :cve:`2022-22827`, :cve:`2022-23852`, :cve:`2022-23990`, :cve:`2022-25235`, :cve:`2022-25236`, :cve:`2022-25313`, :cve:`2022-25314`, :cve:`2022-25315`
-- ffmpeg: :cve:`2021-38114`
-- gcc: :cve:`2021-35465`, :cve:`2021-42574`, :cve:`2021-46195`, :cve:`2022-24765`
-- glibc: :cve:`2021-3998`, :cve:`2021-3999`, :cve:`2021-43396`, :cve:`2022-23218`, :cve:`2022-23219`
-- gmp: :cve:`2021-43618`
-- go: :cve:`2021-41771` and :cve:`2021-41772`
-- grub2: :cve:`2021-3981`
-- gzip: :cve:`2022-1271`
-- libarchive : :cve:`2021-31566`, :cve:`2021-36976`
-- libxml2: :cve:`2022-23308`
-- libxslt: :cve:`2021-30560`
-- lighttpd: :cve:`2022-22707`
-- linux-yocto/5.10: amdgpu: :cve:`2021-42327`
-- lua: :cve:`2021-43396`
-- openssl: :cve:`2021-4044`, :cve:`2022-0778`
-- qemu: :cve:`2022-1050`, :cve:`2022-26353`, :cve:`2022-26354`
-- rpm: :cve:`2021-3521`
-- seatd: :cve:`2022-25643`
-- speex: :cve:`2020-23903`
-- squashfs-tools: :cve:`2021-41072`
-- systemd: :cve:`2021-4034`
-- tiff: :cve:`2022-0561`, :cve:`2022-0562`, :cve:`2022-0865`, :cve:`2022-0891`, :cve:`2022-0907`, :cve:`2022-0908`, :cve:`2022-0909`, :cve:`2022-0924`, :cve:`2022-1056`, :cve:`2022-22844`
-- unzip: :cve:`2021-4217`
-- vim: :cve:`2021-3796`, :cve:`2021-3872`, :cve:`2021-3875`, :cve:`2021-3927`, :cve:`2021-3928`, :cve:`2021-3968`, :cve:`2021-3973`, :cve:`2021-4187`, :cve:`2022-0128`, :cve:`2022-0156`, :cve:`2022-0158`, :cve:`2022-0261`, :cve:`2022-0318`, :cve:`2022-0319`, :cve:`2022-0554`, :cve:`2022-0696`, :cve:`2022-0714`, :cve:`2022-0729`, :cve:`2022-0943`
-- virglrenderer: :cve:`2022-0135`, :cve:`2022-0175`
-- webkitgtk: :cve:`2022-22589`, :cve:`2022-22590`, :cve:`2022-22592`
-- xz: :cve:`2022-1271`
-- zlib: :cve:`2018-25032`
+- binutils: :cve_nist:`2021-42574`, :cve_nist:`2021-45078`
+- curl: :cve_nist:`2021-22945`, :cve_nist:`2021-22946`, :cve_nist:`2021-22947`
+- epiphany: :cve_nist:`2021-45085`, :cve_nist:`2021-45086`, :cve_nist:`2021-45087`, :cve_nist:`2021-45088`
+- expat: :cve_nist:`2021-45960`, :cve_nist:`2021-46143`, :cve_nist:`2022-22822`, :cve_nist:`2022-22823`, :cve_nist:`2022-22824`, :cve_nist:`2022-22825`, :cve_nist:`2022-22826`, :cve_nist:`2022-22827`, :cve_nist:`2022-23852`, :cve_nist:`2022-23990`, :cve_nist:`2022-25235`, :cve_nist:`2022-25236`, :cve_nist:`2022-25313`, :cve_nist:`2022-25314`, :cve_nist:`2022-25315`
+- ffmpeg: :cve_nist:`2021-38114`
+- gcc: :cve_nist:`2021-35465`, :cve_nist:`2021-42574`, :cve_nist:`2021-46195`, :cve_nist:`2022-24765`
+- glibc: :cve_nist:`2021-3998`, :cve_nist:`2021-3999`, :cve_nist:`2021-43396`, :cve_nist:`2022-23218`, :cve_nist:`2022-23219`
+- gmp: :cve_nist:`2021-43618`
+- go: :cve_nist:`2021-41771` and :cve_nist:`2021-41772`
+- grub2: :cve_nist:`2021-3981`
+- gzip: :cve_nist:`2022-1271`
+- libarchive : :cve_nist:`2021-31566`, :cve_nist:`2021-36976`
+- libxml2: :cve_nist:`2022-23308`
+- libxslt: :cve_nist:`2021-30560`
+- lighttpd: :cve_nist:`2022-22707`
+- linux-yocto/5.10: amdgpu: :cve_nist:`2021-42327`
+- lua: :cve_nist:`2021-43396`
+- openssl: :cve_nist:`2021-4044`, :cve_nist:`2022-0778`
+- qemu: :cve_nist:`2022-1050`, :cve_nist:`2022-26353`, :cve_nist:`2022-26354`
+- rpm: :cve_nist:`2021-3521`
+- seatd: :cve_nist:`2022-25643`
+- speex: :cve_nist:`2020-23903`
+- squashfs-tools: :cve_nist:`2021-41072`
+- systemd: :cve_nist:`2021-4034`
+- tiff: :cve_nist:`2022-0561`, :cve_nist:`2022-0562`, :cve_nist:`2022-0865`, :cve_nist:`2022-0891`, :cve_nist:`2022-0907`, :cve_nist:`2022-0908`, :cve_nist:`2022-0909`, :cve_nist:`2022-0924`, :cve_nist:`2022-1056`, :cve_nist:`2022-22844`
+- unzip: :cve_nist:`2021-4217`
+- vim: :cve_nist:`2021-3796`, :cve_nist:`2021-3872`, :cve_nist:`2021-3875`, :cve_nist:`2021-3927`, :cve_nist:`2021-3928`, :cve_nist:`2021-3968`, :cve_nist:`2021-3973`, :cve_nist:`2021-4187`, :cve_nist:`2022-0128`, :cve_nist:`2022-0156`, :cve_nist:`2022-0158`, :cve_nist:`2022-0261`, :cve_nist:`2022-0318`, :cve_nist:`2022-0319`, :cve_nist:`2022-0554`, :cve_nist:`2022-0696`, :cve_nist:`2022-0714`, :cve_nist:`2022-0729`, :cve_nist:`2022-0943`
+- virglrenderer: :cve_nist:`2022-0135`, :cve_nist:`2022-0175`
+- webkitgtk: :cve_nist:`2022-22589`, :cve_nist:`2022-22590`, :cve_nist:`2022-22592`
+- xz: :cve_nist:`2022-1271`
+- zlib: :cve_nist:`2018-25032`
 
 
 
diff --git a/documentation/migration-guides/release-notes-4.1.1.rst b/documentation/migration-guides/release-notes-4.1.1.rst
index 4f31fbf1c7c1fae7ede250ba2829a265cf7574b5..8393bc5320f522944cef82e464de9f8648cebaf7 100644
--- a/documentation/migration-guides/release-notes-4.1.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.1.rst
@@ -6,16 +6,16 @@ Release notes for Yocto-4.1.1 (Langdale)
 Security Fixes in Yocto-4.1.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  curl: Fix :cve:`2022-32221`, :cve:`2022-35260`, :cve:`2022-42915` and :cve:`2022-42916`
--  libx11: Fix :cve:`2022-3554`
--  lighttpd: Fix :cve:`2022-41556`
--  openssl: Fix :cve:`2022-3358`, :cve:`2022-3602` and :cve:`2022-3786`
--  pixman: Fix :cve:`2022-44638`
--  qemu: Fix :cve:`2022-3165`
--  sudo: Fix :cve:`2022-43995`
--  tiff: Fix :cve:`2022-3599`, :cve:`2022-3597`, :cve:`2022-3626`, :cve:`2022-3627`, :cve:`2022-3570` and :cve:`2022-3598`
--  xserver-xorg: Fix :cve:`2022-3550` and :cve:`2022-3551`
--  xserver-xorg: Ignore :cve:`2022-3553`
+-  curl: Fix :cve_nist:`2022-32221`, :cve_nist:`2022-35260`, :cve_nist:`2022-42915` and :cve_nist:`2022-42916`
+-  libx11: Fix :cve_nist:`2022-3554`
+-  lighttpd: Fix :cve_nist:`2022-41556`
+-  openssl: Fix :cve_nist:`2022-3358`, :cve_nist:`2022-3602` and :cve_nist:`2022-3786`
+-  pixman: Fix :cve_nist:`2022-44638`
+-  qemu: Fix :cve_nist:`2022-3165`
+-  sudo: Fix :cve_nist:`2022-43995`
+-  tiff: Fix :cve_nist:`2022-3599`, :cve_nist:`2022-3597`, :cve_nist:`2022-3626`, :cve_nist:`2022-3627`, :cve_nist:`2022-3570` and :cve_nist:`2022-3598`
+-  xserver-xorg: Fix :cve_nist:`2022-3550` and :cve_nist:`2022-3551`
+-  xserver-xorg: Ignore :cve_nist:`2022-3553`
 
 
 Fixes in Yocto-4.1.1
@@ -179,7 +179,7 @@ Fixes in Yocto-4.1.1
 -  shadow: update 4.12.1 -> 4.12.3
 -  systemd: add systemd-creds and systemd-cryptenroll to systemd-extra-utils
 -  test-manual: fix typo in machine name
--  tiff: fix a typo for :cve:`2022-2953`.patch
+-  tiff: fix a typo for :cve_nist:`2022-2953`.patch
 -  u-boot: Add savedefconfig task
 -  u-boot: Remove duplicate inherit of cml1
 -  uboot-sign: Fix using wrong KEY_REQ_ARGS
diff --git a/documentation/migration-guides/release-notes-4.1.2.rst b/documentation/migration-guides/release-notes-4.1.2.rst
index ee5d4ccc51e80d799b3d8bbad095609b5dbf3a58..ea20ced1be0eef716b76a63d68891242d9b30b07 100644
--- a/documentation/migration-guides/release-notes-4.1.2.rst
+++ b/documentation/migration-guides/release-notes-4.1.2.rst
@@ -6,18 +6,18 @@ Release notes for Yocto-4.1.2 (Langdale)
 Security Fixes in Yocto-4.1.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  sudo: Fix :cve:`2022-43995`
--  binutils: Fix :cve:`2022-4285`
--  cairo: update patch for :cve:`2019-6461` with upstream solution
--  expat: Fix :cve:`2022-43680`
--  ffmpeg: Fix :cve:`2022-3964` and :cve:`2022-3965`
--  grub: Fix :cve:`2022-28736`
--  libarchive: Fix :cve:`2022-36227`
--  libpam: Fix :cve:`2022-28321`
--  libpng: Fix :cve:`2019-6129`
--  ruby: Fix :cve:`2022-28738` and :cve:`2022-28739`
--  tiff: Fix :cve:`2022-3970`
--  vim: Fix :cve:`2022-4141`
+-  sudo: Fix :cve_nist:`2022-43995`
+-  binutils: Fix :cve_nist:`2022-4285`
+-  cairo: update patch for :cve_nist:`2019-6461` with upstream solution
+-  expat: Fix :cve_nist:`2022-43680`
+-  ffmpeg: Fix :cve_nist:`2022-3964` and :cve_nist:`2022-3965`
+-  grub: Fix :cve_nist:`2022-28736`
+-  libarchive: Fix :cve_nist:`2022-36227`
+-  libpam: Fix :cve_nist:`2022-28321`
+-  libpng: Fix :cve_nist:`2019-6129`
+-  ruby: Fix :cve_nist:`2022-28738` and :cve_nist:`2022-28739`
+-  tiff: Fix :cve_nist:`2022-3970`
+-  vim: Fix :cve_nist:`2022-4141`
 
 
 Fixes in Yocto-4.1.2
diff --git a/documentation/migration-guides/release-notes-4.1.3.rst b/documentation/migration-guides/release-notes-4.1.3.rst
index d8474cda6881f1766575a2f2abd4ea324fdeff71..b07cfa4689c0a0eaa04381da7f9d2c6e5a98b363 100644
--- a/documentation/migration-guides/release-notes-4.1.3.rst
+++ b/documentation/migration-guides/release-notes-4.1.3.rst
@@ -6,24 +6,24 @@ Release notes for Yocto-4.1.3 (Langdale)
 Security Fixes in Yocto-4.1.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  apr-util: Fix :cve:`2022-25147`
--  apr: Fix :cve:`2022-24963` and :cve:`2022-28331`
--  bind: Fix :cve:`2022-3094`, :cve:`2022-3736` and :cve:`2022-3924`
--  curl: Fix :cve:`2022-43551` and :cve:`2022-43552`
--  dbus: Fix :cve:`2022-42010`, :cve:`2022-42011` and :cve:`2022-42012`
--  git: Fix  :cve:`2022-23521`, :cve:`2022-39253`, :cve:`2022-39260` and :cve:`2022-41903`
--  git: Ignore :cve:`2022-41953`
--  go: Fix :cve:`2022-41717` and :cve:`2022-41720`
--  grub2: Fix :cve:`2022-2601` and :cve:`2022-3775`
--  less: Fix :cve:`2022-46663`
--  libarchive: Fix :cve:`2022-36227`
--  libksba: Fix :cve:`2022-47629`
--  openssl: Fix :cve:`2022-3996`
--  pkgconf: Fix :cve:`2023-24056`
--  ppp: Fix :cve:`2022-4603`
--  sudo: Fix :cve:`2023-22809`
--  tar: Fix :cve:`2022-48303`
--  vim: Fix :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054`, :cve:`2023-0288`, :cve:`2023-0433` and :cve:`2023-0512`
+-  apr-util: Fix :cve_nist:`2022-25147`
+-  apr: Fix :cve_nist:`2022-24963` and :cve_nist:`2022-28331`
+-  bind: Fix :cve_nist:`2022-3094`, :cve_nist:`2022-3736` and :cve_nist:`2022-3924`
+-  curl: Fix :cve_nist:`2022-43551` and :cve_nist:`2022-43552`
+-  dbus: Fix :cve_nist:`2022-42010`, :cve_nist:`2022-42011` and :cve_nist:`2022-42012`
+-  git: Fix  :cve_nist:`2022-23521`, :cve_nist:`2022-39253`, :cve_nist:`2022-39260` and :cve_nist:`2022-41903`
+-  git: Ignore :cve_nist:`2022-41953`
+-  go: Fix :cve_nist:`2022-41717` and :cve_nist:`2022-41720`
+-  grub2: Fix :cve_nist:`2022-2601` and :cve_nist:`2022-3775`
+-  less: Fix :cve_nist:`2022-46663`
+-  libarchive: Fix :cve_nist:`2022-36227`
+-  libksba: Fix :cve_nist:`2022-47629`
+-  openssl: Fix :cve_nist:`2022-3996`
+-  pkgconf: Fix :cve_nist:`2023-24056`
+-  ppp: Fix :cve_nist:`2022-4603`
+-  sudo: Fix :cve_nist:`2023-22809`
+-  tar: Fix :cve_nist:`2022-48303`
+-  vim: Fix :cve_nist:`2023-0049`, :cve_nist:`2023-0051`, :cve_nist:`2023-0054`, :cve_nist:`2023-0288`, :cve_nist:`2023-0433` and :cve_nist:`2023-0512`
 -  xserver-xorg: Fix :cve_mitre:`2023-0494`
 -  xwayland: Fix :cve_mitre:`2023-0494`
 
diff --git a/documentation/migration-guides/release-notes-4.1.4.rst b/documentation/migration-guides/release-notes-4.1.4.rst
index de469f4bee29f6c2d24cd99e21d6cec5c0a200ce..147dd371b11e46908514a49974572caaf284dca8 100644
--- a/documentation/migration-guides/release-notes-4.1.4.rst
+++ b/documentation/migration-guides/release-notes-4.1.4.rst
@@ -6,23 +6,23 @@ Release notes for Yocto-4.1.4 (Langdale)
 Security Fixes in Yocto-4.1.4
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  cve-extra-exclusions/linux-yocto: Ignore :cve:`2020-27784`, :cve:`2021-3669`, :cve:`2021-3759`, :cve:`2021-4218`, :cve:`2022-0480`, :cve:`2022-1184`, :cve:`2022-1462`, :cve:`2022-2308`, :cve:`2022-2327`, :cve:`2022-26365`, :cve:`2022-2663`, :cve:`2022-2785`, :cve:`2022-3176`, :cve:`2022-33740`, :cve:`2022-33741`, :cve:`2022-33742`, :cve:`2022-3526`, :cve:`2022-3563`, :cve:`2022-3621`, :cve:`2022-3623`, :cve:`2022-3624`, :cve:`2022-3625`, :cve:`2022-3629`, :cve:`2022-3630`, :cve:`2022-3633`, :cve:`2022-3635`, :cve:`2022-3636`, :cve:`2022-3637`, :cve:`2022-3646` and :cve:`2022-3649`
--  cve-extra-exclusions/linux-yocto 5.15: Ignore :cve:`2022-3435`, :cve:`2022-3534`, :cve:`2022-3564`, :cve:`2022-3564`, :cve:`2022-3619`, :cve:`2022-3640`, :cve:`2022-42895`, :cve:`2022-42896`, :cve:`2022-4382`, :cve:`2023-0266` and :cve:`2023-0394`
--  epiphany: Fix :cve:`2023-26081`
--  git: Ignore :cve:`2023-22743`
--  go: Fix :cve:`2022-41722`, :cve:`2022-41723`, :cve:`2022-41724`, :cve:`2022-41725` and :cve:`2023-24532`
--  harfbuzz: Fix :cve:`2023-25193`
--  libmicrohttpd: Fix :cve:`2023-27371`
--  libxml2: Fix :cve:`2022-40303` and :cve:`2022-40304`
--  openssl: Fix :cve:`2023-0464`, :cve:`2023-0465` and :cve:`2023-0466`
--  python3-setuptools: Fix :cve:`2022-40897`
--  qemu: Fix :cve:`2022-4144`
--  screen: Fix :cve:`2023-24626`
--  shadow: Ignore :cve:`2016-15024`
--  tiff: Fix :cve:`2022-48281`, :cve:`2023-0795`, :cve:`2023-0796`, :cve:`2023-0797`, :cve:`2023-0798`, :cve:`2023-0799`, :cve:`2023-0800`, :cve:`2023-0801`, :cve:`2023-0802`, :cve:`2023-0803` and :cve:`2023-0804`
--  vim: Fix :cve:`2023-1127`, :cve:`2023-1170`, :cve:`2023-1175`, :cve:`2023-1264` and :cve:`2023-1355`
--  xdg-utils: Fix :cve:`2022-4055`
--  xserver-xorg: Fix for :cve:`2023-1393`
+-  cve-extra-exclusions/linux-yocto: Ignore :cve_nist:`2020-27784`, :cve_nist:`2021-3669`, :cve_nist:`2021-3759`, :cve_nist:`2021-4218`, :cve_nist:`2022-0480`, :cve_nist:`2022-1184`, :cve_nist:`2022-1462`, :cve_nist:`2022-2308`, :cve_nist:`2022-2327`, :cve_nist:`2022-26365`, :cve_nist:`2022-2663`, :cve_nist:`2022-2785`, :cve_nist:`2022-3176`, :cve_nist:`2022-33740`, :cve_nist:`2022-33741`, :cve_nist:`2022-33742`, :cve_nist:`2022-3526`, :cve_nist:`2022-3563`, :cve_nist:`2022-3621`, :cve_nist:`2022-3623`, :cve_nist:`2022-3624`, :cve_nist:`2022-3625`, :cve_nist:`2022-3629`, :cve_nist:`2022-3630`, :cve_nist:`2022-3633`, :cve_nist:`2022-3635`, :cve_nist:`2022-3636`, :cve_nist:`2022-3637`, :cve_nist:`2022-3646` and :cve_nist:`2022-3649`
+-  cve-extra-exclusions/linux-yocto 5.15: Ignore :cve_nist:`2022-3435`, :cve_nist:`2022-3534`, :cve_nist:`2022-3564`, :cve_nist:`2022-3564`, :cve_nist:`2022-3619`, :cve_nist:`2022-3640`, :cve_nist:`2022-42895`, :cve_nist:`2022-42896`, :cve_nist:`2022-4382`, :cve_nist:`2023-0266` and :cve_nist:`2023-0394`
+-  epiphany: Fix :cve_nist:`2023-26081`
+-  git: Ignore :cve_nist:`2023-22743`
+-  go: Fix :cve_nist:`2022-41722`, :cve_nist:`2022-41723`, :cve_nist:`2022-41724`, :cve_nist:`2022-41725` and :cve_nist:`2023-24532`
+-  harfbuzz: Fix :cve_nist:`2023-25193`
+-  libmicrohttpd: Fix :cve_nist:`2023-27371`
+-  libxml2: Fix :cve_nist:`2022-40303` and :cve_nist:`2022-40304`
+-  openssl: Fix :cve_nist:`2023-0464`, :cve_nist:`2023-0465` and :cve_nist:`2023-0466`
+-  python3-setuptools: Fix :cve_nist:`2022-40897`
+-  qemu: Fix :cve_nist:`2022-4144`
+-  screen: Fix :cve_nist:`2023-24626`
+-  shadow: Ignore :cve_nist:`2016-15024`
+-  tiff: Fix :cve_nist:`2022-48281`, :cve_nist:`2023-0795`, :cve_nist:`2023-0796`, :cve_nist:`2023-0797`, :cve_nist:`2023-0798`, :cve_nist:`2023-0799`, :cve_nist:`2023-0800`, :cve_nist:`2023-0801`, :cve_nist:`2023-0802`, :cve_nist:`2023-0803` and :cve_nist:`2023-0804`
+-  vim: Fix :cve_nist:`2023-1127`, :cve_nist:`2023-1170`, :cve_nist:`2023-1175`, :cve_nist:`2023-1264` and :cve_nist:`2023-1355`
+-  xdg-utils: Fix :cve_nist:`2022-4055`
+-  xserver-xorg: Fix for :cve_nist:`2023-1393`
 
 
 Fixes in Yocto-4.1.4
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index a0d5196128adc2a8c590a4652466da62370a7fae..3ad3611b80a7da6c98acfdacd3512884817ee95e 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -225,36 +225,36 @@ The following corrections have been made to the :term:`LICENSE` values set by re
 Security Fixes in 4.1
 ~~~~~~~~~~~~~~~~~~~~~
 
-- bind: :cve:`2022-1183`, :cve:`2022-2795`, :cve:`2022-2881`, :cve:`2022-2906`, :cve:`2022-3080`, :cve:`2022-38178`
-- binutils: :cve:`2019-1010204`, :cve:`2022-38126`, :cve:`2022-38127`, :cve:`2022-38128`, :cve:`2022-38533`
-- busybox: :cve:`2022-30065`
-- connman: :cve:`2022-32292`, :cve:`2022-32293`
-- cups: :cve:`2022-26691`
-- e2fsprogs: :cve:`2022-1304`
-- expat: :cve:`2022-40674`
-- freetype: :cve:`2022-27404`
-- glibc: :cve:`2022-39046`
-- gnupg: :cve:`2022-34903`
-- grub2: :cve:`2021-3695`, :cve:`2021-3696`, :cve:`2021-3697`, :cve:`2022-28733`, :cve:`2022-28734`, :cve:`2022-28735`
-- inetutils: :cve:`2022-39028`
-- libtirpc: :cve:`2021-46828`
-- libxml2: :cve:`2016-3709` (ignored)
-- libxslt: :cve:`2022-29824` (not applicable)
-- linux-yocto/5.15: :cve:`2022-28796`
-- logrotate: :cve:`2022-1348`
-- lua: :cve:`2022-33099`
-- nasm: :cve:`2020-18974` (ignored)
-- ncurses: :cve:`2022-29458`
-- openssl: :cve:`2022-1292`, :cve:`2022-1343`, :cve:`2022-1434`, :cve:`2022-1473`, :cve:`2022-2068`, :cve:`2022-2274`, :cve:`2022-2097`
-- python3: :cve:`2015-20107` (ignored)
-- qemu: :cve:`2021-20255` (ignored), :cve:`2019-12067` (ignored), :cve:`2021-3507`, :cve:`2022-0216`, :cve:`2022-2962`, :cve:`2022-35414`
-- rpm: :cve:`2021-35937`, :cve:`2021-35938`, :cve:`2021-35939`
-- rsync: :cve:`2022-29154`
-- subversion: :cve:`2021-28544`, :cve:`2022-24070`
-- tiff: :cve:`2022-1210` (not applicable), :cve:`2022-1622`, :cve:`2022-1623` (invalid), :cve:`2022-2056`, :cve:`2022-2057`, :cve:`2022-2058`, :cve:`2022-2953`, :cve:`2022-34526`
-- unzip: :cve:`2022-0529`, :cve:`2022-0530`
-- vim: :cve:`2022-1381`, :cve:`2022-1420`, :cve:`2022-1621`, :cve:`2022-1629`, :cve:`2022-1674`, :cve:`2022-1733`, :cve:`2022-1735`, :cve:`2022-1769`, :cve:`2022-1771`, :cve:`2022-1785`, :cve:`2022-1796`, :cve:`2022-1927`, :cve:`2022-1942`, :cve:`2022-2257`, :cve:`2022-2264`, :cve:`2022-2284`, :cve:`2022-2285`, :cve:`2022-2286`, :cve:`2022-2287`, :cve:`2022-2816`, :cve:`2022-2817`, :cve:`2022-2819`, :cve:`2022-2845`, :cve:`2022-2849`, :cve:`2022-2862`, :cve:`2022-2874`, :cve:`2022-2889`, :cve:`2022-2980`, :cve:`2022-2946`, :cve:`2022-2982`, :cve:`2022-3099`, :cve:`2022-3134`, :cve:`2022-3234`, :cve:`2022-3278`
-- zlib: :cve:`2022-37434`
+- bind: :cve_nist:`2022-1183`, :cve_nist:`2022-2795`, :cve_nist:`2022-2881`, :cve_nist:`2022-2906`, :cve_nist:`2022-3080`, :cve_nist:`2022-38178`
+- binutils: :cve_nist:`2019-1010204`, :cve_nist:`2022-38126`, :cve_nist:`2022-38127`, :cve_nist:`2022-38128`, :cve_nist:`2022-38533`
+- busybox: :cve_nist:`2022-30065`
+- connman: :cve_nist:`2022-32292`, :cve_nist:`2022-32293`
+- cups: :cve_nist:`2022-26691`
+- e2fsprogs: :cve_nist:`2022-1304`
+- expat: :cve_nist:`2022-40674`
+- freetype: :cve_nist:`2022-27404`
+- glibc: :cve_nist:`2022-39046`
+- gnupg: :cve_nist:`2022-34903`
+- grub2: :cve_nist:`2021-3695`, :cve_nist:`2021-3696`, :cve_nist:`2021-3697`, :cve_nist:`2022-28733`, :cve_nist:`2022-28734`, :cve_nist:`2022-28735`
+- inetutils: :cve_nist:`2022-39028`
+- libtirpc: :cve_nist:`2021-46828`
+- libxml2: :cve_nist:`2016-3709` (ignored)
+- libxslt: :cve_nist:`2022-29824` (not applicable)
+- linux-yocto/5.15: :cve_nist:`2022-28796`
+- logrotate: :cve_nist:`2022-1348`
+- lua: :cve_nist:`2022-33099`
+- nasm: :cve_nist:`2020-18974` (ignored)
+- ncurses: :cve_nist:`2022-29458`
+- openssl: :cve_nist:`2022-1292`, :cve_nist:`2022-1343`, :cve_nist:`2022-1434`, :cve_nist:`2022-1473`, :cve_nist:`2022-2068`, :cve_nist:`2022-2274`, :cve_nist:`2022-2097`
+- python3: :cve_nist:`2015-20107` (ignored)
+- qemu: :cve_nist:`2021-20255` (ignored), :cve_nist:`2019-12067` (ignored), :cve_nist:`2021-3507`, :cve_nist:`2022-0216`, :cve_nist:`2022-2962`, :cve_nist:`2022-35414`
+- rpm: :cve_nist:`2021-35937`, :cve_nist:`2021-35938`, :cve_nist:`2021-35939`
+- rsync: :cve_nist:`2022-29154`
+- subversion: :cve_nist:`2021-28544`, :cve_nist:`2022-24070`
+- tiff: :cve_nist:`2022-1210` (not applicable), :cve_nist:`2022-1622`, :cve_nist:`2022-1623` (invalid), :cve_nist:`2022-2056`, :cve_nist:`2022-2057`, :cve_nist:`2022-2058`, :cve_nist:`2022-2953`, :cve_nist:`2022-34526`
+- unzip: :cve_nist:`2022-0529`, :cve_nist:`2022-0530`
+- vim: :cve_nist:`2022-1381`, :cve_nist:`2022-1420`, :cve_nist:`2022-1621`, :cve_nist:`2022-1629`, :cve_nist:`2022-1674`, :cve_nist:`2022-1733`, :cve_nist:`2022-1735`, :cve_nist:`2022-1769`, :cve_nist:`2022-1771`, :cve_nist:`2022-1785`, :cve_nist:`2022-1796`, :cve_nist:`2022-1927`, :cve_nist:`2022-1942`, :cve_nist:`2022-2257`, :cve_nist:`2022-2264`, :cve_nist:`2022-2284`, :cve_nist:`2022-2285`, :cve_nist:`2022-2286`, :cve_nist:`2022-2287`, :cve_nist:`2022-2816`, :cve_nist:`2022-2817`, :cve_nist:`2022-2819`, :cve_nist:`2022-2845`, :cve_nist:`2022-2849`, :cve_nist:`2022-2862`, :cve_nist:`2022-2874`, :cve_nist:`2022-2889`, :cve_nist:`2022-2980`, :cve_nist:`2022-2946`, :cve_nist:`2022-2982`, :cve_nist:`2022-3099`, :cve_nist:`2022-3134`, :cve_nist:`2022-3234`, :cve_nist:`2022-3278`
+- zlib: :cve_nist:`2022-37434`
 
 
 
diff --git a/documentation/migration-guides/release-notes-4.2.1.rst b/documentation/migration-guides/release-notes-4.2.1.rst
index 948c35fd67a0b997323f9a25e3e705217f32494b..0b2ef060fc5761807c5d270678c6d2403b3b5774 100644
--- a/documentation/migration-guides/release-notes-4.2.1.rst
+++ b/documentation/migration-guides/release-notes-4.2.1.rst
@@ -6,13 +6,13 @@ Release notes for Yocto-4.2.1 (Mickledore)
 Security Fixes in Yocto-4.2.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  connman: Fix :cve:`2023-28488`
--  linux-yocto: Ignore :cve:`2023-1652` and :cve:`2023-1829`
--  ghostscript: Fix :cve:`2023-28879`
--  qemu: Ignore :cve:`2023-0664`
--  ruby: Fix :cve:`2022-28738` and :cve:`2022-28739`
--  tiff: Fix :cve:`2022-4645`
--  xwayland: Fix :cve:`2023-1393`
+-  connman: Fix :cve_nist:`2023-28488`
+-  linux-yocto: Ignore :cve_nist:`2023-1652` and :cve_nist:`2023-1829`
+-  ghostscript: Fix :cve_nist:`2023-28879`
+-  qemu: Ignore :cve_nist:`2023-0664`
+-  ruby: Fix :cve_nist:`2022-28738` and :cve_nist:`2022-28739`
+-  tiff: Fix :cve_nist:`2022-4645`
+-  xwayland: Fix :cve_nist:`2023-1393`
 
 
 Fixes in Yocto-4.2.1
diff --git a/documentation/migration-guides/release-notes-4.2.2.rst b/documentation/migration-guides/release-notes-4.2.2.rst
index 74f2d0e82a327ef2568e9988315356d70bf916be..0795c8e93807981c0b5c6461e5c3d56e83155444 100644
--- a/documentation/migration-guides/release-notes-4.2.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.2.rst
@@ -6,21 +6,21 @@ Release notes for Yocto-4.2.2 (Mickledore)
 Security Fixes in Yocto-4.2.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  binutils: Fix :cve:`2023-1972`
--  cups: Fix :cve:`2023-32324`
--  curl: Fix :cve:`2023-28319`, :cve:`2023-28320`, :cve:`2023-28321` and :cve:`2023-28322`
--  dbus: Fix :cve:`2023-34969`
--  git: Fix :cve:`2023-25652` and :cve:`2023-29007`
--  git: Ignore :cve:`2023-25815`
--  libwebp: Fix :cve:`2023-1999`
--  libxml2: Fix :cve:`2023-28484` and :cve:`2023-29469`
--  libxpm: Fix :cve:`2022-44617`
--  ninja: Ignore :cve:`2021-4336`
--  openssl: Fix :cve:`2023-0464`, :cve:`2023-0465`, :cve:`2023-0466`, :cve:`2023-1255` and :cve:`2023-2650`
--  perl: Fix :cve:`2023-31484` and :cve:`2023-31486`
--  sysstat: Fix :cve:`2023-33204`
--  tiff: Fix :cve_mitre:`2023-25434`, :cve:`2023-26965` and :cve:`2023-2731`
--  vim: Fix :cve:`2023-2426`
+-  binutils: Fix :cve_nist:`2023-1972`
+-  cups: Fix :cve_nist:`2023-32324`
+-  curl: Fix :cve_nist:`2023-28319`, :cve_nist:`2023-28320`, :cve_nist:`2023-28321` and :cve_nist:`2023-28322`
+-  dbus: Fix :cve_nist:`2023-34969`
+-  git: Fix :cve_nist:`2023-25652` and :cve_nist:`2023-29007`
+-  git: Ignore :cve_nist:`2023-25815`
+-  libwebp: Fix :cve_nist:`2023-1999`
+-  libxml2: Fix :cve_nist:`2023-28484` and :cve_nist:`2023-29469`
+-  libxpm: Fix :cve_nist:`2022-44617`
+-  ninja: Ignore :cve_nist:`2021-4336`
+-  openssl: Fix :cve_nist:`2023-0464`, :cve_nist:`2023-0465`, :cve_nist:`2023-0466`, :cve_nist:`2023-1255` and :cve_nist:`2023-2650`
+-  perl: Fix :cve_nist:`2023-31484` and :cve_nist:`2023-31486`
+-  sysstat: Fix :cve_nist:`2023-33204`
+-  tiff: Fix :cve_mitre:`2023-25434`, :cve_nist:`2023-26965` and :cve_nist:`2023-2731`
+-  vim: Fix :cve_nist:`2023-2426`
 
 
 Fixes in Yocto-4.2.2
diff --git a/documentation/migration-guides/release-notes-4.2.3.rst b/documentation/migration-guides/release-notes-4.2.3.rst
index 3b568a1c29ae402f9e2e39dcd9e8d5b30a5dc0cf..86ce5b702506bdeaf40d245a36c94c67d58d3dd4 100644
--- a/documentation/migration-guides/release-notes-4.2.3.rst
+++ b/documentation/migration-guides/release-notes-4.2.3.rst
@@ -6,24 +6,24 @@ Release notes for Yocto-4.2.3 (Mickledore)
 Security Fixes in Yocto-4.2.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2023-2828` and :cve:`2023-2911`
--  cups: Fix :cve:`2023-34241`
--  dmidecode: Fix :cve:`2023-30630`
--  erofs-utils: Fix :cve:`2023-33551` and :cve:`2023-33552`
--  ghostscript: Fix :cve:`2023-36664`
+-  bind: Fix :cve_nist:`2023-2828` and :cve_nist:`2023-2911`
+-  cups: Fix :cve_nist:`2023-34241`
+-  dmidecode: Fix :cve_nist:`2023-30630`
+-  erofs-utils: Fix :cve_nist:`2023-33551` and :cve_nist:`2023-33552`
+-  ghostscript: Fix :cve_nist:`2023-36664`
 -  go: Fix :cve_mitre:`2023-24531`
--  libarchive: ignore :cve:`2023-30571`
--  libjpeg-turbo: Fix :cve:`2023-2804`
--  libx11: Fix :cve:`2023-3138`
--  ncurses: Fix :cve:`2023-29491`
--  openssh: Fix :cve:`2023-38408`
--  python3-certifi: Fix :cve:`2023-37920`
--  python3-requests: Fix :cve:`2023-32681`
--  python3: Ignore :cve:`2023-36632`
--  qemu: fix :cve:`2023-0330`, :cve_mitre:`2023-2861`, :cve_mitre:`2023-3255` and :cve_mitre:`2023-3301`
--  ruby: Fix :cve:`2023-36617`
--  vim: Fix :cve:`2023-2609` and :cve:`2023-2610`
--  webkitgtk: Fix :cve:`2023-27932` and :cve:`2023-27954`
+-  libarchive: ignore :cve_nist:`2023-30571`
+-  libjpeg-turbo: Fix :cve_nist:`2023-2804`
+-  libx11: Fix :cve_nist:`2023-3138`
+-  ncurses: Fix :cve_nist:`2023-29491`
+-  openssh: Fix :cve_nist:`2023-38408`
+-  python3-certifi: Fix :cve_nist:`2023-37920`
+-  python3-requests: Fix :cve_nist:`2023-32681`
+-  python3: Ignore :cve_nist:`2023-36632`
+-  qemu: fix :cve_nist:`2023-0330`, :cve_mitre:`2023-2861`, :cve_mitre:`2023-3255` and :cve_mitre:`2023-3301`
+-  ruby: Fix :cve_nist:`2023-36617`
+-  vim: Fix :cve_nist:`2023-2609` and :cve_nist:`2023-2610`
+-  webkitgtk: Fix :cve_nist:`2023-27932` and :cve_nist:`2023-27954`
 
 
 Fixes in Yocto-4.2.3
diff --git a/documentation/migration-guides/release-notes-4.2.4.rst b/documentation/migration-guides/release-notes-4.2.4.rst
index 3c20140e29c9aad92677fea9b393d9e66bb5e4b6..60f878c3b0bcc29b150bf9b3a0e0baaa24dc58a2 100644
--- a/documentation/migration-guides/release-notes-4.2.4.rst
+++ b/documentation/migration-guides/release-notes-4.2.4.rst
@@ -6,44 +6,44 @@ Release notes for Yocto-4.2.4 (Mickledore)
 Security Fixes in Yocto-4.2.4
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2023-3341` and :cve:`2023-4236`
--  binutils: Fix :cve:`2023-39128`
--  cups: fix :cve:`2023-4504`
--  curl: Fix :cve:`2023-28320`, :cve:`2023-32001`, :cve:`2023-38039`, :cve:`2023-38545` and :cve:`2023-38546`
--  dmidecode: fix for :cve:`2023-30630`
--  dropbear: fix :cve:`2023-36328`
--  ffmpeg: Ignore :cve:`2023-39018`
--  gcc: Fix :cve:`2023-4039`
--  gdb: Fix :cve:`2023-39128`
--  ghostscript: Fix :cve:`2023-38559` and :cve:`2023-43115`
--  glibc: Fix :cve:`2023-4527` and :cve:`2023-4806`
--  go: Fix :cve:`2023-29409` and :cve:`2023-39533`
--  grub: Fix :cve:`2023-4692` and :cve:`2023-4693`
+-  bind: Fix :cve_nist:`2023-3341` and :cve_nist:`2023-4236`
+-  binutils: Fix :cve_nist:`2023-39128`
+-  cups: fix :cve_nist:`2023-4504`
+-  curl: Fix :cve_nist:`2023-28320`, :cve_nist:`2023-32001`, :cve_nist:`2023-38039`, :cve_nist:`2023-38545` and :cve_nist:`2023-38546`
+-  dmidecode: fix for :cve_nist:`2023-30630`
+-  dropbear: fix :cve_nist:`2023-36328`
+-  ffmpeg: Ignore :cve_nist:`2023-39018`
+-  gcc: Fix :cve_nist:`2023-4039`
+-  gdb: Fix :cve_nist:`2023-39128`
+-  ghostscript: Fix :cve_nist:`2023-38559` and :cve_nist:`2023-43115`
+-  glibc: Fix :cve_nist:`2023-4527` and :cve_nist:`2023-4806`
+-  go: Fix :cve_nist:`2023-29409` and :cve_nist:`2023-39533`
+-  grub: Fix :cve_nist:`2023-4692` and :cve_nist:`2023-4693`
 -  gstreamer: Fix :cve_mitre:`2023-40474`, :cve_mitre:`2023-40475` and :cve_mitre:`2023-40476`
--  inetutils: fix :cve:`2023-40303`
--  librsvg: Fix :cve:`2023-38633`
--  libssh2: Fix :cve:`2020-22218`
--  libwebp: Fix :cve:`2023-4863` and :cve:`2023-5129`
--  libx11: Fix :cve:`2023-43785`, :cve:`2023-43786` and :cve:`2023-43787`
--  libxpm: Fix :cve:`2023-43788` and :cve:`2023-43789`
--  linux-yocto/6.1: Ignore :cve:`2003-1604`, :cve:`2004-0230`, :cve:`2006-3635`, :cve:`2006-5331`, :cve:`2006-6128`, :cve:`2007-4774`, :cve:`2007-6761`, :cve:`2007-6762`, :cve:`2008-7316`, :cve:`2009-2692`, :cve:`2010-0008`, :cve:`2010-3432`, :cve:`2010-4648`, :cve:`2010-5313`, :cve:`2010-5328`, :cve:`2010-5329`, :cve:`2010-5331`, :cve:`2010-5332`, :cve:`2011-4098`, :cve:`2011-4131`, :cve:`2011-4915`, :cve:`2011-5321`, :cve:`2011-5327`, :cve:`2012-0957`, :cve:`2012-2119`, :cve:`2012-2136`, :cve:`2012-2137`, :cve:`2012-2313`, :cve:`2012-2319`, :cve:`2012-2372`, :cve:`2012-2375`, :cve:`2012-2390`, :cve:`2012-2669`, :cve:`2012-2744`, :cve:`2012-2745`, :cve:`2012-3364`, :cve:`2012-3375`, :cve:`2012-3400`, :cve:`2012-3412`, :cve:`2012-3430`, :cve:`2012-3510`, :cve:`2012-3511`, :cve:`2012-3520`, :cve:`2012-3552`, :cve:`2012-4398`, :cve:`2012-4444`, :cve:`2012-4461`, :cve:`2012-4467`, :cve:`2012-4508`, :cve:`2012-4530`, :cve:`2012-4565`, :cve:`2012-5374`, :cve:`2012-5375`, :cve:`2012-5517`
 , :cve:`2012-6536`, :cve:`2012-6537`, :cve:`2012-6538`, :cve:`2012-6539`, :cve:`2012-6540`, :cve:`2012-6541`, :cve:`2012-6542`, :cve:`2012-6543`, :cve:`2012-6544`, :cve:`2012-6545`, :cve:`2012-6546`, :cve:`2012-6547`, :cve:`2012-6548`, :cve:`2012-6549`, :cve:`2012-6638`, :cve:`2012-6647`, :cve:`2012-6657`, :cve:`2012-6689`, :cve:`2012-6701`, :cve:`2012-6703`, :cve:`2012-6704`, :cve:`2012-6712`, :cve:`2013-0160`, :cve:`2013-0190`, :cve:`2013-0216`, :cve:`2013-0217`, :cve:`2013-0228`, :cve:`2013-0231`, :cve:`2013-0268`, :cve:`2013-0290`, :cve:`2013-0309`, :cve:`2013-0310`, :cve:`2013-0311`, :cve:`2013-0313`, :cve:`2013-0343`, :cve:`2013-0349`, :cve:`2013-0871`, :cve:`2013-0913`, :cve:`2013-0914`, :cve:`2013-1059`, :cve:`2013-1763`, :cve:`2013-1767`, :cve:`2013-1772`, :cve:`2013-1773`, :cve:`2013-1774`, :cve:`2013-1792`, :cve:`2013-1796`, :cve:`2013-1797`, :cve:`2013-1798`, :cve:`2013-1819`, :cve:`2013-1826`, :cve:`2013-1827`, :cve:`2013-1828`, :cve:`2013-1848`, :cve:`2013-1858`, :cve:
 `2013-1860`, :cve:`2013-1928`, :cve:`2013-1929`, :cve:`2013-1943`, :cve:`2013-1956`, :cve:`2013-1957`, :cve:`2013-1958`, :cve:`2013-1959`, :cve:`2013-1979`, :cve:`2013-2015`, :cve:`2013-2017`, :cve:`2013-2058`, :cve:`2013-2094`, :cve:`2013-2128`, :cve:`2013-2140`, :cve:`2013-2141`, :cve:`2013-2146`, :cve:`2013-2147`, :cve:`2013-2148`, :cve:`2013-2164`, :cve:`2013-2206`, :cve:`2013-2232`, :cve:`2013-2234`, :cve:`2013-2237`, :cve:`2013-2546`, :cve:`2013-2547`, :cve:`2013-2548`, :cve:`2013-2596`, :cve:`2013-2634`, :cve:`2013-2635`, :cve:`2013-2636`, :cve:`2013-2850`, :cve:`2013-2851`, :cve:`2013-2852`, :cve:`2013-2888`, :cve:`2013-2889`, :cve:`2013-2890`, :cve:`2013-2891`, :cve:`2013-2892`, :cve:`2013-2893`, :cve:`2013-2894`, :cve:`2013-2895`, :cve:`2013-2896`, :cve:`2013-2897`, :cve:`2013-2898`, :cve:`2013-2899`, :cve:`2013-2929`, :cve:`2013-2930`, :cve:`2013-3076`, :cve:`2013-3222`, :cve:`2013-3223`, :cve:`2013-3224`, :cve:`2013-3225`, :cve:`2013-3226`, :cve:`2013-3227`, :cve:`2013-3
 228`, :cve:`2013-3229`, :cve:`2013-3230`, :cve:`2013-3231`, :cve:`2013-3232`, :cve:`2013-3233`, :cve:`2013-3234`, :cve:`2013-3235`, :cve:`2013-3236`, :cve:`2013-3237`, :cve:`2013-3301`, :cve:`2013-3302`, :cve:`2013-4125`, :cve:`2013-4127`, :cve:`2013-4129`, :cve:`2013-4162`, :cve:`2013-4163`, :cve:`2013-4205`, :cve:`2013-4220`, :cve:`2013-4247`, :cve:`2013-4254`, :cve:`2013-4270`, :cve:`2013-4299`, :cve:`2013-4300`, :cve:`2013-4312`, :cve:`2013-4343`, :cve:`2013-4345`, :cve:`2013-4348`, :cve:`2013-4350`, :cve:`2013-4387`, :cve:`2013-4470`, :cve:`2013-4483`, :cve:`2013-4511`, :cve:`2013-4512`, :cve:`2013-4513`, :cve:`2013-4514`, :cve:`2013-4515`, :cve:`2013-4516`, :cve:`2013-4563`, :cve:`2013-4579`, :cve:`2013-4587`, :cve:`2013-4588`, :cve:`2013-4591`, :cve:`2013-4592`, :cve:`2013-5634`, :cve:`2013-6282`, :cve:`2013-6367`, :cve:`2013-6368`, :cve:`2013-6376`, :cve:`2013-6378`, :cve:`2013-6380`, :cve:`2013-6381`, :cve:`2013-6382`, :cve:`2013-6383`, :cve:`2013-6431`, :cve:`2013-6432`, :
 cve:`2013-6885`, :cve:`2013-7026`, :cve:`2013-7027`, :cve:`2013-7263`, :cve:`2013-7264`, :cve:`2013-7265`, :cve:`2013-7266`, :cve:`2013-7267`, :cve:`2013-7268`, :cve:`2013-7269`, :cve:`2013-7270`, :cve:`2013-7271`, :cve:`2013-7281`, :cve:`2013-7339`, :cve:`2013-7348`, :cve:`2013-7421`, :cve:`2013-7446`, :cve:`2013-7470`, :cve:`2014-0038`, :cve:`2014-0049`, :cve:`2014-0055`, :cve:`2014-0069`, :cve:`2014-0077`, :cve:`2014-0100`, :cve:`2014-0101`, :cve:`2014-0102`, :cve:`2014-0131`, :cve:`2014-0155`, :cve:`2014-0181`, :cve:`2014-0196`, :cve:`2014-0203`, :cve:`2014-0205`, :cve:`2014-0206`, :cve:`2014-1438`, :cve:`2014-1444`, :cve:`2014-1445`, :cve:`2014-1446`, :cve:`2014-1690`, :cve:`2014-1737`, :cve:`2014-1738`, :cve:`2014-1739`, :cve:`2014-1874`, :cve:`2014-2038`, :cve:`2014-2039`, :cve:`2014-2309`, :cve:`2014-2523`, :cve:`2014-2568`, :cve:`2014-2580`, :cve:`2014-2672`, :cve:`2014-2673`, :cve:`2014-2678`, :cve:`2014-2706`, :cve:`2014-2739`, :cve:`2014-2851`, :cve:`2014-2889`, :cve:`20
 14-3122`, :cve:`2014-3144`, :cve:`2014-3145`, :cve:`2014-3153`, :cve:`2014-3180`, :cve:`2014-3181`, :cve:`2014-3182`, :cve:`2014-3183`, :cve:`2014-3184`, :cve:`2014-3185`, :cve:`2014-3186`, :cve:`2014-3534`, :cve:`2014-3535`, :cve:`2014-3601`, :cve:`2014-3610`, :cve:`2014-3611`, :cve:`2014-3631`, :cve:`2014-3645`, :cve:`2014-3646`, :cve:`2014-3647`, :cve:`2014-3673`, :cve:`2014-3687`, :cve:`2014-3688`, :cve:`2014-3690`, :cve:`2014-3917`, :cve:`2014-3940`, :cve:`2014-4014`, :cve:`2014-4027`, :cve:`2014-4157`, :cve:`2014-4171`, :cve:`2014-4508`, :cve:`2014-4608`, :cve:`2014-4611`, :cve:`2014-4652`, :cve:`2014-4653`, :cve:`2014-4654`, :cve:`2014-4655`, :cve:`2014-4656`, :cve:`2014-4667`, :cve:`2014-4699`, :cve:`2014-4943`, :cve:`2014-5045`, :cve:`2014-5077`, :cve:`2014-5206`, :cve:`2014-5207`, :cve:`2014-5471`, :cve:`2014-5472`, :cve:`2014-6410`, :cve:`2014-6416`, :cve:`2014-6417`, :cve:`2014-6418`, :cve:`2014-7145`, :cve:`2014-7283`, :cve:`2014-7284`, :cve:`2014-7822`, :cve:`2014-7825
 `, :cve:`2014-7826`, :cve:`2014-7841`, :cve:`2014-7842`, :cve:`2014-7843`, :cve:`2014-7970`, :cve:`2014-7975`, :cve:`2014-8086`, :cve:`2014-8133`, :cve:`2014-8134`, :cve:`2014-8159`, :cve:`2014-8160`, :cve:`2014-8171`, :cve:`2014-8172`, :cve:`2014-8173`, :cve:`2014-8369`, :cve:`2014-8480`, :cve:`2014-8481`, :cve:`2014-8559`, :cve:`2014-8709`, :cve:`2014-8884`, :cve:`2014-8989`, :cve:`2014-9090`, :cve:`2014-9322`, :cve:`2014-9419`, :cve:`2014-9420`, :cve:`2014-9428`, :cve:`2014-9529`, :cve:`2014-9584`, :cve:`2014-9585`, :cve:`2014-9644`, :cve:`2014-9683`, :cve:`2014-9710`, :cve:`2014-9715`, :cve:`2014-9717`, :cve:`2014-9728`, :cve:`2014-9729`, :cve:`2014-9730`, :cve:`2014-9731`, :cve:`2014-9803`, :cve:`2014-9870`, :cve:`2014-9888`, :cve:`2014-9895`, :cve:`2014-9903`, :cve:`2014-9904`, :cve:`2014-9914`, :cve:`2014-9922`, :cve:`2014-9940`, :cve:`2015-0239`, :cve:`2015-0274`, :cve:`2015-0275`, :cve:`2015-1333`, :cve:`2015-1339`, :cve:`2015-1350`, :cve:`2015-1420`, :cve:`2015-1421`, :cve
 :`2015-1465`, :cve:`2015-1573`, :cve:`2015-1593`, :cve:`2015-1805`, :cve:`2015-2041`, :cve:`2015-2042`, :cve:`2015-2150`, :cve:`2015-2666`, :cve:`2015-2672`, :cve:`2015-2686`, :cve:`2015-2830`, :cve:`2015-2922`, :cve:`2015-2925`, :cve:`2015-3212`, :cve:`2015-3214`, :cve:`2015-3288`, :cve:`2015-3290`, :cve:`2015-3291`, :cve:`2015-3331`, :cve:`2015-3339`, :cve:`2015-3636`, :cve:`2015-4001`, :cve:`2015-4002`, :cve:`2015-4003`, :cve:`2015-4004`, :cve:`2015-4036`, :cve:`2015-4167`, :cve:`2015-4170`, :cve:`2015-4176`, :cve:`2015-4177`, :cve:`2015-4178`, :cve:`2015-4692`, :cve:`2015-4700`, :cve:`2015-5156`, :cve:`2015-5157`, :cve:`2015-5257`, :cve:`2015-5283`, :cve:`2015-5307`, :cve:`2015-5327`, :cve:`2015-5364`, :cve:`2015-5366`, :cve:`2015-5697`, :cve:`2015-5706`, :cve:`2015-5707`, :cve:`2015-6252`, :cve:`2015-6526`, :cve:`2015-6937`, :cve:`2015-7509`, :cve:`2015-7513`, :cve:`2015-7515`, :cve:`2015-7550`, :cve:`2015-7566`, :cve:`2015-7613`, :cve:`2015-7799`, :cve:`2015-7833`, :cve:`2015-
 7872`, :cve:`2015-7884`, :cve:`2015-7885`, :cve:`2015-7990`, :cve:`2015-8104`, :cve:`2015-8215`, :cve:`2015-8324`, :cve:`2015-8374`, :cve:`2015-8539`, :cve:`2015-8543`, :cve:`2015-8550`, :cve:`2015-8551`, :cve:`2015-8552`, :cve:`2015-8553`, :cve:`2015-8569`, :cve:`2015-8575`, :cve:`2015-8660`, :cve:`2015-8709`, :cve:`2015-8746`, :cve:`2015-8767`, :cve:`2015-8785`, :cve:`2015-8787`, :cve:`2015-8812`, :cve:`2015-8816`, :cve:`2015-8830`, :cve:`2015-8839`, :cve:`2015-8844`, :cve:`2015-8845`, :cve:`2015-8950`, :cve:`2015-8952`, :cve:`2015-8953`, :cve:`2015-8955`, :cve:`2015-8956`, :cve:`2015-8961`, :cve:`2015-8962`, :cve:`2015-8963`, :cve:`2015-8964`, :cve:`2015-8966`, :cve:`2015-8967`, :cve:`2015-8970`, :cve:`2015-9004`, :cve:`2015-9016`, :cve:`2015-9289`, :cve:`2016-0617`, :cve:`2016-0723`, :cve:`2016-0728`, :cve:`2016-0758`, :cve:`2016-0821`, :cve:`2016-0823`, :cve:`2016-10044`, :cve:`2016-10088`, :cve:`2016-10147`, :cve:`2016-10150`, :cve:`2016-10153`, :cve:`2016-10154`, :cve:`2016-1
 0200`, :cve:`2016-10208`, :cve:`2016-10229`, :cve:`2016-10318`, :cve:`2016-10723`, :cve:`2016-10741`, :cve:`2016-10764`, :cve:`2016-10905`, :cve:`2016-10906`, :cve:`2016-10907`, :cve:`2016-1237`, :cve:`2016-1575`, :cve:`2016-1576`, :cve:`2016-1583`, :cve:`2016-2053`, :cve:`2016-2069`, :cve:`2016-2070`, :cve:`2016-2085`, :cve:`2016-2117`, :cve:`2016-2143`, :cve:`2016-2184`, :cve:`2016-2185`, :cve:`2016-2186`, :cve:`2016-2187`, :cve:`2016-2188`, :cve:`2016-2383`, :cve:`2016-2384`, :cve:`2016-2543`, :cve:`2016-2544`, :cve:`2016-2545`, :cve:`2016-2546`, :cve:`2016-2547`, :cve:`2016-2548`, :cve:`2016-2549`, :cve:`2016-2550`, :cve:`2016-2782`, :cve:`2016-2847`, :cve:`2016-3044`, :cve:`2016-3070`, :cve:`2016-3134`, :cve:`2016-3135`, :cve:`2016-3136`, :cve:`2016-3137`, :cve:`2016-3138`, :cve:`2016-3139`, :cve:`2016-3140`, :cve:`2016-3156`, :cve:`2016-3157`, :cve:`2016-3672`, :cve:`2016-3689`, :cve:`2016-3713`, :cve:`2016-3841`, :cve:`2016-3857`, :cve:`2016-3951`, :cve:`2016-3955`, :cve:`201
 6-3961`, :cve:`2016-4440`, :cve:`2016-4470`, :cve:`2016-4482`, :cve:`2016-4485`, :cve:`2016-4486`, :cve:`2016-4557`, :cve:`2016-4558`, :cve:`2016-4565`, :cve:`2016-4568`, :cve:`2016-4569`, :cve:`2016-4578`, :cve:`2016-4580`, :cve:`2016-4581`, :cve:`2016-4794`, :cve:`2016-4805`, :cve:`2016-4913`, :cve:`2016-4951`, :cve:`2016-4997`, :cve:`2016-4998`, :cve:`2016-5195`, :cve:`2016-5243`, :cve:`2016-5244`, :cve:`2016-5400`, :cve:`2016-5412`, :cve:`2016-5696`, :cve:`2016-5728`, :cve:`2016-5828`, :cve:`2016-5829`, :cve:`2016-6130`, :cve:`2016-6136`, :cve:`2016-6156`, :cve:`2016-6162`, :cve:`2016-6187`, :cve:`2016-6197`, :cve:`2016-6198`, :cve:`2016-6213`, :cve:`2016-6327`, :cve:`2016-6480`, :cve:`2016-6516`, :cve:`2016-6786`, :cve:`2016-6787`, :cve:`2016-6828`, :cve:`2016-7039`, :cve:`2016-7042`, :cve:`2016-7097`, :cve:`2016-7117`, :cve:`2016-7425`, :cve:`2016-7910`, :cve:`2016-7911`, :cve:`2016-7912`, :cve:`2016-7913`, :cve:`2016-7914`, :cve:`2016-7915`, :cve:`2016-7916`, :cve:`2016-7917`
 , :cve:`2016-8399`, :cve:`2016-8405`, :cve:`2016-8630`, :cve:`2016-8632`, :cve:`2016-8633`, :cve:`2016-8636`, :cve:`2016-8645`, :cve:`2016-8646`, :cve:`2016-8650`, :cve:`2016-8655`, :cve:`2016-8658`, :cve:`2016-8666`, :cve:`2016-9083`, :cve:`2016-9084`, :cve:`2016-9120`, :cve:`2016-9178`, :cve:`2016-9191`, :cve:`2016-9313`, :cve:`2016-9555`, :cve:`2016-9576`, :cve:`2016-9588`, :cve:`2016-9604`, :cve:`2016-9685`, :cve:`2016-9754`, :cve:`2016-9755`, :cve:`2016-9756`, :cve:`2016-9777`, :cve:`2016-9793`, :cve:`2016-9794`, :cve:`2016-9806`, :cve:`2016-9919`, :cve:`2017-0605`, :cve:`2017-0627`, :cve:`2017-0750`, :cve:`2017-0786`, :cve:`2017-0861`, :cve:`2017-1000`, :cve:`2017-1000111`, :cve:`2017-1000112`, :cve:`2017-1000251`, :cve:`2017-1000252`, :cve:`2017-1000253`, :cve:`2017-1000255`, :cve:`2017-1000363`, :cve:`2017-1000364`, :cve:`2017-1000365`, :cve:`2017-1000370`, :cve:`2017-1000371`, :cve:`2017-1000379`, :cve:`2017-1000380`, :cve:`2017-1000405`, :cve:`2017-1000407`, :cve:`2017-100
 0410`, :cve:`2017-10661`, :cve:`2017-10662`, :cve:`2017-10663`, :cve:`2017-10810`, :cve:`2017-10911`, :cve:`2017-11089`, :cve:`2017-11176`, :cve:`2017-11472`, :cve:`2017-11473`, :cve:`2017-11600`, :cve:`2017-12134`, :cve:`2017-12146`, :cve:`2017-12153`, :cve:`2017-12154`, :cve:`2017-12168`, :cve:`2017-12188`, :cve:`2017-12190`, :cve:`2017-12192`, :cve:`2017-12193`, :cve:`2017-12762`, :cve:`2017-13080`, :cve:`2017-13166`, :cve:`2017-13167`, :cve:`2017-13168`, :cve:`2017-13215`, :cve:`2017-13216`, :cve:`2017-13220`, :cve:`2017-13305`, :cve:`2017-13686`, :cve:`2017-13695`, :cve:`2017-13715`, :cve:`2017-14051`, :cve:`2017-14106`, :cve:`2017-14140`, :cve:`2017-14156`, :cve:`2017-14340`, :cve:`2017-14489`, :cve:`2017-14497`, :cve:`2017-14954`, :cve:`2017-14991`, :cve:`2017-15102`, :cve:`2017-15115`, :cve:`2017-15116`, :cve:`2017-15121`, :cve:`2017-15126`, :cve:`2017-15127`, :cve:`2017-15128`, :cve:`2017-15129`, :cve:`2017-15265`, :cve:`2017-15274`, :cve:`2017-15299`, :cve:`2017-15306`, :c
 ve:`2017-15537`, :cve:`2017-15649`, :cve:`2017-15868`, :cve:`2017-15951`, :cve:`2017-16525`, :cve:`2017-16526`, :cve:`2017-16527`, :cve:`2017-16528`, :cve:`2017-16529`, :cve:`2017-16530`, :cve:`2017-16531`, :cve:`2017-16532`, :cve:`2017-16533`, :cve:`2017-16534`, :cve:`2017-16535`, :cve:`2017-16536`, :cve:`2017-16537`, :cve:`2017-16538`, :cve:`2017-16643`, :cve:`2017-16644`, :cve:`2017-16645`, :cve:`2017-16646`, :cve:`2017-16647`, :cve:`2017-16648`, :cve:`2017-16649`, :cve:`2017-16650`, :cve:`2017-16911`, :cve:`2017-16912`, :cve:`2017-16913`, :cve:`2017-16914`, :cve:`2017-16939`, :cve:`2017-16994`, :cve:`2017-16995`, :cve:`2017-16996`, :cve:`2017-17052`, :cve:`2017-17053`, :cve:`2017-17448`, :cve:`2017-17449`, :cve:`2017-17450`, :cve:`2017-17558`, :cve:`2017-17712`, :cve:`2017-17741`, :cve:`2017-17805`, :cve:`2017-17806`, :cve:`2017-17807`, :cve:`2017-17852`, :cve:`2017-17853`, :cve:`2017-17854`, :cve:`2017-17855`, :cve:`2017-17856`, :cve:`2017-17857`, :cve:`2017-17862`, :cve:`2017-
 17863`, :cve:`2017-17864`, :cve:`2017-17975`, :cve:`2017-18017`, :cve:`2017-18075`, :cve:`2017-18079`, :cve:`2017-18174`, :cve:`2017-18193`, :cve:`2017-18200`, :cve:`2017-18202`, :cve:`2017-18203`, :cve:`2017-18204`, :cve:`2017-18208`, :cve:`2017-18216`, :cve:`2017-18218`, :cve:`2017-18221`, :cve:`2017-18222`, :cve:`2017-18224`, :cve:`2017-18232`, :cve:`2017-18241`, :cve:`2017-18249`, :cve:`2017-18255`, :cve:`2017-18257`, :cve:`2017-18261`, :cve:`2017-18270`, :cve:`2017-18344`, :cve:`2017-18360`, :cve:`2017-18379`, :cve:`2017-18509`, :cve:`2017-18549`, :cve:`2017-18550`, :cve:`2017-18551`, :cve:`2017-18552`, :cve:`2017-18595`, :cve:`2017-2583`, :cve:`2017-2584`, :cve:`2017-2596`, :cve:`2017-2618`, :cve:`2017-2634`, :cve:`2017-2636`, :cve:`2017-2647`, :cve:`2017-2671`, :cve:`2017-5123`, :cve:`2017-5546`, :cve:`2017-5547`, :cve:`2017-5548`, :cve:`2017-5549`, :cve:`2017-5550`, :cve:`2017-5551`, :cve:`2017-5576`, :cve:`2017-5577`, :cve:`2017-5669`, :cve:`2017-5715`, :cve:`2017-5753`, :c
 ve:`2017-5754`, :cve:`2017-5897`, :cve:`2017-5967`, :cve:`2017-5970`, :cve:`2017-5972`, :cve:`2017-5986`, :cve:`2017-6001`, :cve:`2017-6074`, :cve:`2017-6214`, :cve:`2017-6345`, :cve:`2017-6346`, :cve:`2017-6347`, :cve:`2017-6348`, :cve:`2017-6353`, :cve:`2017-6874`, :cve:`2017-6951`, :cve:`2017-7184`, :cve:`2017-7187`, :cve:`2017-7261`, :cve:`2017-7273`, :cve:`2017-7277`, :cve:`2017-7294`, :cve:`2017-7308`, :cve:`2017-7346`, :cve:`2017-7374`, :cve:`2017-7472`, :cve:`2017-7477`, :cve:`2017-7482`, :cve:`2017-7487`, :cve:`2017-7495`, :cve:`2017-7518`, :cve:`2017-7533`, :cve:`2017-7541`, :cve:`2017-7542`, :cve:`2017-7558`, :cve:`2017-7616`, :cve:`2017-7618`, :cve:`2017-7645`, :cve:`2017-7889`, :cve:`2017-7895`, :cve:`2017-7979`, :cve:`2017-8061`, :cve:`2017-8062`, :cve:`2017-8063`, :cve:`2017-8064`, :cve:`2017-8065`, :cve:`2017-8066`, :cve:`2017-8067`, :cve:`2017-8068`, :cve:`2017-8069`, :cve:`2017-8070`, :cve:`2017-8071`, :cve:`2017-8072`, :cve:`2017-8106`, :cve:`2017-8240`, :cve:`201
 7-8797`, :cve:`2017-8824`, :cve:`2017-8831`, :cve:`2017-8890`, :cve:`2017-8924`, :cve:`2017-8925`, :cve:`2017-9059`, :cve:`2017-9074`, :cve:`2017-9075`, :cve:`2017-9076`, :cve:`2017-9077`, :cve:`2017-9150`, :cve:`2017-9211`, :cve:`2017-9242`, :cve:`2017-9605`, :cve:`2017-9725`, :cve:`2017-9984`, :cve:`2017-9985`, :cve:`2017-9986`, :cve:`2018-1000004`, :cve:`2018-1000026`, :cve:`2018-1000028`, :cve:`2018-1000199`, :cve:`2018-1000200`, :cve:`2018-1000204`, :cve:`2018-10021`, :cve:`2018-10074`, :cve:`2018-10087`, :cve:`2018-10124`, :cve:`2018-10322`, :cve:`2018-10323`, :cve:`2018-1065`, :cve:`2018-1066`, :cve:`2018-10675`, :cve:`2018-1068`, :cve:`2018-10840`, :cve:`2018-10853`, :cve:`2018-1087`, :cve:`2018-10876`, :cve:`2018-10877`, :cve:`2018-10878`, :cve:`2018-10879`, :cve:`2018-10880`, :cve:`2018-10881`, :cve:`2018-10882`, :cve:`2018-10883`, :cve:`2018-10901`, :cve:`2018-10902`, :cve:`2018-1091`, :cve:`2018-1092`, :cve:`2018-1093`, :cve:`2018-10938`, :cve:`2018-1094`, :cve:`2018-109
 40`, :cve:`2018-1095`, :cve:`2018-1108`, :cve:`2018-1118`, :cve:`2018-1120`, :cve:`2018-11232`, :cve:`2018-1128`, :cve:`2018-1129`, :cve:`2018-1130`, :cve:`2018-11412`, :cve:`2018-11506`, :cve:`2018-11508`, :cve:`2018-12126`, :cve:`2018-12127`, :cve:`2018-12130`, :cve:`2018-12207`, :cve:`2018-12232`, :cve:`2018-12233`, :cve:`2018-12633`, :cve:`2018-12714`, :cve:`2018-12896`, :cve:`2018-12904`, :cve:`2018-13053`, :cve:`2018-13093`, :cve:`2018-13094`, :cve:`2018-13095`, :cve:`2018-13096`, :cve:`2018-13097`, :cve:`2018-13098`, :cve:`2018-13099`, :cve:`2018-13100`, :cve:`2018-13405`, :cve:`2018-13406`, :cve:`2018-14609`, :cve:`2018-14610`, :cve:`2018-14611`, :cve:`2018-14612`, :cve:`2018-14613`, :cve:`2018-14614`, :cve:`2018-14615`, :cve:`2018-14616`, :cve:`2018-14617`, :cve:`2018-14619`, :cve:`2018-14625`, :cve:`2018-14633`, :cve:`2018-14634`, :cve:`2018-14641`, :cve:`2018-14646`, :cve:`2018-14656`, :cve:`2018-14678`, :cve:`2018-14734`, :cve:`2018-15471`, :cve:`2018-15572`, :cve:`2018-
 15594`, :cve:`2018-16276`, :cve:`2018-16597`, :cve:`2018-16658`, :cve:`2018-16862`, :cve:`2018-16871`, :cve:`2018-16880`, :cve:`2018-16882`, :cve:`2018-16884`, :cve:`2018-17182`, :cve:`2018-17972`, :cve:`2018-18021`, :cve:`2018-18281`, :cve:`2018-18386`, :cve:`2018-18397`, :cve:`2018-18445`, :cve:`2018-18559`, :cve:`2018-18690`, :cve:`2018-18710`, :cve:`2018-18955`, :cve:`2018-19406`, :cve:`2018-19407`, :cve:`2018-19824`, :cve:`2018-19854`, :cve:`2018-19985`, :cve:`2018-20169`, :cve:`2018-20449`, :cve:`2018-20509`, :cve:`2018-20510`, :cve:`2018-20511`, :cve:`2018-20669`, :cve:`2018-20784`, :cve:`2018-20836`, :cve:`2018-20854`, :cve:`2018-20855`, :cve:`2018-20856`, :cve:`2018-20961`, :cve:`2018-20976`, :cve:`2018-21008`, :cve:`2018-25015`, :cve:`2018-25020`, :cve:`2018-3620`, :cve:`2018-3639`, :cve:`2018-3646`, :cve:`2018-3665`, :cve:`2018-3693`, :cve:`2018-5332`, :cve:`2018-5333`, :cve:`2018-5344`, :cve:`2018-5390`, :cve:`2018-5391`, :cve:`2018-5703`, :cve:`2018-5750`, :cve:`2018-58
 03`, :cve:`2018-5814`, :cve:`2018-5848`, :cve:`2018-5873`, :cve:`2018-5953`, :cve:`2018-5995`, :cve:`2018-6412`, :cve:`2018-6554`, :cve:`2018-6555`, :cve:`2018-6927`, :cve:`2018-7191`, :cve:`2018-7273`, :cve:`2018-7480`, :cve:`2018-7492`, :cve:`2018-7566`, :cve:`2018-7740`, :cve:`2018-7754`, :cve:`2018-7755`, :cve:`2018-7757`, :cve:`2018-7995`, :cve:`2018-8043`, :cve_mitre:`2018-8087`, :cve_mitre:`2018-8781`, :cve_mitre:`2018-8822`, :cve_mitre:`2018-8897`, :cve_mitre:`2018-9363`, :cve_mitre:`2018-9385`, :cve_mitre:`2018-9415`, :cve_mitre:`2018-9422`, :cve_mitre:`2018-9465`, :cve_mitre:`2018-9516`, :cve_mitre:`2018-9517`, :cve_mitre:`2018-9518` and :cve_mitre:`2018-9568`
--  linux-yocto/6.1 (Continued): Ignore :cve:`2019-0136`, :cve:`2019-0145`, :cve:`2019-0146`, :cve:`2019-0147`, :cve:`2019-0148`, :cve:`2019-0149`, :cve:`2019-0154`, :cve:`2019-0155`, :cve:`2019-10124`, :cve:`2019-10125`, :cve:`2019-10126`, :cve:`2019-10142`, :cve:`2019-10207`, :cve:`2019-10220`, :cve:`2019-10638`, :cve:`2019-10639`, :cve:`2019-11085`, :cve:`2019-11091`, :cve:`2019-11135`, :cve:`2019-11190`, :cve:`2019-11191`, :cve:`2019-1125`, :cve:`2019-11477`, :cve:`2019-11478`, :cve:`2019-11479`, :cve:`2019-11486`, :cve:`2019-11487`, :cve:`2019-11599`, :cve:`2019-11683`, :cve:`2019-11810`, :cve:`2019-11811`, :cve:`2019-11815`, :cve:`2019-11833`, :cve:`2019-11884`, :cve:`2019-12378`, :cve:`2019-12379`, :cve:`2019-12380`, :cve:`2019-12381`, :cve:`2019-12382`, :cve:`2019-12454`, :cve:`2019-12455`, :cve:`2019-12614`, :cve:`2019-12615`, :cve:`2019-12817`, :cve:`2019-12818`, :cve:`2019-12819`, :cve:`2019-12881`, :cve:`2019-12984`, :cve:`2019-13233`, :cve:`2019-13272`, :cve:`2019-13631`
 , :cve:`2019-13648`, :cve:`2019-14283`, :cve:`2019-14284`, :cve:`2019-14615`, :cve:`2019-14763`, :cve:`2019-14814`, :cve:`2019-14815`, :cve:`2019-14816`, :cve:`2019-14821`, :cve:`2019-14835`, :cve:`2019-14895`, :cve:`2019-14896`, :cve:`2019-14897`, :cve:`2019-14901`, :cve:`2019-15030`, :cve:`2019-15031`, :cve:`2019-15090`, :cve:`2019-15098`, :cve:`2019-15099`, :cve:`2019-15117`, :cve:`2019-15118`, :cve:`2019-15211`, :cve:`2019-15212`, :cve:`2019-15213`, :cve:`2019-15214`, :cve:`2019-15215`, :cve:`2019-15216`, :cve:`2019-15217`, :cve:`2019-15218`, :cve:`2019-15219`, :cve:`2019-15220`, :cve:`2019-15221`, :cve:`2019-15222`, :cve:`2019-15223`, :cve:`2019-15291`, :cve:`2019-15292`, :cve:`2019-15504`, :cve:`2019-15505`, :cve:`2019-15538`, :cve:`2019-15666`, :cve:`2019-15794`, :cve:`2019-15807`, :cve:`2019-15916`, :cve:`2019-15917`, :cve:`2019-15918`, :cve:`2019-15919`, :cve:`2019-15920`, :cve:`2019-15921`, :cve:`2019-15922`, :cve:`2019-15923`, :cve:`2019-15924`, :cve:`2019-15925`, :cve:`2
 019-15926`, :cve:`2019-15927`, :cve:`2019-16229`, :cve:`2019-16230`, :cve:`2019-16231`, :cve:`2019-16232`, :cve:`2019-16233`, :cve:`2019-16234`, :cve:`2019-16413`, :cve:`2019-16714`, :cve:`2019-16746`, :cve:`2019-16921`, :cve:`2019-16994`, :cve:`2019-16995`, :cve:`2019-17052`, :cve:`2019-17053`, :cve:`2019-17054`, :cve:`2019-17055`, :cve:`2019-17056`, :cve:`2019-17075`, :cve:`2019-17133`, :cve:`2019-17351`, :cve:`2019-17666`, :cve:`2019-18198`, :cve:`2019-18282`, :cve:`2019-18660`, :cve:`2019-18675`, :cve:`2019-18683`, :cve:`2019-18786`, :cve:`2019-18805`, :cve:`2019-18806`, :cve:`2019-18807`, :cve:`2019-18808`, :cve:`2019-18809`, :cve:`2019-18810`, :cve:`2019-18811`, :cve:`2019-18812`, :cve:`2019-18813`, :cve:`2019-18814`, :cve:`2019-18885`, :cve:`2019-19036`, :cve:`2019-19037`, :cve:`2019-19039`, :cve:`2019-19043`, :cve:`2019-19044`, :cve:`2019-19045`, :cve:`2019-19046`, :cve:`2019-19047`, :cve:`2019-19048`, :cve:`2019-19049`, :cve:`2019-19050`, :cve:`2019-19051`, :cve:`2019-19052
 `, :cve:`2019-19053`, :cve:`2019-19054`, :cve:`2019-19055`, :cve:`2019-19056`, :cve:`2019-19057`, :cve:`2019-19058`, :cve:`2019-19059`, :cve:`2019-19060`, :cve:`2019-19061`, :cve:`2019-19062`, :cve:`2019-19063`, :cve:`2019-19064`, :cve:`2019-19065`, :cve:`2019-19066`, :cve:`2019-19067`, :cve:`2019-19068`, :cve:`2019-19069`, :cve:`2019-19070`, :cve:`2019-19071`, :cve:`2019-19072`, :cve:`2019-19073`, :cve:`2019-19074`, :cve:`2019-19075`, :cve:`2019-19076`, :cve:`2019-19077`, :cve:`2019-19078`, :cve:`2019-19079`, :cve:`2019-19080`, :cve:`2019-19081`, :cve:`2019-19082`, :cve:`2019-19083`, :cve:`2019-19227`, :cve:`2019-19241`, :cve:`2019-19252`, :cve:`2019-19318`, :cve:`2019-19319`, :cve:`2019-19332`, :cve:`2019-19338`, :cve:`2019-19377`, :cve:`2019-19447`, :cve:`2019-19448`, :cve:`2019-19449`, :cve:`2019-19462`, :cve:`2019-19523`, :cve:`2019-19524`, :cve:`2019-19525`, :cve:`2019-19526`, :cve:`2019-19527`, :cve:`2019-19528`, :cve:`2019-19529`, :cve:`2019-19530`, :cve:`2019-19531`, :cve:`
 2019-19532`, :cve:`2019-19533`, :cve:`2019-19534`, :cve:`2019-19535`, :cve:`2019-19536`, :cve:`2019-19537`, :cve:`2019-19543`, :cve:`2019-19602`, :cve:`2019-19767`, :cve:`2019-19768`, :cve:`2019-19769`, :cve:`2019-19770`, :cve:`2019-19807`, :cve:`2019-19813`, :cve:`2019-19815`, :cve:`2019-19816`, :cve:`2019-19922`, :cve:`2019-19927`, :cve:`2019-19947`, :cve:`2019-19965`, :cve:`2019-19966`, :cve:`2019-1999`, :cve:`2019-20054`, :cve:`2019-20095`, :cve:`2019-20096`, :cve:`2019-2024`, :cve:`2019-2025`, :cve:`2019-20422`, :cve:`2019-2054`, :cve:`2019-20636`, :cve:`2019-20806`, :cve:`2019-20810`, :cve:`2019-20811`, :cve:`2019-20812`, :cve:`2019-20908`, :cve:`2019-20934`, :cve:`2019-2101`, :cve:`2019-2181`, :cve:`2019-2182`, :cve:`2019-2213`, :cve:`2019-2214`, :cve:`2019-2215`, :cve:`2019-25044`, :cve:`2019-25045`, :cve:`2019-3016`, :cve:`2019-3459`, :cve:`2019-3460`, :cve:`2019-3701`, :cve:`2019-3819`, :cve:`2019-3837`, :cve:`2019-3846`, :cve:`2019-3874`, :cve:`2019-3882`, :cve:`2019-3887
 `, :cve:`2019-3892`, :cve:`2019-3896`, :cve:`2019-3900`, :cve:`2019-3901`, :cve:`2019-5108`, :cve:`2019-6133`, :cve:`2019-6974`, :cve:`2019-7221`, :cve:`2019-7222`, :cve:`2019-7308`, :cve:`2019-8912`, :cve:`2019-8956`, :cve:`2019-8980`, :cve:`2019-9003`, :cve:`2019-9162`, :cve:`2019-9213`, :cve:`2019-9245`, :cve:`2019-9444`, :cve:`2019-9445`, :cve:`2019-9453`, :cve:`2019-9454`, :cve:`2019-9455`, :cve:`2019-9456`, :cve:`2019-9457`, :cve:`2019-9458`, :cve:`2019-9466`, :cve:`2019-9500`, :cve:`2019-9503`, :cve:`2019-9506`, :cve:`2019-9857`, :cve:`2020-0009`, :cve:`2020-0030`, :cve:`2020-0041`, :cve:`2020-0066`, :cve:`2020-0067`, :cve:`2020-0110`, :cve:`2020-0255`, :cve:`2020-0305`, :cve:`2020-0404`, :cve:`2020-0423`, :cve:`2020-0427`, :cve:`2020-0429`, :cve:`2020-0430`, :cve:`2020-0431`, :cve:`2020-0432`, :cve:`2020-0433`, :cve:`2020-0435`, :cve:`2020-0444`, :cve:`2020-0465`, :cve:`2020-0466`, :cve:`2020-0543`, :cve:`2020-10135`, :cve:`2020-10690`, :cve:`2020-10711`, :cve:`2020-10720`, 
 :cve:`2020-10732`, :cve:`2020-10742`, :cve:`2020-10751`, :cve:`2020-10757`, :cve:`2020-10766`, :cve:`2020-10767`, :cve:`2020-10768`, :cve:`2020-10769`, :cve:`2020-10773`, :cve:`2020-10781`, :cve:`2020-10942`, :cve:`2020-11494`, :cve:`2020-11565`, :cve:`2020-11608`, :cve:`2020-11609`, :cve:`2020-11668`, :cve:`2020-11669`, :cve:`2020-11884`, :cve:`2020-12114`, :cve:`2020-12351`, :cve:`2020-12352`, :cve:`2020-12362`, :cve:`2020-12363`, :cve:`2020-12364`, :cve:`2020-12464`, :cve:`2020-12465`, :cve:`2020-12652`, :cve:`2020-12653`, :cve:`2020-12654`, :cve:`2020-12655`, :cve:`2020-12656`, :cve:`2020-12657`, :cve:`2020-12659`, :cve:`2020-12768`, :cve:`2020-12769`, :cve:`2020-12770`, :cve:`2020-12771`, :cve:`2020-12826`, :cve:`2020-12888`, :cve:`2020-12912`, :cve:`2020-13143`, :cve:`2020-13974`, :cve:`2020-14305`, :cve:`2020-14314`, :cve:`2020-14331`, :cve:`2020-14351`, :cve:`2020-14353`, :cve:`2020-14356`, :cve:`2020-14381`, :cve:`2020-14385`, :cve:`2020-14386`, :cve:`2020-14390`, :cve:`202
 0-14416`, :cve:`2020-15393`, :cve:`2020-15436`, :cve:`2020-15437`, :cve:`2020-15780`, :cve:`2020-15852`, :cve:`2020-16119`, :cve:`2020-16120`, :cve:`2020-16166`, :cve:`2020-1749`, :cve:`2020-24394`, :cve:`2020-24490`, :cve:`2020-24504`, :cve:`2020-24586`, :cve:`2020-24587`, :cve:`2020-24588`, :cve:`2020-25211`, :cve:`2020-25212`, :cve:`2020-25221`, :cve:`2020-25284`, :cve:`2020-25285`, :cve:`2020-25639`, :cve:`2020-25641`, :cve:`2020-25643`, :cve:`2020-25645`, :cve:`2020-25656`, :cve:`2020-25668`, :cve:`2020-25669`, :cve:`2020-25670`, :cve:`2020-25671`, :cve:`2020-25672`, :cve:`2020-25673`, :cve:`2020-25704`, :cve:`2020-25705`, :cve:`2020-26088`, :cve:`2020-26139`, :cve:`2020-26141`, :cve:`2020-26145`, :cve:`2020-26147`, :cve:`2020-26541`, :cve:`2020-26555`, :cve:`2020-26558`, :cve:`2020-27066`, :cve:`2020-27067`, :cve:`2020-27068`, :cve:`2020-27152`, :cve:`2020-27170`, :cve:`2020-27171`, :cve:`2020-27194`, :cve:`2020-2732`, :cve:`2020-27673`, :cve:`2020-27675`, :cve:`2020-27777`, :
 cve:`2020-27784`, :cve:`2020-27786`, :cve:`2020-27815`, :cve:`2020-27820`, :cve:`2020-27825`, :cve:`2020-27830`, :cve:`2020-27835`, :cve:`2020-28097`, :cve:`2020-28374`, :cve:`2020-28588`, :cve:`2020-28915`, :cve:`2020-28941`, :cve:`2020-28974`, :cve:`2020-29368`, :cve:`2020-29369`, :cve:`2020-29370`, :cve:`2020-29371`, :cve:`2020-29372`, :cve:`2020-29373`, :cve:`2020-29374`, :cve:`2020-29534`, :cve:`2020-29568`, :cve:`2020-29569`, :cve:`2020-29660`, :cve:`2020-29661`, :cve:`2020-35499`, :cve:`2020-35508`, :cve:`2020-35513`, :cve:`2020-35519`, :cve:`2020-36158`, :cve:`2020-36310`, :cve:`2020-36311`, :cve:`2020-36312`, :cve:`2020-36313`, :cve:`2020-36322`, :cve:`2020-36385`, :cve:`2020-36386`, :cve:`2020-36387`, :cve:`2020-36516`, :cve:`2020-36557`, :cve:`2020-36558`, :cve:`2020-36691`, :cve:`2020-36694`, :cve:`2020-36766`, :cve:`2020-3702`, :cve:`2020-4788`, :cve:`2020-7053`, :cve:`2020-8428`, :cve:`2020-8647`, :cve:`2020-8648`, :cve:`2020-8649`, :cve:`2020-8694`, :cve:`2020-8834`, 
 :cve:`2020-8835`, :cve:`2020-8992`, :cve:`2020-9383`, :cve:`2020-9391`, :cve:`2021-0129`, :cve:`2021-0342`, :cve_mitre:`2021-0447`, :cve_mitre:`2021-0448`, :cve:`2021-0512`, :cve:`2021-0605`, :cve:`2021-0707`, :cve:`2021-0920`, :cve:`2021-0929`, :cve:`2021-0935`, :cve_mitre:`2021-0937`, :cve:`2021-0938`, :cve:`2021-0941`, :cve:`2021-1048`, :cve:`2021-20177`, :cve:`2021-20194`, :cve:`2021-20226`, :cve:`2021-20239`, :cve:`2021-20261`, :cve:`2021-20265`, :cve:`2021-20268`, :cve:`2021-20292`, :cve:`2021-20317`, :cve:`2021-20320`, :cve:`2021-20321`, :cve:`2021-20322`, :cve:`2021-21781`, :cve:`2021-22543`, :cve:`2021-22555`, :cve:`2021-22600`, :cve:`2021-23133`, :cve:`2021-23134`, :cve:`2021-26401`, :cve:`2021-26708`, :cve:`2021-26930`, :cve:`2021-26931`, :cve:`2021-26932`, :cve:`2021-27363`, :cve:`2021-27364`, :cve:`2021-27365`, :cve:`2021-28038`, :cve:`2021-28039`, :cve:`2021-28375`, :cve:`2021-28660`, :cve:`2021-28688`, :cve:`2021-28691`, :cve:`2021-28711`, :cve:`2021-28712`, :cve:`202
 1-28713`, :cve:`2021-28714`, :cve:`2021-28715`, :cve:`2021-28950`, :cve:`2021-28951`, :cve:`2021-28952`, :cve:`2021-28964`, :cve:`2021-28971`, :cve:`2021-28972`, :cve:`2021-29154`, :cve:`2021-29155`, :cve:`2021-29264`, :cve:`2021-29265`, :cve:`2021-29266`, :cve:`2021-29646`, :cve:`2021-29647`, :cve:`2021-29648`, :cve:`2021-29649`, :cve:`2021-29650`, :cve:`2021-29657`, :cve:`2021-30002`, :cve:`2021-30178`, :cve:`2021-31440`, :cve:`2021-3178`, :cve:`2021-31829`, :cve:`2021-31916`, :cve:`2021-32078`, :cve:`2021-32399`, :cve:`2021-32606`, :cve:`2021-33033`, :cve:`2021-33034`, :cve:`2021-33061`, :cve:`2021-33098`, :cve:`2021-33135`, :cve:`2021-33200`, :cve:`2021-3347`, :cve:`2021-3348`, :cve:`2021-33624`, :cve:`2021-33655`, :cve:`2021-33656`, :cve:`2021-33909`, :cve:`2021-3411`, :cve:`2021-3428`, :cve:`2021-3444`, :cve:`2021-34556`, :cve:`2021-34693`, :cve:`2021-3483`, :cve:`2021-34866`, :cve:`2021-3489`, :cve:`2021-3490`, :cve:`2021-3491`, :cve:`2021-3493`, :cve_mitre:`2021-34981`, :cve
 :`2021-3501`, :cve:`2021-35039`, :cve:`2021-3506`, :cve:`2021-3543`, :cve:`2021-35477`, :cve:`2021-3564`, :cve:`2021-3573`, :cve:`2021-3587`, :cve_mitre:`2021-3600`, :cve:`2021-3609`, :cve:`2021-3612`, :cve:`2021-3635`, :cve:`2021-3640`, :cve:`2021-3653`, :cve:`2021-3655`, :cve:`2021-3656`, :cve:`2021-3659`, :cve:`2021-3669`, :cve:`2021-3679`, :cve:`2021-3715`, :cve:`2021-37159`, :cve:`2021-3732`, :cve:`2021-3736`, :cve:`2021-3739`, :cve:`2021-3743`, :cve:`2021-3744`, :cve:`2021-3752`, :cve:`2021-3753`, :cve:`2021-37576`, :cve:`2021-3759`, :cve:`2021-3760`, :cve:`2021-3764`, :cve:`2021-3772`, :cve:`2021-38160`, :cve:`2021-38166`, :cve:`2021-38198`, :cve:`2021-38199`, :cve:`2021-38200`, :cve:`2021-38201`, :cve:`2021-38202`, :cve:`2021-38203`, :cve:`2021-38204`, :cve:`2021-38205`, :cve:`2021-38206`, :cve:`2021-38207`, :cve:`2021-38208`, :cve:`2021-38209`, :cve:`2021-38300`, :cve:`2021-3894`, :cve:`2021-3896`, :cve:`2021-3923`, :cve:`2021-39633`, :cve:`2021-39634`, :cve:`2021-39636`, :
 cve:`2021-39648`, :cve:`2021-39656`, :cve:`2021-39657`, :cve:`2021-39685`, :cve:`2021-39686`, :cve:`2021-39698`, :cve:`2021-39711`, :cve:`2021-39713`, :cve:`2021-39714`, :cve:`2021-4001`, :cve:`2021-4002`, :cve:`2021-4023`, :cve:`2021-4028`, :cve:`2021-4032`, :cve:`2021-4037`, :cve:`2021-40490`, :cve:`2021-4083`, :cve:`2021-4090`, :cve:`2021-4093`, :cve:`2021-4095`, :cve:`2021-41073`, :cve:`2021-4135`, :cve:`2021-4148`, :cve:`2021-4149`, :cve:`2021-4150`, :cve:`2021-4154`, :cve:`2021-4155`, :cve:`2021-4157`, :cve:`2021-4159`, :cve:`2021-41864`, :cve:`2021-4197`, :cve:`2021-42008`, :cve:`2021-4202`, :cve:`2021-4203`, :cve:`2021-4204`, :cve:`2021-4218`, :cve:`2021-42252`, :cve:`2021-42327`, :cve:`2021-42739`, :cve:`2021-43056`, :cve:`2021-43057`, :cve:`2021-43267`, :cve:`2021-43389`, :cve:`2021-43975`, :cve:`2021-43976`, :cve:`2021-44733`, :cve:`2021-44879`, :cve:`2021-45095`, :cve:`2021-45100`, :cve:`2021-45402`, :cve:`2021-45469`, :cve:`2021-45480`, :cve:`2021-45485`, :cve:`2021-454
 86`, :cve:`2021-45868`, :cve:`2021-46283`, :cve:`2022-0001`, :cve:`2022-0002`, :cve:`2022-0168`, :cve:`2022-0171`, :cve:`2022-0185`, :cve:`2022-0264`, :cve:`2022-0286`, :cve:`2022-0322`, :cve:`2022-0330`, :cve:`2022-0382`, :cve:`2022-0433`, :cve:`2022-0435`, :cve:`2022-0480`, :cve:`2022-0487`, :cve:`2022-0492`, :cve:`2022-0494`, :cve:`2022-0500`, :cve:`2022-0516`, :cve:`2022-0617`, :cve:`2022-0644`, :cve:`2022-0646`, :cve:`2022-0742`, :cve:`2022-0812`, :cve:`2022-0847`, :cve:`2022-0850`, :cve:`2022-0854`, :cve:`2022-0995`, :cve:`2022-0998`, :cve:`2022-1011`, :cve:`2022-1012`, :cve:`2022-1015`, :cve:`2022-1016`, :cve:`2022-1043`, :cve:`2022-1048`, :cve:`2022-1055`, :cve:`2022-1158`, :cve:`2022-1184`, :cve:`2022-1195`, :cve:`2022-1198`, :cve:`2022-1199`, :cve:`2022-1204`, :cve:`2022-1205`, :cve:`2022-1263`, :cve:`2022-1280`, :cve:`2022-1353`, :cve:`2022-1419`, :cve:`2022-1462`, :cve:`2022-1508`, :cve:`2022-1516`, :cve:`2022-1651`, :cve:`2022-1652`, :cve:`2022-1671`, :cve:`2022-1678`, 
 :cve:`2022-1679`, :cve:`2022-1729`, :cve:`2022-1734`, :cve:`2022-1786`, :cve:`2022-1789`, :cve:`2022-1836`, :cve:`2022-1852`, :cve:`2022-1882`, :cve:`2022-1943`, :cve:`2022-1966`, :cve:`2022-1972`, :cve:`2022-1973`, :cve:`2022-1974`, :cve:`2022-1975`, :cve:`2022-1976`, :cve:`2022-1998`, :cve:`2022-20008`, :cve:`2022-20132`, :cve:`2022-20141`, :cve:`2022-20148`, :cve:`2022-20153`, :cve:`2022-20154`, :cve:`2022-20158`, :cve:`2022-20166`, :cve:`2022-20368`, :cve:`2022-20369`, :cve:`2022-20409`, :cve:`2022-20421`, :cve:`2022-20422`, :cve:`2022-20423`, :cve:`2022-20424`, :cve_mitre:`2022-20565`, :cve:`2022-20566`, :cve:`2022-20567`, :cve:`2022-20568`, :cve:`2022-20572`, :cve:`2022-2078`, :cve:`2022-21123`, :cve:`2022-21125`, :cve:`2022-21166`, :cve:`2022-21385`, :cve:`2022-21499`, :cve_mitre:`2022-21505`, :cve:`2022-2153`, :cve:`2022-2196`, :cve_mitre:`2022-22942`, :cve:`2022-23036`, :cve:`2022-23037`, :cve:`2022-23038`, :cve:`2022-23039`, :cve:`2022-23040`, :cve:`2022-23041`, :cve:`2022
 -23042`, :cve:`2022-2308`, :cve:`2022-2318`, :cve:`2022-23222`, :cve:`2022-2327`, :cve:`2022-2380`, :cve:`2022-23816`, :cve:`2022-23960`, :cve:`2022-24122`, :cve:`2022-24448`, :cve:`2022-24958`, :cve:`2022-24959`, :cve:`2022-2503`, :cve:`2022-25258`, :cve:`2022-25375`, :cve:`2022-25636`, :cve_mitre:`2022-2585`, :cve_mitre:`2022-2586`, :cve_mitre:`2022-2588`, :cve:`2022-2590`, :cve_mitre:`2022-2602`, :cve:`2022-26365`, :cve:`2022-26373`, :cve:`2022-2639`, :cve:`2022-26490`, :cve:`2022-2663`, :cve:`2022-26966`, :cve:`2022-27223`, :cve:`2022-27666`, :cve:`2022-27672`, :cve:`2022-2785`, :cve:`2022-27950`, :cve:`2022-28356`, :cve:`2022-28388`, :cve:`2022-28389`, :cve:`2022-28390`, :cve:`2022-2873`, :cve:`2022-28796`, :cve:`2022-28893`, :cve:`2022-2905`, :cve:`2022-29156`, :cve:`2022-2938`, :cve:`2022-29581`, :cve:`2022-29582`, :cve:`2022-2959`, :cve:`2022-2964`, :cve:`2022-2977`, :cve:`2022-2978`, :cve:`2022-29900`, :cve:`2022-29901`, :cve:`2022-2991`, :cve:`2022-29968`, :cve:`2022-3028`
 , :cve:`2022-30594`, :cve:`2022-3061`, :cve:`2022-3077`, :cve:`2022-3078`, :cve:`2022-3103`, :cve:`2022-3104`, :cve:`2022-3105`, :cve:`2022-3106`, :cve:`2022-3107`, :cve:`2022-3108`, :cve:`2022-3110`, :cve:`2022-3111`, :cve:`2022-3112`, :cve:`2022-3113`, :cve:`2022-3114`, :cve:`2022-3115`, :cve:`2022-3169`, :cve:`2022-3170`, :cve:`2022-3176`, :cve:`2022-3202`, :cve:`2022-32250`, :cve:`2022-32296`, :cve:`2022-3239`, :cve:`2022-32981`, :cve:`2022-3303`, :cve:`2022-3344`, :cve:`2022-33740`, :cve:`2022-33741`, :cve:`2022-33742`, :cve:`2022-33743`, :cve:`2022-33744`, :cve:`2022-33981`, :cve:`2022-3424`, :cve:`2022-3435`, :cve:`2022-34494`, :cve:`2022-34495`, :cve:`2022-34918`, :cve:`2022-3521`, :cve:`2022-3522`, :cve:`2022-3524`, :cve:`2022-3526`, :cve:`2022-3531`, :cve:`2022-3532`, :cve:`2022-3534`, :cve:`2022-3535`, :cve:`2022-3541`, :cve:`2022-3542`, :cve:`2022-3543`, :cve:`2022-3545`, :cve:`2022-3564`, :cve:`2022-3565`, :cve:`2022-3577`, :cve:`2022-3586`, :cve:`2022-3594`, :cve:`2022
 -3595`, :cve:`2022-36123`, :cve:`2022-3619`, :cve:`2022-3621`, :cve:`2022-3623`, :cve:`2022-3624`, :cve:`2022-3625`, :cve:`2022-3628`, :cve:`2022-36280`, :cve:`2022-3629`, :cve:`2022-3630`, :cve:`2022-3633`, :cve:`2022-3635`, :cve:`2022-3636`, :cve:`2022-3640`, :cve:`2022-3643`, :cve:`2022-3646`, :cve:`2022-3649`, :cve:`2022-36879`, :cve:`2022-36946`, :cve:`2022-3707`, :cve:`2022-38457`, :cve:`2022-3903`, :cve:`2022-3910`, :cve:`2022-39188`, :cve:`2022-39189`, :cve:`2022-39190`, :cve:`2022-3977`, :cve:`2022-39842`, :cve:`2022-40133`, :cve:`2022-40307`, :cve:`2022-40476`, :cve:`2022-40768`, :cve:`2022-4095`, :cve:`2022-40982`, :cve:`2022-41218`, :cve:`2022-41222`, :cve:`2022-4127`, :cve:`2022-4128`, :cve:`2022-4129`, :cve:`2022-4139`, :cve:`2022-41674`, :cve:`2022-41849`, :cve:`2022-41850`, :cve:`2022-41858`, :cve:`2022-42328`, :cve:`2022-42329`, :cve:`2022-42432`, :cve:`2022-4269`, :cve:`2022-42703`, :cve:`2022-42719`, :cve:`2022-42720`, :cve:`2022-42721`, :cve:`2022-42722`, :cve:`2
 022-42895`, :cve:`2022-42896`, :cve:`2022-43750`, :cve:`2022-4378`, :cve:`2022-4379`, :cve:`2022-4382`, :cve:`2022-43945`, :cve:`2022-45869`, :cve:`2022-45886`, :cve:`2022-45887`, :cve:`2022-45919`, :cve:`2022-45934`, :cve:`2022-4662`, :cve:`2022-4696`, :cve:`2022-4744`, :cve:`2022-47518`, :cve:`2022-47519`, :cve:`2022-47520`, :cve:`2022-47521`, :cve:`2022-47929`, :cve:`2022-47938`, :cve:`2022-47939`, :cve:`2022-47940`, :cve:`2022-47941`, :cve:`2022-47942`, :cve:`2022-47943`, :cve:`2022-47946`, :cve:`2022-4842`, :cve:`2022-48423`, :cve:`2022-48424`, :cve:`2022-48425`, :cve:`2022-48502`, :cve:`2023-0030`, :cve:`2023-0045`, :cve:`2023-0047`, :cve:`2023-0122`, :cve:`2023-0160`, :cve:`2023-0179`, :cve:`2023-0210`, :cve:`2023-0240`, :cve:`2023-0266`, :cve:`2023-0386`, :cve:`2023-0394`, :cve:`2023-0458`, :cve:`2023-0459`, :cve:`2023-0461`, :cve:`2023-0468`, :cve:`2023-0469`, :cve:`2023-0590`, :cve:`2023-0615`, :cve_mitre:`2023-1032`, :cve:`2023-1073`, :cve:`2023-1074`, :cve:`2023-1076`, :
 cve:`2023-1077`, :cve:`2023-1078`, :cve:`2023-1079`, :cve:`2023-1095`, :cve:`2023-1118`, :cve:`2023-1192`, :cve:`2023-1194`, :cve:`2023-1195`, :cve:`2023-1206`, :cve:`2023-1249`, :cve:`2023-1252`, :cve:`2023-1281`, :cve:`2023-1295`, :cve:`2023-1380`, :cve:`2023-1382`, :cve:`2023-1390`, :cve:`2023-1513`, :cve:`2023-1582`, :cve:`2023-1583`, :cve:`2023-1611`, :cve:`2023-1637`, :cve:`2023-1652`, :cve:`2023-1670`, :cve:`2023-1829`, :cve:`2023-1838`, :cve:`2023-1855`, :cve:`2023-1859`, :cve:`2023-1872`, :cve:`2023-1989`, :cve:`2023-1990`, :cve:`2023-1998`, :cve:`2023-2002`, :cve:`2023-2006`, :cve:`2023-2007`, :cve:`2023-2008`, :cve:`2023-2019`, :cve:`2023-20569`, :cve:`2023-20588`, :cve:`2023-20593`, :cve:`2023-20928`, :cve:`2023-20938`, :cve:`2023-21102`, :cve:`2023-21106`, :cve:`2023-2124`, :cve:`2023-21255`, :cve:`2023-2156`, :cve:`2023-2162`, :cve:`2023-2163`, :cve:`2023-2166`, :cve:`2023-2177`, :cve:`2023-2194`, :cve:`2023-2235`, :cve:`2023-2236`, :cve:`2023-2248`, :cve:`2023-2269`, 
 :cve:`2023-22995`, :cve:`2023-22996`, :cve:`2023-22997`, :cve:`2023-22998`, :cve:`2023-22999`, :cve:`2023-23000`, :cve:`2023-23001`, :cve:`2023-23002`, :cve:`2023-23003`, :cve:`2023-23004`, :cve:`2023-23006`, :cve:`2023-23454`, :cve:`2023-23455`, :cve:`2023-23559`, :cve:`2023-23586`, :cve:`2023-2430`, :cve:`2023-2483`, :cve:`2023-25012`, :cve:`2023-2513`, :cve:`2023-25775`, :cve:`2023-2598`, :cve:`2023-26544`, :cve:`2023-26545`, :cve:`2023-26605`, :cve:`2023-26606`, :cve:`2023-26607`, :cve:`2023-28327`, :cve:`2023-28328`, :cve:`2023-28410`, :cve:`2023-28464`, :cve:`2023-28466`, :cve:`2023-2860`, :cve:`2023-28772`, :cve:`2023-28866`, :cve:`2023-2898`, :cve:`2023-2985`, :cve:`2023-3006`, :cve:`2023-30456`, :cve:`2023-30772`, :cve:`2023-3090`, :cve:`2023-3106`, :cve:`2023-3111`, :cve:`2023-3117`, :cve:`2023-31248`, :cve:`2023-3141`, :cve:`2023-31436`, :cve:`2023-3159`, :cve:`2023-3161`, :cve:`2023-3212`, :cve:`2023-3220`, :cve:`2023-32233`, :cve:`2023-32247`, :cve:`2023-32248`, :cve:`2
 023-32250`, :cve:`2023-32252`, :cve:`2023-32254`, :cve:`2023-32257`, :cve:`2023-32258`, :cve:`2023-32269`, :cve:`2023-3268`, :cve:`2023-3269`, :cve:`2023-3312`, :cve:`2023-3317`, :cve:`2023-33203`, :cve:`2023-33250`, :cve:`2023-33288`, :cve:`2023-3338`, :cve:`2023-3355`, :cve:`2023-3357`, :cve:`2023-3358`, :cve:`2023-3359`, :cve:`2023-3389`, :cve:`2023-3390`, :cve:`2023-33951`, :cve:`2023-33952`, :cve:`2023-34255`, :cve:`2023-34256`, :cve:`2023-34319`, :cve:`2023-3439`, :cve:`2023-35001`, :cve:`2023-3567`, :cve:`2023-35788`, :cve:`2023-35823`, :cve:`2023-35824`, :cve:`2023-35826`, :cve:`2023-35828`, :cve:`2023-35829`, :cve:`2023-3609`, :cve:`2023-3610`, :cve:`2023-3611`, :cve:`2023-37453`, :cve:`2023-3772`, :cve:`2023-3773`, :cve:`2023-3776`, :cve:`2023-3777`, :cve:`2023-3812`, :cve:`2023-38409`, :cve:`2023-38426`, :cve:`2023-38427`, :cve:`2023-38428`, :cve:`2023-38429`, :cve:`2023-38430`, :cve:`2023-38431`, :cve:`2023-38432`, :cve:`2023-3863`, :cve_mitre:`2023-3865`, :cve_mitre:`20
 23-3866`, :cve_mitre:`2023-3867`, :cve:`2023-4004`, :cve:`2023-4015`, :cve:`2023-40283`, :cve:`2023-4128`, :cve:`2023-4132`, :cve:`2023-4147`, :cve:`2023-4155`, :cve:`2023-4194`, :cve:`2023-4206`, :cve:`2023-4207`, :cve:`2023-4208`, :cve:`2023-4273`, :cve:`2023-42752`, :cve:`2023-42753`, :cve:`2023-4385`, :cve:`2023-4387`, :cve:`2023-4389`, :cve:`2023-4394`, :cve:`2023-4459`, :cve:`2023-4569`, :cve:`2023-4611` and :cve:`2023-4623`
--  nghttp2: Fix :cve:`2023-35945`
--  openssl: Fix :cve:`2023-2975`, :cve:`2023-3446`, :cve:`2023-3817`, :cve:`2023-4807` and :cve:`2023-5363`
--  pixman: Ignore :cve:`2023-37769`
--  procps: Fix :cve:`2023-4016`
--  python3-git: Fix :cve:`2023-40267`, :cve:`2023-40590` and :cve:`2023-41040`
--  python3-pygments: Fix :cve:`2022-40896`
--  python3-urllib3: Fix :cve:`2023-43804` and :cve:`2023-45803`
--  python3: Fix :cve:`2023-24329` and :cve:`2023-40217`
--  qemu: Fix :cve:`2023-3180`, :cve:`2023-3354` and :cve:`2023-42467`
--  qemu: Ignore :cve:`2023-2680`
--  screen: Fix :cve:`2023-24626`
+-  inetutils: fix :cve_nist:`2023-40303`
+-  librsvg: Fix :cve_nist:`2023-38633`
+-  libssh2: Fix :cve_nist:`2020-22218`
+-  libwebp: Fix :cve_nist:`2023-4863` and :cve_nist:`2023-5129`
+-  libx11: Fix :cve_nist:`2023-43785`, :cve_nist:`2023-43786` and :cve_nist:`2023-43787`
+-  libxpm: Fix :cve_nist:`2023-43788` and :cve_nist:`2023-43789`
+-  linux-yocto/6.1: Ignore :cve_nist:`2003-1604`, :cve_nist:`2004-0230`, :cve_nist:`2006-3635`, :cve_nist:`2006-5331`, :cve_nist:`2006-6128`, :cve_nist:`2007-4774`, :cve_nist:`2007-6761`, :cve_nist:`2007-6762`, :cve_nist:`2008-7316`, :cve_nist:`2009-2692`, :cve_nist:`2010-0008`, :cve_nist:`2010-3432`, :cve_nist:`2010-4648`, :cve_nist:`2010-5313`, :cve_nist:`2010-5328`, :cve_nist:`2010-5329`, :cve_nist:`2010-5331`, :cve_nist:`2010-5332`, :cve_nist:`2011-4098`, :cve_nist:`2011-4131`, :cve_nist:`2011-4915`, :cve_nist:`2011-5321`, :cve_nist:`2011-5327`, :cve_nist:`2012-0957`, :cve_nist:`2012-2119`, :cve_nist:`2012-2136`, :cve_nist:`2012-2137`, :cve_nist:`2012-2313`, :cve_nist:`2012-2319`, :cve_nist:`2012-2372`, :cve_nist:`2012-2375`, :cve_nist:`2012-2390`, :cve_nist:`2012-2669`, :cve_nist:`2012-2744`, :cve_nist:`2012-2745`, :cve_nist:`2012-3364`, :cve_nist:`2012-3375`, :cve_nist:`2012-3400`, :cve_nist:`2012-3412`, :cve_nist:`2012-3430`, :cve_nist:`2012-3510`, :cve_nist:`2012-3511`, :cve
 _nist:`2012-3520`, :cve_nist:`2012-3552`, :cve_nist:`2012-4398`, :cve_nist:`2012-4444`, :cve_nist:`2012-4461`, :cve_nist:`2012-4467`, :cve_nist:`2012-4508`, :cve_nist:`2012-4530`, :cve_nist:`2012-4565`, :cve_nist:`2012-5374`, :cve_nist:`2012-5375`, :cve_nist:`2012-5517`, :cve_nist:`2012-6536`, :cve_nist:`2012-6537`, :cve_nist:`2012-6538`, :cve_nist:`2012-6539`, :cve_nist:`2012-6540`, :cve_nist:`2012-6541`, :cve_nist:`2012-6542`, :cve_nist:`2012-6543`, :cve_nist:`2012-6544`, :cve_nist:`2012-6545`, :cve_nist:`2012-6546`, :cve_nist:`2012-6547`, :cve_nist:`2012-6548`, :cve_nist:`2012-6549`, :cve_nist:`2012-6638`, :cve_nist:`2012-6647`, :cve_nist:`2012-6657`, :cve_nist:`2012-6689`, :cve_nist:`2012-6701`, :cve_nist:`2012-6703`, :cve_nist:`2012-6704`, :cve_nist:`2012-6712`, :cve_nist:`2013-0160`, :cve_nist:`2013-0190`, :cve_nist:`2013-0216`, :cve_nist:`2013-0217`, :cve_nist:`2013-0228`, :cve_nist:`2013-0231`, :cve_nist:`2013-0268`, :cve_nist:`2013-0290`, :cve_nist:`2013-0309`, :cve_nist:`2
 013-0310`, :cve_nist:`2013-0311`, :cve_nist:`2013-0313`, :cve_nist:`2013-0343`, :cve_nist:`2013-0349`, :cve_nist:`2013-0871`, :cve_nist:`2013-0913`, :cve_nist:`2013-0914`, :cve_nist:`2013-1059`, :cve_nist:`2013-1763`, :cve_nist:`2013-1767`, :cve_nist:`2013-1772`, :cve_nist:`2013-1773`, :cve_nist:`2013-1774`, :cve_nist:`2013-1792`, :cve_nist:`2013-1796`, :cve_nist:`2013-1797`, :cve_nist:`2013-1798`, :cve_nist:`2013-1819`, :cve_nist:`2013-1826`, :cve_nist:`2013-1827`, :cve_nist:`2013-1828`, :cve_nist:`2013-1848`, :cve_nist:`2013-1858`, :cve_nist:`2013-1860`, :cve_nist:`2013-1928`, :cve_nist:`2013-1929`, :cve_nist:`2013-1943`, :cve_nist:`2013-1956`, :cve_nist:`2013-1957`, :cve_nist:`2013-1958`, :cve_nist:`2013-1959`, :cve_nist:`2013-1979`, :cve_nist:`2013-2015`, :cve_nist:`2013-2017`, :cve_nist:`2013-2058`, :cve_nist:`2013-2094`, :cve_nist:`2013-2128`, :cve_nist:`2013-2140`, :cve_nist:`2013-2141`, :cve_nist:`2013-2146`, :cve_nist:`2013-2147`, :cve_nist:`2013-2148`, :cve_nist:`2013-2164
 `, :cve_nist:`2013-2206`, :cve_nist:`2013-2232`, :cve_nist:`2013-2234`, :cve_nist:`2013-2237`, :cve_nist:`2013-2546`, :cve_nist:`2013-2547`, :cve_nist:`2013-2548`, :cve_nist:`2013-2596`, :cve_nist:`2013-2634`, :cve_nist:`2013-2635`, :cve_nist:`2013-2636`, :cve_nist:`2013-2850`, :cve_nist:`2013-2851`, :cve_nist:`2013-2852`, :cve_nist:`2013-2888`, :cve_nist:`2013-2889`, :cve_nist:`2013-2890`, :cve_nist:`2013-2891`, :cve_nist:`2013-2892`, :cve_nist:`2013-2893`, :cve_nist:`2013-2894`, :cve_nist:`2013-2895`, :cve_nist:`2013-2896`, :cve_nist:`2013-2897`, :cve_nist:`2013-2898`, :cve_nist:`2013-2899`, :cve_nist:`2013-2929`, :cve_nist:`2013-2930`, :cve_nist:`2013-3076`, :cve_nist:`2013-3222`, :cve_nist:`2013-3223`, :cve_nist:`2013-3224`, :cve_nist:`2013-3225`, :cve_nist:`2013-3226`, :cve_nist:`2013-3227`, :cve_nist:`2013-3228`, :cve_nist:`2013-3229`, :cve_nist:`2013-3230`, :cve_nist:`2013-3231`, :cve_nist:`2013-3232`, :cve_nist:`2013-3233`, :cve_nist:`2013-3234`, :cve_nist:`2013-3235`, :cve_
 nist:`2013-3236`, :cve_nist:`2013-3237`, :cve_nist:`2013-3301`, :cve_nist:`2013-3302`, :cve_nist:`2013-4125`, :cve_nist:`2013-4127`, :cve_nist:`2013-4129`, :cve_nist:`2013-4162`, :cve_nist:`2013-4163`, :cve_nist:`2013-4205`, :cve_nist:`2013-4220`, :cve_nist:`2013-4247`, :cve_nist:`2013-4254`, :cve_nist:`2013-4270`, :cve_nist:`2013-4299`, :cve_nist:`2013-4300`, :cve_nist:`2013-4312`, :cve_nist:`2013-4343`, :cve_nist:`2013-4345`, :cve_nist:`2013-4348`, :cve_nist:`2013-4350`, :cve_nist:`2013-4387`, :cve_nist:`2013-4470`, :cve_nist:`2013-4483`, :cve_nist:`2013-4511`, :cve_nist:`2013-4512`, :cve_nist:`2013-4513`, :cve_nist:`2013-4514`, :cve_nist:`2013-4515`, :cve_nist:`2013-4516`, :cve_nist:`2013-4563`, :cve_nist:`2013-4579`, :cve_nist:`2013-4587`, :cve_nist:`2013-4588`, :cve_nist:`2013-4591`, :cve_nist:`2013-4592`, :cve_nist:`2013-5634`, :cve_nist:`2013-6282`, :cve_nist:`2013-6367`, :cve_nist:`2013-6368`, :cve_nist:`2013-6376`, :cve_nist:`2013-6378`, :cve_nist:`2013-6380`, :cve_nist:`20
 13-6381`, :cve_nist:`2013-6382`, :cve_nist:`2013-6383`, :cve_nist:`2013-6431`, :cve_nist:`2013-6432`, :cve_nist:`2013-6885`, :cve_nist:`2013-7026`, :cve_nist:`2013-7027`, :cve_nist:`2013-7263`, :cve_nist:`2013-7264`, :cve_nist:`2013-7265`, :cve_nist:`2013-7266`, :cve_nist:`2013-7267`, :cve_nist:`2013-7268`, :cve_nist:`2013-7269`, :cve_nist:`2013-7270`, :cve_nist:`2013-7271`, :cve_nist:`2013-7281`, :cve_nist:`2013-7339`, :cve_nist:`2013-7348`, :cve_nist:`2013-7421`, :cve_nist:`2013-7446`, :cve_nist:`2013-7470`, :cve_nist:`2014-0038`, :cve_nist:`2014-0049`, :cve_nist:`2014-0055`, :cve_nist:`2014-0069`, :cve_nist:`2014-0077`, :cve_nist:`2014-0100`, :cve_nist:`2014-0101`, :cve_nist:`2014-0102`, :cve_nist:`2014-0131`, :cve_nist:`2014-0155`, :cve_nist:`2014-0181`, :cve_nist:`2014-0196`, :cve_nist:`2014-0203`, :cve_nist:`2014-0205`, :cve_nist:`2014-0206`, :cve_nist:`2014-1438`, :cve_nist:`2014-1444`, :cve_nist:`2014-1445`, :cve_nist:`2014-1446`, :cve_nist:`2014-1690`, :cve_nist:`2014-1737`
 , :cve_nist:`2014-1738`, :cve_nist:`2014-1739`, :cve_nist:`2014-1874`, :cve_nist:`2014-2038`, :cve_nist:`2014-2039`, :cve_nist:`2014-2309`, :cve_nist:`2014-2523`, :cve_nist:`2014-2568`, :cve_nist:`2014-2580`, :cve_nist:`2014-2672`, :cve_nist:`2014-2673`, :cve_nist:`2014-2678`, :cve_nist:`2014-2706`, :cve_nist:`2014-2739`, :cve_nist:`2014-2851`, :cve_nist:`2014-2889`, :cve_nist:`2014-3122`, :cve_nist:`2014-3144`, :cve_nist:`2014-3145`, :cve_nist:`2014-3153`, :cve_nist:`2014-3180`, :cve_nist:`2014-3181`, :cve_nist:`2014-3182`, :cve_nist:`2014-3183`, :cve_nist:`2014-3184`, :cve_nist:`2014-3185`, :cve_nist:`2014-3186`, :cve_nist:`2014-3534`, :cve_nist:`2014-3535`, :cve_nist:`2014-3601`, :cve_nist:`2014-3610`, :cve_nist:`2014-3611`, :cve_nist:`2014-3631`, :cve_nist:`2014-3645`, :cve_nist:`2014-3646`, :cve_nist:`2014-3647`, :cve_nist:`2014-3673`, :cve_nist:`2014-3687`, :cve_nist:`2014-3688`, :cve_nist:`2014-3690`, :cve_nist:`2014-3917`, :cve_nist:`2014-3940`, :cve_nist:`2014-4014`, :cve_n
 ist:`2014-4027`, :cve_nist:`2014-4157`, :cve_nist:`2014-4171`, :cve_nist:`2014-4508`, :cve_nist:`2014-4608`, :cve_nist:`2014-4611`, :cve_nist:`2014-4652`, :cve_nist:`2014-4653`, :cve_nist:`2014-4654`, :cve_nist:`2014-4655`, :cve_nist:`2014-4656`, :cve_nist:`2014-4667`, :cve_nist:`2014-4699`, :cve_nist:`2014-4943`, :cve_nist:`2014-5045`, :cve_nist:`2014-5077`, :cve_nist:`2014-5206`, :cve_nist:`2014-5207`, :cve_nist:`2014-5471`, :cve_nist:`2014-5472`, :cve_nist:`2014-6410`, :cve_nist:`2014-6416`, :cve_nist:`2014-6417`, :cve_nist:`2014-6418`, :cve_nist:`2014-7145`, :cve_nist:`2014-7283`, :cve_nist:`2014-7284`, :cve_nist:`2014-7822`, :cve_nist:`2014-7825`, :cve_nist:`2014-7826`, :cve_nist:`2014-7841`, :cve_nist:`2014-7842`, :cve_nist:`2014-7843`, :cve_nist:`2014-7970`, :cve_nist:`2014-7975`, :cve_nist:`2014-8086`, :cve_nist:`2014-8133`, :cve_nist:`2014-8134`, :cve_nist:`2014-8159`, :cve_nist:`2014-8160`, :cve_nist:`2014-8171`, :cve_nist:`2014-8172`, :cve_nist:`2014-8173`, :cve_nist:`201
 4-8369`, :cve_nist:`2014-8480`, :cve_nist:`2014-8481`, :cve_nist:`2014-8559`, :cve_nist:`2014-8709`, :cve_nist:`2014-8884`, :cve_nist:`2014-8989`, :cve_nist:`2014-9090`, :cve_nist:`2014-9322`, :cve_nist:`2014-9419`, :cve_nist:`2014-9420`, :cve_nist:`2014-9428`, :cve_nist:`2014-9529`, :cve_nist:`2014-9584`, :cve_nist:`2014-9585`, :cve_nist:`2014-9644`, :cve_nist:`2014-9683`, :cve_nist:`2014-9710`, :cve_nist:`2014-9715`, :cve_nist:`2014-9717`, :cve_nist:`2014-9728`, :cve_nist:`2014-9729`, :cve_nist:`2014-9730`, :cve_nist:`2014-9731`, :cve_nist:`2014-9803`, :cve_nist:`2014-9870`, :cve_nist:`2014-9888`, :cve_nist:`2014-9895`, :cve_nist:`2014-9903`, :cve_nist:`2014-9904`, :cve_nist:`2014-9914`, :cve_nist:`2014-9922`, :cve_nist:`2014-9940`, :cve_nist:`2015-0239`, :cve_nist:`2015-0274`, :cve_nist:`2015-0275`, :cve_nist:`2015-1333`, :cve_nist:`2015-1339`, :cve_nist:`2015-1350`, :cve_nist:`2015-1420`, :cve_nist:`2015-1421`, :cve_nist:`2015-1465`, :cve_nist:`2015-1573`, :cve_nist:`2015-1593`,
  :cve_nist:`2015-1805`, :cve_nist:`2015-2041`, :cve_nist:`2015-2042`, :cve_nist:`2015-2150`, :cve_nist:`2015-2666`, :cve_nist:`2015-2672`, :cve_nist:`2015-2686`, :cve_nist:`2015-2830`, :cve_nist:`2015-2922`, :cve_nist:`2015-2925`, :cve_nist:`2015-3212`, :cve_nist:`2015-3214`, :cve_nist:`2015-3288`, :cve_nist:`2015-3290`, :cve_nist:`2015-3291`, :cve_nist:`2015-3331`, :cve_nist:`2015-3339`, :cve_nist:`2015-3636`, :cve_nist:`2015-4001`, :cve_nist:`2015-4002`, :cve_nist:`2015-4003`, :cve_nist:`2015-4004`, :cve_nist:`2015-4036`, :cve_nist:`2015-4167`, :cve_nist:`2015-4170`, :cve_nist:`2015-4176`, :cve_nist:`2015-4177`, :cve_nist:`2015-4178`, :cve_nist:`2015-4692`, :cve_nist:`2015-4700`, :cve_nist:`2015-5156`, :cve_nist:`2015-5157`, :cve_nist:`2015-5257`, :cve_nist:`2015-5283`, :cve_nist:`2015-5307`, :cve_nist:`2015-5327`, :cve_nist:`2015-5364`, :cve_nist:`2015-5366`, :cve_nist:`2015-5697`, :cve_nist:`2015-5706`, :cve_nist:`2015-5707`, :cve_nist:`2015-6252`, :cve_nist:`2015-6526`, :cve_ni
 st:`2015-6937`, :cve_nist:`2015-7509`, :cve_nist:`2015-7513`, :cve_nist:`2015-7515`, :cve_nist:`2015-7550`, :cve_nist:`2015-7566`, :cve_nist:`2015-7613`, :cve_nist:`2015-7799`, :cve_nist:`2015-7833`, :cve_nist:`2015-7872`, :cve_nist:`2015-7884`, :cve_nist:`2015-7885`, :cve_nist:`2015-7990`, :cve_nist:`2015-8104`, :cve_nist:`2015-8215`, :cve_nist:`2015-8324`, :cve_nist:`2015-8374`, :cve_nist:`2015-8539`, :cve_nist:`2015-8543`, :cve_nist:`2015-8550`, :cve_nist:`2015-8551`, :cve_nist:`2015-8552`, :cve_nist:`2015-8553`, :cve_nist:`2015-8569`, :cve_nist:`2015-8575`, :cve_nist:`2015-8660`, :cve_nist:`2015-8709`, :cve_nist:`2015-8746`, :cve_nist:`2015-8767`, :cve_nist:`2015-8785`, :cve_nist:`2015-8787`, :cve_nist:`2015-8812`, :cve_nist:`2015-8816`, :cve_nist:`2015-8830`, :cve_nist:`2015-8839`, :cve_nist:`2015-8844`, :cve_nist:`2015-8845`, :cve_nist:`2015-8950`, :cve_nist:`2015-8952`, :cve_nist:`2015-8953`, :cve_nist:`2015-8955`, :cve_nist:`2015-8956`, :cve_nist:`2015-8961`, :cve_nist:`2015
 -8962`, :cve_nist:`2015-8963`, :cve_nist:`2015-8964`, :cve_nist:`2015-8966`, :cve_nist:`2015-8967`, :cve_nist:`2015-8970`, :cve_nist:`2015-9004`, :cve_nist:`2015-9016`, :cve_nist:`2015-9289`, :cve_nist:`2016-0617`, :cve_nist:`2016-0723`, :cve_nist:`2016-0728`, :cve_nist:`2016-0758`, :cve_nist:`2016-0821`, :cve_nist:`2016-0823`, :cve_nist:`2016-10044`, :cve_nist:`2016-10088`, :cve_nist:`2016-10147`, :cve_nist:`2016-10150`, :cve_nist:`2016-10153`, :cve_nist:`2016-10154`, :cve_nist:`2016-10200`, :cve_nist:`2016-10208`, :cve_nist:`2016-10229`, :cve_nist:`2016-10318`, :cve_nist:`2016-10723`, :cve_nist:`2016-10741`, :cve_nist:`2016-10764`, :cve_nist:`2016-10905`, :cve_nist:`2016-10906`, :cve_nist:`2016-10907`, :cve_nist:`2016-1237`, :cve_nist:`2016-1575`, :cve_nist:`2016-1576`, :cve_nist:`2016-1583`, :cve_nist:`2016-2053`, :cve_nist:`2016-2069`, :cve_nist:`2016-2070`, :cve_nist:`2016-2085`, :cve_nist:`2016-2117`, :cve_nist:`2016-2143`, :cve_nist:`2016-2184`, :cve_nist:`2016-2185`, :cve_ni
 st:`2016-2186`, :cve_nist:`2016-2187`, :cve_nist:`2016-2188`, :cve_nist:`2016-2383`, :cve_nist:`2016-2384`, :cve_nist:`2016-2543`, :cve_nist:`2016-2544`, :cve_nist:`2016-2545`, :cve_nist:`2016-2546`, :cve_nist:`2016-2547`, :cve_nist:`2016-2548`, :cve_nist:`2016-2549`, :cve_nist:`2016-2550`, :cve_nist:`2016-2782`, :cve_nist:`2016-2847`, :cve_nist:`2016-3044`, :cve_nist:`2016-3070`, :cve_nist:`2016-3134`, :cve_nist:`2016-3135`, :cve_nist:`2016-3136`, :cve_nist:`2016-3137`, :cve_nist:`2016-3138`, :cve_nist:`2016-3139`, :cve_nist:`2016-3140`, :cve_nist:`2016-3156`, :cve_nist:`2016-3157`, :cve_nist:`2016-3672`, :cve_nist:`2016-3689`, :cve_nist:`2016-3713`, :cve_nist:`2016-3841`, :cve_nist:`2016-3857`, :cve_nist:`2016-3951`, :cve_nist:`2016-3955`, :cve_nist:`2016-3961`, :cve_nist:`2016-4440`, :cve_nist:`2016-4470`, :cve_nist:`2016-4482`, :cve_nist:`2016-4485`, :cve_nist:`2016-4486`, :cve_nist:`2016-4557`, :cve_nist:`2016-4558`, :cve_nist:`2016-4565`, :cve_nist:`2016-4568`, :cve_nist:`2016
 -4569`, :cve_nist:`2016-4578`, :cve_nist:`2016-4580`, :cve_nist:`2016-4581`, :cve_nist:`2016-4794`, :cve_nist:`2016-4805`, :cve_nist:`2016-4913`, :cve_nist:`2016-4951`, :cve_nist:`2016-4997`, :cve_nist:`2016-4998`, :cve_nist:`2016-5195`, :cve_nist:`2016-5243`, :cve_nist:`2016-5244`, :cve_nist:`2016-5400`, :cve_nist:`2016-5412`, :cve_nist:`2016-5696`, :cve_nist:`2016-5728`, :cve_nist:`2016-5828`, :cve_nist:`2016-5829`, :cve_nist:`2016-6130`, :cve_nist:`2016-6136`, :cve_nist:`2016-6156`, :cve_nist:`2016-6162`, :cve_nist:`2016-6187`, :cve_nist:`2016-6197`, :cve_nist:`2016-6198`, :cve_nist:`2016-6213`, :cve_nist:`2016-6327`, :cve_nist:`2016-6480`, :cve_nist:`2016-6516`, :cve_nist:`2016-6786`, :cve_nist:`2016-6787`, :cve_nist:`2016-6828`, :cve_nist:`2016-7039`, :cve_nist:`2016-7042`, :cve_nist:`2016-7097`, :cve_nist:`2016-7117`, :cve_nist:`2016-7425`, :cve_nist:`2016-7910`, :cve_nist:`2016-7911`, :cve_nist:`2016-7912`, :cve_nist:`2016-7913`, :cve_nist:`2016-7914`, :cve_nist:`2016-7915`, 
 :cve_nist:`2016-7916`, :cve_nist:`2016-7917`, :cve_nist:`2016-8399`, :cve_nist:`2016-8405`, :cve_nist:`2016-8630`, :cve_nist:`2016-8632`, :cve_nist:`2016-8633`, :cve_nist:`2016-8636`, :cve_nist:`2016-8645`, :cve_nist:`2016-8646`, :cve_nist:`2016-8650`, :cve_nist:`2016-8655`, :cve_nist:`2016-8658`, :cve_nist:`2016-8666`, :cve_nist:`2016-9083`, :cve_nist:`2016-9084`, :cve_nist:`2016-9120`, :cve_nist:`2016-9178`, :cve_nist:`2016-9191`, :cve_nist:`2016-9313`, :cve_nist:`2016-9555`, :cve_nist:`2016-9576`, :cve_nist:`2016-9588`, :cve_nist:`2016-9604`, :cve_nist:`2016-9685`, :cve_nist:`2016-9754`, :cve_nist:`2016-9755`, :cve_nist:`2016-9756`, :cve_nist:`2016-9777`, :cve_nist:`2016-9793`, :cve_nist:`2016-9794`, :cve_nist:`2016-9806`, :cve_nist:`2016-9919`, :cve_nist:`2017-0605`, :cve_nist:`2017-0627`, :cve_nist:`2017-0750`, :cve_nist:`2017-0786`, :cve_nist:`2017-0861`, :cve_nist:`2017-1000`, :cve_nist:`2017-1000111`, :cve_nist:`2017-1000112`, :cve_nist:`2017-1000251`, :cve_nist:`2017-100025
 2`, :cve_nist:`2017-1000253`, :cve_nist:`2017-1000255`, :cve_nist:`2017-1000363`, :cve_nist:`2017-1000364`, :cve_nist:`2017-1000365`, :cve_nist:`2017-1000370`, :cve_nist:`2017-1000371`, :cve_nist:`2017-1000379`, :cve_nist:`2017-1000380`, :cve_nist:`2017-1000405`, :cve_nist:`2017-1000407`, :cve_nist:`2017-1000410`, :cve_nist:`2017-10661`, :cve_nist:`2017-10662`, :cve_nist:`2017-10663`, :cve_nist:`2017-10810`, :cve_nist:`2017-10911`, :cve_nist:`2017-11089`, :cve_nist:`2017-11176`, :cve_nist:`2017-11472`, :cve_nist:`2017-11473`, :cve_nist:`2017-11600`, :cve_nist:`2017-12134`, :cve_nist:`2017-12146`, :cve_nist:`2017-12153`, :cve_nist:`2017-12154`, :cve_nist:`2017-12168`, :cve_nist:`2017-12188`, :cve_nist:`2017-12190`, :cve_nist:`2017-12192`, :cve_nist:`2017-12193`, :cve_nist:`2017-12762`, :cve_nist:`2017-13080`, :cve_nist:`2017-13166`, :cve_nist:`2017-13167`, :cve_nist:`2017-13168`, :cve_nist:`2017-13215`, :cve_nist:`2017-13216`, :cve_nist:`2017-13220`, :cve_nist:`2017-13305`, :cve_nist
 :`2017-13686`, :cve_nist:`2017-13695`, :cve_nist:`2017-13715`, :cve_nist:`2017-14051`, :cve_nist:`2017-14106`, :cve_nist:`2017-14140`, :cve_nist:`2017-14156`, :cve_nist:`2017-14340`, :cve_nist:`2017-14489`, :cve_nist:`2017-14497`, :cve_nist:`2017-14954`, :cve_nist:`2017-14991`, :cve_nist:`2017-15102`, :cve_nist:`2017-15115`, :cve_nist:`2017-15116`, :cve_nist:`2017-15121`, :cve_nist:`2017-15126`, :cve_nist:`2017-15127`, :cve_nist:`2017-15128`, :cve_nist:`2017-15129`, :cve_nist:`2017-15265`, :cve_nist:`2017-15274`, :cve_nist:`2017-15299`, :cve_nist:`2017-15306`, :cve_nist:`2017-15537`, :cve_nist:`2017-15649`, :cve_nist:`2017-15868`, :cve_nist:`2017-15951`, :cve_nist:`2017-16525`, :cve_nist:`2017-16526`, :cve_nist:`2017-16527`, :cve_nist:`2017-16528`, :cve_nist:`2017-16529`, :cve_nist:`2017-16530`, :cve_nist:`2017-16531`, :cve_nist:`2017-16532`, :cve_nist:`2017-16533`, :cve_nist:`2017-16534`, :cve_nist:`2017-16535`, :cve_nist:`2017-16536`, :cve_nist:`2017-16537`, :cve_nist:`2017-16538`
 , :cve_nist:`2017-16643`, :cve_nist:`2017-16644`, :cve_nist:`2017-16645`, :cve_nist:`2017-16646`, :cve_nist:`2017-16647`, :cve_nist:`2017-16648`, :cve_nist:`2017-16649`, :cve_nist:`2017-16650`, :cve_nist:`2017-16911`, :cve_nist:`2017-16912`, :cve_nist:`2017-16913`, :cve_nist:`2017-16914`, :cve_nist:`2017-16939`, :cve_nist:`2017-16994`, :cve_nist:`2017-16995`, :cve_nist:`2017-16996`, :cve_nist:`2017-17052`, :cve_nist:`2017-17053`, :cve_nist:`2017-17448`, :cve_nist:`2017-17449`, :cve_nist:`2017-17450`, :cve_nist:`2017-17558`, :cve_nist:`2017-17712`, :cve_nist:`2017-17741`, :cve_nist:`2017-17805`, :cve_nist:`2017-17806`, :cve_nist:`2017-17807`, :cve_nist:`2017-17852`, :cve_nist:`2017-17853`, :cve_nist:`2017-17854`, :cve_nist:`2017-17855`, :cve_nist:`2017-17856`, :cve_nist:`2017-17857`, :cve_nist:`2017-17862`, :cve_nist:`2017-17863`, :cve_nist:`2017-17864`, :cve_nist:`2017-17975`, :cve_nist:`2017-18017`, :cve_nist:`2017-18075`, :cve_nist:`2017-18079`, :cve_nist:`2017-18174`, :cve_nist:`
 2017-18193`, :cve_nist:`2017-18200`, :cve_nist:`2017-18202`, :cve_nist:`2017-18203`, :cve_nist:`2017-18204`, :cve_nist:`2017-18208`, :cve_nist:`2017-18216`, :cve_nist:`2017-18218`, :cve_nist:`2017-18221`, :cve_nist:`2017-18222`, :cve_nist:`2017-18224`, :cve_nist:`2017-18232`, :cve_nist:`2017-18241`, :cve_nist:`2017-18249`, :cve_nist:`2017-18255`, :cve_nist:`2017-18257`, :cve_nist:`2017-18261`, :cve_nist:`2017-18270`, :cve_nist:`2017-18344`, :cve_nist:`2017-18360`, :cve_nist:`2017-18379`, :cve_nist:`2017-18509`, :cve_nist:`2017-18549`, :cve_nist:`2017-18550`, :cve_nist:`2017-18551`, :cve_nist:`2017-18552`, :cve_nist:`2017-18595`, :cve_nist:`2017-2583`, :cve_nist:`2017-2584`, :cve_nist:`2017-2596`, :cve_nist:`2017-2618`, :cve_nist:`2017-2634`, :cve_nist:`2017-2636`, :cve_nist:`2017-2647`, :cve_nist:`2017-2671`, :cve_nist:`2017-5123`, :cve_nist:`2017-5546`, :cve_nist:`2017-5547`, :cve_nist:`2017-5548`, :cve_nist:`2017-5549`, :cve_nist:`2017-5550`, :cve_nist:`2017-5551`, :cve_nist:`2017
 -5576`, :cve_nist:`2017-5577`, :cve_nist:`2017-5669`, :cve_nist:`2017-5715`, :cve_nist:`2017-5753`, :cve_nist:`2017-5754`, :cve_nist:`2017-5897`, :cve_nist:`2017-5967`, :cve_nist:`2017-5970`, :cve_nist:`2017-5972`, :cve_nist:`2017-5986`, :cve_nist:`2017-6001`, :cve_nist:`2017-6074`, :cve_nist:`2017-6214`, :cve_nist:`2017-6345`, :cve_nist:`2017-6346`, :cve_nist:`2017-6347`, :cve_nist:`2017-6348`, :cve_nist:`2017-6353`, :cve_nist:`2017-6874`, :cve_nist:`2017-6951`, :cve_nist:`2017-7184`, :cve_nist:`2017-7187`, :cve_nist:`2017-7261`, :cve_nist:`2017-7273`, :cve_nist:`2017-7277`, :cve_nist:`2017-7294`, :cve_nist:`2017-7308`, :cve_nist:`2017-7346`, :cve_nist:`2017-7374`, :cve_nist:`2017-7472`, :cve_nist:`2017-7477`, :cve_nist:`2017-7482`, :cve_nist:`2017-7487`, :cve_nist:`2017-7495`, :cve_nist:`2017-7518`, :cve_nist:`2017-7533`, :cve_nist:`2017-7541`, :cve_nist:`2017-7542`, :cve_nist:`2017-7558`, :cve_nist:`2017-7616`, :cve_nist:`2017-7618`, :cve_nist:`2017-7645`, :cve_nist:`2017-7889`, 
 :cve_nist:`2017-7895`, :cve_nist:`2017-7979`, :cve_nist:`2017-8061`, :cve_nist:`2017-8062`, :cve_nist:`2017-8063`, :cve_nist:`2017-8064`, :cve_nist:`2017-8065`, :cve_nist:`2017-8066`, :cve_nist:`2017-8067`, :cve_nist:`2017-8068`, :cve_nist:`2017-8069`, :cve_nist:`2017-8070`, :cve_nist:`2017-8071`, :cve_nist:`2017-8072`, :cve_nist:`2017-8106`, :cve_nist:`2017-8240`, :cve_nist:`2017-8797`, :cve_nist:`2017-8824`, :cve_nist:`2017-8831`, :cve_nist:`2017-8890`, :cve_nist:`2017-8924`, :cve_nist:`2017-8925`, :cve_nist:`2017-9059`, :cve_nist:`2017-9074`, :cve_nist:`2017-9075`, :cve_nist:`2017-9076`, :cve_nist:`2017-9077`, :cve_nist:`2017-9150`, :cve_nist:`2017-9211`, :cve_nist:`2017-9242`, :cve_nist:`2017-9605`, :cve_nist:`2017-9725`, :cve_nist:`2017-9984`, :cve_nist:`2017-9985`, :cve_nist:`2017-9986`, :cve_nist:`2018-1000004`, :cve_nist:`2018-1000026`, :cve_nist:`2018-1000028`, :cve_nist:`2018-1000199`, :cve_nist:`2018-1000200`, :cve_nist:`2018-1000204`, :cve_nist:`2018-10021`, :cve_nist:`2
 018-10074`, :cve_nist:`2018-10087`, :cve_nist:`2018-10124`, :cve_nist:`2018-10322`, :cve_nist:`2018-10323`, :cve_nist:`2018-1065`, :cve_nist:`2018-1066`, :cve_nist:`2018-10675`, :cve_nist:`2018-1068`, :cve_nist:`2018-10840`, :cve_nist:`2018-10853`, :cve_nist:`2018-1087`, :cve_nist:`2018-10876`, :cve_nist:`2018-10877`, :cve_nist:`2018-10878`, :cve_nist:`2018-10879`, :cve_nist:`2018-10880`, :cve_nist:`2018-10881`, :cve_nist:`2018-10882`, :cve_nist:`2018-10883`, :cve_nist:`2018-10901`, :cve_nist:`2018-10902`, :cve_nist:`2018-1091`, :cve_nist:`2018-1092`, :cve_nist:`2018-1093`, :cve_nist:`2018-10938`, :cve_nist:`2018-1094`, :cve_nist:`2018-10940`, :cve_nist:`2018-1095`, :cve_nist:`2018-1108`, :cve_nist:`2018-1118`, :cve_nist:`2018-1120`, :cve_nist:`2018-11232`, :cve_nist:`2018-1128`, :cve_nist:`2018-1129`, :cve_nist:`2018-1130`, :cve_nist:`2018-11412`, :cve_nist:`2018-11506`, :cve_nist:`2018-11508`, :cve_nist:`2018-12126`, :cve_nist:`2018-12127`, :cve_nist:`2018-12130`, :cve_nist:`2018-
 12207`, :cve_nist:`2018-12232`, :cve_nist:`2018-12233`, :cve_nist:`2018-12633`, :cve_nist:`2018-12714`, :cve_nist:`2018-12896`, :cve_nist:`2018-12904`, :cve_nist:`2018-13053`, :cve_nist:`2018-13093`, :cve_nist:`2018-13094`, :cve_nist:`2018-13095`, :cve_nist:`2018-13096`, :cve_nist:`2018-13097`, :cve_nist:`2018-13098`, :cve_nist:`2018-13099`, :cve_nist:`2018-13100`, :cve_nist:`2018-13405`, :cve_nist:`2018-13406`, :cve_nist:`2018-14609`, :cve_nist:`2018-14610`, :cve_nist:`2018-14611`, :cve_nist:`2018-14612`, :cve_nist:`2018-14613`, :cve_nist:`2018-14614`, :cve_nist:`2018-14615`, :cve_nist:`2018-14616`, :cve_nist:`2018-14617`, :cve_nist:`2018-14619`, :cve_nist:`2018-14625`, :cve_nist:`2018-14633`, :cve_nist:`2018-14634`, :cve_nist:`2018-14641`, :cve_nist:`2018-14646`, :cve_nist:`2018-14656`, :cve_nist:`2018-14678`, :cve_nist:`2018-14734`, :cve_nist:`2018-15471`, :cve_nist:`2018-15572`, :cve_nist:`2018-15594`, :cve_nist:`2018-16276`, :cve_nist:`2018-16597`, :cve_nist:`2018-16658`, :cve_
 nist:`2018-16862`, :cve_nist:`2018-16871`, :cve_nist:`2018-16880`, :cve_nist:`2018-16882`, :cve_nist:`2018-16884`, :cve_nist:`2018-17182`, :cve_nist:`2018-17972`, :cve_nist:`2018-18021`, :cve_nist:`2018-18281`, :cve_nist:`2018-18386`, :cve_nist:`2018-18397`, :cve_nist:`2018-18445`, :cve_nist:`2018-18559`, :cve_nist:`2018-18690`, :cve_nist:`2018-18710`, :cve_nist:`2018-18955`, :cve_nist:`2018-19406`, :cve_nist:`2018-19407`, :cve_nist:`2018-19824`, :cve_nist:`2018-19854`, :cve_nist:`2018-19985`, :cve_nist:`2018-20169`, :cve_nist:`2018-20449`, :cve_nist:`2018-20509`, :cve_nist:`2018-20510`, :cve_nist:`2018-20511`, :cve_nist:`2018-20669`, :cve_nist:`2018-20784`, :cve_nist:`2018-20836`, :cve_nist:`2018-20854`, :cve_nist:`2018-20855`, :cve_nist:`2018-20856`, :cve_nist:`2018-20961`, :cve_nist:`2018-20976`, :cve_nist:`2018-21008`, :cve_nist:`2018-25015`, :cve_nist:`2018-25020`, :cve_nist:`2018-3620`, :cve_nist:`2018-3639`, :cve_nist:`2018-3646`, :cve_nist:`2018-3665`, :cve_nist:`2018-3693`,
  :cve_nist:`2018-5332`, :cve_nist:`2018-5333`, :cve_nist:`2018-5344`, :cve_nist:`2018-5390`, :cve_nist:`2018-5391`, :cve_nist:`2018-5703`, :cve_nist:`2018-5750`, :cve_nist:`2018-5803`, :cve_nist:`2018-5814`, :cve_nist:`2018-5848`, :cve_nist:`2018-5873`, :cve_nist:`2018-5953`, :cve_nist:`2018-5995`, :cve_nist:`2018-6412`, :cve_nist:`2018-6554`, :cve_nist:`2018-6555`, :cve_nist:`2018-6927`, :cve_nist:`2018-7191`, :cve_nist:`2018-7273`, :cve_nist:`2018-7480`, :cve_nist:`2018-7492`, :cve_nist:`2018-7566`, :cve_nist:`2018-7740`, :cve_nist:`2018-7754`, :cve_nist:`2018-7755`, :cve_nist:`2018-7757`, :cve_nist:`2018-7995`, :cve_nist:`2018-8043`, :cve_mitre:`2018-8087`, :cve_mitre:`2018-8781`, :cve_mitre:`2018-8822`, :cve_mitre:`2018-8897`, :cve_mitre:`2018-9363`, :cve_mitre:`2018-9385`, :cve_mitre:`2018-9415`, :cve_mitre:`2018-9422`, :cve_mitre:`2018-9465`, :cve_mitre:`2018-9516`, :cve_mitre:`2018-9517`, :cve_mitre:`2018-9518` and :cve_mitre:`2018-9568`
+-  linux-yocto/6.1 (Continued): Ignore :cve_nist:`2019-0136`, :cve_nist:`2019-0145`, :cve_nist:`2019-0146`, :cve_nist:`2019-0147`, :cve_nist:`2019-0148`, :cve_nist:`2019-0149`, :cve_nist:`2019-0154`, :cve_nist:`2019-0155`, :cve_nist:`2019-10124`, :cve_nist:`2019-10125`, :cve_nist:`2019-10126`, :cve_nist:`2019-10142`, :cve_nist:`2019-10207`, :cve_nist:`2019-10220`, :cve_nist:`2019-10638`, :cve_nist:`2019-10639`, :cve_nist:`2019-11085`, :cve_nist:`2019-11091`, :cve_nist:`2019-11135`, :cve_nist:`2019-11190`, :cve_nist:`2019-11191`, :cve_nist:`2019-1125`, :cve_nist:`2019-11477`, :cve_nist:`2019-11478`, :cve_nist:`2019-11479`, :cve_nist:`2019-11486`, :cve_nist:`2019-11487`, :cve_nist:`2019-11599`, :cve_nist:`2019-11683`, :cve_nist:`2019-11810`, :cve_nist:`2019-11811`, :cve_nist:`2019-11815`, :cve_nist:`2019-11833`, :cve_nist:`2019-11884`, :cve_nist:`2019-12378`, :cve_nist:`2019-12379`, :cve_nist:`2019-12380`, :cve_nist:`2019-12381`, :cve_nist:`2019-12382`, :cve_nist:`2019-12454`, :cve_ni
 st:`2019-12455`, :cve_nist:`2019-12614`, :cve_nist:`2019-12615`, :cve_nist:`2019-12817`, :cve_nist:`2019-12818`, :cve_nist:`2019-12819`, :cve_nist:`2019-12881`, :cve_nist:`2019-12984`, :cve_nist:`2019-13233`, :cve_nist:`2019-13272`, :cve_nist:`2019-13631`, :cve_nist:`2019-13648`, :cve_nist:`2019-14283`, :cve_nist:`2019-14284`, :cve_nist:`2019-14615`, :cve_nist:`2019-14763`, :cve_nist:`2019-14814`, :cve_nist:`2019-14815`, :cve_nist:`2019-14816`, :cve_nist:`2019-14821`, :cve_nist:`2019-14835`, :cve_nist:`2019-14895`, :cve_nist:`2019-14896`, :cve_nist:`2019-14897`, :cve_nist:`2019-14901`, :cve_nist:`2019-15030`, :cve_nist:`2019-15031`, :cve_nist:`2019-15090`, :cve_nist:`2019-15098`, :cve_nist:`2019-15099`, :cve_nist:`2019-15117`, :cve_nist:`2019-15118`, :cve_nist:`2019-15211`, :cve_nist:`2019-15212`, :cve_nist:`2019-15213`, :cve_nist:`2019-15214`, :cve_nist:`2019-15215`, :cve_nist:`2019-15216`, :cve_nist:`2019-15217`, :cve_nist:`2019-15218`, :cve_nist:`2019-15219`, :cve_nist:`2019-1522
 0`, :cve_nist:`2019-15221`, :cve_nist:`2019-15222`, :cve_nist:`2019-15223`, :cve_nist:`2019-15291`, :cve_nist:`2019-15292`, :cve_nist:`2019-15504`, :cve_nist:`2019-15505`, :cve_nist:`2019-15538`, :cve_nist:`2019-15666`, :cve_nist:`2019-15794`, :cve_nist:`2019-15807`, :cve_nist:`2019-15916`, :cve_nist:`2019-15917`, :cve_nist:`2019-15918`, :cve_nist:`2019-15919`, :cve_nist:`2019-15920`, :cve_nist:`2019-15921`, :cve_nist:`2019-15922`, :cve_nist:`2019-15923`, :cve_nist:`2019-15924`, :cve_nist:`2019-15925`, :cve_nist:`2019-15926`, :cve_nist:`2019-15927`, :cve_nist:`2019-16229`, :cve_nist:`2019-16230`, :cve_nist:`2019-16231`, :cve_nist:`2019-16232`, :cve_nist:`2019-16233`, :cve_nist:`2019-16234`, :cve_nist:`2019-16413`, :cve_nist:`2019-16714`, :cve_nist:`2019-16746`, :cve_nist:`2019-16921`, :cve_nist:`2019-16994`, :cve_nist:`2019-16995`, :cve_nist:`2019-17052`, :cve_nist:`2019-17053`, :cve_nist:`2019-17054`, :cve_nist:`2019-17055`, :cve_nist:`2019-17056`, :cve_nist:`2019-17075`, :cve_nist
 :`2019-17133`, :cve_nist:`2019-17351`, :cve_nist:`2019-17666`, :cve_nist:`2019-18198`, :cve_nist:`2019-18282`, :cve_nist:`2019-18660`, :cve_nist:`2019-18675`, :cve_nist:`2019-18683`, :cve_nist:`2019-18786`, :cve_nist:`2019-18805`, :cve_nist:`2019-18806`, :cve_nist:`2019-18807`, :cve_nist:`2019-18808`, :cve_nist:`2019-18809`, :cve_nist:`2019-18810`, :cve_nist:`2019-18811`, :cve_nist:`2019-18812`, :cve_nist:`2019-18813`, :cve_nist:`2019-18814`, :cve_nist:`2019-18885`, :cve_nist:`2019-19036`, :cve_nist:`2019-19037`, :cve_nist:`2019-19039`, :cve_nist:`2019-19043`, :cve_nist:`2019-19044`, :cve_nist:`2019-19045`, :cve_nist:`2019-19046`, :cve_nist:`2019-19047`, :cve_nist:`2019-19048`, :cve_nist:`2019-19049`, :cve_nist:`2019-19050`, :cve_nist:`2019-19051`, :cve_nist:`2019-19052`, :cve_nist:`2019-19053`, :cve_nist:`2019-19054`, :cve_nist:`2019-19055`, :cve_nist:`2019-19056`, :cve_nist:`2019-19057`, :cve_nist:`2019-19058`, :cve_nist:`2019-19059`, :cve_nist:`2019-19060`, :cve_nist:`2019-19061`
 , :cve_nist:`2019-19062`, :cve_nist:`2019-19063`, :cve_nist:`2019-19064`, :cve_nist:`2019-19065`, :cve_nist:`2019-19066`, :cve_nist:`2019-19067`, :cve_nist:`2019-19068`, :cve_nist:`2019-19069`, :cve_nist:`2019-19070`, :cve_nist:`2019-19071`, :cve_nist:`2019-19072`, :cve_nist:`2019-19073`, :cve_nist:`2019-19074`, :cve_nist:`2019-19075`, :cve_nist:`2019-19076`, :cve_nist:`2019-19077`, :cve_nist:`2019-19078`, :cve_nist:`2019-19079`, :cve_nist:`2019-19080`, :cve_nist:`2019-19081`, :cve_nist:`2019-19082`, :cve_nist:`2019-19083`, :cve_nist:`2019-19227`, :cve_nist:`2019-19241`, :cve_nist:`2019-19252`, :cve_nist:`2019-19318`, :cve_nist:`2019-19319`, :cve_nist:`2019-19332`, :cve_nist:`2019-19338`, :cve_nist:`2019-19377`, :cve_nist:`2019-19447`, :cve_nist:`2019-19448`, :cve_nist:`2019-19449`, :cve_nist:`2019-19462`, :cve_nist:`2019-19523`, :cve_nist:`2019-19524`, :cve_nist:`2019-19525`, :cve_nist:`2019-19526`, :cve_nist:`2019-19527`, :cve_nist:`2019-19528`, :cve_nist:`2019-19529`, :cve_nist:`
 2019-19530`, :cve_nist:`2019-19531`, :cve_nist:`2019-19532`, :cve_nist:`2019-19533`, :cve_nist:`2019-19534`, :cve_nist:`2019-19535`, :cve_nist:`2019-19536`, :cve_nist:`2019-19537`, :cve_nist:`2019-19543`, :cve_nist:`2019-19602`, :cve_nist:`2019-19767`, :cve_nist:`2019-19768`, :cve_nist:`2019-19769`, :cve_nist:`2019-19770`, :cve_nist:`2019-19807`, :cve_nist:`2019-19813`, :cve_nist:`2019-19815`, :cve_nist:`2019-19816`, :cve_nist:`2019-19922`, :cve_nist:`2019-19927`, :cve_nist:`2019-19947`, :cve_nist:`2019-19965`, :cve_nist:`2019-19966`, :cve_nist:`2019-1999`, :cve_nist:`2019-20054`, :cve_nist:`2019-20095`, :cve_nist:`2019-20096`, :cve_nist:`2019-2024`, :cve_nist:`2019-2025`, :cve_nist:`2019-20422`, :cve_nist:`2019-2054`, :cve_nist:`2019-20636`, :cve_nist:`2019-20806`, :cve_nist:`2019-20810`, :cve_nist:`2019-20811`, :cve_nist:`2019-20812`, :cve_nist:`2019-20908`, :cve_nist:`2019-20934`, :cve_nist:`2019-2101`, :cve_nist:`2019-2181`, :cve_nist:`2019-2182`, :cve_nist:`2019-2213`, :cve_nis
 t:`2019-2214`, :cve_nist:`2019-2215`, :cve_nist:`2019-25044`, :cve_nist:`2019-25045`, :cve_nist:`2019-3016`, :cve_nist:`2019-3459`, :cve_nist:`2019-3460`, :cve_nist:`2019-3701`, :cve_nist:`2019-3819`, :cve_nist:`2019-3837`, :cve_nist:`2019-3846`, :cve_nist:`2019-3874`, :cve_nist:`2019-3882`, :cve_nist:`2019-3887`, :cve_nist:`2019-3892`, :cve_nist:`2019-3896`, :cve_nist:`2019-3900`, :cve_nist:`2019-3901`, :cve_nist:`2019-5108`, :cve_nist:`2019-6133`, :cve_nist:`2019-6974`, :cve_nist:`2019-7221`, :cve_nist:`2019-7222`, :cve_nist:`2019-7308`, :cve_nist:`2019-8912`, :cve_nist:`2019-8956`, :cve_nist:`2019-8980`, :cve_nist:`2019-9003`, :cve_nist:`2019-9162`, :cve_nist:`2019-9213`, :cve_nist:`2019-9245`, :cve_nist:`2019-9444`, :cve_nist:`2019-9445`, :cve_nist:`2019-9453`, :cve_nist:`2019-9454`, :cve_nist:`2019-9455`, :cve_nist:`2019-9456`, :cve_nist:`2019-9457`, :cve_nist:`2019-9458`, :cve_nist:`2019-9466`, :cve_nist:`2019-9500`, :cve_nist:`2019-9503`, :cve_nist:`2019-9506`, :cve_nist:`201
 9-9857`, :cve_nist:`2020-0009`, :cve_nist:`2020-0030`, :cve_nist:`2020-0041`, :cve_nist:`2020-0066`, :cve_nist:`2020-0067`, :cve_nist:`2020-0110`, :cve_nist:`2020-0255`, :cve_nist:`2020-0305`, :cve_nist:`2020-0404`, :cve_nist:`2020-0423`, :cve_nist:`2020-0427`, :cve_nist:`2020-0429`, :cve_nist:`2020-0430`, :cve_nist:`2020-0431`, :cve_nist:`2020-0432`, :cve_nist:`2020-0433`, :cve_nist:`2020-0435`, :cve_nist:`2020-0444`, :cve_nist:`2020-0465`, :cve_nist:`2020-0466`, :cve_nist:`2020-0543`, :cve_nist:`2020-10135`, :cve_nist:`2020-10690`, :cve_nist:`2020-10711`, :cve_nist:`2020-10720`, :cve_nist:`2020-10732`, :cve_nist:`2020-10742`, :cve_nist:`2020-10751`, :cve_nist:`2020-10757`, :cve_nist:`2020-10766`, :cve_nist:`2020-10767`, :cve_nist:`2020-10768`, :cve_nist:`2020-10769`, :cve_nist:`2020-10773`, :cve_nist:`2020-10781`, :cve_nist:`2020-10942`, :cve_nist:`2020-11494`, :cve_nist:`2020-11565`, :cve_nist:`2020-11608`, :cve_nist:`2020-11609`, :cve_nist:`2020-11668`, :cve_nist:`2020-11669`, :
 cve_nist:`2020-11884`, :cve_nist:`2020-12114`, :cve_nist:`2020-12351`, :cve_nist:`2020-12352`, :cve_nist:`2020-12362`, :cve_nist:`2020-12363`, :cve_nist:`2020-12364`, :cve_nist:`2020-12464`, :cve_nist:`2020-12465`, :cve_nist:`2020-12652`, :cve_nist:`2020-12653`, :cve_nist:`2020-12654`, :cve_nist:`2020-12655`, :cve_nist:`2020-12656`, :cve_nist:`2020-12657`, :cve_nist:`2020-12659`, :cve_nist:`2020-12768`, :cve_nist:`2020-12769`, :cve_nist:`2020-12770`, :cve_nist:`2020-12771`, :cve_nist:`2020-12826`, :cve_nist:`2020-12888`, :cve_nist:`2020-12912`, :cve_nist:`2020-13143`, :cve_nist:`2020-13974`, :cve_nist:`2020-14305`, :cve_nist:`2020-14314`, :cve_nist:`2020-14331`, :cve_nist:`2020-14351`, :cve_nist:`2020-14353`, :cve_nist:`2020-14356`, :cve_nist:`2020-14381`, :cve_nist:`2020-14385`, :cve_nist:`2020-14386`, :cve_nist:`2020-14390`, :cve_nist:`2020-14416`, :cve_nist:`2020-15393`, :cve_nist:`2020-15436`, :cve_nist:`2020-15437`, :cve_nist:`2020-15780`, :cve_nist:`2020-15852`, :cve_nist:`202
 0-16119`, :cve_nist:`2020-16120`, :cve_nist:`2020-16166`, :cve_nist:`2020-1749`, :cve_nist:`2020-24394`, :cve_nist:`2020-24490`, :cve_nist:`2020-24504`, :cve_nist:`2020-24586`, :cve_nist:`2020-24587`, :cve_nist:`2020-24588`, :cve_nist:`2020-25211`, :cve_nist:`2020-25212`, :cve_nist:`2020-25221`, :cve_nist:`2020-25284`, :cve_nist:`2020-25285`, :cve_nist:`2020-25639`, :cve_nist:`2020-25641`, :cve_nist:`2020-25643`, :cve_nist:`2020-25645`, :cve_nist:`2020-25656`, :cve_nist:`2020-25668`, :cve_nist:`2020-25669`, :cve_nist:`2020-25670`, :cve_nist:`2020-25671`, :cve_nist:`2020-25672`, :cve_nist:`2020-25673`, :cve_nist:`2020-25704`, :cve_nist:`2020-25705`, :cve_nist:`2020-26088`, :cve_nist:`2020-26139`, :cve_nist:`2020-26141`, :cve_nist:`2020-26145`, :cve_nist:`2020-26147`, :cve_nist:`2020-26541`, :cve_nist:`2020-26555`, :cve_nist:`2020-26558`, :cve_nist:`2020-27066`, :cve_nist:`2020-27067`, :cve_nist:`2020-27068`, :cve_nist:`2020-27152`, :cve_nist:`2020-27170`, :cve_nist:`2020-27171`, :cve
 _nist:`2020-27194`, :cve_nist:`2020-2732`, :cve_nist:`2020-27673`, :cve_nist:`2020-27675`, :cve_nist:`2020-27777`, :cve_nist:`2020-27784`, :cve_nist:`2020-27786`, :cve_nist:`2020-27815`, :cve_nist:`2020-27820`, :cve_nist:`2020-27825`, :cve_nist:`2020-27830`, :cve_nist:`2020-27835`, :cve_nist:`2020-28097`, :cve_nist:`2020-28374`, :cve_nist:`2020-28588`, :cve_nist:`2020-28915`, :cve_nist:`2020-28941`, :cve_nist:`2020-28974`, :cve_nist:`2020-29368`, :cve_nist:`2020-29369`, :cve_nist:`2020-29370`, :cve_nist:`2020-29371`, :cve_nist:`2020-29372`, :cve_nist:`2020-29373`, :cve_nist:`2020-29374`, :cve_nist:`2020-29534`, :cve_nist:`2020-29568`, :cve_nist:`2020-29569`, :cve_nist:`2020-29660`, :cve_nist:`2020-29661`, :cve_nist:`2020-35499`, :cve_nist:`2020-35508`, :cve_nist:`2020-35513`, :cve_nist:`2020-35519`, :cve_nist:`2020-36158`, :cve_nist:`2020-36310`, :cve_nist:`2020-36311`, :cve_nist:`2020-36312`, :cve_nist:`2020-36313`, :cve_nist:`2020-36322`, :cve_nist:`2020-36385`, :cve_nist:`2020-36
 386`, :cve_nist:`2020-36387`, :cve_nist:`2020-36516`, :cve_nist:`2020-36557`, :cve_nist:`2020-36558`, :cve_nist:`2020-36691`, :cve_nist:`2020-36694`, :cve_nist:`2020-36766`, :cve_nist:`2020-3702`, :cve_nist:`2020-4788`, :cve_nist:`2020-7053`, :cve_nist:`2020-8428`, :cve_nist:`2020-8647`, :cve_nist:`2020-8648`, :cve_nist:`2020-8649`, :cve_nist:`2020-8694`, :cve_nist:`2020-8834`, :cve_nist:`2020-8835`, :cve_nist:`2020-8992`, :cve_nist:`2020-9383`, :cve_nist:`2020-9391`, :cve_nist:`2021-0129`, :cve_nist:`2021-0342`, :cve_mitre:`2021-0447`, :cve_mitre:`2021-0448`, :cve_nist:`2021-0512`, :cve_nist:`2021-0605`, :cve_nist:`2021-0707`, :cve_nist:`2021-0920`, :cve_nist:`2021-0929`, :cve_nist:`2021-0935`, :cve_mitre:`2021-0937`, :cve_nist:`2021-0938`, :cve_nist:`2021-0941`, :cve_nist:`2021-1048`, :cve_nist:`2021-20177`, :cve_nist:`2021-20194`, :cve_nist:`2021-20226`, :cve_nist:`2021-20239`, :cve_nist:`2021-20261`, :cve_nist:`2021-20265`, :cve_nist:`2021-20268`, :cve_nist:`2021-20292`, :cve_ni
 st:`2021-20317`, :cve_nist:`2021-20320`, :cve_nist:`2021-20321`, :cve_nist:`2021-20322`, :cve_nist:`2021-21781`, :cve_nist:`2021-22543`, :cve_nist:`2021-22555`, :cve_nist:`2021-22600`, :cve_nist:`2021-23133`, :cve_nist:`2021-23134`, :cve_nist:`2021-26401`, :cve_nist:`2021-26708`, :cve_nist:`2021-26930`, :cve_nist:`2021-26931`, :cve_nist:`2021-26932`, :cve_nist:`2021-27363`, :cve_nist:`2021-27364`, :cve_nist:`2021-27365`, :cve_nist:`2021-28038`, :cve_nist:`2021-28039`, :cve_nist:`2021-28375`, :cve_nist:`2021-28660`, :cve_nist:`2021-28688`, :cve_nist:`2021-28691`, :cve_nist:`2021-28711`, :cve_nist:`2021-28712`, :cve_nist:`2021-28713`, :cve_nist:`2021-28714`, :cve_nist:`2021-28715`, :cve_nist:`2021-28950`, :cve_nist:`2021-28951`, :cve_nist:`2021-28952`, :cve_nist:`2021-28964`, :cve_nist:`2021-28971`, :cve_nist:`2021-28972`, :cve_nist:`2021-29154`, :cve_nist:`2021-29155`, :cve_nist:`2021-29264`, :cve_nist:`2021-29265`, :cve_nist:`2021-29266`, :cve_nist:`2021-29646`, :cve_nist:`2021-2964
 7`, :cve_nist:`2021-29648`, :cve_nist:`2021-29649`, :cve_nist:`2021-29650`, :cve_nist:`2021-29657`, :cve_nist:`2021-30002`, :cve_nist:`2021-30178`, :cve_nist:`2021-31440`, :cve_nist:`2021-3178`, :cve_nist:`2021-31829`, :cve_nist:`2021-31916`, :cve_nist:`2021-32078`, :cve_nist:`2021-32399`, :cve_nist:`2021-32606`, :cve_nist:`2021-33033`, :cve_nist:`2021-33034`, :cve_nist:`2021-33061`, :cve_nist:`2021-33098`, :cve_nist:`2021-33135`, :cve_nist:`2021-33200`, :cve_nist:`2021-3347`, :cve_nist:`2021-3348`, :cve_nist:`2021-33624`, :cve_nist:`2021-33655`, :cve_nist:`2021-33656`, :cve_nist:`2021-33909`, :cve_nist:`2021-3411`, :cve_nist:`2021-3428`, :cve_nist:`2021-3444`, :cve_nist:`2021-34556`, :cve_nist:`2021-34693`, :cve_nist:`2021-3483`, :cve_nist:`2021-34866`, :cve_nist:`2021-3489`, :cve_nist:`2021-3490`, :cve_nist:`2021-3491`, :cve_nist:`2021-3493`, :cve_mitre:`2021-34981`, :cve_nist:`2021-3501`, :cve_nist:`2021-35039`, :cve_nist:`2021-3506`, :cve_nist:`2021-3543`, :cve_nist:`2021-35477`
 , :cve_nist:`2021-3564`, :cve_nist:`2021-3573`, :cve_nist:`2021-3587`, :cve_mitre:`2021-3600`, :cve_nist:`2021-3609`, :cve_nist:`2021-3612`, :cve_nist:`2021-3635`, :cve_nist:`2021-3640`, :cve_nist:`2021-3653`, :cve_nist:`2021-3655`, :cve_nist:`2021-3656`, :cve_nist:`2021-3659`, :cve_nist:`2021-3669`, :cve_nist:`2021-3679`, :cve_nist:`2021-3715`, :cve_nist:`2021-37159`, :cve_nist:`2021-3732`, :cve_nist:`2021-3736`, :cve_nist:`2021-3739`, :cve_nist:`2021-3743`, :cve_nist:`2021-3744`, :cve_nist:`2021-3752`, :cve_nist:`2021-3753`, :cve_nist:`2021-37576`, :cve_nist:`2021-3759`, :cve_nist:`2021-3760`, :cve_nist:`2021-3764`, :cve_nist:`2021-3772`, :cve_nist:`2021-38160`, :cve_nist:`2021-38166`, :cve_nist:`2021-38198`, :cve_nist:`2021-38199`, :cve_nist:`2021-38200`, :cve_nist:`2021-38201`, :cve_nist:`2021-38202`, :cve_nist:`2021-38203`, :cve_nist:`2021-38204`, :cve_nist:`2021-38205`, :cve_nist:`2021-38206`, :cve_nist:`2021-38207`, :cve_nist:`2021-38208`, :cve_nist:`2021-38209`, :cve_nist:`2
 021-38300`, :cve_nist:`2021-3894`, :cve_nist:`2021-3896`, :cve_nist:`2021-3923`, :cve_nist:`2021-39633`, :cve_nist:`2021-39634`, :cve_nist:`2021-39636`, :cve_nist:`2021-39648`, :cve_nist:`2021-39656`, :cve_nist:`2021-39657`, :cve_nist:`2021-39685`, :cve_nist:`2021-39686`, :cve_nist:`2021-39698`, :cve_nist:`2021-39711`, :cve_nist:`2021-39713`, :cve_nist:`2021-39714`, :cve_nist:`2021-4001`, :cve_nist:`2021-4002`, :cve_nist:`2021-4023`, :cve_nist:`2021-4028`, :cve_nist:`2021-4032`, :cve_nist:`2021-4037`, :cve_nist:`2021-40490`, :cve_nist:`2021-4083`, :cve_nist:`2021-4090`, :cve_nist:`2021-4093`, :cve_nist:`2021-4095`, :cve_nist:`2021-41073`, :cve_nist:`2021-4135`, :cve_nist:`2021-4148`, :cve_nist:`2021-4149`, :cve_nist:`2021-4150`, :cve_nist:`2021-4154`, :cve_nist:`2021-4155`, :cve_nist:`2021-4157`, :cve_nist:`2021-4159`, :cve_nist:`2021-41864`, :cve_nist:`2021-4197`, :cve_nist:`2021-42008`, :cve_nist:`2021-4202`, :cve_nist:`2021-4203`, :cve_nist:`2021-4204`, :cve_nist:`2021-4218`, :cv
 e_nist:`2021-42252`, :cve_nist:`2021-42327`, :cve_nist:`2021-42739`, :cve_nist:`2021-43056`, :cve_nist:`2021-43057`, :cve_nist:`2021-43267`, :cve_nist:`2021-43389`, :cve_nist:`2021-43975`, :cve_nist:`2021-43976`, :cve_nist:`2021-44733`, :cve_nist:`2021-44879`, :cve_nist:`2021-45095`, :cve_nist:`2021-45100`, :cve_nist:`2021-45402`, :cve_nist:`2021-45469`, :cve_nist:`2021-45480`, :cve_nist:`2021-45485`, :cve_nist:`2021-45486`, :cve_nist:`2021-45868`, :cve_nist:`2021-46283`, :cve_nist:`2022-0001`, :cve_nist:`2022-0002`, :cve_nist:`2022-0168`, :cve_nist:`2022-0171`, :cve_nist:`2022-0185`, :cve_nist:`2022-0264`, :cve_nist:`2022-0286`, :cve_nist:`2022-0322`, :cve_nist:`2022-0330`, :cve_nist:`2022-0382`, :cve_nist:`2022-0433`, :cve_nist:`2022-0435`, :cve_nist:`2022-0480`, :cve_nist:`2022-0487`, :cve_nist:`2022-0492`, :cve_nist:`2022-0494`, :cve_nist:`2022-0500`, :cve_nist:`2022-0516`, :cve_nist:`2022-0617`, :cve_nist:`2022-0644`, :cve_nist:`2022-0646`, :cve_nist:`2022-0742`, :cve_nist:`202
 2-0812`, :cve_nist:`2022-0847`, :cve_nist:`2022-0850`, :cve_nist:`2022-0854`, :cve_nist:`2022-0995`, :cve_nist:`2022-0998`, :cve_nist:`2022-1011`, :cve_nist:`2022-1012`, :cve_nist:`2022-1015`, :cve_nist:`2022-1016`, :cve_nist:`2022-1043`, :cve_nist:`2022-1048`, :cve_nist:`2022-1055`, :cve_nist:`2022-1158`, :cve_nist:`2022-1184`, :cve_nist:`2022-1195`, :cve_nist:`2022-1198`, :cve_nist:`2022-1199`, :cve_nist:`2022-1204`, :cve_nist:`2022-1205`, :cve_nist:`2022-1263`, :cve_nist:`2022-1280`, :cve_nist:`2022-1353`, :cve_nist:`2022-1419`, :cve_nist:`2022-1462`, :cve_nist:`2022-1508`, :cve_nist:`2022-1516`, :cve_nist:`2022-1651`, :cve_nist:`2022-1652`, :cve_nist:`2022-1671`, :cve_nist:`2022-1678`, :cve_nist:`2022-1679`, :cve_nist:`2022-1729`, :cve_nist:`2022-1734`, :cve_nist:`2022-1786`, :cve_nist:`2022-1789`, :cve_nist:`2022-1836`, :cve_nist:`2022-1852`, :cve_nist:`2022-1882`, :cve_nist:`2022-1943`, :cve_nist:`2022-1966`, :cve_nist:`2022-1972`, :cve_nist:`2022-1973`, :cve_nist:`2022-1974`,
  :cve_nist:`2022-1975`, :cve_nist:`2022-1976`, :cve_nist:`2022-1998`, :cve_nist:`2022-20008`, :cve_nist:`2022-20132`, :cve_nist:`2022-20141`, :cve_nist:`2022-20148`, :cve_nist:`2022-20153`, :cve_nist:`2022-20154`, :cve_nist:`2022-20158`, :cve_nist:`2022-20166`, :cve_nist:`2022-20368`, :cve_nist:`2022-20369`, :cve_nist:`2022-20409`, :cve_nist:`2022-20421`, :cve_nist:`2022-20422`, :cve_nist:`2022-20423`, :cve_nist:`2022-20424`, :cve_mitre:`2022-20565`, :cve_nist:`2022-20566`, :cve_nist:`2022-20567`, :cve_nist:`2022-20568`, :cve_nist:`2022-20572`, :cve_nist:`2022-2078`, :cve_nist:`2022-21123`, :cve_nist:`2022-21125`, :cve_nist:`2022-21166`, :cve_nist:`2022-21385`, :cve_nist:`2022-21499`, :cve_mitre:`2022-21505`, :cve_nist:`2022-2153`, :cve_nist:`2022-2196`, :cve_mitre:`2022-22942`, :cve_nist:`2022-23036`, :cve_nist:`2022-23037`, :cve_nist:`2022-23038`, :cve_nist:`2022-23039`, :cve_nist:`2022-23040`, :cve_nist:`2022-23041`, :cve_nist:`2022-23042`, :cve_nist:`2022-2308`, :cve_nist:`2022-
 2318`, :cve_nist:`2022-23222`, :cve_nist:`2022-2327`, :cve_nist:`2022-2380`, :cve_nist:`2022-23816`, :cve_nist:`2022-23960`, :cve_nist:`2022-24122`, :cve_nist:`2022-24448`, :cve_nist:`2022-24958`, :cve_nist:`2022-24959`, :cve_nist:`2022-2503`, :cve_nist:`2022-25258`, :cve_nist:`2022-25375`, :cve_nist:`2022-25636`, :cve_mitre:`2022-2585`, :cve_mitre:`2022-2586`, :cve_mitre:`2022-2588`, :cve_nist:`2022-2590`, :cve_mitre:`2022-2602`, :cve_nist:`2022-26365`, :cve_nist:`2022-26373`, :cve_nist:`2022-2639`, :cve_nist:`2022-26490`, :cve_nist:`2022-2663`, :cve_nist:`2022-26966`, :cve_nist:`2022-27223`, :cve_nist:`2022-27666`, :cve_nist:`2022-27672`, :cve_nist:`2022-2785`, :cve_nist:`2022-27950`, :cve_nist:`2022-28356`, :cve_nist:`2022-28388`, :cve_nist:`2022-28389`, :cve_nist:`2022-28390`, :cve_nist:`2022-2873`, :cve_nist:`2022-28796`, :cve_nist:`2022-28893`, :cve_nist:`2022-2905`, :cve_nist:`2022-29156`, :cve_nist:`2022-2938`, :cve_nist:`2022-29581`, :cve_nist:`2022-29582`, :cve_nist:`2022-
 2959`, :cve_nist:`2022-2964`, :cve_nist:`2022-2977`, :cve_nist:`2022-2978`, :cve_nist:`2022-29900`, :cve_nist:`2022-29901`, :cve_nist:`2022-2991`, :cve_nist:`2022-29968`, :cve_nist:`2022-3028`, :cve_nist:`2022-30594`, :cve_nist:`2022-3061`, :cve_nist:`2022-3077`, :cve_nist:`2022-3078`, :cve_nist:`2022-3103`, :cve_nist:`2022-3104`, :cve_nist:`2022-3105`, :cve_nist:`2022-3106`, :cve_nist:`2022-3107`, :cve_nist:`2022-3108`, :cve_nist:`2022-3110`, :cve_nist:`2022-3111`, :cve_nist:`2022-3112`, :cve_nist:`2022-3113`, :cve_nist:`2022-3114`, :cve_nist:`2022-3115`, :cve_nist:`2022-3169`, :cve_nist:`2022-3170`, :cve_nist:`2022-3176`, :cve_nist:`2022-3202`, :cve_nist:`2022-32250`, :cve_nist:`2022-32296`, :cve_nist:`2022-3239`, :cve_nist:`2022-32981`, :cve_nist:`2022-3303`, :cve_nist:`2022-3344`, :cve_nist:`2022-33740`, :cve_nist:`2022-33741`, :cve_nist:`2022-33742`, :cve_nist:`2022-33743`, :cve_nist:`2022-33744`, :cve_nist:`2022-33981`, :cve_nist:`2022-3424`, :cve_nist:`2022-3435`, :cve_nist:`
 2022-34494`, :cve_nist:`2022-34495`, :cve_nist:`2022-34918`, :cve_nist:`2022-3521`, :cve_nist:`2022-3522`, :cve_nist:`2022-3524`, :cve_nist:`2022-3526`, :cve_nist:`2022-3531`, :cve_nist:`2022-3532`, :cve_nist:`2022-3534`, :cve_nist:`2022-3535`, :cve_nist:`2022-3541`, :cve_nist:`2022-3542`, :cve_nist:`2022-3543`, :cve_nist:`2022-3545`, :cve_nist:`2022-3564`, :cve_nist:`2022-3565`, :cve_nist:`2022-3577`, :cve_nist:`2022-3586`, :cve_nist:`2022-3594`, :cve_nist:`2022-3595`, :cve_nist:`2022-36123`, :cve_nist:`2022-3619`, :cve_nist:`2022-3621`, :cve_nist:`2022-3623`, :cve_nist:`2022-3624`, :cve_nist:`2022-3625`, :cve_nist:`2022-3628`, :cve_nist:`2022-36280`, :cve_nist:`2022-3629`, :cve_nist:`2022-3630`, :cve_nist:`2022-3633`, :cve_nist:`2022-3635`, :cve_nist:`2022-3636`, :cve_nist:`2022-3640`, :cve_nist:`2022-3643`, :cve_nist:`2022-3646`, :cve_nist:`2022-3649`, :cve_nist:`2022-36879`, :cve_nist:`2022-36946`, :cve_nist:`2022-3707`, :cve_nist:`2022-38457`, :cve_nist:`2022-3903`, :cve_nist:`
 2022-3910`, :cve_nist:`2022-39188`, :cve_nist:`2022-39189`, :cve_nist:`2022-39190`, :cve_nist:`2022-3977`, :cve_nist:`2022-39842`, :cve_nist:`2022-40133`, :cve_nist:`2022-40307`, :cve_nist:`2022-40476`, :cve_nist:`2022-40768`, :cve_nist:`2022-4095`, :cve_nist:`2022-40982`, :cve_nist:`2022-41218`, :cve_nist:`2022-41222`, :cve_nist:`2022-4127`, :cve_nist:`2022-4128`, :cve_nist:`2022-4129`, :cve_nist:`2022-4139`, :cve_nist:`2022-41674`, :cve_nist:`2022-41849`, :cve_nist:`2022-41850`, :cve_nist:`2022-41858`, :cve_nist:`2022-42328`, :cve_nist:`2022-42329`, :cve_nist:`2022-42432`, :cve_nist:`2022-4269`, :cve_nist:`2022-42703`, :cve_nist:`2022-42719`, :cve_nist:`2022-42720`, :cve_nist:`2022-42721`, :cve_nist:`2022-42722`, :cve_nist:`2022-42895`, :cve_nist:`2022-42896`, :cve_nist:`2022-43750`, :cve_nist:`2022-4378`, :cve_nist:`2022-4379`, :cve_nist:`2022-4382`, :cve_nist:`2022-43945`, :cve_nist:`2022-45869`, :cve_nist:`2022-45886`, :cve_nist:`2022-45887`, :cve_nist:`2022-45919`, :cve_nist:`
 2022-45934`, :cve_nist:`2022-4662`, :cve_nist:`2022-4696`, :cve_nist:`2022-4744`, :cve_nist:`2022-47518`, :cve_nist:`2022-47519`, :cve_nist:`2022-47520`, :cve_nist:`2022-47521`, :cve_nist:`2022-47929`, :cve_nist:`2022-47938`, :cve_nist:`2022-47939`, :cve_nist:`2022-47940`, :cve_nist:`2022-47941`, :cve_nist:`2022-47942`, :cve_nist:`2022-47943`, :cve_nist:`2022-47946`, :cve_nist:`2022-4842`, :cve_nist:`2022-48423`, :cve_nist:`2022-48424`, :cve_nist:`2022-48425`, :cve_nist:`2022-48502`, :cve_nist:`2023-0030`, :cve_nist:`2023-0045`, :cve_nist:`2023-0047`, :cve_nist:`2023-0122`, :cve_nist:`2023-0160`, :cve_nist:`2023-0179`, :cve_nist:`2023-0210`, :cve_nist:`2023-0240`, :cve_nist:`2023-0266`, :cve_nist:`2023-0386`, :cve_nist:`2023-0394`, :cve_nist:`2023-0458`, :cve_nist:`2023-0459`, :cve_nist:`2023-0461`, :cve_nist:`2023-0468`, :cve_nist:`2023-0469`, :cve_nist:`2023-0590`, :cve_nist:`2023-0615`, :cve_mitre:`2023-1032`, :cve_nist:`2023-1073`, :cve_nist:`2023-1074`, :cve_nist:`2023-1076`, :
 cve_nist:`2023-1077`, :cve_nist:`2023-1078`, :cve_nist:`2023-1079`, :cve_nist:`2023-1095`, :cve_nist:`2023-1118`, :cve_nist:`2023-1192`, :cve_nist:`2023-1194`, :cve_nist:`2023-1195`, :cve_nist:`2023-1206`, :cve_nist:`2023-1249`, :cve_nist:`2023-1252`, :cve_nist:`2023-1281`, :cve_nist:`2023-1295`, :cve_nist:`2023-1380`, :cve_nist:`2023-1382`, :cve_nist:`2023-1390`, :cve_nist:`2023-1513`, :cve_nist:`2023-1582`, :cve_nist:`2023-1583`, :cve_nist:`2023-1611`, :cve_nist:`2023-1637`, :cve_nist:`2023-1652`, :cve_nist:`2023-1670`, :cve_nist:`2023-1829`, :cve_nist:`2023-1838`, :cve_nist:`2023-1855`, :cve_nist:`2023-1859`, :cve_nist:`2023-1872`, :cve_nist:`2023-1989`, :cve_nist:`2023-1990`, :cve_nist:`2023-1998`, :cve_nist:`2023-2002`, :cve_nist:`2023-2006`, :cve_nist:`2023-2007`, :cve_nist:`2023-2008`, :cve_nist:`2023-2019`, :cve_nist:`2023-20569`, :cve_nist:`2023-20588`, :cve_nist:`2023-20593`, :cve_nist:`2023-20928`, :cve_nist:`2023-20938`, :cve_nist:`2023-21102`, :cve_nist:`2023-21106`, :c
 ve_nist:`2023-2124`, :cve_nist:`2023-21255`, :cve_nist:`2023-2156`, :cve_nist:`2023-2162`, :cve_nist:`2023-2163`, :cve_nist:`2023-2166`, :cve_nist:`2023-2177`, :cve_nist:`2023-2194`, :cve_nist:`2023-2235`, :cve_nist:`2023-2236`, :cve_nist:`2023-2248`, :cve_nist:`2023-2269`, :cve_nist:`2023-22995`, :cve_nist:`2023-22996`, :cve_nist:`2023-22997`, :cve_nist:`2023-22998`, :cve_nist:`2023-22999`, :cve_nist:`2023-23000`, :cve_nist:`2023-23001`, :cve_nist:`2023-23002`, :cve_nist:`2023-23003`, :cve_nist:`2023-23004`, :cve_nist:`2023-23006`, :cve_nist:`2023-23454`, :cve_nist:`2023-23455`, :cve_nist:`2023-23559`, :cve_nist:`2023-23586`, :cve_nist:`2023-2430`, :cve_nist:`2023-2483`, :cve_nist:`2023-25012`, :cve_nist:`2023-2513`, :cve_nist:`2023-25775`, :cve_nist:`2023-2598`, :cve_nist:`2023-26544`, :cve_nist:`2023-26545`, :cve_nist:`2023-26605`, :cve_nist:`2023-26606`, :cve_nist:`2023-26607`, :cve_nist:`2023-28327`, :cve_nist:`2023-28328`, :cve_nist:`2023-28410`, :cve_nist:`2023-28464`, :cve_n
 ist:`2023-28466`, :cve_nist:`2023-2860`, :cve_nist:`2023-28772`, :cve_nist:`2023-28866`, :cve_nist:`2023-2898`, :cve_nist:`2023-2985`, :cve_nist:`2023-3006`, :cve_nist:`2023-30456`, :cve_nist:`2023-30772`, :cve_nist:`2023-3090`, :cve_nist:`2023-3106`, :cve_nist:`2023-3111`, :cve_nist:`2023-3117`, :cve_nist:`2023-31248`, :cve_nist:`2023-3141`, :cve_nist:`2023-31436`, :cve_nist:`2023-3159`, :cve_nist:`2023-3161`, :cve_nist:`2023-3212`, :cve_nist:`2023-3220`, :cve_nist:`2023-32233`, :cve_nist:`2023-32247`, :cve_nist:`2023-32248`, :cve_nist:`2023-32250`, :cve_nist:`2023-32252`, :cve_nist:`2023-32254`, :cve_nist:`2023-32257`, :cve_nist:`2023-32258`, :cve_nist:`2023-32269`, :cve_nist:`2023-3268`, :cve_nist:`2023-3269`, :cve_nist:`2023-3312`, :cve_nist:`2023-3317`, :cve_nist:`2023-33203`, :cve_nist:`2023-33250`, :cve_nist:`2023-33288`, :cve_nist:`2023-3338`, :cve_nist:`2023-3355`, :cve_nist:`2023-3357`, :cve_nist:`2023-3358`, :cve_nist:`2023-3359`, :cve_nist:`2023-3389`, :cve_nist:`2023-33
 90`, :cve_nist:`2023-33951`, :cve_nist:`2023-33952`, :cve_nist:`2023-34255`, :cve_nist:`2023-34256`, :cve_nist:`2023-34319`, :cve_nist:`2023-3439`, :cve_nist:`2023-35001`, :cve_nist:`2023-3567`, :cve_nist:`2023-35788`, :cve_nist:`2023-35823`, :cve_nist:`2023-35824`, :cve_nist:`2023-35826`, :cve_nist:`2023-35828`, :cve_nist:`2023-35829`, :cve_nist:`2023-3609`, :cve_nist:`2023-3610`, :cve_nist:`2023-3611`, :cve_nist:`2023-37453`, :cve_nist:`2023-3772`, :cve_nist:`2023-3773`, :cve_nist:`2023-3776`, :cve_nist:`2023-3777`, :cve_nist:`2023-3812`, :cve_nist:`2023-38409`, :cve_nist:`2023-38426`, :cve_nist:`2023-38427`, :cve_nist:`2023-38428`, :cve_nist:`2023-38429`, :cve_nist:`2023-38430`, :cve_nist:`2023-38431`, :cve_nist:`2023-38432`, :cve_nist:`2023-3863`, :cve_mitre:`2023-3865`, :cve_mitre:`2023-3866`, :cve_mitre:`2023-3867`, :cve_nist:`2023-4004`, :cve_nist:`2023-4015`, :cve_nist:`2023-40283`, :cve_nist:`2023-4128`, :cve_nist:`2023-4132`, :cve_nist:`2023-4147`, :cve_nist:`2023-4155`, :
 cve_nist:`2023-4194`, :cve_nist:`2023-4206`, :cve_nist:`2023-4207`, :cve_nist:`2023-4208`, :cve_nist:`2023-4273`, :cve_nist:`2023-42752`, :cve_nist:`2023-42753`, :cve_nist:`2023-4385`, :cve_nist:`2023-4387`, :cve_nist:`2023-4389`, :cve_nist:`2023-4394`, :cve_nist:`2023-4459`, :cve_nist:`2023-4569`, :cve_nist:`2023-4611` and :cve_nist:`2023-4623`
+-  nghttp2: Fix :cve_nist:`2023-35945`
+-  openssl: Fix :cve_nist:`2023-2975`, :cve_nist:`2023-3446`, :cve_nist:`2023-3817`, :cve_nist:`2023-4807` and :cve_nist:`2023-5363`
+-  pixman: Ignore :cve_nist:`2023-37769`
+-  procps: Fix :cve_nist:`2023-4016`
+-  python3-git: Fix :cve_nist:`2023-40267`, :cve_nist:`2023-40590` and :cve_nist:`2023-41040`
+-  python3-pygments: Fix :cve_nist:`2022-40896`
+-  python3-urllib3: Fix :cve_nist:`2023-43804` and :cve_nist:`2023-45803`
+-  python3: Fix :cve_nist:`2023-24329` and :cve_nist:`2023-40217`
+-  qemu: Fix :cve_nist:`2023-3180`, :cve_nist:`2023-3354` and :cve_nist:`2023-42467`
+-  qemu: Ignore :cve_nist:`2023-2680`
+-  screen: Fix :cve_nist:`2023-24626`
 -  shadow: Fix :cve_mitre:`2023-4641`
--  tiff: Fix :cve:`2023-40745` and :cve:`2023-41175`
--  vim: Fix :cve:`2023-3896`, :cve:`2023-4733`, :cve:`2023-4734`, :cve:`2023-4735`, :cve:`2023-4736`, :cve:`2023-4738`, :cve:`2023-4750`, :cve:`2023-4752`, :cve:`2023-4781`, :cve:`2023-5441` and :cve:`2023-5535`
--  webkitgtk: Fix :cve:`2023-32435` and :cve:`2023-32439`
--  xserver-xorg: Fix :cve:`2023-5367` and :cve:`2023-5380`
+-  tiff: Fix :cve_nist:`2023-40745` and :cve_nist:`2023-41175`
+-  vim: Fix :cve_nist:`2023-3896`, :cve_nist:`2023-4733`, :cve_nist:`2023-4734`, :cve_nist:`2023-4735`, :cve_nist:`2023-4736`, :cve_nist:`2023-4738`, :cve_nist:`2023-4750`, :cve_nist:`2023-4752`, :cve_nist:`2023-4781`, :cve_nist:`2023-5441` and :cve_nist:`2023-5535`
+-  webkitgtk: Fix :cve_nist:`2023-32435` and :cve_nist:`2023-32439`
+-  xserver-xorg: Fix :cve_nist:`2023-5367` and :cve_nist:`2023-5380`
 
 
 Fixes in Yocto-4.2.4
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index ee81d8367a377719449a6bc34d8bba3bb9fef3f2..8da42a4390506acf0246d032304e754f8b6e5f11 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -348,39 +348,39 @@ The following corrections have been made to the :term:`LICENSE` values set by re
 Security Fixes in 4.2
 ~~~~~~~~~~~~~~~~~~~~~
 
-- binutils: :cve:`2022-4285`, :cve_mitre:`2023-25586`
-- curl: :cve:`2022-32221`, :cve:`2022-35260`, :cve:`2022-42915`, :cve:`2022-42916`
-- epiphany: :cve:`2023-26081`
-- expat: :cve:`2022-43680`
-- ffmpeg: :cve:`2022-3964`, :cve:`2022-3965`
-- git: :cve:`2022-39260`, :cve:`2022-41903`, :cve:`2022-23521`, :cve:`2022-41953` (ignored)
-- glibc: :cve:`2023-25139` (ignored)
-- go: :cve:`2023-24532`, :cve:`2023-24537`
-- grub2: :cve:`2022-2601`, :cve:`2022-3775`, :cve_mitre:`2022-28736`
-- inetutils: :cve:`2019-0053`
-- less: :cve:`2022-46663`
-- libarchive: :cve:`2022-36227`
-- libinput: :cve:`2022-1215`
-- libpam: :cve:`2022-28321`
-- libpng: :cve:`2019-6129`
-- libx11: :cve:`2022-3554`
-- openssh: :cve:`2023-28531`
-- openssl: :cve:`2022-3358`, :cve:`2022-3786`, :cve:`2022-3602`, :cve:`2022-3996`, :cve:`2023-0286`, :cve:`2022-4304`, :cve:`2022-4203`, :cve:`2023-0215`, :cve:`2022-4450`, :cve:`2023-0216`, :cve:`2023-0217`, :cve:`2023-0401`, :cve:`2023-0464`
-- ppp: :cve:`2022-4603`
-- python3-cryptography{-vectors}: :cve:`2022-3602`, :cve:`2022-3786`, :cve:`2023-23931`
+- binutils: :cve_nist:`2022-4285`, :cve_mitre:`2023-25586`
+- curl: :cve_nist:`2022-32221`, :cve_nist:`2022-35260`, :cve_nist:`2022-42915`, :cve_nist:`2022-42916`
+- epiphany: :cve_nist:`2023-26081`
+- expat: :cve_nist:`2022-43680`
+- ffmpeg: :cve_nist:`2022-3964`, :cve_nist:`2022-3965`
+- git: :cve_nist:`2022-39260`, :cve_nist:`2022-41903`, :cve_nist:`2022-23521`, :cve_nist:`2022-41953` (ignored)
+- glibc: :cve_nist:`2023-25139` (ignored)
+- go: :cve_nist:`2023-24532`, :cve_nist:`2023-24537`
+- grub2: :cve_nist:`2022-2601`, :cve_nist:`2022-3775`, :cve_mitre:`2022-28736`
+- inetutils: :cve_nist:`2019-0053`
+- less: :cve_nist:`2022-46663`
+- libarchive: :cve_nist:`2022-36227`
+- libinput: :cve_nist:`2022-1215`
+- libpam: :cve_nist:`2022-28321`
+- libpng: :cve_nist:`2019-6129`
+- libx11: :cve_nist:`2022-3554`
+- openssh: :cve_nist:`2023-28531`
+- openssl: :cve_nist:`2022-3358`, :cve_nist:`2022-3786`, :cve_nist:`2022-3602`, :cve_nist:`2022-3996`, :cve_nist:`2023-0286`, :cve_nist:`2022-4304`, :cve_nist:`2022-4203`, :cve_nist:`2023-0215`, :cve_nist:`2022-4450`, :cve_nist:`2023-0216`, :cve_nist:`2023-0217`, :cve_nist:`2023-0401`, :cve_nist:`2023-0464`
+- ppp: :cve_nist:`2022-4603`
+- python3-cryptography{-vectors}: :cve_nist:`2022-3602`, :cve_nist:`2022-3786`, :cve_nist:`2023-23931`
 - python3: :cve_mitre:`2022-37460`
-- qemu: :cve:`2022-3165`
-- rust: :cve:`2022-46176`
-- rxvt-unicode: :cve:`2022-4170`
-- screen: :cve:`2023-24626`
-- shadow: :cve:`2023-29383`, :cve:`2016-15024` (ignored)
-- sudo: :cve:`2022-43995`
-- systemd: :cve:`2022-4415` (ignored)
-- tar: :cve:`2022-48303`
-- tiff: :cve:`2022-3599`, :cve:`2022-3597`, :cve:`2022-3626`, :cve:`2022-3627`, :cve:`2022-3570`, :cve:`2022-3598`, :cve:`2022-3970`, :cve:`2022-48281`
-- vim: :cve:`2022-3352`, :cve:`2022-4141`, :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054`, :cve:`2023-0288`, :cve:`2023-1127`, :cve:`2023-1170`, :cve:`2023-1175`, :cve:`2023-1127`, :cve:`2023-1170`, :cve:`2023-1175`, :cve:`2023-1264`, :cve:`2023-1355`, :cve:`2023-0433`, :cve:`2022-47024`, :cve:`2022-3705`
-- xdg-utils: :cve:`2022-4055`
-- xserver-xorg: :cve:`2022-3550`, :cve:`2022-3551`, :cve:`2023-1393`, :cve:`2023-0494`, :cve:`2022-3553` (ignored)
+- qemu: :cve_nist:`2022-3165`
+- rust: :cve_nist:`2022-46176`
+- rxvt-unicode: :cve_nist:`2022-4170`
+- screen: :cve_nist:`2023-24626`
+- shadow: :cve_nist:`2023-29383`, :cve_nist:`2016-15024` (ignored)
+- sudo: :cve_nist:`2022-43995`
+- systemd: :cve_nist:`2022-4415` (ignored)
+- tar: :cve_nist:`2022-48303`
+- tiff: :cve_nist:`2022-3599`, :cve_nist:`2022-3597`, :cve_nist:`2022-3626`, :cve_nist:`2022-3627`, :cve_nist:`2022-3570`, :cve_nist:`2022-3598`, :cve_nist:`2022-3970`, :cve_nist:`2022-48281`
+- vim: :cve_nist:`2022-3352`, :cve_nist:`2022-4141`, :cve_nist:`2023-0049`, :cve_nist:`2023-0051`, :cve_nist:`2023-0054`, :cve_nist:`2023-0288`, :cve_nist:`2023-1127`, :cve_nist:`2023-1170`, :cve_nist:`2023-1175`, :cve_nist:`2023-1127`, :cve_nist:`2023-1170`, :cve_nist:`2023-1175`, :cve_nist:`2023-1264`, :cve_nist:`2023-1355`, :cve_nist:`2023-0433`, :cve_nist:`2022-47024`, :cve_nist:`2022-3705`
+- xdg-utils: :cve_nist:`2022-4055`
+- xserver-xorg: :cve_nist:`2022-3550`, :cve_nist:`2022-3551`, :cve_nist:`2023-1393`, :cve_nist:`2023-0494`, :cve_nist:`2022-3553` (ignored)
 
 Recipe Upgrades in 4.2
 ~~~~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/migration-guides/release-notes-4.3.1.rst b/documentation/migration-guides/release-notes-4.3.1.rst
index cea9c538a2584bc52a5a3d19df3fc71025a2ee88..afde1e7942b8756c17422b45c111993cb09f82b2 100644
--- a/documentation/migration-guides/release-notes-4.3.1.rst
+++ b/documentation/migration-guides/release-notes-4.3.1.rst
@@ -6,14 +6,14 @@ Release notes for Yocto-4.3.1 (Nanbield)
 Security Fixes in Yocto-4.3.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  libsndfile1: Fix :cve:`2022-33065`
--  libxml2: Ignore :cve:`2023-45322`
--  linux-yocto/6.1: Ignore :cve:`2020-27418`, :cve:`2023-31085`, :cve_mitre:`2023-34324`, :cve:`2023-39189`, :cve:`2023-39192`, :cve:`2023-39193`, :cve:`2023-39194`, :cve:`2023-4244`, :cve:`2023-42754`, :cve:`2023-42756`, :cve:`2023-44466`, :cve:`2023-4563`, :cve:`2023-45862`, :cve:`2023-45863`, :cve:`2023-45871`, :cve:`2023-45898`, :cve:`2023-4732`, :cve:`2023-5158`, :cve:`2023-5197` and :cve:`2023-5345`
--  linux-yocto/6.5: Ignore :cve:`2020-27418`, :cve:`2023-1193`, :cve:`2023-39191`, :cve:`2023-39194`, :cve:`2023-40791`, :cve:`2023-44466`, :cve:`2023-45862`, :cve:`2023-45863`, :cve:`2023-4610` and :cve:`2023-4732`
--  openssl: Fix :cve:`2023-5363`
--  pixman: Ignore :cve:`2023-37769`
--  vim: Fix :cve:`2023-46246`
--  zlib: Ignore :cve:`2023-45853`
+-  libsndfile1: Fix :cve_nist:`2022-33065`
+-  libxml2: Ignore :cve_nist:`2023-45322`
+-  linux-yocto/6.1: Ignore :cve_nist:`2020-27418`, :cve_nist:`2023-31085`, :cve_mitre:`2023-34324`, :cve_nist:`2023-39189`, :cve_nist:`2023-39192`, :cve_nist:`2023-39193`, :cve_nist:`2023-39194`, :cve_nist:`2023-4244`, :cve_nist:`2023-42754`, :cve_nist:`2023-42756`, :cve_nist:`2023-44466`, :cve_nist:`2023-4563`, :cve_nist:`2023-45862`, :cve_nist:`2023-45863`, :cve_nist:`2023-45871`, :cve_nist:`2023-45898`, :cve_nist:`2023-4732`, :cve_nist:`2023-5158`, :cve_nist:`2023-5197` and :cve_nist:`2023-5345`
+-  linux-yocto/6.5: Ignore :cve_nist:`2020-27418`, :cve_nist:`2023-1193`, :cve_nist:`2023-39191`, :cve_nist:`2023-39194`, :cve_nist:`2023-40791`, :cve_nist:`2023-44466`, :cve_nist:`2023-45862`, :cve_nist:`2023-45863`, :cve_nist:`2023-4610` and :cve_nist:`2023-4732`
+-  openssl: Fix :cve_nist:`2023-5363`
+-  pixman: Ignore :cve_nist:`2023-37769`
+-  vim: Fix :cve_nist:`2023-46246`
+-  zlib: Ignore :cve_nist:`2023-45853`
 
 
 Fixes in Yocto-4.3.1
diff --git a/documentation/migration-guides/release-notes-4.3.2.rst b/documentation/migration-guides/release-notes-4.3.2.rst
index 3a40d83bc2e0bc1804d9620e9ddd6c6c6e134fe6..c32cd83b2a2345f10f2d2178fd7d4b3d9a7827ab 100644
--- a/documentation/migration-guides/release-notes-4.3.2.rst
+++ b/documentation/migration-guides/release-notes-4.3.2.rst
@@ -6,19 +6,19 @@ Release notes for Yocto-4.3.2 (Nanbield)
 Security Fixes in Yocto-4.3.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  avahi: Fix :cve:`2023-1981`, :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, :cve:`2023-38472` and :cve:`2023-38473`
--  curl: Fix :cve:`2023-46218`
--  ghostscript: Fix :cve:`2023-46751`
--  grub: fix :cve:`2023-4692` and :cve:`2023-4693`
+-  avahi: Fix :cve_nist:`2023-1981`, :cve_nist:`2023-38469`, :cve_nist:`2023-38470`, :cve_nist:`2023-38471`, :cve_nist:`2023-38472` and :cve_nist:`2023-38473`
+-  curl: Fix :cve_nist:`2023-46218`
+-  ghostscript: Fix :cve_nist:`2023-46751`
+-  grub: fix :cve_nist:`2023-4692` and :cve_nist:`2023-4693`
 -  gstreamer1.0: Fix :cve_mitre:`2023-44446`
--  linux-yocto/6.1: Ignore :cve_mitre:`2023-39197`, :cve:`2023-39198`, :cve:`2023-5090`, :cve:`2023-5633`, :cve:`2023-6111`, :cve:`2023-6121` and :cve:`2023-6176`
--  linux-yocto/6.5: Ignore :cve:`2022-44034`, :cve_mitre:`2023-39197`, :cve:`2023-39198`, :cve:`2023-5972`, :cve:`2023-6039`, :cve:`2023-6111` and :cve:`2023-6176`
--  perl: fix :cve:`2023-47100`
--  python3-urllib3: Fix :cve:`2023-45803`
--  rust: Fix :cve:`2023-40030`
--  vim: Fix :cve:`2023-48231`, :cve:`2023-48232`, :cve:`2023-48233`, :cve:`2023-48234`, :cve:`2023-48235`, :cve:`2023-48236` and :cve:`2023-48237`
--  xserver-xorg: Fix :cve:`2023-5367` and :cve:`2023-5380`
--  xwayland: Fix :cve:`2023-5367`
+-  linux-yocto/6.1: Ignore :cve_mitre:`2023-39197`, :cve_nist:`2023-39198`, :cve_nist:`2023-5090`, :cve_nist:`2023-5633`, :cve_nist:`2023-6111`, :cve_nist:`2023-6121` and :cve_nist:`2023-6176`
+-  linux-yocto/6.5: Ignore :cve_nist:`2022-44034`, :cve_mitre:`2023-39197`, :cve_nist:`2023-39198`, :cve_nist:`2023-5972`, :cve_nist:`2023-6039`, :cve_nist:`2023-6111` and :cve_nist:`2023-6176`
+-  perl: fix :cve_nist:`2023-47100`
+-  python3-urllib3: Fix :cve_nist:`2023-45803`
+-  rust: Fix :cve_nist:`2023-40030`
+-  vim: Fix :cve_nist:`2023-48231`, :cve_nist:`2023-48232`, :cve_nist:`2023-48233`, :cve_nist:`2023-48234`, :cve_nist:`2023-48235`, :cve_nist:`2023-48236` and :cve_nist:`2023-48237`
+-  xserver-xorg: Fix :cve_nist:`2023-5367` and :cve_nist:`2023-5380`
+-  xwayland: Fix :cve_nist:`2023-5367`
 
 
 Fixes in Yocto-4.3.2
diff --git a/documentation/migration-guides/release-notes-4.3.3.rst b/documentation/migration-guides/release-notes-4.3.3.rst
index 2a0658a9c9240e91bedd1e4e6b81c85e2efb2fb9..d30f4f5c2d35329091334bca03ef11b87651a5c7 100644
--- a/documentation/migration-guides/release-notes-4.3.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.3.rst
@@ -6,17 +6,17 @@ Release notes for Yocto-4.3.3 (Nanbield)
 Security Fixes in Yocto-4.3.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  curl: Fix :cve:`2023-46219`
--  glibc: Ignore fixed :cve:`2023-0687` and :cve:`2023-5156`
--  linux-yocto/6.1: Ignore :cve:`2022-48619`, :cve:`2023-4610`, :cve:`2023-5178`, :cve:`2023-5972`, :cve:`2023-6040`, :cve:`2023-6531`, :cve:`2023-6546`, :cve:`2023-6622`, :cve:`2023-6679`, :cve:`2023-6817`, :cve:`2023-6931`, :cve:`2023-6932`, :cve:`2023-7192`, :cve:`2024-0193` and :cve:`2024-0443`
--  linux-yocto/6.1: Fix :cve:`2023-1193`, :cve_mitre:`2023-51779`, :cve:`2023-51780`, :cve:`2023-51781`, :cve:`2023-51782` and :cve:`2023-6606`
--  qemu: Fix :cve:`2023-3019`
--  shadow: Fix :cve:`2023-4641`
--  sqlite3: Fix :cve:`2024-0232`
--  sqlite3: drop obsolete CVE ignore :cve:`2023-36191`
--  sudo: Fix :cve:`2023-42456` and :cve:`2023-42465`
--  tiff: Fix :cve:`2023-6277`
--  xwayland: Fix :cve:`2023-6377` and :cve:`2023-6478`
+-  curl: Fix :cve_nist:`2023-46219`
+-  glibc: Ignore fixed :cve_nist:`2023-0687` and :cve_nist:`2023-5156`
+-  linux-yocto/6.1: Ignore :cve_nist:`2022-48619`, :cve_nist:`2023-4610`, :cve_nist:`2023-5178`, :cve_nist:`2023-5972`, :cve_nist:`2023-6040`, :cve_nist:`2023-6531`, :cve_nist:`2023-6546`, :cve_nist:`2023-6622`, :cve_nist:`2023-6679`, :cve_nist:`2023-6817`, :cve_nist:`2023-6931`, :cve_nist:`2023-6932`, :cve_nist:`2023-7192`, :cve_nist:`2024-0193` and :cve_nist:`2024-0443`
+-  linux-yocto/6.1: Fix :cve_nist:`2023-1193`, :cve_mitre:`2023-51779`, :cve_nist:`2023-51780`, :cve_nist:`2023-51781`, :cve_nist:`2023-51782` and :cve_nist:`2023-6606`
+-  qemu: Fix :cve_nist:`2023-3019`
+-  shadow: Fix :cve_nist:`2023-4641`
+-  sqlite3: Fix :cve_nist:`2024-0232`
+-  sqlite3: drop obsolete CVE ignore :cve_nist:`2023-36191`
+-  sudo: Fix :cve_nist:`2023-42456` and :cve_nist:`2023-42465`
+-  tiff: Fix :cve_nist:`2023-6277`
+-  xwayland: Fix :cve_nist:`2023-6377` and :cve_nist:`2023-6478`
 
 
 Fixes in Yocto-4.3.3
diff --git a/documentation/migration-guides/release-notes-4.3.4.rst b/documentation/migration-guides/release-notes-4.3.4.rst
index 4c9e67f2cbcf295bc1ba9c081e6dc07dd22aa48f..b725ace3695755c9c701f74bcdcad95208567e90 100644
--- a/documentation/migration-guides/release-notes-4.3.4.rst
+++ b/documentation/migration-guides/release-notes-4.3.4.rst
@@ -6,23 +6,23 @@ Release notes for Yocto-4.3.4 (Nanbield)
 Security Fixes in Yocto-4.3.4
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2023-4408`, :cve:`2023-5517`, :cve:`2023-5679` and :cve:`2023-50387`
--  gcc: Update :term:`CVE_STATUS` for :cve:`2023-4039` as fixed
--  glibc: Fix :cve:`2023-6246`, :cve:`2023-6779` and :cve:`2023-6780`
--  gnutls: Fix :cve:`2024-0553` and :cve:`2024-0567`
+-  bind: Fix :cve_nist:`2023-4408`, :cve_nist:`2023-5517`, :cve_nist:`2023-5679` and :cve_nist:`2023-50387`
+-  gcc: Update :term:`CVE_STATUS` for :cve_nist:`2023-4039` as fixed
+-  glibc: Fix :cve_nist:`2023-6246`, :cve_nist:`2023-6779` and :cve_nist:`2023-6780`
+-  gnutls: Fix :cve_nist:`2024-0553` and :cve_nist:`2024-0567`
 -  gstreamer: Fix :cve_mitre:`2024-0444`
--  libssh2: fix :cve:`2023-48795`
--  libxml2: Fix :cve:`2024-25062`
--  linux-yocto/6.1: Fix :cve:`2023-6610`, :cve:`2023-6915`, :cve:`2023-46838`, :cve:`2023-50431`, :cve:`2024-1085`, :cve:`2024-1086` and :cve:`2024-23849`
--  linux-yocto/6.1: Ignore :cve:`2021-33630`, :cve:`2021-33631`, :cve:`2022-36402`, :cve:`2023-5717`, :cve:`2023-6200`, :cve:`2023-35827`, :cve:`2023-40791`, :cve:`2023-46343`, :cve:`2023-46813`, :cve:`2023-46862`, :cve:`2023-51042`, :cve:`2023-51043`, :cve_mitre:`2023-52340`, :cve:`2024-0562`, :cve:`2024-0565`, :cve:`2024-0582`, :cve:`2024-0584`, :cve:`2024-0607`, :cve:`2024-0639`, :cve:`2024-0641`, :cve:`2024-0646`, :cve:`2024-0775` and :cve:`2024-22705`
--  openssl: fix :cve:`2024-0727`
--  python3-jinja2: Fix :cve:`2024-22195`
--  tiff: Fix :cve:`2023-6228`, :cve:`2023-52355` and :cve:`2023-52356`
--  vim: Fix :cve:`2024-22667`
--  wpa-supplicant: Fix :cve:`2023-52160`
--  xserver-xorg: Fix :cve:`2023-6377`, :cve:`2023-6478`, :cve:`2023-6816`, :cve:`2024-0229`, :cve:`2024-0408`, :cve:`2024-0409`, :cve:`2024-21885` and :cve:`2024-21886`
--  xwayland: Fix :cve:`2023-6816`, :cve:`2024-0408` and :cve:`2024-0409`
--  zlib: Ignore :cve:`2023-6992`
+-  libssh2: fix :cve_nist:`2023-48795`
+-  libxml2: Fix :cve_nist:`2024-25062`
+-  linux-yocto/6.1: Fix :cve_nist:`2023-6610`, :cve_nist:`2023-6915`, :cve_nist:`2023-46838`, :cve_nist:`2023-50431`, :cve_nist:`2024-1085`, :cve_nist:`2024-1086` and :cve_nist:`2024-23849`
+-  linux-yocto/6.1: Ignore :cve_nist:`2021-33630`, :cve_nist:`2021-33631`, :cve_nist:`2022-36402`, :cve_nist:`2023-5717`, :cve_nist:`2023-6200`, :cve_nist:`2023-35827`, :cve_nist:`2023-40791`, :cve_nist:`2023-46343`, :cve_nist:`2023-46813`, :cve_nist:`2023-46862`, :cve_nist:`2023-51042`, :cve_nist:`2023-51043`, :cve_mitre:`2023-52340`, :cve_nist:`2024-0562`, :cve_nist:`2024-0565`, :cve_nist:`2024-0582`, :cve_nist:`2024-0584`, :cve_nist:`2024-0607`, :cve_nist:`2024-0639`, :cve_nist:`2024-0641`, :cve_nist:`2024-0646`, :cve_nist:`2024-0775` and :cve_nist:`2024-22705`
+-  openssl: fix :cve_nist:`2024-0727`
+-  python3-jinja2: Fix :cve_nist:`2024-22195`
+-  tiff: Fix :cve_nist:`2023-6228`, :cve_nist:`2023-52355` and :cve_nist:`2023-52356`
+-  vim: Fix :cve_nist:`2024-22667`
+-  wpa-supplicant: Fix :cve_nist:`2023-52160`
+-  xserver-xorg: Fix :cve_nist:`2023-6377`, :cve_nist:`2023-6478`, :cve_nist:`2023-6816`, :cve_nist:`2024-0229`, :cve_nist:`2024-0408`, :cve_nist:`2024-0409`, :cve_nist:`2024-21885` and :cve_nist:`2024-21886`
+-  xwayland: Fix :cve_nist:`2023-6816`, :cve_nist:`2024-0408` and :cve_nist:`2024-0409`
+-  zlib: Ignore :cve_nist:`2023-6992`
 
 
 Fixes in Yocto-4.3.4
@@ -59,7 +59,7 @@ Fixes in Yocto-4.3.4
 -  docs: use "manual page(s)"
 -  docs: Makefile: remove releases.rst in "make clean"
 -  externalsrc: fix task dependency for do_populate_lic
--  glibc: Remove duplicate :term:`CVE_STATUS` for :cve:`2023-4527`
+-  glibc: Remove duplicate :term:`CVE_STATUS` for :cve_nist:`2023-4527`
 -  glibc: stable 2.38 branch updates (2.38+gitd37c2b20a4)
 -  gnutls: Upgrade to 3.8.3
 -  gstreamer1.0: skip a test that is known to be flaky
diff --git a/documentation/migration-guides/release-notes-4.3.rst b/documentation/migration-guides/release-notes-4.3.rst
index 0e175067da2a77862b76f70f56c509f550ba8e10..d1ab70447b630595fe46f97b256c997811b6f185 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -337,47 +337,47 @@ The following corrections have been made to the :term:`LICENSE` values set by re
 Security Fixes in 4.3
 ~~~~~~~~~~~~~~~~~~~~~
 
--  bind: :cve:`2023-2911`, :cve:`2023-2828`, :cve:`2023-3341`, :cve:`2023-4236`
--  binutils: :cve:`2023-1972`
--  connman: :cve:`2023-28488`
--  cups: :cve:`2023-32324`, :cve:`2023-34241`, :cve:`2023-4504`
--  dbus: :cve:`2023-34969`
--  dmidecode: :cve:`2023-30630`
--  dropbear: :cve:`2023-36328`
--  erofs-utils: :cve:`2023-33551`, :cve:`2023-33552`
--  gcc: :cve:`2023-4039`
--  ghostscript: :cve:`2023-28879`, :cve:`2023-36664`, :cve:`2023-38559;` ignore :cve:`2023-38560`
--  git: :cve:`2023-25652`, :cve:`2023-29007`
--  glibc: :cve:`2023-4527`, :cve:`2023-4806`
--  go: :cve:`2023-24537`, :cve:`2023-39325`
--  gstreamer: :cve:`2023-40475`, :cve:`2023-40476`
--  inetutils: :cve:`2023-40303`
--  libarchive: ignore :cve:`2023-30571`
--  librsvg: :cve:`2023-38633`
--  libwebp: :cve:`2023-1999`, :cve:`2023-4863`
--  libx11: :cve:`2023-3138`, :cve:`2023-43785`, :cve:`2023-43786`, :cve:`2023-43787`
--  libxml2: :cve:`2023-28484`, :cve:`2023-29469;` ignore disputed :cve:`2023-45322`
--  libxpm: :cve:`2023-43788`, :cve:`2023-43789`, :cve:`2022-44617`
+-  bind: :cve_nist:`2023-2911`, :cve_nist:`2023-2828`, :cve_nist:`2023-3341`, :cve_nist:`2023-4236`
+-  binutils: :cve_nist:`2023-1972`
+-  connman: :cve_nist:`2023-28488`
+-  cups: :cve_nist:`2023-32324`, :cve_nist:`2023-34241`, :cve_nist:`2023-4504`
+-  dbus: :cve_nist:`2023-34969`
+-  dmidecode: :cve_nist:`2023-30630`
+-  dropbear: :cve_nist:`2023-36328`
+-  erofs-utils: :cve_nist:`2023-33551`, :cve_nist:`2023-33552`
+-  gcc: :cve_nist:`2023-4039`
+-  ghostscript: :cve_nist:`2023-28879`, :cve_nist:`2023-36664`, :cve_nist:`2023-38559;` ignore :cve_nist:`2023-38560`
+-  git: :cve_nist:`2023-25652`, :cve_nist:`2023-29007`
+-  glibc: :cve_nist:`2023-4527`, :cve_nist:`2023-4806`
+-  go: :cve_nist:`2023-24537`, :cve_nist:`2023-39325`
+-  gstreamer: :cve_nist:`2023-40475`, :cve_nist:`2023-40476`
+-  inetutils: :cve_nist:`2023-40303`
+-  libarchive: ignore :cve_nist:`2023-30571`
+-  librsvg: :cve_nist:`2023-38633`
+-  libwebp: :cve_nist:`2023-1999`, :cve_nist:`2023-4863`
+-  libx11: :cve_nist:`2023-3138`, :cve_nist:`2023-43785`, :cve_nist:`2023-43786`, :cve_nist:`2023-43787`
+-  libxml2: :cve_nist:`2023-28484`, :cve_nist:`2023-29469;` ignore disputed :cve_nist:`2023-45322`
+-  libxpm: :cve_nist:`2023-43788`, :cve_nist:`2023-43789`, :cve_nist:`2022-44617`
 -  linux: update CVE exclusions
--  ncurses: :cve:`2023-29491`
--  nghttp2: :cve:`2023-44487`
--  ninja: ignore :cve:`2021-4336`, wrong ninja
--  openssh: :cve:`2023-38408`
--  openssl: :cve:`2023-2650`, :cve:`2023-1255`, :cve:`2023-0466`, :cve:`2023-0465`, :cve:`2023-0464`, :cve:`2023-3817`, :cve:`2023-3446`, :cve:`2023-2975`, :cve:`2023-4807`
--  perl: :cve:`2023-31484`, :cve:`2023-31486`
--  pixman: ignore :cve:`2023-37769`
--  procps: :cve:`2023-4016`
--  python3-git: :cve:`2023-41040`
--  python3: ignore :cve:`2023-36632`
--  python3-urllib3: :cve:`2023-43804`
--  qemu: :cve:`2023-40360`, :cve:`2023-42467;` ignore :cve:`2023-0664` (Windows-specific), ignore :cve:`2023-2680` (RHEL specific)
--  screen: :cve:`2023-24626`
--  shadow: :cve:`2023-29383`
--  sqlite3: ignore :cve:`2023-36191`
--  sysstat: :cve:`2023-33204`
--  tiff: :cve:`2022-4645`, :cve:`2023-2731`, :cve:`2023-26965`, :cve:`2023-40745`, :cve:`2023-41175`
--  vim: :cve:`2023-2426`, :cve:`2023-2609`, :cve:`2023-2610`, :cve:`2023-3896`, :cve:`2023-5441`, :cve:`2023-5535`
--  zlib: ignore :cve:`2023-45853`
+-  ncurses: :cve_nist:`2023-29491`
+-  nghttp2: :cve_nist:`2023-44487`
+-  ninja: ignore :cve_nist:`2021-4336`, wrong ninja
+-  openssh: :cve_nist:`2023-38408`
+-  openssl: :cve_nist:`2023-2650`, :cve_nist:`2023-1255`, :cve_nist:`2023-0466`, :cve_nist:`2023-0465`, :cve_nist:`2023-0464`, :cve_nist:`2023-3817`, :cve_nist:`2023-3446`, :cve_nist:`2023-2975`, :cve_nist:`2023-4807`
+-  perl: :cve_nist:`2023-31484`, :cve_nist:`2023-31486`
+-  pixman: ignore :cve_nist:`2023-37769`
+-  procps: :cve_nist:`2023-4016`
+-  python3-git: :cve_nist:`2023-41040`
+-  python3: ignore :cve_nist:`2023-36632`
+-  python3-urllib3: :cve_nist:`2023-43804`
+-  qemu: :cve_nist:`2023-40360`, :cve_nist:`2023-42467;` ignore :cve_nist:`2023-0664` (Windows-specific), ignore :cve_nist:`2023-2680` (RHEL specific)
+-  screen: :cve_nist:`2023-24626`
+-  shadow: :cve_nist:`2023-29383`
+-  sqlite3: ignore :cve_nist:`2023-36191`
+-  sysstat: :cve_nist:`2023-33204`
+-  tiff: :cve_nist:`2022-4645`, :cve_nist:`2023-2731`, :cve_nist:`2023-26965`, :cve_nist:`2023-40745`, :cve_nist:`2023-41175`
+-  vim: :cve_nist:`2023-2426`, :cve_nist:`2023-2609`, :cve_nist:`2023-2610`, :cve_nist:`2023-3896`, :cve_nist:`2023-5441`, :cve_nist:`2023-5535`
+-  zlib: ignore :cve_nist:`2023-45853`
 
 
 Recipe Upgrades in 4.3
diff --git a/documentation/migration-guides/release-notes-5.0.2.rst b/documentation/migration-guides/release-notes-5.0.2.rst
index 820e33189e0c38db598b959cb7b86cf2ef9347eb..b60fd73190ac90be7ef9696123df445d5860a885 100644
--- a/documentation/migration-guides/release-notes-5.0.2.rst
+++ b/documentation/migration-guides/release-notes-5.0.2.rst
@@ -6,17 +6,17 @@ Release notes for Yocto-5.0.2 (Scarthgap)
 Security Fixes in Yocto-5.0.2
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  cups: Fix :cve:`2024-35235`
--  gcc: Fix :cve:`2024-0151`
--  gdk-pixbuf: Fix :cve:`2022-48622`
+-  cups: Fix :cve_nist:`2024-35235`
+-  gcc: Fix :cve_nist:`2024-0151`
+-  gdk-pixbuf: Fix :cve_nist:`2022-48622`
 -  ghostscript: fix :cve_mitre:`2024-29510`, :cve_mitre:`2024-33869`, :cve_mitre:`2024-33870` and :cve_mitre:`2024-33871`
--  git: Fix :cve:`2024-32002`, :cve:`2024-32004`, :cve:`2024-32020`, :cve:`2024-32021` and :cve:`2024-32465`
--  glib-2.0: Fix :cve:`2024-34397`
--  glibc: Fix :cve:`2024-2961`, :cve:`2024-33599`, :cve:`2024-33600`, :cve:`2024-33601` and :cve:`2024-33602`
--  ncurses: Fix :cve:`2023-45918` and :cve:`2023-50495`
--  openssl: Fix :cve:`2024-4603` and :cve_mitre:`2024-4741`
--  util-linux: Fix :cve:`2024-28085`
--  xserver-xorg: Fix :cve:`2024-31080`, :cve:`2024-31081`, :cve:`2024-31082` and :cve:`2024-31083`
+-  git: Fix :cve_nist:`2024-32002`, :cve_nist:`2024-32004`, :cve_nist:`2024-32020`, :cve_nist:`2024-32021` and :cve_nist:`2024-32465`
+-  glib-2.0: Fix :cve_nist:`2024-34397`
+-  glibc: Fix :cve_nist:`2024-2961`, :cve_nist:`2024-33599`, :cve_nist:`2024-33600`, :cve_nist:`2024-33601` and :cve_nist:`2024-33602`
+-  ncurses: Fix :cve_nist:`2023-45918` and :cve_nist:`2023-50495`
+-  openssl: Fix :cve_nist:`2024-4603` and :cve_mitre:`2024-4741`
+-  util-linux: Fix :cve_nist:`2024-28085`
+-  xserver-xorg: Fix :cve_nist:`2024-31080`, :cve_nist:`2024-31081`, :cve_nist:`2024-31082` and :cve_nist:`2024-31083`
 
 
 Fixes in Yocto-5.0.2
@@ -44,7 +44,7 @@ Fixes in Yocto-5.0.2
 -  bitbake: tests/fetch: Tweak test to match upstream repo url change
 -  bitbake: tests/fetch: Tweak to work on Fedora40
 -  build-appliance-image: Update to scarthgap head revision
--  busybox: update :cve:`2022-28391` patches upstream status
+-  busybox: update :cve_nist:`2022-28391` patches upstream status
 -  cdrtools-native: Fix build with GCC 14
 -  classes: image_types: apply EXTRA_IMAGECMD:squashfs* in oe_mksquashfs()
 -  classes: image_types: quote variable assignment needed by dash
diff --git a/documentation/migration-guides/release-notes-5.0.3.rst b/documentation/migration-guides/release-notes-5.0.3.rst
index 5ed660c9eccb3ef4bfc686d84f79ab2859c67a27..caf33c7c3f0a7b8f2738d913de4a112d10787d18 100644
--- a/documentation/migration-guides/release-notes-5.0.3.rst
+++ b/documentation/migration-guides/release-notes-5.0.3.rst
@@ -6,30 +6,30 @@ Release notes for Yocto-5.0.3 (Scarthgap)
 Security Fixes in Yocto-5.0.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  bind: Fix :cve:`2024-0760`, :cve:`2024-1737`, :cve:`2024-1975` and :cve:`2024-4076`
--  busybox: Fix :cve:`2023-42366`, :cve:`2023-42364`, :cve:`2023-42365`, :cve:`2021-42380` and :cve:`2023-42363`
--  cpio: Ignore :cve:`2023-7216`
--  curl: Fix :cve:`2024-6197`
--  ffmpeg: Fix :cve:`2023-49502`, :cve:`2024-31578` and :cve:`2024-31582`
--  ghostscript: Fix :cve:`2023-52722`
--  go: Fix :cve:`2024-24790`
--  gstreamer1.0-plugins-base: Fix :cve:`2024-4453`
--  less: Fix :cve:`2024-32487`
--  libxml2: Fix :cve:`2024-34459`
--  libyaml: Ignore :cve:`2024-35328`
--  linux-yocto/6.6: Fix :cve:`2024-23307`, :cve:`2024-24861`, :cve:`2024-26642`, :cve:`2024-26643`, :cve:`2024-26654`, :cve:`2024-26656` and :cve:`2023-47233`
--  linux-yocto/6.6: Ignore :cve:`2019-25160`, :cve:`2019-25162`, :cve:`2020-36775`, :cve:`2020-36776`, :cve:`2020-36777`, :cve:`2020-36778`, :cve:`2020-36779`, :cve:`2020-36780`, :cve:`2020-36781`, :cve:`2020-36782`, :cve:`2020-36783`, :cve:`2020-36784`, :cve:`2020-36785`, :cve:`2020-36786`, :cve:`2020-36787`, :cve:`2021-46904`, :cve:`2021-46905`, :cve:`2021-46906`, :cve:`2021-46908`, :cve:`2021-46909`, :cve:`2021-46910`, :cve:`2021-46911`, :cve:`2021-46912`, :cve:`2021-46913`, :cve:`2021-46914`, :cve:`2021-46915`, :cve:`2021-46916`, :cve:`2021-46917`, :cve:`2021-46918`, :cve:`2021-46919`, :cve:`2021-46920`, :cve:`2021-46921`, :cve:`2021-46922`, :cve:`2021-46923`, :cve:`2021-46924`, :cve:`2021-46925`, :cve:`2021-46926`, :cve:`2021-46927`, :cve:`2021-46928`, :cve:`2021-46929`, :cve:`2021-46930`, :cve:`2021-46931`, :cve:`2021-46932`, :cve:`2021-46933`, :cve:`2021-46934`, :cve:`2021-46935`, :cve:`2021-46936`, :cve:`2021-46937`, :cve:`2021-46938`, :cve:`2021-46939`, :cve:`2021-46940`, :
 cve:`2021-46941`, :cve:`2021-46942`, :cve:`2021-46943`, :cve:`2021-46944`, :cve:`2021-46945`, :cve:`2021-46947`, :cve:`2021-46948`, :cve:`2021-46949`, :cve:`2021-46950`, :cve:`2021-46951`, :cve:`2021-46952`, :cve:`2021-46953`, :cve:`2021-46954`, :cve:`2021-46955`, :cve:`2021-46956`, :cve:`2021-46957`, :cve:`2021-46958`, :cve:`2021-46959`, :cve:`2021-46960`, :cve:`2021-46961`, :cve:`2021-46962`, :cve:`2021-46963`, :cve:`2021-46964`, :cve:`2021-46965`, :cve:`2021-46966`, :cve:`2021-46967`, :cve:`2021-46968`, :cve:`2021-46969`, :cve:`2021-46970`, :cve:`2021-46971`, :cve:`2021-46972`, :cve:`2021-46973`, :cve:`2021-46974`, :cve:`2021-46976`, :cve:`2021-46977`, :cve:`2021-46978`, :cve:`2021-46979`, :cve:`2021-46980`, :cve:`2021-46981`, :cve:`2021-46982`, :cve:`2021-46983`, :cve:`2021-46984`, :cve:`2021-46985`, :cve:`2021-46986`, :cve:`2021-46987`, :cve:`2021-46988`, :cve:`2021-46989`, :cve:`2021-46990`, :cve:`2021-46991`, :cve:`2021-46992`, :cve:`2021-46993`, :cve:`2021-46994`, :cve:`2021
 -46995`, :cve:`2021-46996`, :cve:`2021-46997`, :cve:`2021-46998`, :cve:`2021-46999`, :cve:`2021-47000`, :cve:`2021-47001`, :cve:`2021-47002`, :cve:`2021-47003`, :cve:`2021-47004`, :cve:`2021-47005`, :cve:`2021-47006`, :cve:`2021-47007`, :cve:`2021-47008`, :cve:`2021-47009`, :cve:`2021-47010`, :cve:`2021-47011`, :cve:`2021-47012`, :cve:`2021-47013`, :cve:`2021-47014`, :cve:`2021-47015`, :cve:`2021-47016`, :cve:`2021-47017`, :cve:`2021-47018`, :cve:`2021-47019`, :cve:`2021-47020`, :cve:`2021-47021`, :cve:`2021-47022`, :cve:`2021-47023`, :cve:`2021-47024`, :cve:`2021-47025`, :cve:`2021-47026`, :cve:`2021-47027`, :cve:`2021-47028`, :cve:`2021-47029`, :cve:`2021-47030`, :cve:`2021-47031`, :cve:`2021-47032`, :cve:`2021-47033`, :cve:`2021-47034`, :cve:`2021-47035`, :cve:`2021-47036`, :cve:`2021-47037`, :cve:`2021-47038`, :cve:`2021-47039`, :cve:`2021-47040`, :cve:`2021-47041`, :cve:`2021-47042`, :cve:`2021-47043`, :cve:`2021-47044`, :cve:`2021-47045`, :cve:`2021-47046`, :cve:`2021-47047`, 
 :cve:`2021-47048`, :cve:`2021-47049`, :cve:`2021-47050`, :cve:`2021-47051`, :cve:`2021-47052`, :cve:`2021-47053`, :cve:`2021-47054`, :cve:`2021-47055`, :cve:`2021-47056`, :cve:`2021-47057`, :cve:`2021-47058`, :cve:`2021-47059`, :cve:`2021-47060`, :cve:`2021-47061`, :cve:`2021-47062`, :cve:`2021-47063`, :cve:`2021-47064`, :cve:`2021-47065`, :cve:`2021-47066`, :cve:`2021-47067`, :cve:`2021-47068`, :cve:`2021-47069`, :cve:`2021-47070`, :cve:`2021-47071`, :cve:`2021-47072`, :cve:`2021-47073`, :cve:`2021-47074`, :cve:`2021-47075`, :cve:`2021-47076`, :cve:`2021-47077`, :cve:`2021-47078`, :cve:`2021-47079`, :cve:`2021-47080`, :cve:`2021-47081`, :cve:`2021-47082`, :cve:`2021-47083`, :cve:`2021-47086`, :cve:`2021-47087`, :cve:`2021-47088`, :cve:`2021-47089`, :cve:`2021-47090`, :cve:`2021-47091`, :cve:`2021-47092`, :cve:`2021-47093`, :cve:`2021-47094`, :cve:`2021-47095`, :cve:`2021-47096`, :cve:`2021-47097`, :cve:`2021-47098`, :cve:`2021-47099`, :cve:`2021-47100`, :cve:`2021-47101`, :cve:`202
 1-47102`, :cve:`2021-47103`, :cve:`2021-47104`, :cve:`2021-47105`, :cve:`2021-47106`, :cve:`2021-47107`, :cve:`2021-47108`, :cve:`2021-47109`, :cve:`2021-47110`, :cve:`2021-47111`, :cve:`2021-47112`, :cve:`2021-47113`, :cve:`2021-47114`, :cve:`2021-47116`, :cve:`2021-47117`, :cve:`2021-47118`, :cve:`2021-47119`, :cve:`2021-47120`, :cve:`2021-47121`, :cve:`2021-47122`, :cve:`2021-47123`, :cve:`2021-47124`, :cve:`2021-47125`, :cve:`2021-47126`, :cve:`2021-47127`, :cve:`2021-47128`, :cve:`2021-47129`, :cve:`2021-47130`, :cve:`2021-47131`, :cve:`2021-47132`, :cve:`2021-47133`, :cve:`2021-47134`, :cve:`2021-47135`, :cve:`2021-47136`, :cve:`2021-47137`, :cve:`2021-47138`, :cve:`2021-47139`, :cve:`2021-47140`, :cve:`2021-47141`, :cve:`2021-47142`, :cve:`2021-47143`, :cve:`2021-47144`, :cve:`2021-47145`, :cve:`2021-47146`, :cve:`2021-47147`, :cve:`2021-47148`, :cve:`2021-47149`, :cve:`2021-47150`, :cve:`2021-47151`, :cve:`2021-47152`, :cve:`2021-47153`, :cve:`2021-47158`, :cve:`2021-47159`,
  :cve:`2021-47160`, :cve:`2021-47161`, :cve:`2021-47162`, :cve:`2021-47163`, :cve:`2021-47164`, :cve:`2021-47165`, :cve:`2021-47166`, :cve:`2021-47167`, :cve:`2021-47168`, :cve:`2021-47169`, :cve:`2021-47170`, :cve:`2021-47171`, :cve:`2021-47172`, :cve:`2021-47173`, :cve:`2021-47174`, :cve:`2021-47175`, :cve:`2021-47176`, :cve:`2021-47177`, :cve:`2021-47178`, :cve:`2021-47179`, :cve:`2021-47180`, :cve:`2022-48626`, :cve:`2022-48627`, :cve:`2022-48628`, :cve:`2022-48629` and :cve:`2022-48630`
--  linux-yocto/6.6 (cont.): Ignore :cve:`2023-6270`, :cve:`2023-6356`, :cve:`2023-6536`, :cve:`2023-7042`, :cve:`2023-28746`, :cve:`2023-52465`, :cve:`2023-52467`, :cve:`2023-52468`, :cve:`2023-52469`, :cve:`2023-52470`, :cve:`2023-52471`, :cve:`2023-52472`, :cve:`2023-52473`, :cve:`2023-52474`, :cve:`2023-52475`, :cve:`2023-52476`, :cve:`2023-52477`, :cve:`2023-52478`, :cve:`2023-52479`, :cve:`2023-52480`, :cve:`2023-52481`, :cve:`2023-52482`, :cve:`2023-52483`, :cve:`2023-52484`, :cve:`2023-52486`, :cve:`2023-52487`, :cve:`2023-52488`, :cve:`2023-52489`, :cve:`2023-52490`, :cve:`2023-52491`, :cve:`2023-52492`, :cve:`2023-52493`, :cve:`2023-52494`, :cve:`2023-52495`, :cve:`2023-52497`, :cve:`2023-52498`, :cve:`2023-52499`, :cve:`2023-52500`, :cve:`2023-52501`, :cve:`2023-52502`, :cve:`2023-52503`, :cve:`2023-52504`, :cve:`2023-52505`, :cve:`2023-52506`, :cve:`2023-52507`, :cve:`2023-52508`, :cve:`2023-52509`, :cve:`2023-52510`, :cve:`2023-52511`, :cve:`2023-52512`, :cve:`2023-52513
 `, :cve:`2023-52515`, :cve:`2023-52516`, :cve:`2023-52517`, :cve:`2023-52518`, :cve:`2023-52519`, :cve:`2023-52520`, :cve:`2023-52522`, :cve:`2023-52523`, :cve:`2023-52524`, :cve:`2023-52525`, :cve:`2023-52526`, :cve:`2023-52527`, :cve:`2023-52528`, :cve:`2023-52529`, :cve:`2023-52530`, :cve:`2023-52531`, :cve:`2023-52532`, :cve:`2023-52559`, :cve:`2023-52560`, :cve:`2023-52561`, :cve:`2023-52562`, :cve:`2023-52563`, :cve:`2023-52564`, :cve:`2023-52565`, :cve:`2023-52566`, :cve:`2023-52567`, :cve:`2023-52568`, :cve:`2023-52569`, :cve:`2023-52570`, :cve:`2023-52571`, :cve:`2023-52572`, :cve:`2023-52573`, :cve:`2023-52574`, :cve:`2023-52575`, :cve:`2023-52576`, :cve:`2023-52577`, :cve:`2023-52578`, :cve:`2023-52580`, :cve:`2023-52581`, :cve:`2023-52582`, :cve:`2023-52583`, :cve:`2023-52584`, :cve:`2023-52587`, :cve:`2023-52588`, :cve:`2023-52589`, :cve:`2023-52591`, :cve:`2023-52593`, :cve:`2023-52594`, :cve:`2023-52595`, :cve:`2023-52596`, :cve:`2023-52597`, :cve:`2023-52598`, :cve:`
 2023-52599`, :cve:`2023-52600`, :cve:`2023-52601`, :cve:`2023-52602`, :cve:`2023-52603`, :cve:`2023-52604`, :cve:`2023-52606`, :cve:`2023-52607`, :cve:`2023-52608`, :cve:`2023-52609`, :cve:`2023-52610`, :cve:`2023-52611`, :cve:`2023-52612`, :cve:`2023-52613`, :cve:`2023-52614`, :cve:`2023-52615`, :cve:`2023-52616`, :cve:`2023-52617`, :cve:`2023-52618`, :cve:`2023-52619`, :cve:`2023-52620`, :cve:`2023-52621`, :cve:`2023-52622`, :cve:`2023-52623`, :cve:`2023-52626`, :cve:`2023-52627`, :cve:`2023-52628`, :cve:`2023-52629`, :cve:`2023-52630`, :cve:`2023-52631`, :cve:`2023-52632`, :cve:`2023-52633`, :cve:`2023-52635`, :cve:`2023-52636`, :cve:`2023-52637`, :cve:`2023-52638`, :cve:`2023-52639`, :cve:`2023-52640`, :cve:`2023-52641`, :cve:`2024-0841`, :cve:`2024-22099`, :cve:`2024-23196`, :cve:`2024-26600`, :cve:`2024-26601`, :cve:`2024-26602`, :cve:`2024-26603`, :cve:`2024-26604`, :cve:`2024-26605`, :cve:`2024-26606`, :cve:`2024-26607`, :cve:`2024-26608`, :cve:`2024-26610`, :cve:`2024-26611
 `, :cve:`2024-26612`, :cve:`2024-26614`, :cve:`2024-26615`, :cve:`2024-26616`, :cve:`2024-26617`, :cve:`2024-26618`, :cve:`2024-26619`, :cve:`2024-26620`, :cve:`2024-26621`, :cve:`2024-26622`, :cve:`2024-26623`, :cve:`2024-26625`, :cve:`2024-26626`, :cve:`2024-26627`, :cve:`2024-26629`, :cve:`2024-26630`, :cve:`2024-26631`, :cve:`2024-26632`, :cve:`2024-26633`, :cve:`2024-26634`, :cve:`2024-26635`, :cve:`2024-26636`, :cve:`2024-26637`, :cve:`2024-26638`, :cve:`2024-26639`, :cve:`2024-26640`, :cve:`2024-26641`, :cve:`2024-26644`, :cve:`2024-26645`, :cve:`2024-26646`, :cve:`2024-26647`, :cve:`2024-26648`, :cve:`2024-26649`, :cve:`2024-26650`, :cve:`2024-26651`, :cve:`2024-26652`, :cve:`2024-26653`, :cve:`2024-26657`, :cve:`2024-26659`, :cve:`2024-26660`, :cve:`2024-26661`, :cve:`2024-26662`, :cve:`2024-26663`, :cve:`2024-26664`, :cve:`2024-26665`, :cve:`2024-26666`, :cve:`2024-26667`, :cve:`2024-26668`, :cve:`2024-26669`, :cve:`2024-26670`, :cve:`2024-26671`, :cve:`2024-26673`, :cve:`
 2024-26674`, :cve:`2024-26675`, :cve:`2024-26676`, :cve:`2024-26677`, :cve:`2024-26678`, :cve:`2024-26679`, :cve:`2024-26680`, :cve:`2024-26681`, :cve:`2024-26682`, :cve:`2024-26683`, :cve:`2024-26684`, :cve:`2024-26685`, :cve:`2024-26687`, :cve:`2024-26688`, :cve:`2024-26689`, :cve:`2024-26690`, :cve:`2024-26691`, :cve:`2024-26692`, :cve:`2024-26693`, :cve:`2024-26694`, :cve:`2024-26695`, :cve:`2024-26696`, :cve:`2024-26697`, :cve:`2024-26698`, :cve:`2024-26700`, :cve:`2024-26702`, :cve:`2024-26703`, :cve:`2024-26704`, :cve:`2024-26705`, :cve:`2024-26706`, :cve:`2024-26707`, :cve:`2024-26708`, :cve:`2024-26709`, :cve:`2024-26710`, :cve:`2024-26711`, :cve:`2024-26712`, :cve:`2024-26713`, :cve:`2024-26714`, :cve:`2024-26715`, :cve:`2024-26716`, :cve:`2024-26717`, :cve:`2024-26718`, :cve:`2024-26719`, :cve:`2024-26720`, :cve:`2024-26721`, :cve:`2024-26722`, :cve:`2024-26723`, :cve:`2024-26724`, :cve:`2024-26725`, :cve:`2024-26726`, :cve:`2024-26727`, :cve:`2024-26728`, :cve:`2024-2672
 9`, :cve:`2024-26730`, :cve:`2024-26731`, :cve:`2024-26732`, :cve:`2024-26733`, :cve:`2024-26734`, :cve:`2024-26735`, :cve:`2024-26736`, :cve:`2024-26737`, :cve:`2024-26738`, :cve:`2024-26739`, :cve:`2024-26740`, :cve:`2024-26741`, :cve:`2024-26742`, :cve:`2024-26743`, :cve:`2024-26744`, :cve:`2024-26745`, :cve:`2024-26746`, :cve:`2024-26747`, :cve:`2024-26748`, :cve:`2024-26749`, :cve:`2024-26750`, :cve:`2024-26751`, :cve:`2024-26752`, :cve:`2024-26753`, :cve:`2024-26754`, :cve:`2024-26755`, :cve:`2024-26759`, :cve:`2024-26760`, :cve:`2024-26761`, :cve:`2024-26762`, :cve:`2024-26763`, :cve:`2024-26764`, :cve:`2024-26765`, :cve:`2024-26766`, :cve:`2024-26767`, :cve:`2024-26768`, :cve:`2024-26769`, :cve:`2024-26770`, :cve:`2024-26771`, :cve:`2024-26772`, :cve:`2024-26773`, :cve:`2024-26774`, :cve:`2024-26775`, :cve:`2024-26776`, :cve:`2024-26777`, :cve:`2024-26778`, :cve:`2024-26779`, :cve:`2024-26780`, :cve:`2024-26781`, :cve:`2024-26782`, :cve:`2024-26783`, :cve:`2024-26786`, :cve:
 `2024-26787`, :cve:`2024-26788`, :cve:`2024-26789`, :cve:`2024-26790`, :cve:`2024-26791`, :cve:`2024-26792`, :cve:`2024-26793`, :cve:`2024-26794`, :cve:`2024-26795`, :cve:`2024-26796`, :cve:`2024-26798`, :cve:`2024-26799`, :cve:`2024-26800`, :cve:`2024-26801`, :cve:`2024-26802`, :cve:`2024-26803`, :cve:`2024-26804`, :cve:`2024-26805`, :cve:`2024-26807`, :cve:`2024-26808` and :cve:`2024-26809`
--  llvm: Fix :cve:`2024-0151`
--  ofono: Fix :cve:`2023-2794`
--  openssh: Fix :cve:`2024-6387` and :cve:`2024-39894`
--  openssl: Fix :cve:`2024-5535`
--  pam: Fix :cve:`2024-22365`
--  python3-idna: Fix :cve:`2024-3651`
--  qemu: Fix :cve:`2023-6683`, :cve:`2024-3446`, :cve_mitre:`2024-3447`, :cve:`2024-3567`, :cve:`2024-26327` and :cve:`2024-26328`
--  ruby: Fix :cve:`2023-36617` and :cve:`2024-27281`
--  vte: Fix :cve:`2024-37535`
--  wget: Fix for :cve:`2024-38428`
+-  bind: Fix :cve_nist:`2024-0760`, :cve_nist:`2024-1737`, :cve_nist:`2024-1975` and :cve_nist:`2024-4076`
+-  busybox: Fix :cve_nist:`2023-42366`, :cve_nist:`2023-42364`, :cve_nist:`2023-42365`, :cve_nist:`2021-42380` and :cve_nist:`2023-42363`
+-  cpio: Ignore :cve_nist:`2023-7216`
+-  curl: Fix :cve_nist:`2024-6197`
+-  ffmpeg: Fix :cve_nist:`2023-49502`, :cve_nist:`2024-31578` and :cve_nist:`2024-31582`
+-  ghostscript: Fix :cve_nist:`2023-52722`
+-  go: Fix :cve_nist:`2024-24790`
+-  gstreamer1.0-plugins-base: Fix :cve_nist:`2024-4453`
+-  less: Fix :cve_nist:`2024-32487`
+-  libxml2: Fix :cve_nist:`2024-34459`
+-  libyaml: Ignore :cve_nist:`2024-35328`
+-  linux-yocto/6.6: Fix :cve_nist:`2024-23307`, :cve_nist:`2024-24861`, :cve_nist:`2024-26642`, :cve_nist:`2024-26643`, :cve_nist:`2024-26654`, :cve_nist:`2024-26656` and :cve_nist:`2023-47233`
+-  linux-yocto/6.6: Ignore :cve_nist:`2019-25160`, :cve_nist:`2019-25162`, :cve_nist:`2020-36775`, :cve_nist:`2020-36776`, :cve_nist:`2020-36777`, :cve_nist:`2020-36778`, :cve_nist:`2020-36779`, :cve_nist:`2020-36780`, :cve_nist:`2020-36781`, :cve_nist:`2020-36782`, :cve_nist:`2020-36783`, :cve_nist:`2020-36784`, :cve_nist:`2020-36785`, :cve_nist:`2020-36786`, :cve_nist:`2020-36787`, :cve_nist:`2021-46904`, :cve_nist:`2021-46905`, :cve_nist:`2021-46906`, :cve_nist:`2021-46908`, :cve_nist:`2021-46909`, :cve_nist:`2021-46910`, :cve_nist:`2021-46911`, :cve_nist:`2021-46912`, :cve_nist:`2021-46913`, :cve_nist:`2021-46914`, :cve_nist:`2021-46915`, :cve_nist:`2021-46916`, :cve_nist:`2021-46917`, :cve_nist:`2021-46918`, :cve_nist:`2021-46919`, :cve_nist:`2021-46920`, :cve_nist:`2021-46921`, :cve_nist:`2021-46922`, :cve_nist:`2021-46923`, :cve_nist:`2021-46924`, :cve_nist:`2021-46925`, :cve_nist:`2021-46926`, :cve_nist:`2021-46927`, :cve_nist:`2021-46928`, :cve_nist:`2021-46929`, :cve_nist:
 `2021-46930`, :cve_nist:`2021-46931`, :cve_nist:`2021-46932`, :cve_nist:`2021-46933`, :cve_nist:`2021-46934`, :cve_nist:`2021-46935`, :cve_nist:`2021-46936`, :cve_nist:`2021-46937`, :cve_nist:`2021-46938`, :cve_nist:`2021-46939`, :cve_nist:`2021-46940`, :cve_nist:`2021-46941`, :cve_nist:`2021-46942`, :cve_nist:`2021-46943`, :cve_nist:`2021-46944`, :cve_nist:`2021-46945`, :cve_nist:`2021-46947`, :cve_nist:`2021-46948`, :cve_nist:`2021-46949`, :cve_nist:`2021-46950`, :cve_nist:`2021-46951`, :cve_nist:`2021-46952`, :cve_nist:`2021-46953`, :cve_nist:`2021-46954`, :cve_nist:`2021-46955`, :cve_nist:`2021-46956`, :cve_nist:`2021-46957`, :cve_nist:`2021-46958`, :cve_nist:`2021-46959`, :cve_nist:`2021-46960`, :cve_nist:`2021-46961`, :cve_nist:`2021-46962`, :cve_nist:`2021-46963`, :cve_nist:`2021-46964`, :cve_nist:`2021-46965`, :cve_nist:`2021-46966`, :cve_nist:`2021-46967`, :cve_nist:`2021-46968`, :cve_nist:`2021-46969`, :cve_nist:`2021-46970`, :cve_nist:`2021-46971`, :cve_nist:`2021-46972`,
  :cve_nist:`2021-46973`, :cve_nist:`2021-46974`, :cve_nist:`2021-46976`, :cve_nist:`2021-46977`, :cve_nist:`2021-46978`, :cve_nist:`2021-46979`, :cve_nist:`2021-46980`, :cve_nist:`2021-46981`, :cve_nist:`2021-46982`, :cve_nist:`2021-46983`, :cve_nist:`2021-46984`, :cve_nist:`2021-46985`, :cve_nist:`2021-46986`, :cve_nist:`2021-46987`, :cve_nist:`2021-46988`, :cve_nist:`2021-46989`, :cve_nist:`2021-46990`, :cve_nist:`2021-46991`, :cve_nist:`2021-46992`, :cve_nist:`2021-46993`, :cve_nist:`2021-46994`, :cve_nist:`2021-46995`, :cve_nist:`2021-46996`, :cve_nist:`2021-46997`, :cve_nist:`2021-46998`, :cve_nist:`2021-46999`, :cve_nist:`2021-47000`, :cve_nist:`2021-47001`, :cve_nist:`2021-47002`, :cve_nist:`2021-47003`, :cve_nist:`2021-47004`, :cve_nist:`2021-47005`, :cve_nist:`2021-47006`, :cve_nist:`2021-47007`, :cve_nist:`2021-47008`, :cve_nist:`2021-47009`, :cve_nist:`2021-47010`, :cve_nist:`2021-47011`, :cve_nist:`2021-47012`, :cve_nist:`2021-47013`, :cve_nist:`2021-47014`, :cve_nist:`2
 021-47015`, :cve_nist:`2021-47016`, :cve_nist:`2021-47017`, :cve_nist:`2021-47018`, :cve_nist:`2021-47019`, :cve_nist:`2021-47020`, :cve_nist:`2021-47021`, :cve_nist:`2021-47022`, :cve_nist:`2021-47023`, :cve_nist:`2021-47024`, :cve_nist:`2021-47025`, :cve_nist:`2021-47026`, :cve_nist:`2021-47027`, :cve_nist:`2021-47028`, :cve_nist:`2021-47029`, :cve_nist:`2021-47030`, :cve_nist:`2021-47031`, :cve_nist:`2021-47032`, :cve_nist:`2021-47033`, :cve_nist:`2021-47034`, :cve_nist:`2021-47035`, :cve_nist:`2021-47036`, :cve_nist:`2021-47037`, :cve_nist:`2021-47038`, :cve_nist:`2021-47039`, :cve_nist:`2021-47040`, :cve_nist:`2021-47041`, :cve_nist:`2021-47042`, :cve_nist:`2021-47043`, :cve_nist:`2021-47044`, :cve_nist:`2021-47045`, :cve_nist:`2021-47046`, :cve_nist:`2021-47047`, :cve_nist:`2021-47048`, :cve_nist:`2021-47049`, :cve_nist:`2021-47050`, :cve_nist:`2021-47051`, :cve_nist:`2021-47052`, :cve_nist:`2021-47053`, :cve_nist:`2021-47054`, :cve_nist:`2021-47055`, :cve_nist:`2021-47056`, :
 cve_nist:`2021-47057`, :cve_nist:`2021-47058`, :cve_nist:`2021-47059`, :cve_nist:`2021-47060`, :cve_nist:`2021-47061`, :cve_nist:`2021-47062`, :cve_nist:`2021-47063`, :cve_nist:`2021-47064`, :cve_nist:`2021-47065`, :cve_nist:`2021-47066`, :cve_nist:`2021-47067`, :cve_nist:`2021-47068`, :cve_nist:`2021-47069`, :cve_nist:`2021-47070`, :cve_nist:`2021-47071`, :cve_nist:`2021-47072`, :cve_nist:`2021-47073`, :cve_nist:`2021-47074`, :cve_nist:`2021-47075`, :cve_nist:`2021-47076`, :cve_nist:`2021-47077`, :cve_nist:`2021-47078`, :cve_nist:`2021-47079`, :cve_nist:`2021-47080`, :cve_nist:`2021-47081`, :cve_nist:`2021-47082`, :cve_nist:`2021-47083`, :cve_nist:`2021-47086`, :cve_nist:`2021-47087`, :cve_nist:`2021-47088`, :cve_nist:`2021-47089`, :cve_nist:`2021-47090`, :cve_nist:`2021-47091`, :cve_nist:`2021-47092`, :cve_nist:`2021-47093`, :cve_nist:`2021-47094`, :cve_nist:`2021-47095`, :cve_nist:`2021-47096`, :cve_nist:`2021-47097`, :cve_nist:`2021-47098`, :cve_nist:`2021-47099`, :cve_nist:`202
 1-47100`, :cve_nist:`2021-47101`, :cve_nist:`2021-47102`, :cve_nist:`2021-47103`, :cve_nist:`2021-47104`, :cve_nist:`2021-47105`, :cve_nist:`2021-47106`, :cve_nist:`2021-47107`, :cve_nist:`2021-47108`, :cve_nist:`2021-47109`, :cve_nist:`2021-47110`, :cve_nist:`2021-47111`, :cve_nist:`2021-47112`, :cve_nist:`2021-47113`, :cve_nist:`2021-47114`, :cve_nist:`2021-47116`, :cve_nist:`2021-47117`, :cve_nist:`2021-47118`, :cve_nist:`2021-47119`, :cve_nist:`2021-47120`, :cve_nist:`2021-47121`, :cve_nist:`2021-47122`, :cve_nist:`2021-47123`, :cve_nist:`2021-47124`, :cve_nist:`2021-47125`, :cve_nist:`2021-47126`, :cve_nist:`2021-47127`, :cve_nist:`2021-47128`, :cve_nist:`2021-47129`, :cve_nist:`2021-47130`, :cve_nist:`2021-47131`, :cve_nist:`2021-47132`, :cve_nist:`2021-47133`, :cve_nist:`2021-47134`, :cve_nist:`2021-47135`, :cve_nist:`2021-47136`, :cve_nist:`2021-47137`, :cve_nist:`2021-47138`, :cve_nist:`2021-47139`, :cve_nist:`2021-47140`, :cve_nist:`2021-47141`, :cve_nist:`2021-47142`, :cv
 e_nist:`2021-47143`, :cve_nist:`2021-47144`, :cve_nist:`2021-47145`, :cve_nist:`2021-47146`, :cve_nist:`2021-47147`, :cve_nist:`2021-47148`, :cve_nist:`2021-47149`, :cve_nist:`2021-47150`, :cve_nist:`2021-47151`, :cve_nist:`2021-47152`, :cve_nist:`2021-47153`, :cve_nist:`2021-47158`, :cve_nist:`2021-47159`, :cve_nist:`2021-47160`, :cve_nist:`2021-47161`, :cve_nist:`2021-47162`, :cve_nist:`2021-47163`, :cve_nist:`2021-47164`, :cve_nist:`2021-47165`, :cve_nist:`2021-47166`, :cve_nist:`2021-47167`, :cve_nist:`2021-47168`, :cve_nist:`2021-47169`, :cve_nist:`2021-47170`, :cve_nist:`2021-47171`, :cve_nist:`2021-47172`, :cve_nist:`2021-47173`, :cve_nist:`2021-47174`, :cve_nist:`2021-47175`, :cve_nist:`2021-47176`, :cve_nist:`2021-47177`, :cve_nist:`2021-47178`, :cve_nist:`2021-47179`, :cve_nist:`2021-47180`, :cve_nist:`2022-48626`, :cve_nist:`2022-48627`, :cve_nist:`2022-48628`, :cve_nist:`2022-48629` and :cve_nist:`2022-48630`
+-  linux-yocto/6.6 (cont.): Ignore :cve_nist:`2023-6270`, :cve_nist:`2023-6356`, :cve_nist:`2023-6536`, :cve_nist:`2023-7042`, :cve_nist:`2023-28746`, :cve_nist:`2023-52465`, :cve_nist:`2023-52467`, :cve_nist:`2023-52468`, :cve_nist:`2023-52469`, :cve_nist:`2023-52470`, :cve_nist:`2023-52471`, :cve_nist:`2023-52472`, :cve_nist:`2023-52473`, :cve_nist:`2023-52474`, :cve_nist:`2023-52475`, :cve_nist:`2023-52476`, :cve_nist:`2023-52477`, :cve_nist:`2023-52478`, :cve_nist:`2023-52479`, :cve_nist:`2023-52480`, :cve_nist:`2023-52481`, :cve_nist:`2023-52482`, :cve_nist:`2023-52483`, :cve_nist:`2023-52484`, :cve_nist:`2023-52486`, :cve_nist:`2023-52487`, :cve_nist:`2023-52488`, :cve_nist:`2023-52489`, :cve_nist:`2023-52490`, :cve_nist:`2023-52491`, :cve_nist:`2023-52492`, :cve_nist:`2023-52493`, :cve_nist:`2023-52494`, :cve_nist:`2023-52495`, :cve_nist:`2023-52497`, :cve_nist:`2023-52498`, :cve_nist:`2023-52499`, :cve_nist:`2023-52500`, :cve_nist:`2023-52501`, :cve_nist:`2023-52502`, :cve_n
 ist:`2023-52503`, :cve_nist:`2023-52504`, :cve_nist:`2023-52505`, :cve_nist:`2023-52506`, :cve_nist:`2023-52507`, :cve_nist:`2023-52508`, :cve_nist:`2023-52509`, :cve_nist:`2023-52510`, :cve_nist:`2023-52511`, :cve_nist:`2023-52512`, :cve_nist:`2023-52513`, :cve_nist:`2023-52515`, :cve_nist:`2023-52516`, :cve_nist:`2023-52517`, :cve_nist:`2023-52518`, :cve_nist:`2023-52519`, :cve_nist:`2023-52520`, :cve_nist:`2023-52522`, :cve_nist:`2023-52523`, :cve_nist:`2023-52524`, :cve_nist:`2023-52525`, :cve_nist:`2023-52526`, :cve_nist:`2023-52527`, :cve_nist:`2023-52528`, :cve_nist:`2023-52529`, :cve_nist:`2023-52530`, :cve_nist:`2023-52531`, :cve_nist:`2023-52532`, :cve_nist:`2023-52559`, :cve_nist:`2023-52560`, :cve_nist:`2023-52561`, :cve_nist:`2023-52562`, :cve_nist:`2023-52563`, :cve_nist:`2023-52564`, :cve_nist:`2023-52565`, :cve_nist:`2023-52566`, :cve_nist:`2023-52567`, :cve_nist:`2023-52568`, :cve_nist:`2023-52569`, :cve_nist:`2023-52570`, :cve_nist:`2023-52571`, :cve_nist:`2023-525
 72`, :cve_nist:`2023-52573`, :cve_nist:`2023-52574`, :cve_nist:`2023-52575`, :cve_nist:`2023-52576`, :cve_nist:`2023-52577`, :cve_nist:`2023-52578`, :cve_nist:`2023-52580`, :cve_nist:`2023-52581`, :cve_nist:`2023-52582`, :cve_nist:`2023-52583`, :cve_nist:`2023-52584`, :cve_nist:`2023-52587`, :cve_nist:`2023-52588`, :cve_nist:`2023-52589`, :cve_nist:`2023-52591`, :cve_nist:`2023-52593`, :cve_nist:`2023-52594`, :cve_nist:`2023-52595`, :cve_nist:`2023-52596`, :cve_nist:`2023-52597`, :cve_nist:`2023-52598`, :cve_nist:`2023-52599`, :cve_nist:`2023-52600`, :cve_nist:`2023-52601`, :cve_nist:`2023-52602`, :cve_nist:`2023-52603`, :cve_nist:`2023-52604`, :cve_nist:`2023-52606`, :cve_nist:`2023-52607`, :cve_nist:`2023-52608`, :cve_nist:`2023-52609`, :cve_nist:`2023-52610`, :cve_nist:`2023-52611`, :cve_nist:`2023-52612`, :cve_nist:`2023-52613`, :cve_nist:`2023-52614`, :cve_nist:`2023-52615`, :cve_nist:`2023-52616`, :cve_nist:`2023-52617`, :cve_nist:`2023-52618`, :cve_nist:`2023-52619`, :cve_nis
 t:`2023-52620`, :cve_nist:`2023-52621`, :cve_nist:`2023-52622`, :cve_nist:`2023-52623`, :cve_nist:`2023-52626`, :cve_nist:`2023-52627`, :cve_nist:`2023-52628`, :cve_nist:`2023-52629`, :cve_nist:`2023-52630`, :cve_nist:`2023-52631`, :cve_nist:`2023-52632`, :cve_nist:`2023-52633`, :cve_nist:`2023-52635`, :cve_nist:`2023-52636`, :cve_nist:`2023-52637`, :cve_nist:`2023-52638`, :cve_nist:`2023-52639`, :cve_nist:`2023-52640`, :cve_nist:`2023-52641`, :cve_nist:`2024-0841`, :cve_nist:`2024-22099`, :cve_nist:`2024-23196`, :cve_nist:`2024-26600`, :cve_nist:`2024-26601`, :cve_nist:`2024-26602`, :cve_nist:`2024-26603`, :cve_nist:`2024-26604`, :cve_nist:`2024-26605`, :cve_nist:`2024-26606`, :cve_nist:`2024-26607`, :cve_nist:`2024-26608`, :cve_nist:`2024-26610`, :cve_nist:`2024-26611`, :cve_nist:`2024-26612`, :cve_nist:`2024-26614`, :cve_nist:`2024-26615`, :cve_nist:`2024-26616`, :cve_nist:`2024-26617`, :cve_nist:`2024-26618`, :cve_nist:`2024-26619`, :cve_nist:`2024-26620`, :cve_nist:`2024-26621`
 , :cve_nist:`2024-26622`, :cve_nist:`2024-26623`, :cve_nist:`2024-26625`, :cve_nist:`2024-26626`, :cve_nist:`2024-26627`, :cve_nist:`2024-26629`, :cve_nist:`2024-26630`, :cve_nist:`2024-26631`, :cve_nist:`2024-26632`, :cve_nist:`2024-26633`, :cve_nist:`2024-26634`, :cve_nist:`2024-26635`, :cve_nist:`2024-26636`, :cve_nist:`2024-26637`, :cve_nist:`2024-26638`, :cve_nist:`2024-26639`, :cve_nist:`2024-26640`, :cve_nist:`2024-26641`, :cve_nist:`2024-26644`, :cve_nist:`2024-26645`, :cve_nist:`2024-26646`, :cve_nist:`2024-26647`, :cve_nist:`2024-26648`, :cve_nist:`2024-26649`, :cve_nist:`2024-26650`, :cve_nist:`2024-26651`, :cve_nist:`2024-26652`, :cve_nist:`2024-26653`, :cve_nist:`2024-26657`, :cve_nist:`2024-26659`, :cve_nist:`2024-26660`, :cve_nist:`2024-26661`, :cve_nist:`2024-26662`, :cve_nist:`2024-26663`, :cve_nist:`2024-26664`, :cve_nist:`2024-26665`, :cve_nist:`2024-26666`, :cve_nist:`2024-26667`, :cve_nist:`2024-26668`, :cve_nist:`2024-26669`, :cve_nist:`2024-26670`, :cve_nist:`
 2024-26671`, :cve_nist:`2024-26673`, :cve_nist:`2024-26674`, :cve_nist:`2024-26675`, :cve_nist:`2024-26676`, :cve_nist:`2024-26677`, :cve_nist:`2024-26678`, :cve_nist:`2024-26679`, :cve_nist:`2024-26680`, :cve_nist:`2024-26681`, :cve_nist:`2024-26682`, :cve_nist:`2024-26683`, :cve_nist:`2024-26684`, :cve_nist:`2024-26685`, :cve_nist:`2024-26687`, :cve_nist:`2024-26688`, :cve_nist:`2024-26689`, :cve_nist:`2024-26690`, :cve_nist:`2024-26691`, :cve_nist:`2024-26692`, :cve_nist:`2024-26693`, :cve_nist:`2024-26694`, :cve_nist:`2024-26695`, :cve_nist:`2024-26696`, :cve_nist:`2024-26697`, :cve_nist:`2024-26698`, :cve_nist:`2024-26700`, :cve_nist:`2024-26702`, :cve_nist:`2024-26703`, :cve_nist:`2024-26704`, :cve_nist:`2024-26705`, :cve_nist:`2024-26706`, :cve_nist:`2024-26707`, :cve_nist:`2024-26708`, :cve_nist:`2024-26709`, :cve_nist:`2024-26710`, :cve_nist:`2024-26711`, :cve_nist:`2024-26712`, :cve_nist:`2024-26713`, :cve_nist:`2024-26714`, :cve_nist:`2024-26715`, :cve_nist:`2024-26716`, 
 :cve_nist:`2024-26717`, :cve_nist:`2024-26718`, :cve_nist:`2024-26719`, :cve_nist:`2024-26720`, :cve_nist:`2024-26721`, :cve_nist:`2024-26722`, :cve_nist:`2024-26723`, :cve_nist:`2024-26724`, :cve_nist:`2024-26725`, :cve_nist:`2024-26726`, :cve_nist:`2024-26727`, :cve_nist:`2024-26728`, :cve_nist:`2024-26729`, :cve_nist:`2024-26730`, :cve_nist:`2024-26731`, :cve_nist:`2024-26732`, :cve_nist:`2024-26733`, :cve_nist:`2024-26734`, :cve_nist:`2024-26735`, :cve_nist:`2024-26736`, :cve_nist:`2024-26737`, :cve_nist:`2024-26738`, :cve_nist:`2024-26739`, :cve_nist:`2024-26740`, :cve_nist:`2024-26741`, :cve_nist:`2024-26742`, :cve_nist:`2024-26743`, :cve_nist:`2024-26744`, :cve_nist:`2024-26745`, :cve_nist:`2024-26746`, :cve_nist:`2024-26747`, :cve_nist:`2024-26748`, :cve_nist:`2024-26749`, :cve_nist:`2024-26750`, :cve_nist:`2024-26751`, :cve_nist:`2024-26752`, :cve_nist:`2024-26753`, :cve_nist:`2024-26754`, :cve_nist:`2024-26755`, :cve_nist:`2024-26759`, :cve_nist:`2024-26760`, :cve_nist:`20
 24-26761`, :cve_nist:`2024-26762`, :cve_nist:`2024-26763`, :cve_nist:`2024-26764`, :cve_nist:`2024-26765`, :cve_nist:`2024-26766`, :cve_nist:`2024-26767`, :cve_nist:`2024-26768`, :cve_nist:`2024-26769`, :cve_nist:`2024-26770`, :cve_nist:`2024-26771`, :cve_nist:`2024-26772`, :cve_nist:`2024-26773`, :cve_nist:`2024-26774`, :cve_nist:`2024-26775`, :cve_nist:`2024-26776`, :cve_nist:`2024-26777`, :cve_nist:`2024-26778`, :cve_nist:`2024-26779`, :cve_nist:`2024-26780`, :cve_nist:`2024-26781`, :cve_nist:`2024-26782`, :cve_nist:`2024-26783`, :cve_nist:`2024-26786`, :cve_nist:`2024-26787`, :cve_nist:`2024-26788`, :cve_nist:`2024-26789`, :cve_nist:`2024-26790`, :cve_nist:`2024-26791`, :cve_nist:`2024-26792`, :cve_nist:`2024-26793`, :cve_nist:`2024-26794`, :cve_nist:`2024-26795`, :cve_nist:`2024-26796`, :cve_nist:`2024-26798`, :cve_nist:`2024-26799`, :cve_nist:`2024-26800`, :cve_nist:`2024-26801`, :cve_nist:`2024-26802`, :cve_nist:`2024-26803`, :cve_nist:`2024-26804`, :cve_nist:`2024-26805`, :c
 ve_nist:`2024-26807`, :cve_nist:`2024-26808` and :cve_nist:`2024-26809`
+-  llvm: Fix :cve_nist:`2024-0151`
+-  ofono: Fix :cve_nist:`2023-2794`
+-  openssh: Fix :cve_nist:`2024-6387` and :cve_nist:`2024-39894`
+-  openssl: Fix :cve_nist:`2024-5535`
+-  pam: Fix :cve_nist:`2024-22365`
+-  python3-idna: Fix :cve_nist:`2024-3651`
+-  qemu: Fix :cve_nist:`2023-6683`, :cve_nist:`2024-3446`, :cve_mitre:`2024-3447`, :cve_nist:`2024-3567`, :cve_nist:`2024-26327` and :cve_nist:`2024-26328`
+-  ruby: Fix :cve_nist:`2023-36617` and :cve_nist:`2024-27281`
+-  vte: Fix :cve_nist:`2024-37535`
+-  wget: Fix for :cve_nist:`2024-38428`
 
 
 Fixes in Yocto-5.0.3
diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 2bf78c633d8c5e10e321c62997c96797d7146b11..de11bd174adf171d26d7197e74d9c4c49094c94e 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -362,39 +362,39 @@ The following corrections have been made to the :term:`LICENSE` values set by re
 Security Fixes in 5.0
 ~~~~~~~~~~~~~~~~~~~~~
 
--  avahi: :cve:`2023-1981`, :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471`, :cve:`2023-38472`, :cve:`2023-38473`
--  bind: :cve:`2023-4408`, :cve:`2023-5517`, :cve:`2023-5679`, :cve:`2023-50387`
--  bluez5: :cve:`2023-45866`
--  coreutils: :cve:`2024-0684`
--  cups: :cve:`2023-4504`
--  curl: :cve:`2023-46218`
--  expat: :cve:`2024-28757`
--  gcc: :cve:`2023-4039`
--  glibc: :cve:`2023-5156`, :cve:`2023-0687`
--  gnutls: :cve:`2024-0553`, :cve:`2024-0567`, :cve:`2024-28834`, :cve:`2024-28835`
--  go: :cve:`2023-45288`
--  grub: :cve:`2023-4692`, :cve:`2023-4693`
--  grub2: :cve:`2023-4001` (ignored), :cve:`2024-1048` (ignored)
--  libgit2: :cve:`2024-24575`, :cve:`2024-24577`
--  libsndfile1: :cve:`2022-33065`
--  libssh2: :cve:`2023-48795`
--  libuv: :cve:`2024-24806`
--  libxml2: :cve:`2023-45322` (ignored)
--  linux-yocto/6.6: :cve:`2020-16119`
--  openssh: :cve:`2023-48795`, :cve:`2023-51384`, :cve:`2023-51385`
--  openssl: :cve:`2023-5363`, :cve:`2023-5678`, :cve:`2023-6129`, :cve_mitre:`2023-6237`, :cve:`2024-0727`, :cve:`2024-2511`
--  perl: :cve:`2023-47100`
--  pixman: :cve:`2023-37769` (ignored)
--  python3-cryptography{-vectors}: :cve:`2023-49083`, :cve:`2024-26130`
--  python3-urllib3: :cve:`2023-45803`
--  shadow: :cve:`2023-4641`
--  sudo: :cve:`2023-42456`
--  tiff: :cve:`2023-6228`, :cve:`2023-6277`, :cve:`2023-52355`, :cve:`2023-52356`
--  vim: :cve:`2023-46246`, :cve:`2023-48231`, :cve:`2023-48232`, :cve:`2023-48233`, :cve:`2023-48234`, :cve:`2023-48235`, :cve:`2023-48236`, :cve:`2023-48237`, :cve:`2024-22667`
--  wpa-supplicant: :cve:`2023-52160`
--  xserver-xorg: :cve:`2023-5574`, :cve:`2023-6816`, :cve:`2024-0229`, :cve:`2024-0408`, :cve:`2024-0409`, :cve:`2024-21885`, :cve:`2024-21886`
--  xwayland: :cve:`2023-5367`, :cve:`2024-0408`, :cve:`2024-0409`, :cve:`2023-6816`, :cve:`2024-0229`, :cve:`2024-21885`, :cve:`2024-21886`
--  zlib: :cve:`2023-45853` (ignored), :cve:`2023-6992` (ignored)
+-  avahi: :cve_nist:`2023-1981`, :cve_nist:`2023-38469`, :cve_nist:`2023-38470`, :cve_nist:`2023-38471`, :cve_nist:`2023-38469`, :cve_nist:`2023-38470`, :cve_nist:`2023-38471`, :cve_nist:`2023-38472`, :cve_nist:`2023-38473`
+-  bind: :cve_nist:`2023-4408`, :cve_nist:`2023-5517`, :cve_nist:`2023-5679`, :cve_nist:`2023-50387`
+-  bluez5: :cve_nist:`2023-45866`
+-  coreutils: :cve_nist:`2024-0684`
+-  cups: :cve_nist:`2023-4504`
+-  curl: :cve_nist:`2023-46218`
+-  expat: :cve_nist:`2024-28757`
+-  gcc: :cve_nist:`2023-4039`
+-  glibc: :cve_nist:`2023-5156`, :cve_nist:`2023-0687`
+-  gnutls: :cve_nist:`2024-0553`, :cve_nist:`2024-0567`, :cve_nist:`2024-28834`, :cve_nist:`2024-28835`
+-  go: :cve_nist:`2023-45288`
+-  grub: :cve_nist:`2023-4692`, :cve_nist:`2023-4693`
+-  grub2: :cve_nist:`2023-4001` (ignored), :cve_nist:`2024-1048` (ignored)
+-  libgit2: :cve_nist:`2024-24575`, :cve_nist:`2024-24577`
+-  libsndfile1: :cve_nist:`2022-33065`
+-  libssh2: :cve_nist:`2023-48795`
+-  libuv: :cve_nist:`2024-24806`
+-  libxml2: :cve_nist:`2023-45322` (ignored)
+-  linux-yocto/6.6: :cve_nist:`2020-16119`
+-  openssh: :cve_nist:`2023-48795`, :cve_nist:`2023-51384`, :cve_nist:`2023-51385`
+-  openssl: :cve_nist:`2023-5363`, :cve_nist:`2023-5678`, :cve_nist:`2023-6129`, :cve_mitre:`2023-6237`, :cve_nist:`2024-0727`, :cve_nist:`2024-2511`
+-  perl: :cve_nist:`2023-47100`
+-  pixman: :cve_nist:`2023-37769` (ignored)
+-  python3-cryptography{-vectors}: :cve_nist:`2023-49083`, :cve_nist:`2024-26130`
+-  python3-urllib3: :cve_nist:`2023-45803`
+-  shadow: :cve_nist:`2023-4641`
+-  sudo: :cve_nist:`2023-42456`
+-  tiff: :cve_nist:`2023-6228`, :cve_nist:`2023-6277`, :cve_nist:`2023-52355`, :cve_nist:`2023-52356`
+-  vim: :cve_nist:`2023-46246`, :cve_nist:`2023-48231`, :cve_nist:`2023-48232`, :cve_nist:`2023-48233`, :cve_nist:`2023-48234`, :cve_nist:`2023-48235`, :cve_nist:`2023-48236`, :cve_nist:`2023-48237`, :cve_nist:`2024-22667`
+-  wpa-supplicant: :cve_nist:`2023-52160`
+-  xserver-xorg: :cve_nist:`2023-5574`, :cve_nist:`2023-6816`, :cve_nist:`2024-0229`, :cve_nist:`2024-0408`, :cve_nist:`2024-0409`, :cve_nist:`2024-21885`, :cve_nist:`2024-21886`
+-  xwayland: :cve_nist:`2023-5367`, :cve_nist:`2024-0408`, :cve_nist:`2024-0409`, :cve_nist:`2023-6816`, :cve_nist:`2024-0229`, :cve_nist:`2024-21885`, :cve_nist:`2024-21886`
+-  zlib: :cve_nist:`2023-45853` (ignored), :cve_nist:`2023-6992` (ignored)
 
 
 Recipe Upgrades in 5.0
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index d6e284c1e8fef2c7dada3f15ffe3c0cecf21a981..1bccd2f6400355cafeb1ec138d87ac8593e03d94 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -446,32 +446,32 @@ The following corrections have been made to the :term:`LICENSE` values set by re
 Security Fixes in 5.1
 ~~~~~~~~~~~~~~~~~~~~~
 
--  ``apr``: :cve:`2023-49582`
--  ``busybox``: :cve:`2021-42380`, :cve:`2023-42363`, :cve:`2023-42364`, :cve:`2023-42365`, :cve:`2023-42366`
--  ``cups``: :cve:`2024-35235`
--  ``curl``: :cve:`2024-6197`, :cve:`2024-6874`, :cve:`2024-7264`
--  ``expat``: :cve:`2024-45490`, :cve:`2024-45491`, :cve:`2024-45492`.
--  ``gcc``: :cve:`2023-4039`
--  ``gdk-pixbuf``: :cve:`2022-48622`
--  ``ghostscript``: :cve:`2024-33869`, :cve:`2023-52722`, :cve:`2024-33870`, :cve:`2024-33871`, :cve:`2024-29510`
--  ``git``: :cve:`2024-32002`, :cve:`2024-32004`, :cve:`2024-32020`, :cve:`2024-32021`, :cve:`2024-32465`
--  ``glibc``: :cve:`2024-2961`, :cve:`2024-33599`, :cve:`2024-33600`, :cve:`2024-33601`, :cve:`2024-33602`
--  ``go``: :cve:`2024-24790`
--  ``gtk+3``: :cve:`2024-6655`
--  ``linux-yocto/6.10``: :cve:`2020-16119`
--  ``linux-yocto/6.6``: :cve:`2020-16119`
--  ``llvm``: :cve:`2024-0151`
--  ``ncurses``: :cve:`2023-50495`, :cve:`2023-45918`
--  ``openssh``: :cve:`2024-6387`
--  ``openssl``: :cve:`2024-4603`, :cve:`2024-4741`
--  ``ovmf``: :cve:`2023-45236`, :cve:`2023-45237`, :cve:`2024-25742`
--  ``python3``: :cve:`2024-7592`, :cve:`2024-8088`, :cve:`2024-6232`
--  ``ruby``: :cve:`2024-27282`, :cve:`2024-27281`, :cve:`2024-27280`
--  ``tiff``: :cve:`2024-7006`
--  ``vim``: :cve:`2024-41957`, :cve:`2024-41965`, :cve:`2024-43374`, :cve:`2024-43790`, :cve:`2024-43802`
--  ``wget``: :cve:`2024-38428`
--  ``wpa-supplicant``: :cve:`2024-5290`, :cve:`2023-52160`
--  ``xserver-xorg``: :cve:`2024-31080`, :cve:`2024-31081`, :cve:`2024-31082`, :cve:`2024-31083`
+-  ``apr``: :cve_nist:`2023-49582`
+-  ``busybox``: :cve_nist:`2021-42380`, :cve_nist:`2023-42363`, :cve_nist:`2023-42364`, :cve_nist:`2023-42365`, :cve_nist:`2023-42366`
+-  ``cups``: :cve_nist:`2024-35235`
+-  ``curl``: :cve_nist:`2024-6197`, :cve_nist:`2024-6874`, :cve_nist:`2024-7264`
+-  ``expat``: :cve_nist:`2024-45490`, :cve_nist:`2024-45491`, :cve_nist:`2024-45492`.
+-  ``gcc``: :cve_nist:`2023-4039`
+-  ``gdk-pixbuf``: :cve_nist:`2022-48622`
+-  ``ghostscript``: :cve_nist:`2024-33869`, :cve_nist:`2023-52722`, :cve_nist:`2024-33870`, :cve_nist:`2024-33871`, :cve_nist:`2024-29510`
+-  ``git``: :cve_nist:`2024-32002`, :cve_nist:`2024-32004`, :cve_nist:`2024-32020`, :cve_nist:`2024-32021`, :cve_nist:`2024-32465`
+-  ``glibc``: :cve_nist:`2024-2961`, :cve_nist:`2024-33599`, :cve_nist:`2024-33600`, :cve_nist:`2024-33601`, :cve_nist:`2024-33602`
+-  ``go``: :cve_nist:`2024-24790`
+-  ``gtk+3``: :cve_nist:`2024-6655`
+-  ``linux-yocto/6.10``: :cve_nist:`2020-16119`
+-  ``linux-yocto/6.6``: :cve_nist:`2020-16119`
+-  ``llvm``: :cve_nist:`2024-0151`
+-  ``ncurses``: :cve_nist:`2023-50495`, :cve_nist:`2023-45918`
+-  ``openssh``: :cve_nist:`2024-6387`
+-  ``openssl``: :cve_nist:`2024-4603`, :cve_nist:`2024-4741`
+-  ``ovmf``: :cve_nist:`2023-45236`, :cve_nist:`2023-45237`, :cve_nist:`2024-25742`
+-  ``python3``: :cve_nist:`2024-7592`, :cve_nist:`2024-8088`, :cve_nist:`2024-6232`
+-  ``ruby``: :cve_nist:`2024-27282`, :cve_nist:`2024-27281`, :cve_nist:`2024-27280`
+-  ``tiff``: :cve_nist:`2024-7006`
+-  ``vim``: :cve_nist:`2024-41957`, :cve_nist:`2024-41965`, :cve_nist:`2024-43374`, :cve_nist:`2024-43790`, :cve_nist:`2024-43802`
+-  ``wget``: :cve_nist:`2024-38428`
+-  ``wpa-supplicant``: :cve_nist:`2024-5290`, :cve_nist:`2023-52160`
+-  ``xserver-xorg``: :cve_nist:`2024-31080`, :cve_nist:`2024-31081`, :cve_nist:`2024-31082`, :cve_nist:`2024-31083`
 
 Recipe Upgrades in 5.1
 ~~~~~~~~~~~~~~~~~~~~~~

---
base-commit: 7b40c7b73a360a1ec383c4c9f00c3e126208320b
change-id: 20241104-new-cve-role-84b8deba9c67

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


