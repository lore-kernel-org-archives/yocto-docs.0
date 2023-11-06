Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D280C001B2
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:59 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.50728.1699266595123280964
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 797FA28460;
	Mon,  6 Nov 2023 05:29:54 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 9CBCD28599;
	Mon,  6 Nov 2023 05:29:53 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 03/12] ref-manual: remove semicolons from *PROCESS_COMMAND variables
Date: Mon,  6 Nov 2023 23:29:33 +1300
Message-Id: <f2998d26b8a6522c200cd8289720b5409e9a5d45.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4589

In nanbield these are no longer needed - spaces are sufficient.
The code still handles any semicolons (replacing them with spaces before
interpreting the value), but let's avoid people adding them from now on
in case we decide to change that in future.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/variables.rst | 36 ++++++++++++++------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 82cef4511ca..12889a50857 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3802,9 +3802,9 @@ system and gives an overview of their function and =
contents.
    :term:`IMAGE_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system creates the final image output files. You can specify
-      functions separated by semicolons::
+      functions separated by spaces::
=20
-         IMAGE_POSTPROCESS_COMMAND +=3D "function; ... "
+         IMAGE_POSTPROCESS_COMMAND +=3D "function"
=20
       If you need to pass the root filesystem path to a command within t=
he
       function, you can use ``${IMAGE_ROOTFS}``, which points to the
@@ -3815,9 +3815,9 @@ system and gives an overview of their function and =
contents.
    :term:`IMAGE_PREPROCESS_COMMAND`
       Specifies a list of functions to call before the OpenEmbedded buil=
d
       system creates the final image output files. You can specify
-      functions separated by semicolons::
+      functions separated by spaces::
=20
-         IMAGE_PREPROCESS_COMMAND +=3D "function; ... "
+         IMAGE_PREPROCESS_COMMAND +=3D "function"
=20
       If you need to pass the root filesystem path to a command within t=
he
       function, you can use ``${IMAGE_ROOTFS}``, which points to the
@@ -6488,9 +6488,9 @@ system and gives an overview of their function and =
contents.
    :term:`POPULATE_SDK_POST_HOST_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the host part of the SDK. You can specify
-      functions separated by semicolons::
+      functions separated by spaces::
=20
-          POPULATE_SDK_POST_HOST_COMMAND +=3D "function; ... "
+          POPULATE_SDK_POST_HOST_COMMAND +=3D "function"
=20
       If you need to pass the SDK path to a command within a function, y=
ou
       can use ``${SDK_DIR}``, which points to the parent directory used =
by
@@ -6500,9 +6500,9 @@ system and gives an overview of their function and =
contents.
    :term:`POPULATE_SDK_POST_TARGET_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the target part of the SDK. You can specify
-      functions separated by semicolons::
+      functions separated by spaces::
=20
-         POPULATE_SDK_POST_TARGET_COMMAND +=3D "function; ... "
+         POPULATE_SDK_POST_TARGET_COMMAND +=3D "function"
=20
       If you need to pass the SDK path to a command within a function, y=
ou
       can use ``${SDK_DIR}``, which points to the parent directory used =
by
@@ -7104,9 +7104,9 @@ system and gives an overview of their function and =
contents.
    :term:`ROOTFS_POSTINSTALL_COMMAND`
       Specifies a list of functions to call after the OpenEmbedded build
       system has installed packages. You can specify functions separated=
 by
-      semicolons::
+      spaces::
=20
-         ROOTFS_POSTINSTALL_COMMAND +=3D "function; ... "
+         ROOTFS_POSTINSTALL_COMMAND +=3D "function"
=20
       If you need to pass the root filesystem path to a command within a
       function, you can use ``${IMAGE_ROOTFS}``, which points to the
@@ -7117,9 +7117,9 @@ system and gives an overview of their function and =
contents.
    :term:`ROOTFS_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system has created the root filesystem. You can specify functions
-      separated by semicolons::
+      separated by spaces::
=20
-         ROOTFS_POSTPROCESS_COMMAND +=3D "function; ... "
+         ROOTFS_POSTPROCESS_COMMAND +=3D "function"
=20
       If you need to pass the root filesystem path to a command within a
       function, you can use ``${IMAGE_ROOTFS}``, which points to the
@@ -7132,9 +7132,9 @@ system and gives an overview of their function and =
contents.
       system has removed unnecessary packages. When runtime package
       management is disabled in the image, several packages are removed
       including ``base-passwd``, ``shadow``, and ``update-alternatives``=
.
-      You can specify functions separated by semicolons::
+      You can specify functions separated by spaces::
=20
-         ROOTFS_POSTUNINSTALL_COMMAND +=3D "function; ... "
+         ROOTFS_POSTUNINSTALL_COMMAND +=3D "function"
=20
       If you need to pass the root filesystem path to a command within a
       function, you can use ``${IMAGE_ROOTFS}``, which points to the
@@ -7145,9 +7145,9 @@ system and gives an overview of their function and =
contents.
    :term:`ROOTFS_PREPROCESS_COMMAND`
       Specifies a list of functions to call before the OpenEmbedded buil=
d
       system has created the root filesystem. You can specify functions
-      separated by semicolons::
+      separated by spaces::
=20
-         ROOTFS_PREPROCESS_COMMAND +=3D "function; ... "
+         ROOTFS_PREPROCESS_COMMAND +=3D "function"
=20
       If you need to pass the root filesystem path to a command within a
       function, you can use ``${IMAGE_ROOTFS}``, which points to the
@@ -7462,7 +7462,9 @@ system and gives an overview of their function and =
contents.
    :term:`SDK_POSTPROCESS_COMMAND`
       Specifies a list of functions to call once the OpenEmbedded build
       system creates the SDK. You can specify functions separated by
-      semicolons: SDK_POSTPROCESS_COMMAND +=3D "function; ... "
+      spaces:
+
+         SDK_POSTPROCESS_COMMAND +=3D "function"
=20
       If you need to pass an SDK path to a command within a function, yo=
u
       can use ``${SDK_DIR}``, which points to the parent directory used =
by
--=20
2.34.1


