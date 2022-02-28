Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAACCC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 03:56:09 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.16366.1646020568621133258
 for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 19:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X1Tu52Qw;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id w37so10306700pga.7
        for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 19:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6xoZG7vF7EGXho4zaD24p6uJNiFrLE3fOyAuDN2CQX4=;
        b=X1Tu52QwYpG+WR51qM8xK1dFy5R/56nvMVAkYN62U5dJEqYdKmM7V3cKexB5FCKkpY
         Kz78Fp3trEXYsT8nfe5nSdjHcfyiF+bwPSsJnbLOf5urLT1c6A1xNV8d80nQK7rz8ezf
         XvTceXmc4yoFp67wxjcgE4nUll/viYcI/TcoEeI3qH7ApvQ/ZguvXdpN70IU4Pwjs+cD
         XuF8DhiNrz9Wt03LLBCersPwEiyBKYYqGgcc9KfCj8VJISXUW3u9IqDsAxNaWfgRfgG7
         N6cxfmmWSGnPptZw+RxpwweJGLgpnWViT4TU9KdvujD/HP2FhbEyuLWIb8yw1UOyVvJt
         Zj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6xoZG7vF7EGXho4zaD24p6uJNiFrLE3fOyAuDN2CQX4=;
        b=u+S70mM50trOSRtfcd4JhiP4VdVbuayH/NbGktK+2EQnz5dMFCMkaHNAfdELvpk6j2
         mCz6n2bScIl5qCDUQSZ76BdjrqtvMSzfQRQqo5XfTwq1//9iE4+3E05MIYCtkGMnv8ak
         lSy+Rez4P4jGxSHumjYr2D7y3/eAYLN1Ug39q15BSZXBs/d/SLK8BtWQVyBRECr9lN13
         vXrwDn9q9MKqb4WzI7CelSHvX9ZGCB94LFDO2VzNrglAFEzonFvO91mXHeLX6F3CAqSQ
         wZUFVIKQk8ybspb8RCo8NFqKFvq1hVLXVRR37Ov52m69FASEIWw8ztWJ0JdvpxbJiF+M
         qjrA==
X-Gm-Message-State: AOAM530y8s4e2I/tlBGqZtSiwe9xl6Drxrgux6xv45sDJYdgfLBhIRQU
	laeclyLgL+EKX10yQQf6987DSiYiNFE=
X-Google-Smtp-Source: 
 ABdhPJxjfI5zGojCf8S6mo+0KTMZnslwy5oy9hm5SBEfhXedVkfbu+YKQ2nOdDTQW+2DAJdG/Fygkw==
X-Received: by 2002:a63:698a:0:b0:36c:1d0a:2808 with SMTP id
 e132-20020a63698a000000b0036c1d0a2808mr15535425pgc.567.1646020567618;
        Sun, 27 Feb 2022 19:56:07 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a655805000000b003643e405b56sm8811011pgr.24.2022.02.27.19.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 19:56:07 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/3] docs: update setuptools3 class
Date: Sun, 27 Feb 2022 19:55:47 -0800
Message-Id: <20220228035547.1134436-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228035547.1134436-1-tim.orling@konsulko.com>
References: <20220228035547.1134436-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Feb 2022 03:56:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2507

Add notes to inform about the new `wheel` behavior of the
setuptools3.bbclass.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/classes.rst | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 2338ef6b3..d216f8843 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2439,8 +2439,23 @@ is installed with the :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` c
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
+      ``setuptools3`` ``do_compile`` now calls `setup.py bdist_wheel` to
+      build the ``wheel`` binary package format
+      (See `PEP-427 <https://www.python.org/dev/peps/pep-0427/>`__).
+      A consequence of this is that legacy software still using deprecated
+      `distutils` from the Python standard library cannot be packaged as
+      ``wheels`. A common solution is the replace
+      ``from distutils.core import setup`` with ``from setuptools import setup``.
+
+     ``setuptools3`` ``do_install`` now calls ``pip install`` to install
+     the ``wheel`` binary package. In current versions of ``setuptools`` the
+     legacy ``setup.py install`` method is deprecated.
 
 .. _ref-classes-setuptools3-base:
 
-- 
2.30.2


