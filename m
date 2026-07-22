Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF83C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:58:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47561.1784725107932302708
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 05:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ROdLnHMM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4902A4E40ECD
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BBC960388
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D1AF11BD3CBF;
	Wed, 22 Jul 2026 14:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G7+UPAcJ3jisNCWbv07hESnBPIOxZgiPAy+bf9iNFno=;
	b=ROdLnHMMRaebwwfjMSV0UqXFhMHXtCV9anqPRrTobkAAf+6Pq6mp2MKyQIfA47VWajHEio
	aRL6D6RWVrqtNSsreOev/pL6okEej/voxrMb77e3qFkdENtnHoBL4ZnAMJ8Vc7n81URpQO
	cj74q8dJdhT7kdhqywcOyvQ8bnHVQV4A6FgU1xS/3Mn4A/zPUr2v3tYJZfJNawP0fLmZzU
	yRpjwrNjgluTOYJdyHNEYSx/4c/CrerIt45KJ7nnENcLiIHAKffqs7pzGwCh2dbpEz+vLw
	wvSm4RcRy/UTf9waFlXCF/LKEr7nFAcXwTqtJF4VlC7shz57+J7AROVCofccOQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Jul 2026 14:58:10 +0200
Subject: [PATCH 1/5] dev-manual: add a shared state mirror setup document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260722-sstate-mirrors-doc-v1-1-570baeb41c32@bootlin.com>
References: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
In-Reply-To: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8903;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=dY8iGxCo+7Kjz7vJJDupx+I1GE9YvMx+ZpDpv2C+WME=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqYL5ud6ccvkDey4F8dd+ZdMrfWIfSWG3vRCy5n
 OV1GRJELXGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamC+bgAKCRDRgEFAKaOo
 NiAfD/9TvwyDT0mAagUXLqFI1tGP1HX0hDlWaShUCcjCrj65qtabluoP9oXZFdoRNnXN/sT/adX
 1gdoSxbn6d/LBjHuxrqnKo9AiC+iJsLLgdH8LkDCoDlm2rAKb+vVHWsaJLZ4PRAdBf4jVpaifJ1
 y2Yzx1OctcfK/DxE2Cvrz09dfPQv/p1AFkWD0md8WRF2JPFlIGNUFOd7yVHUogPZ+t2TkjYQgcq
 RmqBKQayMf3s8FObCMCgLmrUA+b+IUB1bSutfQ5Jp2UVEbwyV60wfHIzZlsINqdIxFk8y7aT4jr
 PdvSecWhIbzgB2UK+Wa9G3X+GPjBEHgDtsZk7qRxqZku8O5tSvBaHHfQf30VtwlUQPQlfJWxEoG
 tcCctn+RLm59ZPx0OTT8PWLJk0w+craPV9f8p/Ndft4kllS/VPvpF0UCqjP2dVXd/XU/6tHtKAt
 j8Xtj5MKdtaqhNZCT7tVvxlP4bhC3dy4XhBebPD3v1KUoYwReIMheqUNs8ArHGpqpVP5MssQ0di
 SSvOTAmvRScwWh1mA6+eufzd/yKCAMVqx5NsIYK84wxkoLNWUj/mMwx4ZBu8UzMZBJY6/AJayM9
 EV8eDMbbe1o2hLLZTYlogfLb57QNjeMbHeh2LeRNvM6B24hkN5ee3MegXwAu3tpDnkix9H5A2z+
 HsFN1sKroTWTgzw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10110

The aim of this document is to provide an introduction on how to setup a
shared state mirror on a server for use by clients with SSTATE_MIRRORS.
Setting it up is relatively straightforward. The document gives some
tips which is where the value of the document lies (e.g. by reminding to
use a hash equivalence service alongside it).

[YOCTO #13589]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/index.rst                |   1 +
 documentation/dev-manual/sstate-mirrors-setup.rst | 166 ++++++++++++++++=
++++++
 2 files changed, 167 insertions(+)

diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manua=
l/index.rst
index e9bf17bdc..0e1aa8958 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -49,6 +49,7 @@ Yocto Project Development Tasks Manual
    wayland
    qemu
    bblock
+   sstate-mirrors-setup
    hashequivserver
=20
 .. include:: /boilerplate.rst
diff --git a/documentation/dev-manual/sstate-mirrors-setup.rst b/document=
ation/dev-manual/sstate-mirrors-setup.rst
new file mode 100644
index 000000000..6c369ff4e
--- /dev/null
+++ b/documentation/dev-manual/sstate-mirrors-setup.rst
@@ -0,0 +1,166 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Setting up a Shared State Cache Mirror
+**************************************
+
+This document explains how to set up a server that hosts shared state ar=
tifacts
+that can be reused by machines connecting to the server.
+
+The concept of "shared state" is explained in the
+:ref:`overview-manual/concepts:Setscene Tasks and Shared State` section =
of the
+Yocto Project Overview and Concepts Manual. These artifacts are files th=
at are
+by default placed in the shared state directory (:term:`SSTATE_DIR`).
+
+This document explains how to share the content of this directory throug=
h the
+use of the :term:`SSTATE_MIRRORS` variable.
+
+Use-case
+=3D=3D=3D=3D=3D=3D=3D=3D
+
+The most common use-case for setting up a shared state cache mirror is u=
sually
+when there is a dedicated machine in an infrastructure building images a=
t a
+regular interval, thus populating a shared state cache directory frequen=
tly.
+Usually, this machine is part of a :wikipedia:`CI/CD <CI/CD>` type of
+environment.
+
+Since the shared state directory of this machine contains most of the it=
ems
+needed to accelerate a new build, it can be interesting to share it to r=
emote
+clients connecting to the machine and fetching the artifacts over the ne=
twork:
+
+.. code-block:: text
+
+                      +---------------------+
+                      |                     |
+           +----------+    Build Machine    +-------------+
+           |          |                     |             |
+           |          +--------+------------+             |
+           |                   |                          |
+           |                   |                          |
+           |                   |                          |
+           |                   |                          |
+           |                   |                          |
+   +-------v------+    +-------v------+           +-------v------+
+   |              |    |              |           |              |
+   |   Client 1   |    |   Client 2   |   . . .   |   Client N   |
+   |              |    |              |           |              |
+   +--------------+    +--------------+           +--------------+
+
+With this kind of setup, it is assumed that:
+
+-  Clients connect to the server over some protocol such as HTTP. In pra=
ctice,
+   the protocol should be one supported by BitBake (see :doc:`the suppor=
ted
+   fetchers <bitbake:bitbake-user-manual/bitbake-user-manual-fetching>`)=
.
+
+-  The shared state directory (:term:`SSTATE_DIR`) of the build machine =
is
+   is read-only from the point of view of the clients.
+
+-  The previous points also means that clients hold their own copy of th=
e shared
+   state artifacts in their own shared state directory.
+
+Server Setup
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+There are many ways of setting up a file hosting server. To illustrate, =
this
+document will use a basic HTTP server started thanks to the ``http.serve=
r``
+Python module.
+
+On our build machine, we assume that the server shares the shared state =
from the
+:term:`Build Directory`:
+
+.. code-block:: text
+
+   build/
+   =E2=94=9C=E2=94=80=E2=94=80 ...
+   =E2=94=9C=E2=94=80=E2=94=80 sstate-cache/
+   =E2=94=94=E2=94=80=E2=94=80 ...
+
+With the ``http.server`` Python module, the server can be started as fol=
lows:
+
+.. code-block:: console
+
+   $ python3 -m http.server -d .../build/sstate-cache
+   Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
+
+Client Configuration
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Configuring clients to this server happens through a :term:`configuratio=
n file`,
+for example, the :ref:`site.conf <structure-build-conf-site.conf>` file.=
 Only
+the :term:`SSTATE_MIRRORS` variable is needed to setup the connection::
+
+   SSTATE_MIRRORS =3D "file://.* http://127.0.0.1:8000/PATH;downloadfile=
name=3DPATH"
+
+The line above depends on your server configuration. Here, the example u=
ses the
+local ``127.0.0.1`` IP address (the client is running on the same machin=
e) and
+the files are served on the port 8000.
+
+With this, the client is configured to download shared state artifacts f=
rom the
+server. This will happen automatically based on the :ref:`signatures
+<overview-manual/concepts:Checksums (Signatures)>` of the tasks which ar=
e about
+to run (so only relevant artifacts are fetched).
+
+After running a build, the local shared state directory of the client
+(configured through its :term:`SSTATE_DIR` variable), will be populated =
with the
+files downloaded from the server.
+
+Going Further
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+-  It is recommended to setup a :ref:`overview-manual/concepts:Hash Equi=
valence`
+   service on the build machine --- running in parallel of the shared st=
ate
+   mirror --- to further speed up builds. See the
+   :doc:`/dev-manual/hashequivserver` section of the Yocto Project Devel=
opment
+   Tasks Manual for more information.
+
+-  If the :term:`BB_NO_NETWORK` variable is set to "1" on clients as a m=
eans to
+   disable any accesses to the network, the :term:`SSTATE_MIRROR_ALLOW_N=
ETWORK`
+   variable may be used to allow the clients to fetch from the shared st=
ate
+   mirror as an exception.
+
+-  Multiple shared state sources can be specified in the :term:`SSTATE_M=
IRRORS`
+   variable. For example::
+
+      SSTATE_MIRRORS =3D "\
+         file://.* https://someserver.com/PATH;downloadfilename=3DPATH \
+         file://.* https://someotherserver.com/PATH;downloadfilename=3DP=
ATH \
+      "
+
+   The shared state artifacts will be searched on the remote locations i=
n the
+   same order as they are specified in this variable.
+
+-  Fetching the shared state artifacts from a local directory, such as a=
n
+   :wikipedia:`NFS <Network_File_System>`-mounted directory, is also pos=
sible
+   using the ``file://`` fetcher::
+
+      SSTATE_MIRRORS =3D "file://.* file:///path/to/shared-state/PATH;do=
wnloadfilename=3DPATH"
+
+-  The shared state mirror may be used in combination with GPG signature=
s to
+   ensure the authenticity of the downloaded files. See the
+   :doc:`/security-manual/sstate-signing` section of the Yocto Project S=
ecurity
+   Manual for more information.
+
+-  The size of the shared state directory on the server may grow over ti=
me. The
+   :oecore_path:`sstate-cache-management.py <scripts/sstate-cache-manage=
ment.py>`
+   script may be used to remove duplicate files. Otherwise, removing fil=
es
+   that have not been accessed for a certain period of time can be done =
with the
+   standard ``find`` command, e.g. for removing files older than 2 month=
s:
+
+   .. code-block:: console
+
+      $ find sstate-cache/ -type f -atime +60 -delete
+
+Troubleshooting
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The best way to check that files are being downloaded from the server is
+probably to check the server logs. For example, using the Python ``http.=
server``
+module, the following logs are shown:
+
+.. code-block:: text
+
+   127.0.0.1 - - [20/Jul/2026 14:36:23] "HEAD /d1/75/sstate%3Afile%3Ax86=
-64-v3-oe-linux%3A5.48%3Ar0%3Ax86-64-v3%3A14%3Ad175b18b8adc9cc3003edfc62f=
112fd421505bc715d41f36b4d04eef05d226ad_packagedata.tar.zst HTTP/1.1" 200 =
-
+   127.0.0.1 - - [20/Jul/2026 14:36:23] "HEAD /f4/11/sstate%3Aos-release=
%3Aall-oe-linux%3A1.0%3Ar0%3Aallarch%3A14%3Af411b2f27319283694ab13bf0d896=
5a7dd26428431418dfb7505f3d1cdd0dbfd_package_write_ipk.tar.zst HTTP/1.1" 4=
04 -
+
+Some artifacts may be found (returning 200 above). Some others will not =
be found
+because the expected artifacts on the client is not present on the serve=
r, in
+which case the client will rebuild the task (and its dependencies).

--=20
2.55.0


