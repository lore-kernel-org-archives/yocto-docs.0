Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9240DCCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 15:20:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16148.1762960794931302906
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 07:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E171E1595
	for <docs@lists.yoctoproject.org>; Wed, 12 Nov 2025 07:19:46 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 355263F66E
	for <docs@lists.yoctoproject.org>; Wed, 12 Nov 2025 07:19:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] documentation: link to the Releases page on yoctoproject.org instead of wiki
Date: Wed, 12 Nov 2025 15:19:49 +0000
Message-ID: <20251112151949.2524963-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Nov 2025 15:20:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8024

We have a machine-generated Releases page[1] which is preferable to the
wiki.

[1] https://www.yoctoproject.org/development/releases/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/contributor-guide/submit-changes.rst | 4 ++--
 documentation/dev-manual/layers.rst                | 7 +++----
 documentation/dev-manual/poky-manual-setup.rst     | 2 +-
 documentation/dev-manual/security-subjects.rst     | 2 +-
 documentation/dev-manual/start.rst                 | 2 +-
 documentation/ref-manual/release-process.rst       | 3 ++-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documen=
tation/contributor-guide/submit-changes.rst
index e3b29500d3..0c2120eb04 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -697,8 +697,8 @@ backported to a stable branch unless the bug in quest=
ion does not affect the
 master branch or the fix on the master branch is unsuitable for backport=
ing.
=20
 The list of stable branches along with the status and maintainer for eac=
h
-branch can be obtained from the
-:yocto_wiki:`Releases wiki page </Releases>`.
+branch can be obtained from the :yocto_home:`Releases </development/rele=
ases/>`
+page.
=20
 .. note::
=20
diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manu=
al/layers.rst
index cc7103ba61..8b1341c8f3 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -123,10 +123,9 @@ Follow these general steps to create your layer with=
out using tools:
       Lists all layers on which this layer depends (if any).
=20
    -  :term:`LAYERSERIES_COMPAT`:
-      Lists the :yocto_wiki:`Yocto Project </Releases>`
-      releases for which the current version is compatible. This
-      variable is a good way to indicate if your particular layer is
-      current.
+      Lists the :yocto_home:`Yocto Project releases </development/releas=
es/>`
+      for which the current version is compatible. This variable is a go=
od
+      way to indicate if your particular layer is current.
=20
=20
    .. note::
diff --git a/documentation/dev-manual/poky-manual-setup.rst b/documentati=
on/dev-manual/poky-manual-setup.rst
index 3e7c7d5066..bcda9d7e7d 100644
--- a/documentation/dev-manual/poky-manual-setup.rst
+++ b/documentation/dev-manual/poky-manual-setup.rst
@@ -16,7 +16,7 @@ document guides through this setup step-by-step.
 Use Git to Clone The Layers
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
-Go to :yocto_wiki:`Releases wiki page </Releases>`, and choose a release
+Go to the :yocto_home:`Releases </development/releases/>` page, and choo=
se a release
 (such as ``&DISTRO_REL_LATEST_TAG;``), corresponding to either the lates=
t stable
 release or a Long Term Support release.
=20
diff --git a/documentation/dev-manual/security-subjects.rst b/documentati=
on/dev-manual/security-subjects.rst
index 6785b5a16a..2746852138 100644
--- a/documentation/dev-manual/security-subjects.rst
+++ b/documentation/dev-manual/security-subjects.rst
@@ -44,7 +44,7 @@ See the
 documentation for details regarding the policies and maintenance of stab=
le
 branches.
=20
-The :yocto_wiki:`Releases page </Releases>` contains a list
+The :yocto_home:`Releases </development/releases/>` page contains a list
 of all releases of the Yocto Project. Versions in gray are no longer act=
ively
 maintained with security patches, but well-tested patches may still be a=
ccepted
 for them for significant issues.
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manua=
l/start.rst
index 2a1be7260e..b21cd4f0f8 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -661,7 +661,7 @@ described in the ":ref:`dev-manual/start:accessing so=
urce archives`" section.
    .. note::
=20
       For a "map" of Yocto Project releases to version numbers, see the
-      :yocto_wiki:`Releases </Releases>` wiki page.
+      :yocto_home:`Releases </development/releases/>` page.
=20
    You can use the "RELEASE ARCHIVE" link to reveal a menu of all Yocto
    Project releases.
diff --git a/documentation/ref-manual/release-process.rst b/documentation=
/ref-manual/release-process.rst
index 639921b9f6..8263548448 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -62,7 +62,8 @@ codename are likely to be compatible and thus work toge=
ther.
=20
 Releases are given a nominal release version as well but the codename is
 used in repositories for this reason. You can find information on Yocto
-Project releases and codenames at :yocto_wiki:`/Releases`.
+Project releases and codenames in the :yocto_home:`Releases page
+</development/releases/>`.
=20
 Our :doc:`/migration-guides/index` detail how to migrate from one releas=
e of
 the Yocto Project to the next.
--=20
2.43.0


