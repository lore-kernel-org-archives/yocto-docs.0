Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2BBC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:57:53 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.13180.1641931073301884976
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 11:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TmlBb++8;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id w7so370295plp.13
        for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 11:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1eu1B8b3w5Wv8E13zlyYCWHJcsQ5g0Ni3SXFUqQScI4=;
        b=TmlBb++8SXBsQEjkYHZGH+qg8li59jCPlithDNP0IeD6h17/G1wCazTvdnL39f1HAT
         zoqAnIHQKH6sA4MjpvmVZq+7SexuVp8uQ/0QmnA3116DUnh9L88vWTypjJncX+c1iBQy
         YGnIvsG+FgT4wOBiuIKD3pLAIrsv0xIg00MEbQhhC1Uyaw61rw28wuUR9IgKmJE4XEe4
         pXYLP8q3aDSg0NVp8FwJxCqSXW2PS+LcaFfDkvCa1Igdj+dGsG81OVtamJNS1qxXTl1P
         4E4jhkdAus2DZZoh3oIguFBXLu6IyexqJzsKLQScHvLK+SnAWj5Rc7FsTYEmFeQ3rTDw
         vHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1eu1B8b3w5Wv8E13zlyYCWHJcsQ5g0Ni3SXFUqQScI4=;
        b=qBQD8dpbBHApS1nWRAHoY4uiumNsJE5YNRq0KOXUyVySZhrFEZuAV1ecNK8wPNij3l
         YoDqLNc4CTz93J/qy+GApCr3OAedxWyYt0ljaFRJuDhIJzK0xjD3FWo53i0fTLNAnhuV
         YRZtbB6S2jRTPrmKbA7oDZ4OKydsoozvx0LzI37Pd2afi8Pxdw301/rNA+rv649SGHhK
         KGS6DhwFQzT4o5vutktz0AygBt8Zg5opZgTfHdOKNLtNR7Gb57CbwdIOzOiq40dTJiMZ
         Y3fDkfsHHiJALrEWcaEV8c9RapZpDadR09lYjJDlMREiEbM9/ub/dxINNigZNaMVFvoY
         mFZw==
X-Gm-Message-State: AOAM5325ZYMdPHrL7ldkam+bZjKafZ0CjyxKcyXkj8KMTI6bgkCl4TRQ
	1UA+4nINr1gzYIUiPkhb45p4ATuSa6A=
X-Google-Smtp-Source: 
 ABdhPJzx3om4acHNqqEciFUmAVAnmi7p4sYV3oKkaEVGKCQzsKd3ytfXJzvNyrGQDuXRyFvfJHfSeQ==
X-Received: by 2002:a63:470a:: with SMTP id u10mr5449323pga.346.1641931072629;
        Tue, 11 Jan 2022 11:57:52 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 b4sm12029319pfl.101.2022.01.11.11.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:57:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] ref-manual/variables.rst: add SETUPTOOLS_*_ARGS
Date: Tue, 11 Jan 2022 11:57:41 -0800
Message-Id: <20220111195742.1921572-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220111195742.1921572-1-tim.orling@konsulko.com>
References: <20220111195742.1921572-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 19:57:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2384

Add SETUPTOOLS_BUILD_ARGS variable which can be used to pass additional
arguments to `setup.py build`.

Add SETUPTOOLS_INSTALL_ARGS variable which can be used to pass
additional arguments to `setup.py install`.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 83ccda830..3011c1c83 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6847,6 +6847,25 @@ system and gives an overview of their function and contents.
 
          EXTRA_IMAGE_FEATURES += "read-only-rootfs"
 
+   :term:`SETUPTOOLS_BUILD_ARGS`
+      When used by recipes that inherit the
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable can
+      be used to specify additional arguments to be passed to ``setup.py build``
+      in the ``setuptools3_do_compile()`` task. By default, this variable is unset::
+      
+         SETUPTOOLS_BUILD_ARGS ?= ""
+
+   :term:`SETUPTOOLS_INSTALL_ARGS`
+      When used by recipes that inherit the
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable can
+      be used to specify additional arguments to be passed to ``setup.py install``
+      in the ``setuptools3_do_install()`` task. By default, this variable is::
+
+         SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} \
+             --prefix=${prefix} \
+             --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+             --install-data=${datadir}"
+
    :term:`SETUPTOOLS_SETUP_PATH`
       When used by recipes that inherit the
       :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
-- 
2.30.2


