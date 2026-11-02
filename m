Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9097.1793611419290653942
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 01:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=UJr7kbIM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A59FE1A140C
	for <docs@lists.yoctoproject.org>; Mon,  2 Nov 2026 09:23:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7483A60750;
	Mon,  2 Nov 2026 09:23:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82F3F10329134;
	Mon,  2 Nov 2026 10:23:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793611416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Q7lYSpRTJW/ZItWV+OYPyx/0xNO7vzeaRbC+8dJlnA=;
	b=UJr7kbIM4gVqFogko0NO9A3VPVqOLJwYQ+jMHg7SDMVsmVeI9iCI/CuNBx/STSkzjhYe9k
	eIQXXaPkEvtO42D0hy4PB9Wh1RbdlCJ3wnbLKNGunvC2x4cB9XHXICLU2PMR6FhXI9RJZJ
	JJ4wJLX5KIyqSlS6U1NSWjPNf1dCDGZfzyIsmRvBjA2gNp1gqNqm/C+2u/Zuhm7pnxrwqP
	Q5tksKnH6to9ksWTag5S05w8F0e9KHldeXIFTAUjEi/efbypKwPkICRfpzuC0/0Thz9oxA
	KluoXZLJRLV+D7eHLoI599ebcyHbhRRwQz6rhwCqlCiKl5z6xQkBAeChoKDx1A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Nov 2026 10:23:00 +0100
Subject: [PATCH 3/3] ref-manual/kickstart.rst: document location and
 variable expansion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261102-wks-in-v1-3-fbb797a3d5cb@bootlin.com>
References: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
In-Reply-To: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Trevor Woerner <twoerner@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7321;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iWMHfCtXK+sAeN4RtFKXY3lFbxg2eVXN3xUDa5Yz0A8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq6FZ00LVLlSpvHUgv2jE8/duLtgOqwuyZBGt99
 9FwJEm/EySJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauhWdAAKCRDRgEFAKaOo
 NlpfD/9aVaOuHHubVfCcMJ0FrGylqidueST1gno50IqguLarIzL0B5AQDkkw0LW0xFP5Ovv416B
 rVxX5YwWwFHMlSysac+YObKu1m11js5FBJl5+qtR9haoh4/igT/lTnIMacjKXSjBOWse/zOzHdT
 OJ7JOPx2/XhxUu3SG6p7ISWl9XqBkW5+N9V5fteU2fUujysdMNM0u+/HHuaIe1tHJBdg5MJXcKm
 LiOnb3wbPTshlJUDY2d9qEOUtAVa0fdi3incL8t/MF1pHUMAP97E97ZsfUnhFFr1uaCALQBSd3N
 7pDL/7N9ljtNciTH4mwhDK8PZjMq2+xzhm/WBfxdE/CeBoqLWhTN2lOJ/ee0jcb+SmEPu7o7Z+P
 9jgZpWjy+pMAhkTuk/wWNyDF4gW0AVE5J4lhycOIw47hfPs96zdPbGMypDTjKMYCrF8MSZXAfWn
 NnTUXaskiNU7+FQ3rJGIxBIXfRqk7DADVr2LRGDSP4ag6XRegUFgob9JXteBjD1BMqTPAxSnQoc
 yo7Ktq1WTz4zj/k32aTeqM/c+HjqNRhp/6OH2BZSTe7h8OTA/OiGMagiksCrK3SjRRs9geTszOv
 fSJE/z0qOcgJLl5yxQRcZOCQ+DNYNiEPmbEvWYwT4KULpMQDGhowFe9yG3FQsUHe1n0+8UukOLS
 yi3cEOAY420+erA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 09:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10756

Expand the kickstart reference documentation with:

- Details on kickstart files expected location.
- Details on variable expansion and differences between .wks/.wks.in.
- Documentation for the WICVARS variable.

[YOCTO #16432]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/kickstart.rst | 125 +++++++++++++++++++++++++++=
+++++-
 documentation/ref-manual/variables.rst |   8 +++
 2 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-m=
anual/kickstart.rst
index 5223b80a9..8d5e9f317 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -9,13 +9,47 @@ OpenEmbedded Kickstart (``.wks``) Reference
 Introduction
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-This chapter provides a reference on the available kickstart commands.
+This chapter provides a reference on the available kickstart commands an=
d
+variable expansion in kickstart files (``.wks`` and ``.wks.in`` files).
 The information lists the commands, their syntax, and meanings.
 Kickstart commands are based on the Fedora kickstart versions but with
 modifications to reflect Wic capabilities. You can see the original
 documentation for those commands at the following link:
 https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html
=20
+Kickstart Files Location
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Within a :term:`layer`, a kickstart file should always be placed in the
+``files/wic`` directory. For example, as of writing, the
+:term:`OpenEmbedded-Core (OE-Core)` layer has the following files:
+
+.. code-block:: text
+
+   meta/files/wic
+   =E2=94=9C=E2=94=80=E2=94=80 common.wks.inc
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk-bootloader-config.cfg
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk-bootloader-config.wks
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk-gpt.wks
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk-multi-rootfs.wks
+   =E2=94=9C=E2=94=80=E2=94=80 directdisk.wks
+   =E2=94=9C=E2=94=80=E2=94=80 efi-bootdisk.wks.in
+   =E2=94=9C=E2=94=80=E2=94=80 efi-uki-bootdisk.wks.in
+   =E2=94=9C=E2=94=80=E2=94=80 mkefidisk.wks
+   =E2=94=9C=E2=94=80=E2=94=80 mkhybridiso.wks
+   =E2=94=9C=E2=94=80=E2=94=80 qemuloongarch.wks
+   =E2=94=9C=E2=94=80=E2=94=80 qemuriscv.wks
+   =E2=94=9C=E2=94=80=E2=94=80 qemux86-directdisk.wks
+   =E2=94=9C=E2=94=80=E2=94=80 sdimage-bootpart.wks
+   =E2=94=94=E2=94=80=E2=94=80 systemd-bootdisk.wks
+
+Kickstart files within this directory can end with ``.wks`` and ``.wks.i=
n`` (see
+the :ref:`ref-manual/kickstart:Kickstart Variable Expansion` section for=
 more
+details on the differences). Files ending with ``.inc`` are files includ=
ed in
+kickstart files (see the :ref:`ref-manual/kickstart:Directive: include`
+section), and the ``.cfg`` is a configuration file used by the :ref:`boo=
tloader
+<ref-manual/kickstart:Command: bootloader>` command.
+
 Kickstart Commands And Directives
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -252,3 +286,92 @@ the current file. For example:
    File inclusion is only supported for ``.wks`` files, not ``.wks.in``.=
 See the
    :ref:`ref-manual/kickstart:Kickstart Variable Expansion` section belo=
w for
    more details on the differences between the two files.
+
+Kickstart Variable Expansion
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+Kickstart files support two different file extensions and each has a dif=
ferent
+variable expansion mechanism:
+
+-  ``.wks``: in this file format, only the variables listed in the
+   :term:`WICVARS` variable are expanded. These variables are expanded b=
y the
+   :term:`wic` command-line utility, not :term:`BitBake`. However, the s=
yntax to
+   reference these variables is the same. For example:
+
+   .. code-block:: text
+      :caption: Snippet from ``mkefidisk.wks``
+
+      bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext=
4 console=3D${KERNEL_CONSOLE} console=3Dtty0"
+
+   Here, the :term:`KERNEL_CONSOLE` variable will be expanded, because i=
t is in
+   :term:`WICVARS`.
+
+   For any referenced variable that is not listed in :term:`WICVARS`, a =
warning
+   is emitted (by the :term:`wic` command-line tool, not :term:`BitBake`=
), and
+   the ``${...}`` string is left as-is.
+
+   .. note::
+
+      The :term:`wic` command-line utility is a separate project (see
+      :yocto_git:`/wic`). It is for this reason that the :term:`wic` too=
l
+      supports expanding variables without :term:`BitBake`, using its ow=
n
+      mechanism.
+
+-  ``.wks.in``: in this file format, variables are expanded by :term:`Bi=
tBake`.
+   This means that the :term:`WICVARS` list has no effect anymore: those
+   variables are expanded by :term:`BitBake` directly. For example:
+
+   .. code-block:: text
+      :caption: Snippet from ``efi-uki-bootdisk.wks.in``
+
+      part /boot --source bootimg_efi --sourceparams=3D"loader=3D${EFI_P=
ROVIDER}" --label boot --active ...
+
+   Here, the :term:`EFI_PROVIDER` variable is expanded by :term:`BitBake=
`.
+
+   This also means that ``.wks.in`` files can contain inline Python expr=
essions.
+   Here is a made up example:
+
+   .. code-block:: text
+
+      part / --source rootfs --fstype=3Dext4 --label root --align ${@4 *=
 1024} --size 5G
+
+   Here, since the ``${@4 * 1024}`` expression is evaluated by :term:`Bi=
tBake`,
+   it will be expanded to ``4096``.
+
+   For any referenced variable that is not defined in the environment, a=
n empty
+   string replaces the reference.
+
+Here is a table that summarizes expansion results between ``.wks`` and `=
`.wks.in``:
+
+.. list-table::
+   :widths: 20 20 40 40
+   :header-rows: 1
+
+   * - Reference
+     - In :term:`WICVARS`?
+     - ``.wks`` (:term:`Wic` expansion)
+     - ``.wks.in`` (:term:`BitBake` expansion)
+   * - ``${IMAGE_ROOTFS}``
+     - yes
+     - ``/path/to/rootfs``
+     - ``/path/to/rootfs``
+   * - ``${TMPDIR}``
+     - no
+     - ``${TMPDIR}``
+     - ``/path/to/build/tmp``
+   * - ``${@1024*2}``
+     - n/a
+     - ``${@1024*2}``
+     - 2048
+   * - ``${NOWHERE_DEFINED}``
+     - no
+     - ``${NOWHERE_DEFINED}``
+     - (empty)
+
+Expansion in Included Files
+---------------------------
+
+For files that are included with the :ref:`include
+<ref-manual/kickstart:Directive: include>` directive presented above, va=
riable
+expansion is *always* done by :term:`wic`'s own parser, using the
+:term:`WICVARS` variable.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index bbf0e6d07..2e01d0422 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -12774,6 +12774,14 @@ system and gives an overview of their function a=
nd contents.
       ":ref:`dev-manual/wic:creating partitioned images using wic`" sect=
ion in
       the Yocto Project Development Tasks Manual.
=20
+   :term:`WICVARS`
+      Defined in the :ref:`image_types_wic <ref-classes-image_types>` cl=
ass, the
+      :term:`WICVARS` variable contains a list of variable names that ca=
n be
+      used in :doc:`.wks </ref-manual/kickstart>` files. ``.wks`` files =
differ
+      from ``.wks.in`` files: for the latter, variables are expanded by
+      :term:`BitBake` instead. For more details, see the
+      :ref:`ref-manual/kickstart:Kickstart Variable Expansion` section.
+
    :term:`WIRELESS_DAEMON`
       For ``connman`` and ``packagegroup-base``, specifies the wireless
       daemon to use. The default is "wpa-supplicant" (note that the valu=
e

--=20
2.55.0

