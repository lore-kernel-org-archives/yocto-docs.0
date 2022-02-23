Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12DCC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 10:52:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.6087.1645613541759744795
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 02:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 17E7D1BF204;
	Wed, 23 Feb 2022 10:52:18 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/2] docs: fix hardcoded link warning messages
Date: Wed, 23 Feb 2022 11:52:05 +0100
Message-Id: <20220223105206.2766014-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 10:52:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2491

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Sphinx complains about hardcoded links which can be replaced by an
extlink.

So let's apply its recommendations.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/bsp-guide/bsp.rst               |  7 +-
 .../migration-guides/migration-3.4.rst        | 82 +++++++++----------
 documentation/overview-manual/yp-intro.rst    |  4 +-
 .../ref-manual/system-requirements.rst        |  2 +-
 documentation/ref-manual/terms.rst            |  2 +-
 5 files changed, 49 insertions(+), 48 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index f8d38ca48..ab8ed5480 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -166,8 +166,9 @@ section.
 #. *Determine the BSP Layer You Want:* The Yocto Project supports many
    BSPs, which are maintained in their own layers or in layers designed
    to contain several BSPs. To get an idea of machine support through
-   BSP layers, you can look at the `index of
-   machines <&YOCTO_RELEASE_DL_URL;/machines>`__ for the release.
+   BSP layers, you can look at the
+   :yocto_dl:`index of machines </releases/yocto/yocto-&DISTRO;/machines>`
+   for the release.
 
 #. *Optionally Clone the meta-intel BSP Layer:* If your hardware is
    based on current Intel CPUs and devices, you can leverage this BSP
@@ -877,7 +878,7 @@ Yocto Project:
    your BSP layer as listed in the ``recipes.txt`` file, which is found
    in ``poky/meta`` directory of the :term:`Source Directory`
    or in the OpenEmbedded-Core Layer (``openembedded-core``) at
-   https://git.openembedded.org/openembedded-core/tree/meta.
+   :oe_git:`/openembedded-core/tree/meta`.
 
    You should place recipes (``*.bb`` files) and recipe modifications
    (``*.bbappend`` files) into ``recipes-*`` subdirectories by
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 4e4fbd8bf..40e01d4f8 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -139,7 +139,7 @@ configuration provided and tested by the Yocto Project, there is
 simply no sense in continuing to enable prelink.
 
 There's also a concern that no one is maintaining the code, and there
-are open bugs (including `this serious one <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14429>`__).
+are open bugs (including :yocto_bugs:`this serious one </show_bug.cgi?id=14429>`).
 Given that prelink does intricate address arithmetic and rewriting
 of binaries the best option is to disable the feature. It is recommended
 that you consider disabling this feature in your own configuration if
@@ -162,7 +162,7 @@ location; e.g. x86 tune files have moved into an ``x86`` subdirectory,
 MIPS tune files have moved into a ``mips`` subdirectory, etc.
 The ARM tunes have an extra level (``armv8a``, ``armv8m``, etc.) and
 some have been renamed to make them uniform with the rest of the tunes.
-See `this commit <http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=1d381f21f5f13aa0c4e1a45683ed656ebeedd37d>`__
+See :yocto_git:`this commit </poky/commit/?id=1d381f21f5f13aa0c4e1a45683ed656ebeedd37d>`
 for reference.
 
 If you have any references to tune files (e.g. in custom machine
@@ -988,9 +988,9 @@ Repositories / Downloads for 3.4
 poky
 
 -  Repository Location: https://git.yoctoproject.org/poky/
--  Branch: `honister <https://git.yoctoproject.org/poky/log/?h=honister>`__
--  Tag: `yocto-3.4 <https://git.yoctoproject.org/poky/tag/?h=yocto-3.4>`__
--  Git Revision: `f6d1126fff213460dc6954a5d5fc168606d76b66 <https://git.yoctoproject.org/poky/commit/?id=f6d1126fff213460dc6954a5d5fc168606d76b66>`__
+-  Branch: :yocto_git:`honister </poky/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4 </poky/tag/?h=yocto-3.4>`
+-  Git Revision: :yocto_git:`f6d1126fff213460dc6954a5d5fc168606d76b66 </poky/commit/?id=f6d1126fff213460dc6954a5d5fc168606d76b66>`
 -  Release Artefact:  poky-f6d1126fff213460dc6954a5d5fc168606d76b66
 -  sha: 11e8f5760f704eed1ac37a5b09b1a831b5254d66459be75b06a72128c63e0411
 -  Download Locations:
@@ -999,10 +999,10 @@ poky
 
 openembedded-core
 
--  Repository Location: https://git.openembedded.org/openembedded-core
--  Branch: `honister <https://git.openembedded.org/openembedded-core/log/?h=honister>`__
--  Tag: `2021-10-honister <https://git.openembedded.org/openembedded-core/tag/?h=2021-10-honister>`__
--  Git Revision: `bb1dea6806f084364b6017db2567f438e805aef0 <https://git.openembedded.org/openembedded-core/commit/?id=bb1dea6806f084364b6017db2567f438e805aef0>`__
+-  Repository Location: :oe_git:`/openembedded-core`
+-  Branch: :oe_git:`honister </openembedded-core/log/?h=honister>`
+-  Tag: :oe_git:`2021-10-honister </openembedded-core/tag/?h=2021-10-honister>`
+-  Git Revision: :oe_git:`bb1dea6806f084364b6017db2567f438e805aef0 </openembedded-core/commit/?id=bb1dea6806f084364b6017db2567f438e805aef0>`
 -  Release Artefact: oecore-bb1dea6806f084364b6017db2567f438e805aef0
 -  sha: 9a356c407c567b1c26e535cad235204b0462cb79321fefb0844324a6020b31f4
 -  Download Locations:
@@ -1012,9 +1012,9 @@ openembedded-core
 meta-mingw
 
 -  Repository Location: https://git.yoctoproject.org/meta-mingw
--  Branch: `honister <https://git.yoctoproject.org/meta-mingw/log/?h=honister>`__
--  Tag: `yocto-3.4 <https://git.yoctoproject.org/meta-mingw/tag/?h=yocto-3.4>`__
--  Git Revision: `f5d761cbd5c957e4405c5d40b0c236d263c916a8 <https://git.yoctoproject.org/meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`__
+-  Branch: :yocto_git:`honister </meta-mingw/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4 </meta-mingw/tag/?h=yocto-3.4>`
+-  Git Revision: :yocto_git:`f5d761cbd5c957e4405c5d40b0c236d263c916a8 </meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`
 -  Release Artefact: meta-mingw-f5d761cbd5c957e4405c5d40b0c236d263c916a8
 -  sha: d4305d638ef80948584526c8ca386a8cf77933dffb8a3b8da98d26a5c40fcc11
 -  Download Locations:
@@ -1024,9 +1024,9 @@ meta-mingw
 meta-intel
 
 -  Repository Location: https://git.yoctoproject.org/meta-intel
--  Branch: `honister <https://git.yoctoproject.org/meta-intel/log/?h=honister>`__
--  Tag: `yocto-3.4 <https://git.yoctoproject.org/meta-intel/tag/?h=yocto-3.4>`__
--  Git Revision: `90170cf85fe35b4e8dc00eee50053c0205276b63 <https://git.yoctoproject.org/meta-intel/commit/?id=90170cf85fe35b4e8dc00eee50053c0205276b63>`__
+-  Branch: :yocto_git:`honister </meta-intel/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4 </meta-intel/tag/?h=yocto-3.4>`
+-  Git Revision: :yocto_git:`90170cf85fe35b4e8dc00eee50053c0205276b63 </meta-intel/commit/?id=90170cf85fe35b4e8dc00eee50053c0205276b63>`
 -  Release Artefact: meta-intel-90170cf85fe35b4e8dc00eee50053c0205276b63
 -  sha: 2b3b43386dfcaaa880d819c1ae88b1251b55fb12c622af3d0936c3dc338491fc
 -  Download Locations:
@@ -1036,9 +1036,9 @@ meta-intel
 meta-gplv2
 
 -  Repository Location: https://git.yoctoproject.org/meta-gplv2
--  Branch: `honister <https://git.yoctoproject.org/meta-gplv2/log/?h=honister>`__
--  Tag: `yocto-3.4 <https://git.yoctoproject.org/meta-gplv2/tag/?h=yocto-3.4>`__
--  Git Revision: `f04e4369bf9dd3385165281b9fa2ed1043b0e400 <https://git.yoctoproject.org/meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`__
+-  Branch: :yocto_git:`honister </meta-gplv2/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4 </meta-gplv2/tag/?h=yocto-3.4>`
+-  Git Revision: :yocto_git:`f04e4369bf9dd3385165281b9fa2ed1043b0e400 </meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`
 -  Release Artefact: meta-gplv2-f04e4369bf9dd3385165281b9fa2ed1043b0e400
 -  sha: ef8e2b1ec1fb43dbee4ff6990ac736315c7bc2d8c8e79249e1d337558657d3fe
 -  Download Locations:
@@ -1047,10 +1047,10 @@ meta-gplv2
 
 bitbake
 
--  Repository Location: https://git.openembedded.org/bitbake
--  Branch: `1.52 <https://git.openembedded.org/bitbake/log/?h=1.52>`__
--  Tag: `2021-10-honister <https://git.openembedded.org/bitbake/tag/?h=2021-10-honister>`__
--  Git Revision: `c78ebac71ec976fdf27ea24767057882870f5c60 <https://git.openembedded.org/bitbake/commit/?id=c78ebac71ec976fdf27ea24767057882870f5c60>`__
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`1.52 </bitbake/log/?h=1.52>`
+-  Tag: :oe_git:`2021-10-honister </bitbake/tag/?h=2021-10-honister>`
+-  Git Revision: :oe_git:`c78ebac71ec976fdf27ea24767057882870f5c60 </bitbake/commit/?id=c78ebac71ec976fdf27ea24767057882870f5c60>`
 -  Release Artefact: bitbake-c78ebac71ec976fdf27ea24767057882870f5c60
 -  sha: 8077c7e7528cd73ef488ef74de3943ec66cae361459e5b630fb3cbe89c498d3d
 -  Download Locations:
@@ -1060,9 +1060,9 @@ bitbake
 yocto-docs
 
 -  Repository Location: https://git.yoctoproject.org/yocto-docs
--  Branch: `honister <https://git.yoctoproject.org/yocto-docs/log/?h=honister>`__
--  Tag: `yocto-3.4 <https://git.yoctoproject.org/yocto-docs/tag/?h=yocto-3.4>`__
--  Git Revision: `d75c5450ecf56c8ac799a633ee9ac459e88f91fc <https://git.yoctoproject.org/yocto-docs/commit/?id=d75c5450ecf56c8ac799a633ee9ac459e88f91fc>`__
+-  Branch: :yocto_git:`honister </yocto-docs/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4 </yocto-docs/tag/?h=yocto-3.4>`
+-  Git Revision: :yocto_git:`d75c5450ecf56c8ac799a633ee9ac459e88f91fc </yocto-docs/commit/?id=d75c5450ecf56c8ac799a633ee9ac459e88f91fc>`
 
 Release notes for 3.4.1 (honister)
 ----------------------------------
@@ -1265,9 +1265,9 @@ Repositories / Downloads for 3.4.1
 poky
 
 -  Repository Location: https://git.yoctoproject.org/poky/
--  Branch: `honister <https://git.yoctoproject.org/poky/log/?h=honister>`__
--  Tag: `yocto-3.4.1 <https://git.yoctoproject.org/poky/tag/?h=yocto-3.4.1>`__
--  Git Revision: `b53230c08d9f02ecaf35b4f0b70512abbf10ae11 <https://git.yoctoproject.org/poky/commit/?id=b53230c08d9f02ecaf35b4f0b70512abbf10ae11>`__
+-  Branch: :yocto_git:`honister </poky/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4.1 </poky/tag/?h=yocto-3.4.1>`
+-  Git Revision: :yocto_git:`b53230c08d9f02ecaf35b4f0b70512abbf10ae11 </poky/commit/?id=b53230c08d9f02ecaf35b4f0b70512abbf10ae11>`
 -  Release Artefact: poky-b53230c08d9f02ecaf35b4f0b70512abbf10ae11
 -  sha: 57d49e2afafb555baf65643acf752464f0eb7842b964713a5de7530c392de159
 -  Download Locations:
@@ -1277,9 +1277,9 @@ poky
 meta-mingw
 
 -  Repository Location: https://git.yoctoproject.org/meta-mingw
--  Branch: `honister <https://git.yoctoproject.org/meta-mingw/log/?h=honister>`__
--  Tag: `yocto-3.4.1 <https://git.yoctoproject.org/meta-mingw/tag/?h=yocto-3.4.1>`__
--  Git Revision: `f5d761cbd5c957e4405c5d40b0c236d263c916a8 <https://git.yoctoproject.org/meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`__
+-  Branch: :yocto_git:`honister </meta-mingw/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4.1 </meta-mingw/tag/?h=yocto-3.4.1>`
+-  Git Revision: :yocto_git:`f5d761cbd5c957e4405c5d40b0c236d263c916a8 </meta-mingw/commit/?id=f5d761cbd5c957e4405c5d40b0c236d263c916a8>`
 -  Release Artefact: meta-mingw-f5d761cbd5c957e4405c5d40b0c236d263c916a8
 -  sha: d4305d638ef80948584526c8ca386a8cf77933dffb8a3b8da98d26a5c40fcc11
 -  Download Locations:
@@ -1289,9 +1289,9 @@ meta-mingw
 meta-gplv2
 
 -  Repository Location: https://git.yoctoproject.org/meta-gplv2
--  Branch: `honister <https://git.yoctoproject.org/meta-gplv2/log/?h=honister>`__
--  Tag: `yocto-3.4.1 <https://git.yoctoproject.org/meta-gplv2/tag/?h=yocto-3.4.1>`__
--  Git Revision: `f04e4369bf9dd3385165281b9fa2ed1043b0e400 <https://git.yoctoproject.org/meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`__
+-  Branch: :yocto_git:`honister </meta-gplv2/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4.1 </meta-gplv2/tag/?h=yocto-3.4.1>`
+-  Git Revision: :yocto_git:`f04e4369bf9dd3385165281b9fa2ed1043b0e400 </meta-gplv2/commit/?id=f04e4369bf9dd3385165281b9fa2ed1043b0e400>`
 -  Release Artefact: meta-gplv2-f04e4369bf9dd3385165281b9fa2ed1043b0e400
 -  sha: ef8e2b1ec1fb43dbee4ff6990ac736315c7bc2d8c8e79249e1d337558657d3fe
 -  Download Locations:
@@ -1300,10 +1300,10 @@ meta-gplv2
 
 bitbake
 
--  Repository Location: https://git.openembedded.org/bitbake
--  Branch: `1.52 <https://git.openembedded.org/bitbake/log/?h=1.52>`__
--  Tag: `yocto-3.4.1 <https://git.openembedded.org/bitbake/tag/?h=yocto-3.4.1>`__
--  Git Revision: `44a83b373e1fc34c93cd4a6c6cf8b73b230c1520 <https://git.openembedded.org/bitbake/commit/?id=44a83b373e1fc34c93cd4a6c6cf8b73b230c1520>`__
+-  Repository Location: :oe_git:`/bitbake`
+-  Branch: :oe_git:`1.52 </bitbake/log/?h=1.52>`
+-  Tag: :oe_git:`yocto-3.4.1 </bitbake/tag/?h=yocto-3.4.1>`
+-  Git Revision: :oe_git:`44a83b373e1fc34c93cd4a6c6cf8b73b230c1520 </bitbake/commit/?id=44a83b373e1fc34c93cd4a6c6cf8b73b230c1520>`
 -  Release Artefact: bitbake-44a83b373e1fc34c93cd4a6c6cf8b73b230c1520
 -  sha: 03d50c1318d88d62eb01d359412ea5a8014ef506266629a2bd43ab3a2ef19430
 -  Download Locations:
@@ -1313,6 +1313,6 @@ bitbake
 yocto-docs
 
 -  Repository Location: https://git.yoctoproject.org/yocto-docs
--  Branch: `honister <https://git.yoctoproject.org/yocto-docs/log/?h=honister>`__
--  Tag: `yocto-3.4.1 <https://git.yoctoproject.org/yocto-docs/tag/?h=yocto-3.4.1>`__
--  Git Revision: `b250eda5a0beba8acc9641c55a5b0e30594b5178 <https://git.yoctoproject.org/yocto-docs/commit/?b250eda5a0beba8acc9641c55a5b0e30594b5178>`__
+-  Branch: :yocto_git:`honister </yocto-docs/log/?h=honister>`
+-  Tag: :yocto_git:`yocto-3.4.1 </yocto-docs/tag/?h=yocto-3.4.1>`
+-  Git Revision: :yocto_git:`b250eda5a0beba8acc9641c55a5b0e30594b5178 </yocto-docs/commit/?b250eda5a0beba8acc9641c55a5b0e30594b5178>`
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index a8ca9e944..ce2aed519 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -217,8 +217,8 @@ your Metadata, the easier it is to cope with future changes.
    -  Use Board Support Package (BSP) layers from silicon vendors when
       possible.
 
-   -  Familiarize yourself with the `Yocto Project curated layer
-      index <https://www.yoctoproject.org/software-overview/layers/>`__
+   -  Familiarize yourself with the
+      :yocto_home:`Yocto Project curated layer index</software-overview/layers/>`
       or the :oe_layerindex:`OpenEmbedded layer index <>`.
       The latter contains more layers but they are less universally
       validated.
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index d7b7cec28..30294cb27 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -322,7 +322,7 @@ If you would prefer not to use the ``install-buildtools`` script, you can instea
 download and run a pre-built buildtools installer yourself with the following
 steps:
 
-1. Locate and download the ``*.sh`` at &YOCTO_RELEASE_DL_URL;/buildtools/
+1. Locate and download the ``*.sh`` at :yocto_dl:`/releases/yocto/yocto-&DISTRO;/buildtools/`
 
 2. Execute the installation script. Here is an example for the
    traditional installer::
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 09e0a98bb..3f18d3404 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -148,7 +148,7 @@ universal, the list includes them just in case:
       and so on.
 
       On the other hand, some container layers (such as
-      `meta-security <https://git.yoctoproject.org/cgit/cgit.cgi/meta-security>`_)
+      :yocto_git:`meta-security </meta-security>`)
       have a top-level directory that is itself an actual layer, as well as
       a variety of sub-layers, both of which could be included in your
       ``bblayers.conf`` file.
-- 
2.35.1


