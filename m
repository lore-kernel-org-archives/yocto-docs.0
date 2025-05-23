Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A1BC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 11:24:50 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.45935.1747999479205777582
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 04:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=AzJPm1Hr;
 spf=pass (domain: snapchat.com, ip: 209.85.208.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-601aa44af77so11803523a12.3
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 04:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1747999477; x=1748604277; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh87JIBV9evYLqzEwNSQAbehnUFvwKsEZWneCQaFXfg=;
        b=AzJPm1HriGR2Yy+ciFg+kDe45/VTTYXTHXoNFnmeUEek2rrsFpuyZdGnU5+R4EZo4x
         y5KD1Hom5rkTeK2c06eM05SzN7dCY02JXahglJT98EsoI81wW31q+VAF5Z6DS3edzLGK
         FE7U4fKuHV9hsCIx75u80QPVX6wWySWn84RqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747999477; x=1748604277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xh87JIBV9evYLqzEwNSQAbehnUFvwKsEZWneCQaFXfg=;
        b=leYmT8lPxlbC7+xTwhYU51sXysmdo+1aKw5jmSVeQRUgeomPA/RwrByt7rfM63R0oF
         jXVg4TmW8T5j92+K9SgBRBYifuBXCTMhTBWwHCSSyNd5wIAUjctssa27gEZcrme2jjFw
         +XXMJ64ey85Qs34nD7tPLXpj2dZER5Xaz85ReEt6pk9JKX2Gdh7xEclGQ6lOURrPq28F
         oa/YlK6g4WEbeLH7mTepoa3uVzyWid3Vxfxw0xzAK5NqUzGH7XemoO2fq80bILxWMRyJ
         qaLCJjhflUG/Zn8bkiM9hCOeKI151LoIsGiLvkbSGHZZXJomSF81rQ8DYC5e+/eQRU5Q
         sHFA==
X-Gm-Message-State: AOJu0YyYpJUGCI83Lm1K4Ay3QrV1cvLOapzLPiRhfrGBEYDQQJfLUkkX
	tgo2LZFxFMBFhXvcsoejPLpLGvjd4mXkpyyNUz4ytyrgOdrufZiYo2z6qZIOhH3MedUVW04XDpK
	etI6NHVs=
X-Gm-Gg: ASbGncupj8UatV1FjAcpoYIltNnB4RAZ7LCvwtzmm/q/gFO1Rwq7KWavMpVtL8yDfks
	n9b0ko30icH8LPezUqZ+xS3fdywz9X0JixIa4jLn1jlGs2blSNKvroW6BN10Vi/MEzwRAodG8kG
	pvgKYChiPtosOfcg97fv9ulPFFttaHLRjayQRbmyvmhv8SokJ41ZyLlfo134BqEl1zi5JPLpF1S
	9Q41UzibcNKHH5tacvL1ljud4eI9o/QO5vvD+P55Rms5hZr3nu2HIP7ncpOLFAe9a+w1kZ2L2u9
	E7ldSjEeW0NkumGh+MIi2UkpV+wTu+d4FNKC17I/pbI1vmPG/cUfZE/ZqwkPHWEg
X-Google-Smtp-Source: AGHT+IGklaXm4xdtKBpGvd6V2+nZJm7IH8WivBkgPr1+fV2PKNSP78DzndNpQ/lFw4EsPhW6PmGYEA==
X-Received: by 2002:a05:6402:13c2:b0:601:fd36:6ee1 with SMTP id 4fb4d7f45d1cf-60291582de8mr2232603a12.0.1747999477109;
        Fri, 23 May 2025 04:24:37 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e3ca0sm12127627a12.42.2025.05.23.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 04:24:36 -0700 (PDT)
From: ecordonnier@snap.com
To: docs@lists.yoctoproject.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [docs][PATCH v2] ref-manual/variables.rst: document SSTATE_SKIP_CREATION
Date: Fri, 23 May 2025 13:24:28 +0200
Message-ID: <20250523112428.278675-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 May 2025 11:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6888

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 documentation/ref-manual/variables.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae8f..dc6dd2f1ba4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9049,6 +9049,26 @@ system and gives an overview of their function and contents.
 
       For details on the process, see the :ref:`ref-classes-staging` class.
 
+   :term:`SSTATE_SKIP_CREATION`
+      The :term:`SSTATE_SKIP_CREATION` variable can be used to skip the creation of
+      :ref:`shared state <overview-manual/concepts:shared state cache>` tarball files. It makes sense e.g. for image creation tasks as
+      tarring images and keeping them in sstate would consume a lot of
+      disk space.
+
+      In general it is not recommended to use this variable as missing sstate
+      artefacts adversely impact the build, particularly for entries in the
+      middle of dependency chains. The case it can make sense is where the
+      size and time costs of the artefact are similar to just running the
+      tasks. This generally only applies to end artefact output like images.
+
+      The syntax to disable it for one task is:
+
+          SSTATE_SKIP_CREATION:task-image-complete = "1"
+
+      The syntax to disable it for the whole recipe is:
+
+          SSTATE_SKIP_CREATION = "1"
+
    :term:`STAGING_BASE_LIBDIR_NATIVE`
       Specifies the path to the ``/lib`` subdirectory of the sysroot
       directory for the build host.
-- 
2.43.0


