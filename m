Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14806.1795781134821156398
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2026 04:05:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eJpCBp9D;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55d6deecef6so80073521cf.2
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781134; x=1796385934; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Is5BKYCB7a7tM7TvZhFZxP9+kLbIbBHe7Iiq8SD81I8=;
        b=eJpCBp9DC2N+y9eIP74I2G3bVXzilOBfXhkeUbjotV+OC8j7Q1wmvuWcOVrirwo9WI
         IAdfDQLw1Xv+ixN6OGSSjTUHkyec7VJw0jwTBTYm6vMO7A0t43Wk0OEu54P16MbPsPCh
         36api4LINP2x4AnTIPwLqL4gMvyYEiPPWWJ+9nCbApzchmleMgAdu4yNI9fJ8w3JD9d8
         dPJ7WOtsEAKwglSP9DdwmlpFKZIV4TcGm/F20IZqpRBLpxtEjqTb337xzq4q1fxApHuv
         kJLLr6bDoXLnNf6lUSpN6H5yqYtjgn1lDakxcyAkRv1VKg9ceGg6YVDTqUgizRpllKGR
         UfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781134; x=1796385934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Is5BKYCB7a7tM7TvZhFZxP9+kLbIbBHe7Iiq8SD81I8=;
        b=ab/iUsE+yJmZ+66PSrrPVem+dGHSLLHa8SZw8LY5+5v2P+9nsInL4ZWMVBJy1MJV/6
         X+5w4yDez1ZRBuRHJunDFJqzHWkl5sYS7wPaK1G527qN8aQ102QRxLmCYGHVvBW0ArCz
         dVb3QLW7g5PhomGkgM3fEk0ZhJyy+JuRVwKlmKuNWus0Inqk21xvnJW+mMaqUYUhAkqM
         Sd+WSVcJzcLQ8Gg+UEiy0L+i1lxtd1LTJi7v8lwCZ4eqJ9ySfGSUTSbo69fWkxw09wm0
         m8qbrXKV5KNFKIq9hhQhSn+0XeX9UJFRyfYpI2csBDJzec2VsS0kI3uhjENKpOyLNf3D
         xkaQ==
X-Gm-Message-State: APuU4Z9IP0aiMkuz8zvmvUpOxSbrTUKBLF7s/pbkc6y4W2PqWD8oQ0bE
	IG13cIGXOiKq9Ms66a4X3NkN8REVRt+ldgjZCChxL/T/627IKmzHJ/6NOLv49w==
X-Gm-Gg: AZFdTZcOLtNGBlPCcdUxJbFfQeaqnTbaAwaLrQGGxrxKICZXa6q/f5sOvyn3m+AVNpR
	3SXSkNJ4KoLzpNuwgpA9ZuBd33bABgHWKWe61bM+t4uLDkQd09NXVEPzVyq/U0jsEZSNDvcZ8T2
	cBXVPFODnyhh4wu1bBU0Ped3vrXvOByxE3Zex8VB+Uj4LHEvA5t1xj0BFc+aaZBtUUr5gJ8rWa+
	OU3fytdIdoPhmnfhtj3dgEkbt17x2jELjkSLxf2o2jQjX+kQjLYTSt5HlUGN2ivV8tm6SlobHZQ
	N3VF5LV2JAquhNhpTF0GI9eBm9PA5QZb/S9Y6ciDsxJEb53wYflYDfapMBghmHJ/MpISQtDKKMr
	8rRfFfxGONj1YsM/asMa8PhQjnStNblyzXF/9fWompZUfT6eez/N8KPC4ceilQ7mp86n6cGuqJA
	dC2GSTJxVgF1WigRzh2vHvWbWtn1AVBH8wt2umsflK9eHOb4UqxJbGUBfnUgEvdmEphffuYFFjq
	vXe27bbqqE2iXWZrhh8mAtt0szXUjNGzDQKb95ZKrnfCjZpfDe2Pqj+XYXzqk1sqqSyFm6xTnSY
	J8gf1E0Dcn3huC/AJ0co7cwYb/afRJgy465+A5ZtaXzkx25fLcdYLetr2UqCLslnVFLe2d4wznf
	yDKmkcKrG9R7nkWcED+552hJLNOSF7jM=
X-Received: by 2002:a05:622a:5c0f:b0:537:5488:dee4 with SMTP id d75a77b69052e-55d76a168dbmr477121461cf.25.1795781133414;
        Fri, 27 Nov 2026 04:05:33 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884b5e9sm208106041cf.18.2026.11.27.04.05.32
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:05:32 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 2/4] docs: use the wks lexer for the kickstart examples
Date: Fri, 27 Nov 2026 07:05:26 -0500
Message-ID: <20261127120528.837051-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127120528.837051-1-twoerner@gmail.com>
References: <20261127120528.837051-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2026 12:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10855
Content-Type: text/plain; charset="utf-8"

The wic kickstart examples in the manuals are tagged shell or text, or
left to the default language. Tag them wks so their statements and
options are highlighted as kickstart.

AI-Generated: codex/claude-opus 5.5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- new: tag the kickstart examples wks, as asked in review
---
 documentation/dev-manual/wic.rst       |  6 +++---
 documentation/ref-manual/kickstart.rst | 16 ++++++++++------
 documentation/ref-manual/variables.rst |  8 ++++++--
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 85160bbdf1a0..07e165abeb11 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -343,7 +343,7 @@ Mode that uses the ``directdisk`` file:
 Here are the actual partition language commands used in the
 ``genericx86.wks`` file to generate an image:
 
-.. code-block:: shell
+.. code-block:: wks
 
    # short-description: Create an EFI disk image for genericx86*
    # long-description: Creates a partitioned EFI disk image for genericx86* machines
@@ -403,7 +403,7 @@ implementation, it looks for the plugin with the same name as the
 partition. For example, if the partition is set up using the following
 command in a kickstart file:
 
-.. code-block:: shell
+.. code-block:: wks
 
    part /boot --source bootimg_pcbios --ondisk sda --label boot --active --align 1024
 
@@ -598,7 +598,7 @@ changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
 example changes the following two lines and leaves the remaining lines
 untouched:
 
-.. code-block:: shell
+.. code-block:: wks
 
    part /boot --source bootimg_pcbios --ondisk sdb --label boot --active --align 1024
    part / --source rootfs --ondisk sdb --fstype=ext4 --label platform --align 1024 --use-uuid
diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 8d5e9f317b06..c2b7d6aa1102 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -57,7 +57,9 @@ Command: part
 -------------
 
 This command creates a partition on the system and uses the
-following syntax::
+following syntax:
+
+.. code-block:: wks
 
    part [mntpoint]
 
@@ -85,7 +87,9 @@ must also provide one of the ``--ondrive``, ``--ondisk``, or
    be disabled in custom configurations.
 
 Here is an example that uses "/" as the mountpoint. The command uses
-``--ondisk`` to force the partition onto the ``sdb`` disk::
+``--ondisk`` to force the partition onto the ``sdb`` disk:
+
+.. code-block:: wks
 
       part / --source rootfs --ondisk sdb --fstype=ext3 --label platform --align 1024
 
@@ -275,7 +279,7 @@ The ``include`` directive can be used to include a WKS file into another. The
 only argument to this command is the path to the file to include, relative to
 the current file. For example:
 
-.. code-block:: shell
+.. code-block:: wks
 
    include common.wks.inc
 
@@ -298,7 +302,7 @@ variable expansion mechanism:
    :term:`wic` command-line utility, not :term:`BitBake`. However, the syntax to
    reference these variables is the same. For example:
 
-   .. code-block:: text
+   .. code-block:: wks
       :caption: Snippet from ``mkefidisk.wks``
 
       bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 console=${KERNEL_CONSOLE} console=tty0"
@@ -321,7 +325,7 @@ variable expansion mechanism:
    This means that the :term:`WICVARS` list has no effect anymore: those
    variables are expanded by :term:`BitBake` directly. For example:
 
-   .. code-block:: text
+   .. code-block:: wks
       :caption: Snippet from ``efi-uki-bootdisk.wks.in``
 
       part /boot --source bootimg_efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active ...
@@ -331,7 +335,7 @@ variable expansion mechanism:
    This also means that ``.wks.in`` files can contain inline Python expressions.
    Here is a made up example:
 
-   .. code-block:: text
+   .. code-block:: wks
 
       part / --source rootfs --fstype=ext4 --label root --align ${@4 * 1024} --size 5G
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2e01d04228ce..15ff5be2380a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4318,7 +4318,9 @@ system and gives an overview of their function and contents.
 
       You can also specify the target by label, UUID or partition name if multiple
       extra partitions coexist. Let's take the following example. This would be
-      the WKS file for the image currently being built::
+      the WKS file for the image currently being built:
+
+      .. code-block:: wks
 
          part --source extra_partition --fstype=ext4 --label foo
          part --source extra_partition --fstype=ext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d
@@ -12173,7 +12175,9 @@ system and gives an overview of their function and contents.
       The resulting binary can be flashed using :doc:`WIC </dev-manual/wic>` or
       any other flashing method at the environment offset, overriding any
       existing environment if one is present. Below is an example of a WKS file
-      to flash the binary::
+      to flash the binary:
+
+      .. code-block:: wks
 
          part --source rawcopy --sourceparams="file=u-boot-initial-env-sd.bin" --ondisk sda --no-table --offset 4096k
 
-- 
2.50.0.173.g8b6f19ccfc3a

