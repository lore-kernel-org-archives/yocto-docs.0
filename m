Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.21883.1605694032119880836
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 02:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UbgrMnOF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id s13so2136969wmh.4
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 02:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BZwwHJIqZoanztjv7zKHwBcM0790vuVZTIpoe0ebci0=;
        b=UbgrMnOFPoCVI7zu2hXWytfyEyU9Zb3SIuNlIjdY9WfUqWSXf/P9ZkcH0TxxNiIKYS
         23ftwzcEFh0CIJtgo8J6enYWzqz5QDy3sFVaFbG7NxcV0kohkCBVpFO3fCn7PnKmennc
         S1IiMNgU4wUzC3onPsVP4oaeE2J/Ox2vZdQ/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZwwHJIqZoanztjv7zKHwBcM0790vuVZTIpoe0ebci0=;
        b=Qbm+Nr+B0IXalV/RkY1w4rQEoxJkdREMUKZkEt2LO4k+sMar9jnHp7HCsET6F+zQyd
         XzAiPKXuO6HMc6Lq3E1cYw5jd6QJmunHCUwc6/NGzOxG2x9pT5Vg4NGzdWAomF19oA7M
         Y+Gg0lnGR7sUwIPuiDo+qNcye6k4B2BQqwaLW7r04EvLGOHLfZCkxtvM331lkY6ry0Rl
         xWwgzmMV2mv1iiSrgE1sUXrF/+uQCyFAmABae1thSSMkpZ6eYBOPnnYxnCd0EXPm1R0O
         6RNC8DyelozBfh6PQH9zXjWfwlWmT7MovkuQ3kIJC6s1RDfRxMpltcvXwNZ9jrSS5HXQ
         pugQ==
X-Gm-Message-State: AOAM532SokRzvDl8FKHWvpx6uz0sRn9OuTKdEO9fLD82SLE3PIUpVwS1
	3vyhU+Zym4kKOjmZ6HmUVShH7E5C5F9EZA==
X-Google-Smtp-Source: ABdhPJyc2vwGUpffm0M+ZgzXQ7LsxUqcn8+DQa+qhYZUCGSFR+Om83E3G8qa6xqKKTaa9Ddao7d4ww==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr3532611wmj.26.1605694030272;
        Wed, 18 Nov 2020 02:07:10 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a128sm3013391wmf.5.2020.11.18.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:07:09 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 2/9] dev-manual-common-tasks: Fix refs to testing branches
Date: Wed, 18 Nov 2020 10:06:58 +0000
Message-Id: <20201118100705.3656-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201118100705.3656-1-pbarker@konsulko.com>
References: <20201118100705.3656-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After discussions on IRC with Ross we concluded that the `ross/mut`
branch shouldn't really be listed in the docs as it's more of a personal
test branch. Instead we should list the -next branches for
openembedded-core and poky.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 33 ++++++++++++-------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 27aacde60..6f526c203 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10665,18 +10665,27 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
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
+   :oe_git:`openembedded-core </openembedded-core/>` repository contains
+   proposed changes to the core metadata.
+
+-  *poky "master-next" branch:* This branch is part of the
+   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
+   changes to bitbake, the core metadata and the poky distro.
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

