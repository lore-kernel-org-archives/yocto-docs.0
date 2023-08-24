Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3933FC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:27:16 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.12103.1692887228980007253
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 07:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Dsqp+N3u;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-57100097713so1476763eaf.0
        for <docs@lists.yoctoproject.org>; Thu, 24 Aug 2023 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692887227; x=1693492027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jnxtt6TyOrMgXr4jp7ZYn/uBSyk6+pbDF+l5Wf9ld6s=;
        b=Dsqp+N3ud2Bkhbq1m1r1b1o/athh61M1+ARhVh1h5GvyNtBKNYzUOtJeepCm2G3hTC
         PSEeaayeFxFlmttv/iNP1b68xNRHM5yv+iEwOaAk0+pbIGkXM+FYM9prY7mVGs8Lrc+x
         14ojuNzAEDkbHkUTKprmClZfh73rQKQX3zRH2y5uhthTGIe6/ZMX3v71AJiToM44m+8J
         fCCL6WrqSuQd6iMTUWKvmS/mRhO2+WiN3djDvZnIUMZsTwLrwTY6IzTCkG/W/mmWfZoh
         lg0FcbulCsTwYAUHuqyq0dtKl+N1o6xTfwgFWHIk/Jq7Bybrg+p01y/cicZLYh9RKy4y
         weig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692887227; x=1693492027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnxtt6TyOrMgXr4jp7ZYn/uBSyk6+pbDF+l5Wf9ld6s=;
        b=ilK+2o6ssmovHXLzJALfLlehTC95LcjexaYy7lztlTKVg6+XG5DSAKFTMpJx6M4Xox
         UgwKKhir3KzgdUQ07604DG6uYTD49nUD+GSmwG+M8691YbAjjInDIZl4s8im7FEUesqG
         Q5p06D2bXWAKxcHATlq/1T6RlP3zydYtOGwkPvYWQb865pSLd/2TiM52snqMOJLMz1ez
         htjxrX4woUac9BkZmI2VmjtlcfQiJyyu5t+mwGpJslWGvlenfjveKUYqz6FUNH2euX0U
         1j44gg1fQcVgLB+nXQOSllns+3AyE3rFJBDMZn98Qk1fkicpWf8WcawxoJnXJHMPGH2L
         kiHQ==
X-Gm-Message-State: AOJu0YzmjPMpDuyV6V1VvAyoLMF+ukPMAes1hkwbpKaak4Hvx9rt/jhl
	CccIgOrMoTVhYXx2cfyy+20jAAYJJdw=
X-Google-Smtp-Source: AGHT+IGC+Hr1qh7BRnRtDb93DdOH7Og1sMQPA3DLYmEyZP4BNLmm9B8DiEY0O/zQ46rAfCHP1yCb3A==
X-Received: by 2002:a05:6808:238c:b0:3a7:4802:c3f with SMTP id bp12-20020a056808238c00b003a748020c3fmr20632417oib.52.1692887227561;
        Thu, 24 Aug 2023 07:27:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::751c])
        by smtp.gmail.com with ESMTPSA id bg19-20020a056808179300b003a3860b375esm1838173oib.34.2023.08.24.07.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 07:27:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] Add libacl to required packages
Date: Thu, 24 Aug 2023 08:27:02 -0600
Message-Id: <20230824142702.3491681-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Aug 2023 14:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4176

libacl is required for correctly calculating output hashes, so add it to
the require host packages

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/poky.yaml.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index b2b6a6330ff..2922214bc94 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -13,18 +13,18 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     python3-subunit mesa-common-dev zstd liblz4-tool file locales
+     python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
      \n\   $ sudo locale-gen en_US.UTF-8"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
      python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
-     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en"
+     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en libacl"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
-     zstd lz4 bzip2 gzip hostname
+     zstd lz4 bzip2 gzip hostname libacl1
      \n\   $ sudo pip3 install GitPython"
 ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\   $ sudo yum install dnf-plugins-core
@@ -34,7 +34,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
-     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en"
+     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en libacl"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
-- 
2.33.0


