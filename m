Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60D4C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 03:56:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.16789.1646020555431500875
 for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 19:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q2ieeAA7;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id h17so4027948plc.5
        for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 19:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MMKVUC+OP0JJLOgIX80DfG1EC2rgbei2PtkoKrSunOU=;
        b=Q2ieeAA7PHECUK89PLIaohsgxPXtkVeLNAiYyKYYJ7cRFFa8p1IjFrSML0M887jHzr
         Ro7JQcmjJ2ZUWVrTt89tdUdadW5f4UJrZkx+sjdO3C3lH/zQRLPeAscNHpiPgn3kbMNW
         E1knxgdQ3RzzKzWH025fAaMUqR/xl82OCy8Oxu9b7/QT7cyKMnqqNWvM8pPAGLE8TTsy
         TWysNuuipcsZky5FJ6QHG784zDLxDcdk7s1T+o0ia6vc2xwgsoSRrTWrd+esyy79pQYH
         beI0Ld0xzzll9foAut02Ao6whXJgexTZ7IKrJJMtz6w0xQWJPmXjyrrOl3WY8y4PJ94F
         miDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MMKVUC+OP0JJLOgIX80DfG1EC2rgbei2PtkoKrSunOU=;
        b=B+4JuRltimERjJZAQM0hmuCVX044jtnZ7knfd7IqdOAYh1oEOD5RLszVpFsreqJjti
         4MiinJLPteQrCbNNxClafWfMrWknT7qhJ7r8ZEengDCn6nTpayo5nwpSCWZGtO9JirTd
         CtHKFAeMiiuYC9BnZQRDxqaZmMKzCQswk5aomVL+H3ka+jktYuHM98K7EkioXjIJIZBk
         PHWv08bDsCbqZmU3mXFeFJuaAUSTNA0l4jHnzRKEJO+ctx92egLjMxEbU0KyEvhGs7g0
         U9ikK6uwgEOL/35WcWvWhJpp+9OS0bYUNS7jBAgOE3kL1HA7ZRu/dpWok2wdweHrREmC
         1/OQ==
X-Gm-Message-State: AOAM530FhAvbUUY3s4blKWc9ZOnxvw3ylLpSftGF+HhO6o5r0FSr1AXG
	O5N4WHDyfLIdYfkyGVFBvVssGZleNW8=
X-Google-Smtp-Source: 
 ABdhPJxCGFVslqiNy/eQQdlNjvyUbvwu/+0HyFx6v9qQ5WKuUJvoVlGCVRxCabYWRG5pV2hUmFWhKA==
X-Received: by 2002:a17:90a:a42:b0:1bd:1985:5182 with SMTP id
 o60-20020a17090a0a4200b001bd19855182mr8974579pjo.5.1646020554259;
        Sun, 27 Feb 2022 19:55:54 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a655805000000b003643e405b56sm8811011pgr.24.2022.02.27.19.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 19:55:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] docs: add new python packaging classes
Date: Sun, 27 Feb 2022 19:55:45 -0800
Message-Id: <20220228035547.1134436-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Feb 2022 03:56:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2505

Add the new classes used for Python packaging:
* flit_core
* pip_install_wheel
* setuptools_build_meta

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/classes.rst | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 949217bf4..2338ef6b3 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -650,6 +650,22 @@ variables are not met, the recipe will be skipped, and if the
 build system attempts to build the recipe then an error will be
 triggered.
 
+.. _ref-classes-flit_core:
+
+``flit_core.bbclass``
+=====================
+
+The ``flit_core`` class enables building Python modules which declare
+the  `PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
+``flit_core.buildapi`` ``build-backend`` in the ``[build-system]``
+section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
+
+Python modules built with ``flit_core.buildapi`` are pure Python (no
+``C`` or ``Rust`` extensions).
+
+The resulting ``wheel`` (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__)
+is installed with the :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class.
+
 .. _ref-classes-fontcache:
 
 ``fontcache.bbclass``
@@ -2025,6 +2041,26 @@ When inherited by a recipe, the ``perlnative`` class supports using the
 native version of Perl built by the build system rather than using the
 version provided by the build host.
 
+.. _ref-classes-pip_install_wheel:
+
+``pip_install_wheel.bbclass``
+=============================
+
+The ``pip_install_wheel`` class uses ``pip`` to install a Python ``wheel``
+binary archive format (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__)
+
+The Python ``wheel`` can be built with several classes, including :ref:`flit_core <ref-classes-flit_core>`,
+:ref:`setuptools_build_meta <ref-classes-setuptools_build_meta>`, and :ref:`setuptools3 <ref-classes-setuptools3>`.
+
+The absolute path to the built ``wheel`` to be installed is defined by :term:`PYPA_WHEEL` which can be
+overriden for recipes where the filename or version number of the wheel are not easily
+determined by the defaults. Other variables which can be used to customize the behavior
+of the ``pip_install_wheel`` class include:
+
+- :term:`PIP_INSTALL_ARGS`
+- :term:`PIP_INSTALL_PACKAGE`
+- :term:`PIP_INSTALL_DIST_PATH`
+
 .. _ref-classes-pixbufcache:
 
 ``pixbufcache.bbclass``
@@ -2380,6 +2416,23 @@ additional configuration options you want to pass SCons command line.
 The ``sdl`` class supports recipes that need to build software that uses
 the Simple DirectMedia Layer (SDL) library.
 
+.. _ref-classes-setuptools_build_meta:
+
+``setuptools_build_meta.bbclass``
+=================================
+
+The ``setuptools_build_meta`` class enables building Python modules which
+declare the 
+`PEP-517 <https://www.python.org/dev/peps/pep-0517/>`__ compliant
+``setuptools.build_meta`` ``build-backend`` in the ``[build-system]``
+section of ``pyproject.toml`` (See `PEP-518 <https://www.python.org/dev/peps/pep-0518/>`__).
+
+Python modules built with ``setuptools.build_meta`` can be pure Python or
+include ``C`` or ``Rust`` extensions).
+
+The resulting ``wheel`` (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__)
+is installed with the :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class.
+
 .. _ref-classes-setuptools3:
 
 ``setuptools3.bbclass``
-- 
2.30.2


