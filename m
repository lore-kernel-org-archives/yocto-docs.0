Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4DBC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 11:19:02 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.13711.1737458333307156332
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 03:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RHiFLnrT;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: simon.eu@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab2bb0822a4so1083461466b.3
        for <docs@lists.yoctoproject.org>; Tue, 21 Jan 2025 03:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737458331; x=1738063131; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKHXjp0t2tka9YrEGnurO6tIGodSyxIheNrTsYuz+l0=;
        b=RHiFLnrT1bLH0BZB7axXlcZftR3qWnRuYiFYfTUmsaFVfq24KBKAKykgr5P37Syhs5
         xHjr+rV8qvKrfbeZOo9YkIgGQ6hCYhFtd3MfSytYFXkp/vN+6veluaE41nc0HlkVxxlN
         kJ0uSE/35/gS8K17vRx7+1Sezdw4UwSF+bytKiLjdQIVuORMQIucRaXrlHO/4rf8bdsR
         tpG1UlXvG+xU43T92AaYUjUNbEZpLZDQyo7UBUqLF0W6wfg5BAbIdWNANGnMcTPxxb8m
         8BBSiADDTFqOFpgsrs8VFHYd6KJ9tkjIphbvV44Num+CTaikj00ItjghXy+YpqJL99sb
         mR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737458331; x=1738063131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKHXjp0t2tka9YrEGnurO6tIGodSyxIheNrTsYuz+l0=;
        b=iUuaGBt5IqS/8hXwZwdWhQa6HGWyzh+1mY634s2WiGvNU75toJyg/6o3dn4nfuePnm
         DENvpWCBZhrrUbDeLxQwDmh06UUToSmHNofqb81ZbEqFB3XWjpGNpk2LOfBNahjEYz7e
         flAv4U6G4IgY4Z+E+5+qjB4mALNeStE3ex7LD6YQiIsCOeFsiQOtkwQaiLyjxcfq6wYo
         UQ22JFTVErEuTNe0gvWs5wl9vsWx7UqdZiO78StRI1aTWtoTicm3BIBOP68hU2gpyEFI
         Vz8rBMvH0sIKALelA+gLoTaWPUHbcorJxxfKA49noogXlggmOArXsJApetfvgteC6tyn
         YcDg==
X-Gm-Message-State: AOJu0YzNGMZjEU0NxAr/5QSYolM3F1vNChHIeC/a1DL7a6l0dpB3QwmO
	SorwUjtSu7jeGt1ze6HrQvcD0pQEN3Ks6GSo0bKeSEvqgtP4eO370/88YQ==
X-Gm-Gg: ASbGncvwf95uYVjw+CVRG0x9u4STLcSpjqBWPio5XXWBXJRkNpplbMVgUyqnJ5jHV76
	4PLupVwH3aVCyhqKy8NnyiaK/n5bFib3lFjh4pi68DBPyMSMwwVGcdyTdJk3yOSYitamERhDzOP
	imVpfYOjV/8F0kluUuGEcNVi7B2dxBHhTAdgkTBSSDNrHUqpdzh2uSVKweTJl3KujIT0Bb5r/EQ
	9Pcw8KAkM2b0hQ/HRm6X7ppBP6hNoSh7VIlu7+Dh751nIIbowIBgAGQ8l4GaesN0iL8Yfcb2A==
X-Google-Smtp-Source: AGHT+IFJ/Y0R4nTav2Od2oqwC3PQ3iKkDT6kGJqgRH+MtmBQQzjdK/XauwJKqxHbqcKRuTp/+XXNHQ==
X-Received: by 2002:a17:906:80c4:b0:ab6:37c5:12b6 with SMTP id a640c23a62f3a-ab637c5155bmr231237566b.7.1737458330893;
        Tue, 21 Jan 2025 03:18:50 -0800 (PST)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab384d28507sm735757466b.77.2025.01.21.03.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:18:50 -0800 (PST)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: docs@lists.yoctoproject.org
Cc: "Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH] ref-manual: Describe grub-efi-cfg overrides and GRUB_TITLE
Date: Tue, 21 Jan 2025 12:18:36 +0100
Message-ID: <20250121111836.47434-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115080758.27000-1-simon.eu@gmail.com>
References: <20250115080758.27000-1-simon.eu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Jan 2025 11:19:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6153

This patch describes how to use overrides for grub-efi-cfg because that
is otherwise only clear after reading the .bbclass file. It also adds
a description for GRUB_TITLE.
---
 documentation/ref-manual/classes.rst   | 18 +++++++++++++++++-
 documentation/ref-manual/variables.rst |  6 ++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 761be7b545..df6092f082 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -987,10 +987,11 @@ introspection. This functionality is only enabled if the
 The :ref:`ref-classes-grub-efi` class provides ``grub-efi``-specific functions for
 building bootable images.
 
-This class supports several variables:
+This class supports several variables.
 
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
 
+Each ``LABEL`` defined in the ``LABELS`` variable creates a GRUB boot entry,
+and some variables can be defined individually per ``LABEL``. The label
+specific override names are defined as ``grub_LABEL``.
+
+For example, for a label ``factory``, the override name would be
+``grub_factory``. A custom GRUB menu entry titled "Factory Install" with the
+additional parameter ``factory=yes`` can be achieved as follows::
+
+  LABELS:append = " factory"
+  APPEND:grub_factory = "factory=yes"
+  GRUB_TITLE:grub_factory = "Factory Install"
+
 .. _ref-classes-gsettings:
 
 ``gsettings``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0c5c7aab97..9061c206a7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3320,6 +3320,12 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-grub-efi` class for more information
       on how this variable is used.
 
+   :term:`GRUB_TITLE`
+      Specifies custom titles for GRUB labels defined in  :ref:`LABELS`. See
+      the :ref:`ref-classes-grub-efi` class for more information on how this
+      variable is used.
+
+
    :term:`GTKIMMODULES_PACKAGES`
       When inheriting the :ref:`ref-classes-gtk-immodules-cache` class,
       this variable specifies the packages that contain the GTK+ input
-- 
2.43.0


