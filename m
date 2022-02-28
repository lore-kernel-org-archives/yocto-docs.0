Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA50C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 04:04:49 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.16415.1646021088274477998
 for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 20:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U+3DZb4m;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id m22so10028885pja.0
        for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 20:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=daZcMHWOMHFMQoCCkJodeusnrOnJNo8yCO7kijC4ZJ0=;
        b=U+3DZb4mhoAKI1glusjuIVZ2JgYbki9xWCZXfQHDGZTj4EayOc+ce5SoXpgDT6yUWm
         1Z2xh5xah6WaBHRoYIqSQ3DO48zmLcLp0ZDOiZAv26uRcDf8EEpT52IcENgE6Hdx3J0v
         huGAfKoqUp+qd9uheGdnXzjWrd03gDu74QMhHKB3DOt44h3yCf88OW6l/q1Il1m5LlJp
         JSoEhGPJ6/gkQuFXY1nlNES5LbS2uT4RJmfSaOeU5zvOYrVEHton1OoACB7E+QtqfbVG
         vAeIjlAlcCYhaGXwrT+1PIX2KFdr5WPIHGZ6/O6AOst+ym8gmyR/NS3EnijaX8jx4KWd
         bxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=daZcMHWOMHFMQoCCkJodeusnrOnJNo8yCO7kijC4ZJ0=;
        b=6fjan5HHcF/JXpCQwSJDw6h9hgnnUCTWq4wKWsAWUh06zft0SMrkaIIwxMP0KyxYGz
         /KY0jJDpyxe201Hha4qgR87IlTKZ31TumQ2kVan7BNsZlpcvZochP97Ukkssw+CvA+pR
         EpqQMjXx4sP57nPk6ihPfOBVxfnG6SUWeAIXq5f0S27tpM8gFx3SAcaRJeNfiyAH/41w
         dxhTDkOGpUBEDom3HiLfeKU3ILRIs75fB3tkJDw3secvIXg2Ocq7NbbooCc9wvLzAQoG
         mDTCBRgkbF7d/s1MUTL8B/iYHVO2iywgfNgqIFqkuY5RW0hH0JvLA9mgeqrmJZP0wk7O
         W3hw==
X-Gm-Message-State: AOAM5303sbvmhz7nVbD/jaiaju4+nEAGNPJYiiMy4OEiMrscc5oBkytP
	f1KIdpPuVJkwQDY4z6623dgwIyozgg8=
X-Google-Smtp-Source: 
 ABdhPJzTqTfv4vow7S/3F13QsyVfvMoJw01ZcjN/vYvECYlBxpbae8yaLwHbIz3TgExgB9jb0Wa44A==
X-Received: by 2002:a17:902:db10:b0:150:c9f:5797 with SMTP id
 m16-20020a170902db1000b001500c9f5797mr18570813plx.7.1646021087335;
        Sun, 27 Feb 2022 20:04:47 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a056a00098800b004f36335ecf0sm11406250pfg.146.2022.02.27.20.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 20:04:46 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] docs: update setuptools3 class
Date: Sun, 27 Feb 2022 20:04:06 -0800
Message-Id: <20220228040405.1135905-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Feb 2022 04:04:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2508

Add notes to inform about the new `wheel` behavior of the
setuptools3.bbclass.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Change in v2:
  - improve formatting of notes

 documentation/ref-manual/classes.rst | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2338ef6b3..5e4bacc13 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2439,8 +2439,26 @@ is installed with the :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` c
 =======================
 
 The ``setuptools3`` class supports Python version 3.x extensions that
-use build systems based on ``setuptools``. If your recipe uses these
-build systems, the recipe needs to inherit the ``setuptools3`` class.
+use build systems based on ``setuptools`` (e.g. only have a ``setup.py`` and
+have not migrated to the official ``pyproject.toml`` format). If your recipe
+uses these build systems, the recipe needs to inherit the ``setuptools3`` class.
+
+   .. note::
+
+      The ``setuptools3`` class ``do_compile()`` task now calls
+      ``setup.py bdist_wheel`` to build the ``wheel`` binary archive format
+      (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__).
+
+      A consequence of this is that legacy software still using deprecated
+      ``distutils`` from the Python standard library cannot be packaged as
+      ``wheels``. A common solution is the replace
+      ``from distutils.core import setup`` with ``from setuptools import setup``.
+
+   .. note::
+
+     The ``setuptools3`` class ``do_install()`` task now calls ``pip install``
+     to install the ``wheel`` binary archive. In current versions of
+     ``setuptools`` the legacy ``setup.py install`` method is deprecated.
 
 .. _ref-classes-setuptools3-base:
 
-- 
2.30.2


