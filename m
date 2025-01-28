Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247E3C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 10:23:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.14690.1738059793607026683
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 02:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JKYgcvHG;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: simon.eu@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so55713495e9.2
        for <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 02:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738059792; x=1738664592; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c0tEmaijhLOuY1IybJiwl0ftTCp+xb0b1cNVAQQUqYI=;
        b=JKYgcvHGN2BBRuSFZJc84AVXsMq2txFsLbx2haVribZpGnffLZ7kC+YPTZi0DQC4yM
         HGwRR0S75hHba9q4e0+Glqs6sfTvwP/j/NUsenJ+KR2nj1x4dlXf20vwq66IrbbSqHh/
         a6s4NhD+XFzvIDBAWzFBf3FgoZQymh7Jqk7Dgy0caQfCIqNruEwpCeyPNBV4S2KJQWEY
         mBL0oII7z9dPsD7r+C2ZpJa4P+WUQh55FKXF3YtW3GEivEFFYTMck39intn+TeQJPQmd
         +eVXKS8NhgAXPyawBdIZA51U02iZmqto6BavFDIt7KbU1YTlpE7FZITw8GB0ZXB4JOQt
         MP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738059792; x=1738664592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0tEmaijhLOuY1IybJiwl0ftTCp+xb0b1cNVAQQUqYI=;
        b=S5diSnQrzavDxtsMRRl99f/gsmjmjmB1sOKd0rzqPVXGCZ8NEQkP5RxhoKeb9nfSta
         0DCyT/vPcuMyXNh+xYnOeZdbwCNv2tyQ+3r7uxn7fwuu+m4TUQhNzpeoMNXMQtNvg65V
         dpjdizk9YxQgsIqX6tx9xOvzcOUWcHSbS6UcUAOHUddn9Nkup9ZJivOSSb73ZgFyzstu
         bjiBK6/5WM6iNYWpA2M1pFE1JYfbDWeIr0pyFZpHSC5S0Du4nu2OgyknWkSPGzsxh/Gb
         Ncu2rQOmGgxdR0yRsbLuqwP+2BAH5tA7rAmVlk17comekM1gP6egASUOJ42l5LPXQSaQ
         GhLg==
X-Gm-Message-State: AOJu0YyfPHooqBTgMOWfhuEWHs30xcb9It+RN55uubFue8JOij7Kkd8X
	iUG8R2iOPfrl4KSR4Gsnf4P9MK/KjXPIgBoJvPzCt9FTInlY7QPI8Rb7IA==
X-Gm-Gg: ASbGnctZ1UQSzn+Lqw/m8bTyuYpK2ARKgsemqe5JrN3z6jqdppJofzCxjBmUPBoUha0
	J9IrtQhVBABJOXefEu8SOrAl6uQuXK90aBDRHsra/pSjkANR2xe/bV4xn+ZYFrGaCrmDr5iqSdV
	K0Mr3RZZ7dljwLE57T3GA82l7RWcmoS5ydnXubpF9tg+kzzXzI7fC624/aBwvCuPBvtdfUIl4p9
	yAv0+CU4NOiDNxvXJpYUI7F7PGy8Q47/GQfBfOh2npz9Dn71VXgpiIr2b+yGNQJuvvzBTavIn0z
	M/+TAvVNW3fRLOiTPSI=
X-Google-Smtp-Source: AGHT+IGCIQ6hz3TSQngpT7XOSb/iOVhrM7x33PCGH/OABeVZxsMtiWQuFG4Vc5IoliaLKW2BDtndRw==
X-Received: by 2002:a05:600c:c87:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-438912d54b1mr442440855e9.0.1738059791330;
        Tue, 28 Jan 2025 02:23:11 -0800 (PST)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438bd4856d8sm164266975e9.11.2025.01.28.02.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:23:10 -0800 (PST)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	"Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH v3] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
Date: Tue, 28 Jan 2025 11:23:08 +0100
Message-ID: <20250128102308.42435-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 10:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6206

This patch describes how to use overrides for grub-efi-cfg because that
is otherwise only clear after reading the .bbclass file. It also adds
a description for GRUB_TITLE.

Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
---
 documentation/ref-manual/classes.rst   | 16 ++++++++++++++++
 documentation/ref-manual/variables.rst |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 761be7b545..1d64ac2f28 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -991,6 +991,7 @@ This class supports several variables:
 
 -  :term:`INITRD`: Indicates list of filesystem images to
    concatenate and use as an initial RAM disk (initrd) (optional).
+   Can be specified for each ``LABEL``.
 
 -  :term:`ROOTFS`: Indicates a filesystem image to include
    as the root filesystem (optional).
@@ -1004,6 +1005,9 @@ This class supports several variables:
 -  :term:`APPEND`: An override list of append strings for
    each ``LABEL``.
 
+-  :term:`GRUB_TITLE`: A custom title for each ```LABEL``.
+   Defaults to ``LABEL`` if it is not defined.
+
 -  :term:`GRUB_OPTS`: Additional options to add to the
    configuration (optional). Options are delimited using semi-colon
    characters (``;``).
@@ -1011,6 +1015,18 @@ This class supports several variables:
 -  :term:`GRUB_TIMEOUT`: Timeout before executing
    the default ``LABEL`` (optional).
 
+Each ``LABEL`` defined in the :term:``LABELS`` variable creates a GRUB boot
+entry, and some variables can be defined individually per ``LABEL``. The label
+specific override names are defined as ``grub_LABEL``.
+
+For example, for a label ``factory``, the override name would be
+``grub_factory``. A custom GRUB menu entry titled "Factory Install" with the
+additional parameter ``factory=yes`` can be achieved as follows::
+
+   LABELS:append = " factory"
+   APPEND:grub_factory = "factory=yes"
+   GRUB_TITLE:grub_factory = "Factory Install"
+
 .. _ref-classes-gsettings:
 
 ``gsettings``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0c5c7aab97..4eb11abede 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3320,6 +3320,11 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-grub-efi` class for more information
       on how this variable is used.
 
+   :term:`GRUB_TITLE`
+      Specifies custom titles for GRUB labels defined in  :term:`LABELS`. See
+      the :ref:`ref-classes-grub-efi` class for more information on how this
+      variable is used.
+
    :term:`GTKIMMODULES_PACKAGES`
       When inheriting the :ref:`ref-classes-gtk-immodules-cache` class,
       this variable specifies the packages that contain the GTK+ input
-- 
2.43.0


