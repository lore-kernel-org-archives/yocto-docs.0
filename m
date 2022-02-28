Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05650C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 03:56:03 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.16790.1646020563177040221
 for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 19:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pTTMnpjT;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id t5so839398pfg.4
        for <docs@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 19:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=53phjAYjPKJRokA7PbJSubVRmKCeGYgelotB6K6iAhg=;
        b=pTTMnpjT8IvldxSkFnKSiOU9iaFBGEqR2vDRDJ7waTqlBNvYKx7w+xV3Vfi8VGj6oR
         leWj7ytAKUe0fWYD/ULoTaQz6blGd0jyj2L8uJKSwcH5deLAlrtCg4qFFQwYxf2rs9cL
         TQEX1fzK/LuMr0jvtvkeUOjkz1TxHNh3hr72Fn7HYgItTZlblkvdydLCcMBZe1Uvl3ay
         IlxAYOqrEEz5F53C+JFeSXbU98/2rK5cpxVlfC8kVItEtHaEuaL1H/CWKgUi95AYlYl4
         p8GV7eKLJrKiyva98np8AZbUVOKj01d7+1L2LzbUyNnnrYkR3Z1YjIj9Ft2l1F0a9XZf
         9kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=53phjAYjPKJRokA7PbJSubVRmKCeGYgelotB6K6iAhg=;
        b=w0b5xM8S61zfnsrL160S5X0x2HMvHzzwLwgrRV9atY8QVILmUHdB2/6oRJ7u2kYyRj
         1zAC18cTIn8jBEuFJLeM/06QtFraJNPzyh9K2Mhadz7plSFRGqmEX++VA41M5uN2UBkm
         wYOnkpgZ1OZ5EgaUwGi2JO0pXo5d/G3CAqyTI2zojamV0eU7TmcHcenV3clv9D18iTSv
         7vU1GyD3sWjtxM0/qrYBNfIFdxcrk5qEsU2dDJQfIEbjs2UWFPAfSOvLRdCKNOerETgH
         BcR3KPA/3OO57+Vdu7upVCVABv9ByaOLr2ijiv8u3OutcY1m8U3whx0z/EL6oEHSbABE
         s6wg==
X-Gm-Message-State: AOAM531syp4zlPG5tFk3xPQx38Gi6VXA1QkXANJa5WVmmINZHoZJpnZW
	0J4+zFRtgJua58hAYLB5iXZaIxytLzU=
X-Google-Smtp-Source: 
 ABdhPJzr+LDySX5L3koqSIwOtkyQt4s342T3IzS4ZgtYybPmkSqpN/oVZzjLGPb20b2/BKENWENAvg==
X-Received: by 2002:a05:6a00:b84:b0:492:64f1:61b5 with SMTP id
 g4-20020a056a000b8400b0049264f161b5mr19424162pfj.52.1646020562241;
        Sun, 27 Feb 2022 19:56:02 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a655805000000b003643e405b56sm8811011pgr.24.2022.02.27.19.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 19:56:01 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] docs: add pip install variables
Date: Sun, 27 Feb 2022 19:55:46 -0800
Message-Id: <20220228035547.1134436-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228035547.1134436-1-tim.orling@konsulko.com>
References: <20220228035547.1134436-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Feb 2022 03:56:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2506

Add the new variables used to install Python `wheel` binary archives:
* PIP_INSTALL_ARGS
* PIP_INSTALL_DIST_PATH
* PIP_INSTALL_PACKAGE
* PYPA_WHEEL

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/variables.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ecb2b60c7..1f6433084 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5594,6 +5594,25 @@ system and gives an overview of their function and contents.
       ``bash-4.2-r1/``). This variable is comprised of the following:
       ${:term:`PN`}-${:term:`EXTENDPE`}${:term:`PV`}-${:term:`PR`}
 
+   :term:`PIP_INSTALL_ARGS`
+      When used by recipes that inherit the
+      :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class,
+      denotes the arguments passed to ``pip install`` to adjust the
+      behavior of how the ``wheel`` is installed.
+
+   :term:`PIP_INSTALL_DIST_PATH`
+      When used by recipes that inherit the
+      :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class,
+      denotes the path to ``dist/`` (short for distribution) where the
+      binary archive ``wheel`` is built. This is used in part to create
+      the :term:`PYPA_WHEEL` variable.
+
+   :term:`PIP_INSTALL_PACKAGE`
+      When used by recipes that inherit the
+      :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class,
+      denotes the name of the package portion of the ``wheel`` filename.
+      This is used in part to create the :term:`PYPA_WHEEL` variable.
+
    :term:`PIXBUF_PACKAGES`
       When inheriting the :ref:`pixbufcache <ref-classes-pixbufcache>`
       class, this variable identifies packages that contain the pixbuf
@@ -6021,6 +6040,13 @@ system and gives an overview of their function and contents.
 
       :term:`PV` is the default value of the :term:`PKGV` variable.
 
+   :term:`PYPA_WHEEL`
+      When used by recipes that inherit the
+      :ref:`pip_install_wheel <ref-classes-pip_install_wheel>` class, denotes
+      the absolute path to the built ``wheel`` to be installed. Normally the
+      defaults which use :term:`PIP_INSTALL_PACKAGE` and :term:`PIP_INSTALL_DIST_PATH`
+      to build the path to the ``wheel`` should be sufficient.
+
    :term:`PYTHON_ABI`
       When used by recipes that inherit the
       :ref:`distutils3 <ref-classes-distutils3>`,
-- 
2.30.2


