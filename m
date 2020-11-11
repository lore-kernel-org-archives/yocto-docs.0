Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.8854.1605110888471354083
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uC3/QI8s;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id s13so2811887wmh.4
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 08:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gqwlXKANLVbVyC17HHl4bSTqiyZGpumtkH6/U64s9Sk=;
        b=uC3/QI8sgKRmSPBC/VE8Wg9s+PzSS6mivMAHClRXYaQQg5iipXWagL23ZKoNfAE8hv
         8ZRKq1T4V6+tJqLMzdHy4D6aMb0nqQXRVHBM++v9osrzisglLg9ZjRRlYAzpkshNbVhv
         taeckh9FFRadMC0Gy7RMRRor7N2xAQ8Fe04kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gqwlXKANLVbVyC17HHl4bSTqiyZGpumtkH6/U64s9Sk=;
        b=VnUl+XySpoe6eEYgOW7Bd/Bk3WLX8jO9RPMMIacsSvP47qD+Vu0EJvXd775oDFL396
         UjyVWhwqdwQKL75nohVS0PG0c0MLaHZ6Yi1iFDyo2hB4/QHSMh84WB3O6nmQi4CvnOXt
         +wVHh0xxg56PrPUsYIOODN8t0tmHRgBBZzQXsLzMLwRf4CwVkXFy/U4O/owbgJSjzugk
         vKzd6VjMRJ7RRPJR1S7Rcyi4E/lmuiysrTWORpNzTcrU4ZXVR4WVfEXOMaQ8GpU83bfa
         lqF4AI1dMPFktkOv05tQHKRcW/3NF4yrIttvoJ5044cPxAgTQp5xgSng1fIOYIlAv/8+
         jZ0Q==
X-Gm-Message-State: AOAM531DO4l3IHw4/tuEg734BHfunUf7GwHkvTY7iZJSRkmSfzwTfX37
	+F3+EKarim4Tycsr42B9BK1Df2B9DlEB8A==
X-Google-Smtp-Source: ABdhPJyeA9LwfVXMWPtAUYX/ruB+Jf7USt9ot9E1pguyN8Ny837ddndR8MfBJ2jwomd4IsWJHOAtow==
X-Received: by 2002:a1c:2c43:: with SMTP id s64mr4800674wms.130.1605110886621;
        Wed, 11 Nov 2020 08:08:06 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id u195sm3174617wmu.18.2020.11.11.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:08:06 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 1/8] dev-manual-common-tasks: Fix refs to testing branches
Date: Wed, 11 Nov 2020 16:07:53 +0000
Message-Id: <20201111160800.5669-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After discussions on IRC with Ross we concluded that the `ross/mut`
branch shouldn't really be listed in the docs as it's more of a personal
test branch. Instead we should list the -next branches for
openembedded-core and poky.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 35 ++++++++++++-------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 27aacde60..698b27377 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10665,18 +10665,29 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
 section in the Yocto Project Overview and Concepts Manual for additional
 concepts on working in the Yocto Project development environment.
 
-Two commonly used testing repositories exist for OpenEmbedded-Core:
-
--  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
-   ``poky-contrib`` repository in the
-   :yocto_git:`Yocto Project source repositories <>`.
-
--  *"master-next" branch:* This branch is part of the main "poky"
-   repository in the Yocto Project source repositories.
-
-Maintainers use these branches to test submissions prior to merging
-patches. Thus, you can get an idea of the status of a patch based on
-whether the patch has been merged into one of these branches.
+Maintainers commonly use ``-next`` branches to test submissions prior to
+merging patches. Thus, you can get an idea of the status of a patch based on
+whether the patch has been merged into one of these branches. The commonly
+used testing branches for OpenEmbedded-Core are as follows:
+
+-  *openembedded-core "master-next" branch:* This branch is part of the
+   `openembedded-core <https://git.openembedded.org/openembedded-core/>`__
+   repository on git.openembedded.org and contains proposed changes to the
+   core metadata.
+
+-  *poky "master-next" branch:* This branch is part of the
+   `poky <https://git.yoctoproject.org/cgit/cgit.cgi/poky/>`__
+   repository on git.yoctoproject.org and combines proposed changes to
+   bitbake, the core metadata and the poky distro.
+
+Similarly, stable branches maintained by the project may have corresponding
+``-next`` branches which collect proposed changes. For example,
+``dunfell-next`` and ``gatesgarth-next`` branches in both the
+"openembdedded-core" and "poky" repositories.
+
+Other layers may have similar testing branches but there is no formal
+requirement or standard for these so please check the documentation for the
+layers you are contributing to.
 
 .. note::
 
-- 
2.20.1

