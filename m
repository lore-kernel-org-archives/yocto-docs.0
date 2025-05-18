Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4B8C3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 14:51:15 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.31333.1747579868266947745
 for <docs@lists.yoctoproject.org>;
 Sun, 18 May 2025 07:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ck0VkFOJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b166fa41bso5265764e87.0
        for <docs@lists.yoctoproject.org>; Sun, 18 May 2025 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747579866; x=1748184666; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k+MGLmPq01L5YXh6IF1RxsPluRQgxD+n5RU4pzvNKq0=;
        b=ck0VkFOJNj1mBVTAgvqeuT5xdhiS8mF5p9JE9+Tpe5FhlJOayDZWhKLwAvjSUQR8/K
         6wcAPrxViqfqYyYsO5Ya9bZ++/Z38VbpeQpHCEOtI4rwB8uzMhh3s92jzxuZCZprOO/m
         aXLT6mLwKKayFikz8PDPS8i9Pg5FTmU+ebNygJw9EJRDd94lL+yEQywmjOuNQZDpAfPM
         /Hg4OBZlIovdBtmMXzpKk5I0hdasgrinR2W8wUZrgFdLwYJCOh/zbMf6hccoWEbYm0iC
         rTyr3lelqujManCFQ7orApCk+b0WfoOV6DoBYiPu1zBPizlrGcpXe3UreD4fa0J2lTud
         i8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747579866; x=1748184666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+MGLmPq01L5YXh6IF1RxsPluRQgxD+n5RU4pzvNKq0=;
        b=JS0sBI9e7ReKgJht6gDRiKYkfWYIuPOZ1Oes4c7Tb0AIx+Yr6z/hRAQbeX9D1CXBs6
         kp26enSMkOlqVqq5BXA0bJxUNpONHseJLfgq9jYKHpwsA3XWRymtQMuQEFKcRmjnShc2
         pyqBXUEgcxm0JSpTYlAY7jjNY1RpAHqYVZ0DIDySfpiUUW4KhPFdWcVfkXWcg8stY4tj
         VontlMybCBpOSrTW0tZ9dD2H5nsjrhl86dLWDO+/wRJf63pL1FtyyZQvHLL3pJ2JtEvl
         T902eohLRZ3BaPkAisAHXe6Id/NEATaZn7nS9gCDmOi0Fb68Ys/12lz7GygHnnmNXsO6
         XGHA==
X-Gm-Message-State: AOJu0Yz7FweScuUHStAC7XO6KNmPQw7mifBOFsqSEQF1J47UhUciaUeb
	NTqigw8NCIsHvLjA+/O9/drUaGsMb/myG/33Lw9K69H8ejR7ONQPTuTQkrrx7gYu
X-Gm-Gg: ASbGncv7kz3mWAHBsnpS3Vgk9T1SLCaH5Mk5wZFAsdRrTObeRhMXcqLui0234yRjMid
	ded47Yh2BmqhtdA/MEOceO5vxtKKi7jJ/0RyURzaeZJ7rTZcFeM7TAhBCWwceTdbJhYDaVe7Iij
	kvIOXD82HsTOyOyvbQK0lO6HP9nw3TzryBwftrEkwnkkn0b7sCLYudLTWHafs6HMT7or9AK4Vkv
	8GiN+0lFCfzStCOGd3IGyfzEHd86jcBd9fLZgOzmEYtaO9eKoBKvmd1O1spByWlmXh93tYSfQHC
	TcrX/yesxoOetQ0rbKw78hv5ZOyW4AHyOlDyfN3SMq2HBRnsFSTsTszqbdAb5rkTcVfI
X-Google-Smtp-Source: AGHT+IGZr8fh9AZnyoXP843XkUTwsmBSwHvrpUCYVcpaKuZoiWRKkZf4RR64eyTSlUKZ+/F66KLHEw==
X-Received: by 2002:a05:6512:620b:b0:54f:c6b0:5138 with SMTP id 2adb3069b0e04-550e71950f2mr2506187e87.1.1747579865587;
        Sun, 18 May 2025 07:51:05 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.152])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f302c2sm1445584e87.61.2025.05.18.07.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 07:51:04 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] ref-manual/variables.rst: document INHIBIT_AUTOTOOLS_DEPS
Date: Sun, 18 May 2025 17:50:57 +0300
Message-ID: <20250518145057.85245-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 18 May 2025 14:51:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6835

Fix [YOCTO #15756]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae..d73b0d30e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4487,6 +4487,20 @@ system and gives an overview of their function and contents.
 
          INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
 
+   :term:`INHIBIT_AUTOTOOLS_DEPS`
+      Prevents the :ref:`ref-classes-autotools` class from automatically adding its default build-time dependencies.
+
+      When a recipe inherits the ``autotools``, several native, cross tools such as
+      ``autoconf-native``, ``automake-native``, ``libtool-native``, ``libtool-cross``
+      are added to :term:`DEPENDS` to support the autotools build process.
+
+      To prevent the build system from adding these dependencies automatically, set the
+      :term:`INHIBIT_AUTOTOOLS_DEPS` variable as follows::
+
+         INHIBIT_AUTOTOOLS_DEPS = "1"
+
+      By default, the value of :term:`INHIBIT_AUTOTOOLS_DEPS` is empty.
+
    :term:`INHIBIT_DEFAULT_DEPS`
       Prevents the default dependencies, namely the C compiler and standard
       C library (libc), from being added to :term:`DEPENDS`.
-- 
2.43.0


