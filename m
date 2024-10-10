Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EADFCF11E0
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.41666.1728562261698495604
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZjU3NYkb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26736FF814;
	Thu, 10 Oct 2024 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYU15aGoDWKxeUl0MGLNEJc4ObxT7/w2Rarn6Qp8kK0=;
	b=ZjU3NYkb6HP5wyuemkEDZHXkfs2Xp4zIcfIyi/7/Gp2cxGqgWrX7V/tlbNeSaHagOgFDnC
	nvrrVJHzS4Cbc98slEOoz2GnI9/5fcYpROAV/EvbtTZ+ssOTzSfw+34V6q64nm2cO0YMkt
	iVcr/Dw0uGtA16mSIAyuPGVlRlikIZhOlptcmElt9qxVES+Lfrte+rP60DOs4mkw81OTl3
	1Zc4nLW42di/BLbsI8lx6k7I+RfWDaSR0TWIqpOxAw8n6Gf4eE9Qd3sUgfVqacQnKKaZd3
	1KLB4NemNwk3Eu9bKUTkfo1BJZkXdwF8605GMLDV0vZEn3O9E4+V/WBEq7Fwng==
From: antonin.godard@bootlin.com
Date: Thu, 10 Oct 2024 14:10:40 +0200
Subject: [PATCH v3 15/16] release-notes-5.1: update for several section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-release-note-5-1-v3-15-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Lee Chee Yang <chee.yang.lee@intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11449;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=14WGYCfVoC1iyNiGv9TyVnUWwvPU8pBUTdE95hg24LA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8RPIlUI48pchZGd159oMZdUTS3PZr5MdCtJ1
 Ijf8yU05O2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETwAKCRDRgEFAKaOo
 NiIZD/4l4tar5pf4MKdEUpJuYt15dyRLU0hgY2G0/n8tcNEviyjuuBzSg7L+q2LwHyes8JeI75B
 aH2UDQmNAWx/idvfdAvsLiuXv7fUI+jmnhRU9eIRZtmdt3PufafKcwr4IJrEAG9URT5MbwWGM15
 meC8YKP2NK6LhvH+jwfcepRYbV1qxzLYa2eC+rGcIeoyNDw4WcDNxVsEo761is9fa6N019OCSGl
 qeGxdyIN44EHTdA2lb4AlFKFCh5H7+ko32g/rwXTW/KVSxn5ORas+KbztsYG8X3UMjnPFmQHKig
 UcUsCyGhBwC2oGVcTV/WxEBPYdBUpFG3JsmemlYifRgy6ZJ9JpIKJg+nTKQbF2uzN/mAuuJpp3c
 EJ0UQCeBLkdwz799h7DZMUrCDKOlgp7yidt5hFy6Yy55x3p1v+LaGZD3YrPL0GZNKoVdpSy+6Zp
 V31FHIlu013rPZJsjczXGm6GnH8KwNIHshCx0P/ncUMdxuRGKci+ty+7feLT426cBoVXP0WIL49
 iEBLtfVbrVGxgSvGg9lgJKU3yWqNA34Afx5OiOyhHgwbiQf6fddsTdxdjmCVXItR02TS7cxfUZx
 FP0ILpXyeZBsXE4tmvjsugYYP+FREhpR2jZ4HOTCVSNeDzOPTWpYui5Sl15iyVab0bJiEqYIJXM
 1unF1GkacSBbdsg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5468

From: Lee Chee Yang <chee.yang.lee@intel.com>

update for these changes:
 - license
 - recipe enable for ptests
 - new class, recipe and variable.
 - PACKAGECONFIG
 - some utility script, class and include file.
 - bitbake.
 - qemu/runqemu.
 - Contributors.

removed wic as no significant change or improvement.

Antonin Godard: amend and fix some typos.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.1.rst         | 316 ++++++++++++++++++++-
 1 file changed, 312 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 074d277da..ff307f45e 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -10,30 +10,102 @@ New Features / Enhancements in 5.1
 
 -  New variables:
 
+   -  :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`: suffix for the CVE JSON manifest file.
+
+   -  :term:`PRSERV_UPSTREAM`: Upstream PR service (``host:port``) for the local
+      PR server to connect to.
+
+   -  :term:`RECIPE_UPGRADE_EXTRA_TASKS`: space-delimited list of tasks to run
+      after the new sources have been unpacked in the
+      ``scripts/lib/devtool/upgrade.py`` upgrade() method.
+
+   -  :term:`UNPACKDIR`: allow change of the :ref:`ref-tasks-unpack` task
+      directory.
+
 -  Architecture-specific enhancements:
 
--  Kernel-related enhancements:
+  -  The default kernel is the current stable (6.10), and there is also support
+     for the latest long-term release (6.6).
 
 -  New core recipes:
 
+   -  `fmt <https://fmt.dev>`__: an open-source formatting library for C++
+      (imported from meta-oe).
+
+   -  `xcb-util-errors <http://xcb.freedesktop.org/XcbUtil/>`__: gives human
+      readable names to error codes and event codes
+
 -  QEMU / ``runqemu`` enhancements:
 
--  Rust improvements:
+   -  runqemu: ``QB_DRIVE_TYPE`` now support for sd card (``/dev/mmcblk``)
 
--  wic Image Creator enhancements:
+-  Rust improvements:
 
 -  SDK-related improvements:
 
+   -  included ``nativesdk-python3-pip`` in buildtools.
+
 -  Testing:
 
    -  oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir
 
-   -  Enable ptests for ``python3-libarchive-c``
+   -  Enable ptests for ``python3-cffi``, ``python3-idna``, ``python3-libarchive-c``,
+      ``python3-mako``, ``python3-packaging``, ``python3-uritools`` and ``python3-rpds-py``.
+   -  Included ``nativesdk-python3-pip`` in :term:`buildtools` by default.
+
+   -  Enable ptests for ``python3-cffi``, ``python3-idna``,
+      ``python3-libarchive-c``, ``python3-mako``, ``python3-packaging``,
+      ``python3-uritools`` and ``python3-rpds-py``.
 
 -  Utility script changes:
 
+   -  New ``cve-json-to-text`` script that converts the ``cve-check`` result
+      from the JSON format to the TEXT format as ``cve-check`` removed text
+      format.
+
+   -  New ``makefile-getvar`` script to extract value from a Makefile.
+
+   -  New ``pull-spdx-licenses`` script to pull SPDX license data, update
+      license list JSON data and update license directory.
+
+   -  Several improvements in ``oe-build-perf-report`` report.
+
+   -  ``oe-debuginfod``: add parameter "-d" to store debuginfod files in project
+      sub-directory.
+
+   -  ``resulttool``: support test report generation in JUnit XML format.
+
+
 -  BitBake improvements:
 
+   -  New go module fetcher (``gomod://``) for downloading module dependencies to the
+      module cache from a module proxy.
+
+   -  Fetcher for Rust crates: added a check for latest upstream version.
+
+   -  ``syncrpc`` now requires a minimum version of the websockets module depend
+      on Python version.
+
+   -  Improve ``bitbake-hashclient`` stress statistics reporting.
+
+   -  ``bitbake-hashserv`` added ``reuseport`` parameter to enable SO_REUSEPORT,
+      allowing multiple servers to bind to the same port for load balancing
+
+   -  Improve cloning speed with :term:`BB_GIT_SHALLOW` and
+      :term:`BB_GENERATE_MIRROR_TARBALLS`.
+
+   -  `BitBake` UI now includes log paths for failed task.
+
+   -  ``fetcher2``: support for wget and wget2.
+
+   -  ``fetcher2``: support npm package name with '@' character.
+
+   -  ``fetcher2``: remote name for ``git://`` is now ``origin`` by default.
+
+   -  Codeparser now support shell substitution in quotes, for example::
+
+         var1="$(cmd1 ...)"
+
 -  devtool improvements:
 
    - Fix ``_test_devtool_add_git_url`` test
@@ -52,6 +124,52 @@ New Features / Enhancements in 5.1
 
    -  Fix reproducibility for ``spirv-tools``
 
+   -  Allow selection of host key types used by openssh.
+
+   -  New glibc task ``do_symlist`` to list exported symbols.
+
+   -  ``initramfs-framework`` support for force reboot in the case of fatal error.
+
+   -  The :ref:`ref-classes-insane` class now checks for ``patch-status`` and
+      ``pep517-backend`` by default.
+
+   -  New ``yocto-space-optimize`` include file to allow turning off debug compiler options
+      for a small set of recipes to reduce build on disk footprint and package/sstate sizes.
+
+   -  Image creation tasks inheriting from the :ref:`ref-classes-image` class
+      now produce a ``manifest.json`` file listing the images created. The
+      output manifest path is defined by the :term:`IMAGE_OUTPUT_MANIFEST`
+      variable.
+
+   -  New :ref:`ref-classes-vex` class generates the minimum information that is necessary
+      for VEX generation by an external CVE checking tool.
+
+   -  New :ref:`ref-classes-retain` class creates a tarball of the work directory for a recipe
+      when one of its tasks fails, or any other nominated directories.
+
+   -  New ``localpkgfeed`` class in meta-selftest to create a subset of the
+      package feed that just contain the packages depended on by this recipe.
+
+   -  New :term:`PACKAGECONFIG` options for individual recipes:
+
+      -  ``appstream``: qt6
+      -  ``cronie``: inotify
+      -  ``gstreamer1``.0-plugins-bad: gtk3
+      -  ``libsdl2``: libsamplerate
+      -  ``mesa``: tegra
+      -  ``openssh``: hostkey-rsa hostkey-ecdsa hostkey-ed25519
+      -  ``pciutils``: kmod zlib
+      -  ``piglit``: wayland
+      -  ``pulseaudio``: oss-output
+      -  ``python3``: staticlibpython
+      -  ``python3-jsonschema``: format-nongpl (previously "nongpl")
+      -  ``systemd``: bpf-framework
+      -  ``util-linux``: libmount-mountfd-support
+
+   -  Stop referring :term:`WORKDIR` for :term:`S` and :term:`B` and trigger
+      :ref:`ref-classes-insane` errors when :term:`S` or :term:`B` are equal to
+      :term:`WORKDIR`.
+
 Known Issues in 5.1
 ~~~~~~~~~~~~~~~~~~~
 
@@ -60,6 +178,20 @@ Recipe License changes in 5.1
 
 The following corrections have been made to the :term:`LICENSE` values set by recipes:
 
+-  ``dejagnu``: update :term:`LICENSE` to ``GPL-3.0-only``.
+-  ``gcr``: update :term:`LICENSE` to ``LGPL-2.0-only``.
+-  ``glibc``: update :term:`LICENSE` to ``GPL-2.0-only & LGPL-2.1-or-later``.
+-  ``gpgme``: update :term:`LICENSE` for different packages.
+-  ``libgcrypt``: add license ``BSD-3-Clause``.
+-  ``linux-firmware``: separate license ``Firmware-linaro`` for linaro-license package.
+-  ``iw``: update :term:`LICENSE` to ``ISC``.
+-  ``ppp``: add license ``RSA-MD`` .
+-  ``tiff``: update :term:`LICENSE` to ``libtiff``.
+-  ``unzip``: update :term:`LICENSE` to ``Info-ZIP``.
+-  ``xz``: add :term:`LICENSE` ``PD`` for xz, xz-dev and xz-doc package.
+-  ``zip``: update :term:`LICENSE` to ``Info-ZIP``.
+
+
 Security Fixes in 5.1
 ~~~~~~~~~~~~~~~~~~~~~
 
@@ -71,5 +203,181 @@ Contributors to 5.1
 
 Thanks to the following people who contributed to this release:
 
+- Adithya Balakumar
+- Adriaan Schmidt
+- Adrian Freihofer
+- Alban Bedel
+- Alejandro Hernandez Samaniego
+- Aleksandar Nikolic
+- Alessandro Pecugi
+- Alexander Kanavin
+- Alexander Sverdlin
+- Alexandre Belloni
+- Alexandre Truong
+- Alexis Lothoré
+- Andrew Fernandes
+- Andrew Oppelt
+- Andrey Zhizhikin
+- Anton Almqvist
+- Antonin Godard
+- Anuj Mittal
+- Archana Polampalli
+- Bartosz Golaszewski
+- Benjamin Bara
+- Benjamin Szőke
+- Bruce Ashfield
+- Carlos Alberto Lopez Perez
+- Changhyeok Bae
+- Changqing Li
+- Chen Qi
+- Chris Laplante
+- Chris Spencer
+- Christian Bräuner Sørensen
+- Christian Lindeberg
+- Christian Taedcke
+- Clara Kowalsky
+- Clément Péron
+- Colin McAllister
+- Corentin Lévy
+- Daniel Klauer
+- Daniel Semkowicz
+- Daniil Batalov
+- Dan McGregor
+- Deepesh Varatharajan
+- Deepthi Hemraj
+- Denys Dmytriyenko
+- Divya Chellam
+- Dmitry Baryshkov
+- Emil Kronborg
+- Enguerrand de Ribaucourt
+- Enrico Jörns
+- Esben Haabendal
+- Etienne Cordonnier
+- Fabio Estevam
+- Felix Nilsson
+- Florian Amstutz
+- Gassner, Tobias.ext
+- Gauthier HADERER
+- Guðni Már Gilbert
+- Harish Sadineni
+- Heiko Thole
+- Het Patel
+- Hongxu Jia
+- Igor Opaniuk
+- Intaek Hwang
+- Iskander Amara
+- Jaeyoon Jung
+- Jan Vermaete
+- Jasper Orschulko
+- Joe Slater
+- Johannes Schneider
+- John Ripple
+- Jonas Gorski
+- Jonas Munsin
+- Jonathan GUILLOT
+- Jon Mason
+- Jookia
+- Jordan Crouse
+- Jörg Sommer
+- Jose Quaresma
+- Joshua Watt
+- Julien Stephan
+- Kai Kang
+- Kari Sivonen
+- Khem Raj
+- Kirill Yatsenko
+- Konrad Weihmann
+- Lee Chee Yang
+- Lei Maohui
+- Leon Anavi
+- Leonard Göhrs
+- Louis Rannou
+- Marc Ferland
+- Marcus Folkesson
+- Marek Vasut
+- Mark Hatle
+- Markus Volk
+- Marlon Rodriguez Garcia
+- Marta Rybczynska
+- Martin Hundebøll
+- Martin Jansa
+- Matthew Bullock
+- Matthias Pritschet
+- Maxin B. John
+- Michael Glembotzki
+- Michael Haener
+- Michael Halstead
+- Michael Opdenacker
+- Michal Sieron
+- Mikko Rapeli
+- Mingli Yu
+- Naveen Saini
+- Niko Mauno
+- Ninette Adhikari
+- Noe Galea
+- Ola x Nilsson
+- Oleksandr Hnatiuk
+- Otavio Salvador
+- Patrick Wicki
+- Paul Barker
+- Paul Eggleton
+- Paul Gerber
+- Pedro Ferreira
+- Peter Kjellerstedt
+- Peter Marko
+- Philip Lorenz
+- Poonam Jadhav
+- Primoz Fiser
+- Quentin Schulz
+- Ralph Siemsen
+- Rasmus Villemoes
+- Ricardo Simoes
+- Richard Purdie
+- Robert Joslyn
+- Robert Kovacsics
+- Robert Yang
+- Ross Burton
+- Rudolf J Streif
+- Ryan Eatmon
+- Sabeeh Khan
+- Sakib Sajal
+- Samantha Jalabert
+- Siddharth Doshi
+- simit.ghane
+- Simone Weiß
+- Soumya Sambu
+- Sreejith Ravi
+- Stefan Mueller-Klieser
+- Sundeep KOKKONDA
+- Sven Schwermer
+- Teresa Remmet
+- Theodore A. Roth
+- Thomas Perrot
+- Tim Orling
+- Tom Hochstein
+- Trevor Gamblin
+- Troels Dalsgaard Hoffmeyer
+- Tronje Krabbe
+- Ulrich Ölmann
+- Victor Kamensky
+- Vijay Anusuri
+- Vincent Kriek
+- Vivek Puar
+- Wadim Egorov
+- Wang Mingyu
+- Weisser, Pascal.ext
+- Willy Tu
+- Xiangyu Chen
+- Yang-Mark Zhang
+- Yash Shinde
+- Yi Zhao
+- Yoann Congal
+- Yogita Urade
+- Yuri D'Elia
+- Zahir Hussain
+- Zev Weiss
+- Zoltan Boszormenyi
+
+
 Repositories / Downloads for Yocto-5.1
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
2.46.0


