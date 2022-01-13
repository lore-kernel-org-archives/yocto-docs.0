Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D20C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 15:39:05 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.10205.1642088345245951785
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 07:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FTTFXBs7;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id a7so7703131plh.1
        for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 07:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5/Ji1TDUVEX9sUi0PqSvGVdeBkkfO1USqEHjZywpo+E=;
        b=FTTFXBs79liIi6xsHcNTn1f3PebANlkV7yvtvaYWs+zWQYw7Y+qIkTFQ1yKgnia+FZ
         GDKIC5Z4kIBohfa+0YIDd6HW/X0R78WeCWX0ErkrvJ482K1gHLrnYiR1OQyhwb6Y8bMM
         eo60O2HPRmG7DVTZY+uwpW0/qeT+dg0pqxlEiD4bEzTPrWCn9D3BOFGKXt4Mxy45OTC/
         KiJ8XXasPBEq1FA0W33XwjhZHdbW7SHfQV2qwRRB+J4cv2hqHhVHIlFpt/JjA3MDw6xp
         +21X47cZuKpwjYTKP2CZtwbNsF4nSuheOiis8y2GK2DZgxYZqzW30hgNbyxd3E25KhI0
         yJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/Ji1TDUVEX9sUi0PqSvGVdeBkkfO1USqEHjZywpo+E=;
        b=sABe4iXMwjhEfru0ICK9oPGSoaT2FLidwbztdu/3hY7zRaY3Dx0C2yZzaBGMKH90+y
         7LbSINL6mXPSTFtm12HV82tulzwTSd1CfzEB+I8Y9yNabLL8GCy6+mDOuGkKukRn0JjL
         YJ5ECexzpCmi3NUq0A+dULmIrqi0lvrKuvkrbGL1dKOUN4fBiFxttAe+bHuRaC5KwuSC
         t/oY74QhODhErl4XEYYGxNYqp2G89rvQM8nGyufGWvo90Onar9bk8lLPqsVMgXABavIC
         jwXL55cEB4RfjdjWj1kxqRA7Kqla+OGGbb+Lib35mI5f5QlAZoTHUEifJhL8NstnOEVp
         i5mw==
X-Gm-Message-State: AOAM530NUCJ7nsaXD4wmjn7bH1bD1qmvvAh7JGL5rBw6QkITu30pSRIn
	6cJY4usV5ZRGWE9lp9j97UbnXmH5LCA=
X-Google-Smtp-Source: 
 ABdhPJxur0cEaoDFnFrwjyrZqjP2mpw9HewIbmqHn+q4AWpaJFHC/ifRi24UC7/teiEiaQOqtF8gwQ==
X-Received: by 2002:a17:90a:f193:: with SMTP id
 bv19mr14845114pjb.157.1642088344435;
        Thu, 13 Jan 2022 07:39:04 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bf73:e59:4f56:2dd4])
        by smtp.gmail.com with ESMTPSA id
 q12sm3278507pfk.136.2022.01.13.07.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 07:39:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 2/3] ref-manual/variables.rst: add SETUPTOOLS_*_ARGS
Date: Thu, 13 Jan 2022 07:38:42 -0800
Message-Id: <20220113153843.2544066-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220113153843.2544066-1-tim.orling@konsulko.com>
References: <20220113153843.2544066-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Jan 2022 15:39:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2407

Add SETUPTOOLS_BUILD_ARGS variable which can be used to pass additional
arguments to `setup.py build`.

Add SETUPTOOLS_INSTALL_ARGS variable which can be used to pass
additional arguments to `setup.py install`.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  - drop "default" variable examples, as this is brittle and perhaps not
    providing that much value.

 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7c2f74a39..37231a3cd 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6847,6 +6847,18 @@ system and gives an overview of their function and contents.
 
          EXTRA_IMAGE_FEATURES += "read-only-rootfs"
 
+   :term:`SETUPTOOLS_BUILD_ARGS`
+      When used by recipes that inherit the
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable can
+      be used to specify additional arguments to be passed to ``setup.py build``
+      in the ``setuptools3_do_compile()`` task.
+
+   :term:`SETUPTOOLS_INSTALL_ARGS`
+      When used by recipes that inherit the
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable can
+      be used to specify additional arguments to be passed to ``setup.py install``
+      in the ``setuptools3_do_install()`` task.
+
    :term:`SETUPTOOLS_SETUP_PATH`
       When used by recipes that inherit the
       :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
-- 
2.30.2


