Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36035C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 11:10:07 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.26711.1704193796203371559
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Jan 2024 03:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=aurySTIC;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B62429C284E
	for <docs@lists.yoctoproject.org>; Tue,  2 Jan 2024 06:09:54 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Bg0SYQCJFD7Z; Tue,  2 Jan 2024 06:09:54 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0029A9C2BE2;
	Tue,  2 Jan 2024 06:09:53 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 0029A9C2BE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1704193794; bh=nMM9os88XBKC9QNQepZ+n0SD+lsoPt/srk+W41XCqRw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=aurySTICtOT2JUbd9BJ7gcO4kiIRWuTjjrthtd7w31jkZQEI4rgAqaw5aEKpR/l2N
	 2N4agYrmoePupeoxCZFx+nIxqwTnFisOIOTNoE8yWAe2iSuoLMzlkNA0eWhjEBx+jv
	 T+5WezEr6IIFQNY074UE2knfkbzi6o4JRGGx7pnpAYxLS6t9QeTlKlwM3uHxNfcIAp
	 c9ymSFq0NwYrvRXXhNH3ZmgrelgZ7a6+QaHeLjvZjXWwZ7wINJihR0pw5RxYIUuQQ2
	 PW247Ql0KutrOCEazdCBpqaUva9AklJmnkzPvVeNRyjLORSD/zP2eMOqSwLNmpsyeP
	 3FsTI3Pky27VA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id VCT7x_6hbpv8; Tue,  2 Jan 2024 06:09:53 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (unknown [192.168.216.123])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 750579C284E;
	Tue,  2 Jan 2024 06:09:53 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: docs@lists.yoctoproject.org
Cc: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH] manuals: document VSCode extension
Date: Tue,  2 Jan 2024 12:09:33 +0100
Message-Id: <20240102110932.42188-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Jan 2024 11:10:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4741

The VSCode extension is now officially maintained and published by the
Yocto Project so it should be referenced in the manuals to help users
discover it.

I located the most relevant places to reference the extension by looking
at how the old Eclipse plugin was documented in the 2.6 manuals as well
as the current Toaster references.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
---
 documentation/dev-manual/building.rst         |  4 ++++
 documentation/dev-manual/start.rst            | 15 +++++++++++---
 .../development-environment.rst               |  8 ++++++++
 documentation/overview-manual/yp-intro.rst    | 20 +++++++++++++++++++
 documentation/ref-manual/resources.rst        |  5 +++++
 documentation/what-i-wish-id-known.rst        |  7 +++++++
 6 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/building.rst b/documentation/dev-ma=
nual/building.rst
index a39579349..e964bd1ae 100644
--- a/documentation/dev-manual/building.rst
+++ b/documentation/dev-manual/building.rst
@@ -32,6 +32,10 @@ build host running Linux.
       OpenEmbedded build system, see the
       :doc:`/brief-yoctoprojectqs/index` document.
=20
+   -  You can also use the `Yocto Project BitBake
+      <https://marketplace.visualstudio.com/items?itemName=3Dyocto-proje=
ct.yocto-bitbake>`__
+      extension for Visual Studio Code to build images.
+
 The build process creates an entire Linux distribution from source and
 places it in your :term:`Build Directory` under ``tmp/deploy/images``. F=
or
 detailed information on the build process using BitBake, see the
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manua=
l/start.rst
index 4a556967e..e7c7867b3 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -334,7 +334,10 @@ to use the Extensible SDK, see the ":doc:`/sdk-manua=
l/extensible`" Chapter in th
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you want to work on the kernel, see the :doc:`/ker=
nel-dev/index`. If you are going to use
 Toaster, see the ":doc:`/toaster-manual/setup-and-use`"
-section in the Toaster User Manual.
+section in the Toaster User Manual. If you are a VSCode user, you can co=
nfigure
+the `Yocto Project BitBake
+<https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.yoc=
to-bitbake>`__
+extension accordingly.
=20
 Setting Up to Use CROss PlatformS (CROPS)
 -----------------------------------------
@@ -426,7 +429,10 @@ section. If you are going to use the Extensible SDK =
container, see the
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
 the ":doc:`/toaster-manual/setup-and-use`"
-section in the Toaster User Manual.
+section in the Toaster User Manual. If you are a VSCode user, you can co=
nfigure
+the `Yocto Project BitBake
+<https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.yoc=
to-bitbake>`__
+extension accordingly.
=20
 Setting Up to Use Windows Subsystem For Linux (WSL 2)
 -----------------------------------------------------
@@ -554,7 +560,10 @@ Extensible SDK container, see the ":doc:`/sdk-manual=
/extensible`" Chapter in the
 Project Application Development and the Extensible Software Development
 Kit (eSDK) manual. If you are going to use the Toaster container, see
 the ":doc:`/toaster-manual/setup-and-use`"
-section in the Toaster User Manual.
+section in the Toaster User Manual. If you are a VSCode user, you can co=
nfigure
+the `Yocto Project BitBake
+<https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.yoc=
to-bitbake>`__
+extension accordingly.
=20
 Locating Yocto Project Source Files
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/documentation/overview-manual/development-environment.rst b/=
documentation/overview-manual/development-environment.rst
index 262d5cb20..d79173ff5 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -131,6 +131,14 @@ are several ways of working in the Yocto Project env=
ironment:
    Toaster and on how to use Toaster in general, see the
    :doc:`/toaster-manual/index`.
=20
+-  *Using the VSCode Extension:* You can use the `Yocto Project BitBake
+   <https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.=
yocto-bitbake>`__
+   extension for Visual Studio Code to start your BitBake builds through=
 a
+   graphical user interface.
+
+   Learn more about the VSCode Extension on the `extension's marketplace=
 page
+   <https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.=
yocto-bitbake>`__.
+
 Yocto Project Source Repositories
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/o=
verview-manual/yp-intro.rst
index d694642af..1e6820c14 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -340,6 +340,18 @@ the Yocto Project:
    view information about builds. For information on Toaster, see the
    :doc:`/toaster-manual/index`.
=20
+-  *VSCode IDE Extension:* The `Yocto Project BitBake
+   <https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.=
yocto-bitbake>`__
+   extension for Visual Studio Code provides a rich set of features for =
working
+   with BitBake recipes. The extension provides syntax highlighting,
+   hover tips, and completion for BitBake files as well as embedded Pyth=
on and
+   Bash languages. Additional views and commands allow you to efficientl=
y
+   browse, build and edit recipes. It also provides SDK integration for
+   cross-compiling and debugging through ``devtool``.
+
+   Learn more about the VSCode Extension on the `extension's frontpage
+   <https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.=
yocto-bitbake>`__.
+
 Production Tools
 ----------------
=20
@@ -605,6 +617,14 @@ Build Host runs, you have several choices.
    For information about and how to use Toaster, see the
    :doc:`/toaster-manual/index`.
=20
+-  *Using the VSCode Extension:* You can use the `Yocto Project BitBake
+   <https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.=
yocto-bitbake>`__
+   extension for Visual Studio Code to start your BitBake builds through=
 a
+   graphical user interface.
+
+   Learn more about the VSCode Extension on the `extension's marketplace=
 page
+   <https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.=
yocto-bitbake>`__
+
 Reference Embedded Distribution (Poky)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-m=
anual/resources.rst
index 8c3726e83..8e54ac87c 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -169,6 +169,11 @@ Here is a list of resources you might find helpful:
    the :term:`OpenEmbedded Build System`, which uses
    BitBake, that reports build information.
=20
+-  `Yocto Project BitBake extension for VSCode
+   <https://marketplace.visualstudio.com/items?itemName=3Dyocto-project.=
yocto-bitbake>`__:
+   This extension provides a rich feature set when working with BitBake =
recipes
+   within the Visual Studio Code IDE.
+
 -  :yocto_wiki:`FAQ </FAQ>`: A list of commonly asked
    questions and their answers.
=20
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-=
i-wish-id-known.rst
index fe79bc012..5bc55804f 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -214,6 +214,13 @@ contact us with other suggestions.
      OpenEmbedded build system. If you are interested in using this type=
 of
      interface to create images, see the :doc:`/toaster-manual/index`.
=20
+   * **Discover the VSCode extension**: The `Yocto Project BitBake
+     <https://marketplace.visualstudio.com/items?itemName=3Dyocto-projec=
t.yocto-bitbake>`__
+     extension for the Visual Studio Code IDE provides language features=
 and
+     commands for working with the Yocto Project. If you are interested =
in using
+     this extension, visit its `marketplace page
+     <https://marketplace.visualstudio.com/items?itemName=3Dyocto-projec=
t.yocto-bitbake>`__.
+
    * **Have Available the Yocto Project Reference Manual**: Unlike the r=
est of
      the Yocto Project manual set, this manual is comprised of material =
suited
      for reference rather than procedures. You can get build details, a =
closer
--=20
2.34.1


