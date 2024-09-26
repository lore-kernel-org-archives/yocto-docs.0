Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDA3C369CE
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:58:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web10.40681.1727351911479545441
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 04:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ap8Djwu1;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727351912; x=1758887912;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tkpnaYUwT/JfKdeKwrQ9m1te/kzHpAfwKs6FWXEHtRs=;
  b=ap8Djwu1DBK9tAljgZOVRIUbWFMya5NQMLK4mxOI9LKYmgC2izZgAIDY
   hI04QnW+GfYJmnI956/2NMecQ6EgzUb0+A9jfoJigQ3c0KlOHPSfXvXVJ
   C8WGm7eOJsUdMQ2LpwfulLFgZ686kHVRIIUWTo+GJ81S1hZFswdrWVCl+
   gXHpXxQADtAtPqan/MaIrPOmDFLMfzBunCUj7KJW3xWSqNB+eRQHkYl0q
   Ud12gcp4cTE2H8OxNVcVNtDw0lmo6mfz90NDc0ufbwZcWxl+FPPVU7DD0
   eIFKHaH6a2ktgbu7iNBCN30j8Iosrs4uT4cidzzqWQiILVXvzd3rJmO/+
   Q==;
X-CSE-ConnectionGUID: cX366LnfQvyGkOXO2ebwRA==
X-CSE-MsgGUID: XMkDifY+QiOFSQ8tmPGtxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="25947432"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="25947432"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 04:58:32 -0700
X-CSE-ConnectionGUID: PtHZcz1pTwCea0JrCK6gmA==
X-CSE-MsgGUID: 8vDI0e7lTaqUQ6+vC3qiAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="76207275"
Received: from cheeyang-desk1.png.intel.com ([172.30.130.8])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2024 04:58:30 -0700
From: chee.yang.lee@intel.com
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/1] release-notes-5.1: update for several section
Date: Thu, 26 Sep 2024 19:57:52 +0800
Message-Id: <20240926115752.2412800-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926115752.2412800-1-chee.yang.lee@intel.com>
References: <20240926115752.2412800-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Sep 2024 11:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5373

From: Lee Chee Yang <chee.yang.lee@intel.com>

update for these changes:-
 - license
 - recipe enable for ptests
 - new class, recipe and variable.
 - PACKAGECONFIG
 - some utility script, class and include file.
 - bitbake.
 - qemu/runqemu.
 - Contributors.
removed wic as no significant change or improvement.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../migration-guides/release-notes-5.1.rst    | 304 +++++++++++++++++-
 1 file changed, 301 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 8b51f5677..a6b414c20 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -10,30 +10,92 @@ New Features / Enhancements in 5.1
 
 -  New variables:
 
+   - :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`: suffix for the CVE JSON manifest file.
+
+   - :term:`PRSERVER_UPSTREAM`: Upstream PR service (host:port).
+
+   - :term:`RECIPE_UPGRADE_EXTRA_TASKS`: space-delimited list of tasks to run after the new
+     sources have been unpacked in scripts/lib/devtool/upgrade.py ugrade() method.
+
+   - :term:`UNPACKDIR`: allow change of do_unpack directory.
+
 -  Architecture-specific enhancements:
 
 -  Kernel-related enhancements:
 
+  - The default kernel is the current stable (6.10), and there is also support
+    for the latest long-term release (6.6).
+
 -  New core recipes:
 
+   -  `fmt <https://fmt.dev>`__: an open-source formatting library for C++. (from meta-oe)
+
+   -  `xcb-util-errors <http://xcb.freedesktop.org/XcbUtil/>`__: gives human readable
+      names to error codes and event codes
+
 -  QEMU / ``runqemu`` enhancements:
 
--  Rust improvements:
+   - runqemu: :term:`QB_DRIVE_TYPE` now support for sd card (/dev/mmcblk)
 
--  wic Image Creator enhancements:
+-  Rust improvements:
 
 -  SDK-related improvements:
 
+   -  included ``nativesdk-python3-pip`` in buildtools.
+
 -  Testing:
 
    -  oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir
 
-   -  Enable ptests for ``python3-libarchive-c``
+   -  Enable ptests for ``python3-cffi``, ``python3-idna``, ``python3-libarchive-c``,
+      ``python3-mako``, ``python3-packaging``, ``python3-uritools`` and ``pythonn3-rpds-py``.
 
 -  Utility script changes:
 
+   -  New ``cve-json-to-text`` script that converts the cve-check result from the JSON format
+      to the TEXT format as cve-check removed text format.
+
+   -  New ``makefile-getvar`` script to extract value from a Makefile.
+
+   -  New ``pull-spdx-licenses`` script to pull SPDX license data, update license list JSON
+      data and update license directory.
+
+   -  Several improvement in ``oe-build-perf-report`` report.
+
+   -  ``oe-debuginfod`` add parameter "-d" to store debuginfod files in project sub-directory.
+
+   -  ``resulttool`` support test report generation in JUnit XML format.
+
+
 -  BitBake improvements:
 
+   -  New go module fetcher (``gomod://``) for downloading module dependencies to the
+      module cache from a module proxy.
+
+   -  New go module fetcher (``gomodgit://``) for downloading module dependencies to the
+      module cache directly from a git repository.
+
+   -  Crate added check for latest upstream version.
+
+   -  Syncrpc required a minimum version of the websockets module depend on python version.
+
+   -  Improved bitbake-hashclient stress statistics reporting.
+
+   -  bitbake-hashserv added ``reuseport`` parameter to enable SO_REUSEPORT, allowing
+      multiple servers to bind to the same port for load balancing
+
+   -  improved cloning speed with :term:`BB_GIT_SHALLOW` and :term:`BB_GENERATE_MIRROR_TARBALLS`.
+
+   -  bitbake UI now include log paths for failed task.
+
+   -  fetcher2 support for wget and wget2.
+
+   -  fetcher2 support npm package name with '@' character.
+
+   -  Codeparser now support shell substitution in quotes, for example::
+
+         var1="$(cmd1 ...)"
+
 -  devtool improvements:
 
    - Fix _test_devtool_add_git_url test
@@ -52,6 +114,52 @@ New Features / Enhancements in 5.1
 
    -  spriv-tools is now repeatably reproducible
 
+   -  Allow selection of host key types used by openssh.
+
+   -  New glibc task do_symlist to list exported symbols.
+
+   -  initramfs-framework support for force reboot in the case of fatal error.
+
+   -  insane class now check for patch-status and pep517-backend by default.
+
+   -  New ``yocto-space-optimize`` include file to allow turning off debug compiler options
+      for a small set of recipes to reduce build on disk footprint and package/sstate sizes.
+
+   -  Update to SPDX license version 3.24.0
+
+   -  New :ref:`create-spdx-3.0` class to generate SPDX 3.0 output, :ref:`create-spdx-image-3.0`
+      class that is used when generating images and :ref:`create-spdx-sdk-3.0` for sdk
+      based recipes.
+
+   -  New :ref:`nospdx` class that allows recipes to opt out of generating SPDX.
+
+   -  New :ref:`Vex` class generates the minimum information that is necessary
+      for VEX generation by an external CVE checking tool.
+
+   -  New :ref:`retain` class creates a tarball of the work directory for a recipe
+      when one of its tasks fails, or any other nominated directories.
+
+   -  New :ref:`localpkgfeed` class create a subset of the package feed that just
+      contain the packages depended on by this recipe.
+
+   -  New :term:`PACKAGECONFIG` options for individual recipes:
+
+      - appstream: qt6
+      - cronie: inotify
+      - gstreamer1.0-plugins-bad: gtk3
+      - libsdl2: libsamplerate
+      - mesa: tegra
+      - openssl: hostkey-rsa hostkey-ecdsa hostkey-ed25519
+      - pciutils: kmod zlib
+      - piglit: wayland
+      - pulseaudio: oss-output
+      - python3: staticlibpython
+      - python3-jsonschema: format-nongpl (previously "nongpl")
+      - systemd: bpf-framework
+      - util-linux: libmount-mountfd-support
+
+   -  Stop referring :term:`WORKDIR` for :term:`S` and :term:`B`.
+
 Known Issues in 5.1
 ~~~~~~~~~~~~~~~~~~~
 
@@ -60,6 +168,20 @@ Recipe License changes in 5.1
 
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
 
@@ -71,5 +193,181 @@ Contributors to 5.1
 
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
2.34.1


