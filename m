Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0D3C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 14:21:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.7876.1648650060832665077
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 07:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iHMPPlzY;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m30so29560714wrb.1
        for <docs@lists.yoctoproject.org>;
 Wed, 30 Mar 2022 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oSVA9+0b7Iu7HzXOAUvz8FmRjCm5a5iRQzfB7M7/4uo=;
        b=iHMPPlzY3t2hxuiwSu5ytxr97kXqqkhGOpPMGUnI1rjyc42dnOMKDKW9UX4hvLJosE
         fD3IuAunxPd38mR7WPQo77WPzpi590/s2f2bEuN0aSjDPfRZCA4Wwnp+FYN9qyy4KCLy
         Xg2RY31tY7mVA/DCwIlhOTojEoAIXI4uuMQ0xX2MzuTrsP9hP2pyt2z1SKlKlaQfmIKB
         6706aQfSsuIbQJe0QSDg1cOsPPGaJk8m9qsVRNQSgAzUCacy64yutzA/oSqC2dnrdEGH
         Nd2K0QL4RISOiKVBVqjs36/rurqrlgR2MxZMcBFdpobaf1C5ALuJ37mfCU1PwaIpJrj5
         AQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oSVA9+0b7Iu7HzXOAUvz8FmRjCm5a5iRQzfB7M7/4uo=;
        b=4+Fy//dqBZ9fk2PN9Vf4JWp4WSo+ShzgLfH57JNte4w5kx8cVgvB1aUMuZV+UkrA4/
         5JI6bQzVSz6xKoXt1zUq9VoaxCoDWv1j96M0yubYY/8oTEaeVoOoy9hDGxDz0MqFtea+
         5Xao6TCR0OxYkT88TLSnjlk8gXc83Km/O3ZjtKzEo+7stP4K+5QOdrcMnQQ26OwDoKXe
         dgG3ODpuUtorkJz7VSc0y4TrNWfNPVq8IjkDm6498WQ/tDJn7FHtbkpQMvszynxAdsyn
         yiIW16Smo6KxRWsxFjw++7PJ+6Dvb8Rb5IMFBVfP7rsgLJEJ/lum837ipT3MxXAnyvSn
         MZvw==
X-Gm-Message-State: AOAM533trr4vACo0J+UyHUsXWztYvbIXn7mHld3F74d9B1OqZua4Pk8V
	LWjXmRL4mMvjZNZA8e9yFAnxk4N2fcM=
X-Google-Smtp-Source: 
 ABdhPJyc6Ht0/KZZ86VZTUzuvNSaRhvDMVWmJm58ZuhLyoAptiWH5LMl3eiJY1nhyOiGo0MmsEpdgg==
X-Received: by 2002:a5d:6d8b:0:b0:203:e242:5e38 with SMTP id
 l11-20020a5d6d8b000000b00203e2425e38mr36953671wrs.105.1648650058960;
        Wed, 30 Mar 2022 07:20:58 -0700 (PDT)
Received: from localhost.localdomain ([80.215.178.95])
        by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4e08000000b002054b5437f2sm17035028wrt.115.2022.03.30.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 07:20:58 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH] doc: migration-3.5: extend the section on inclusive language
Date: Wed, 30 Mar 2022 16:20:53 +0200
Message-Id: <20220330142053.2499701-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Mar 2022 14:21:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2737

Add the list of renamed and removed variables, show how the renaming
script works. Also mention the change in cve-check output.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../migration-guides/migration-3.5.rst        | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index 8ce2306e4..6de7b3b0f 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -12,10 +12,50 @@ Recipe changes
   deleted. BitBake will stop with an error when renamed or removed variables
   still exist in your recipes or configuration.
 
+  Please note that the change applies also to environmental variables, so
+  make sure you use a fresh environment for your build.
+
+  The following variables have changed their names:
+
+  - `BB_ENV_WHITELIST` became `BB_ENV_PASSTHROUGH`
+  - `BB_ENV_EXTRAWHITE` became `BB_ENV_PASSTHROUGH_ADDITIONS`
+  - `BB_HASHBASE_WHITELIST` became `BB_BASEHASH_IGNORE_VARS`
+  - `BB_HASHCONFIG_WHITELIST` became `BB_HASHCONFIG_IGNORE_VARS`
+  - `BB_HASHTASK_WHITELIST` became `BB_TASKHASH_IGNORE_TASKS`
+  - `BB_SETSCENE_ENFORCE_WHITELIST` became `BB_SETSCENE_ENFORCE_IGNORE_TASKS`
+  - `CVE_CHECK_PN_WHITELIST` became `CVE_CHECK_SKIP_RECIPE`
+  - `CVE_CHECK_WHITELIST` became `CVE_CHECK_IGNORE`
+  - `ICECC_USER_CLASS_BL` became `ICECC_CLASS_DISABLE`
+  - `ICECC_SYSTEM_CLASS_BL` became `ICECC_CLASS_DISABLE`
+  - `ICECC_USER_PACKAGE_WL` became `ICECC_RECIPE_ENABLE`
+  - `ICECC_USER_PACKAGE_BL` became `ICECC_RECIPE_DISABLE`
+  - `ICECC_SYSTEM_PACKAGE_BL` became `ICECC_RECIPE_DISABLE`
+  - `LICENSE_FLAGS_WHITELIST` became `LICENSE_FLAGS_ACCEPTED`
+  - `MULTI_PROVIDER_WHITELIST` became `BB_MULTI_PROVIDER_ALLOWED`
+  - `PNBLACKLIST` became `SKIP_RECIPE`
+  - `SDK_LOCAL_CONF_BLACKLIST` became `ESDK_LOCALCONF_REMOVE`
+  - `SDK_LOCAL_CONF_WHITELIST` became `ESDK_LOCALCONF_ALLOW`
+  - `SDK_INHERIT_BLACKLIST` became `ESDK_CLASS_INHERIT_DISABLE`
+  - `SSTATE_DUPWHITELIST` became `SSTATE_ALLOW_OVERLAP_FILES`
+  - `SYSROOT_DIRS_BLACKLIST` became `SYSROOT_DIRS_IGNORE`
+  - `UNKNOWN_CONFIGURE_WHITELIST` became `UNKNOWN_CONFIGURE_OPT_IGNORE`
+
+  In addition, `BB_STAMP_WHITELIST`, `BB_STAMP_POLICY`, `INHERIT_BLACKLIST`
+  and `TUNEABI_WHITELIST` have been removed.
+
+  Many internal variable names have been also renamed accordingly.
+
+  In addition, in the `cve-check` output, the CVE issue status `Whitelisted`
+  has been renamed to `Ignored`.
+
   A :oe_git:`convert-variable-renames.py
   </openembedded-core/tree/scripts/contrib/convert-variable-renames.py>`
   script is provided to convert your recipes and configuration,
-  and also warns you about the use of problematic words.
+  and also warns you about the use of problematic words. The script performs
+  changes and you need to review them before committing. An example warning
+  looks like::
+
+     poky/scripts/lib/devtool/upgrade.py needs further work at line 275 since it contains abort
 
 - Because of the uncertainty in future default branch names in git repositories,
   it is now required to add a branch name to all URLs described
-- 
2.33.0


