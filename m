Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC34EC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:57:52 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.13179.1641931071608444014
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 11:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vg3CbQrz;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso7404697pje.0
        for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 11:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVlyh3Vrie0Kx+2EksxkfyjIqoXsfTo5xYzOlpX2AYE=;
        b=Vg3CbQrz0FJPPiNDVt5Aec2WdOWSLViiFSLDym5hiXwVp5FzAe1vBNgizXmNeNbNDs
         iuhmbqkkLc2PLlMb8748d5pk+kJY7xLcZtMwvL74i0i8VzzRjzJUs2X7hfIAps3ghMv2
         jtn86BohU81BZtXJj83ZFNNtL2ARqcvuACj9YOQN7hU+isepwYwUaViNnpo7Och8CVch
         K9fnFYWWjPss11tdgDebpVqd4gTH/A6kenNXJRE/d8sMTjBn0cMDVP1t6IyC5uvNzc2k
         JAJ/Wt6iIkFIwJUrVc7qp/kHcjpEcSDxgtPM2aFEPyfHfFfX6X6gzrtAScls9y+oO3jn
         bxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVlyh3Vrie0Kx+2EksxkfyjIqoXsfTo5xYzOlpX2AYE=;
        b=jKxk/HjZG4r8r+uhXNvSdNO9jFM8PI+AxsQD7ef96ttyOvEluik18vJtzgWP1PH+sh
         o2SwZdPpai2jozzvBFOSg062fQvVkfQPiQrsxVHswJhAJHYiBlhPjvu1TuPf3GHivic5
         TpjvMeenlc0FKHqMjmxo6YSP9lovxuWjrZZbkrQUdNbaLlBJfOrsaRdZGEQhy0WahBNX
         3D9fbcGTUEkUdZIJDH0MH3HHQExPe76ffOeshcJEhrW9QnAakBF+zCByCs15NhL5utza
         dbE3ycQlhtCsFueuqJOgUR1S1YN429lKsimLz9EB7qpN0ckzXjk7LS2ZuT5mI4Er7cpu
         S17Q==
X-Gm-Message-State: AOAM530FZtAa5u9Lvdy5MjykIT8vzGVMMn+6NiEkg1wrU6UolIkg5T21
	VtXkD64AMnlzJXEu5hm7q/079xOIKKc=
X-Google-Smtp-Source: 
 ABdhPJx3pGKdZgYWc5m+HdesYFuqs2R4W7AdRWeD2NrJeY6sNE/7Nm9icDFACvX9lVRGs1AqDhCUvQ==
X-Received: by 2002:a63:ab4a:: with SMTP id k10mr5323129pgp.105.1641931070859;
        Tue, 11 Jan 2022 11:57:50 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 b4sm12029319pfl.101.2022.01.11.11.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:57:50 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] ref-manual/variables.rst: add SETUPTOOLS_SETUP_PATH
Date: Tue, 11 Jan 2022 11:57:40 -0800
Message-Id: <20220111195742.1921572-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220111195742.1921572-1-tim.orling@konsulko.com>
References: <20220111195742.1921572-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 19:57:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2383

Add SETUPTOOLS_SETUP_PATH for setuptools3 class.

Deprecate DISTUTILS_SETUP_PATH and drop mention of ref-classes-setuptools3 as
that class has moved to new variable.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/variables.rst | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index be496161b..83ccda830 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1985,8 +1985,7 @@ system and gives an overview of their function and contents.
 
    :term:`DISTUTILS_SETUP_PATH`
       When used by recipes that inherit the
-      :ref:`distutils3 <ref-classes-distutils3>` or
-      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
+      :ref:`distutils3 <ref-classes-distutils3>` class, this variable should
       be used to specify the directory in which the ``setup.py`` file is
       located if it is not at the root of the source tree (as specified by
       :term:`S`). For example, in a recipe where the sources are fetched from
@@ -1995,6 +1994,13 @@ system and gives an overview of their function and contents.
 
          S = "${WORKDIR}/git"
          DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"
+      
+      .. note::
+
+         ``distutils`` has been deprecated in Python 3.10 and will be removed
+         in Python 3.12. For this reason, the use of :ref:`distutils3 <ref-classes-distutils3>`
+         is deprecated. Instead use :ref:`setuptools3 <ref-classes-setuptools3>` and the
+         :term:`SETUPTOOLS_SETUP_PATH` variable.
 
    :term:`DL_DIR`
       The central download directory used by the build process to store
@@ -6841,6 +6847,18 @@ system and gives an overview of their function and contents.
 
          EXTRA_IMAGE_FEATURES += "read-only-rootfs"
 
+   :term:`SETUPTOOLS_SETUP_PATH`
+      When used by recipes that inherit the
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
+      be used to specify the directory in which the ``setup.py`` file is
+      located if it is not at the root of the source tree (as specified by
+      :term:`S`). For example, in a recipe where the sources are fetched from
+      a Git repository and ``setup.py`` is in a ``python/pythonmodule``
+      subdirectory, you would have this::
+
+         S = "${WORKDIR}/git"
+         SETUPTOOLS_SETUP_PATH = "${S}/python/pythonmodule"
+
    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
       signatures of tasks from one recipe when they depend on tasks from
-- 
2.30.2


