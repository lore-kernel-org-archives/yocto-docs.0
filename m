Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D2FC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 15:02:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.46836.1710774137427705746
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 08:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VhyfK8Xz;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513dc9d6938so3418995e87.2
        for <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710774135; x=1711378935; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLOe/K7nF8umlGoLT2N9MjdWOAbL/4g+FBrKPN0vgjo=;
        b=VhyfK8XzQl6YW5Dprc9lVO/9xXHlkE4OmDPK6m0iIL4B8HhbKXYCAP/uzxS+HgSf0A
         ByRERi1QjLsNgLqBvIAivkSXQVkPry0rDfD0u3c001ZH09UX32wSxX498oN+SesZNhma
         5FBIcvQ3c6bdjKHNKn5kXrPfikLO+H2w3UYQT6xliGMP4Ny0OKq3wl045hzr620FkG8H
         EfdYZVWEBgLcHUGFtgVOlJIr9SJaAtlb9wb5XC6Mf+leXtTk6jI70xqOXa8DZOg58ENE
         ecF5sym7+udLK9mr6qqX8fJAxaNpNe1TDAhOjXTawcloOBnxC6oelJJgdbr3Zt90XwZk
         Aotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710774135; x=1711378935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLOe/K7nF8umlGoLT2N9MjdWOAbL/4g+FBrKPN0vgjo=;
        b=ufV2l/oPb1pbek+1UIZKUjnwi/rW47fDWXAWetT5eqmCwVcPYwAAcgYkQrjiMEs11a
         zR5VeuEnu9xx6zkpVQ70XbTtDDsrH8wF7uVQuaOzW2IjIPCHoKWpgzCKNAJ2P/hfFYzH
         UsgAln1IbihG1Kzkf6yjr1UrHv5JBmcroVdH694iFFe7ffYVC9S7u5KjOaRxrd7275zW
         KXZ8k2PvZ1zv9YShcnuzXX4ivePn4VK0jePaFgczWURhZitBnxUn/nUbXyg4Yejd1iLD
         xsYiq2v23gJL557Lz4V/Z9XfYH+9EIzITGWfxlSPpWRl1sjDakciDlQlSzzvLxn0r0oz
         DDSw==
X-Gm-Message-State: AOJu0YwIyVgkd7wIpHfpgfdTSJvj98BOVGx9lghClVThNw4x1EWWvCut
	juwOhzPzwfUFDH6y8tKhgNOkYH+81OpApjarGSz36q9zr2pXRF84AdJKoeu0
X-Google-Smtp-Source: AGHT+IEE9OsBwewcShx4VxJyAORUGL+CVYp1pSFLBX491sHqqPsUEkIQ5mfce2qRdvVisfABfy43wQ==
X-Received: by 2002:ac2:4a76:0:b0:513:5978:6919 with SMTP id q22-20020ac24a76000000b0051359786919mr7628253lfp.68.1710774135430;
        Mon, 18 Mar 2024 08:02:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id be7-20020a1709070a4700b00a46a9c38b16sm2635356ejc.138.2024.03.18.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 08:02:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] dev/ref-manual: document conf-summary.txt together with conf-notes.txt
Date: Mon, 18 Mar 2024 16:02:11 +0100
Message-Id: <20240318150211.1192651-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318150211.1192651-1-alex@linutronix.de>
References: <20240318150211.1192651-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 15:02:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4988

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dev-manual/custom-template-configuration-directory.rst | 6 +++---
 documentation/ref-manual/structure.rst                     | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/dev-manual/custom-template-configuration-directory.rst b/documentation/dev-manual/custom-template-configuration-directory.rst
index 9bffef35b46..06fcada822d 100644
--- a/documentation/dev-manual/custom-template-configuration-directory.rst
+++ b/documentation/dev-manual/custom-template-configuration-directory.rst
@@ -42,11 +42,11 @@ would be::
    TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf/templates/default}
 
 If you look at a configuration template directory, you will
-see the ``bblayers.conf.sample``, ``local.conf.sample``, and
+see the ``bblayers.conf.sample``, ``local.conf.sample``, ``conf-summary.txt`` and
 ``conf-notes.txt`` files. The build system uses these files to form the
 respective ``bblayers.conf`` file, ``local.conf`` file, and show
-users a note about the build they're setting up
+users usage information about the build they're setting up
 when running the ``oe-init-build-env`` setup script. These can be
 edited further if needed to improve or change the build configurations
-available to the users.
+available to the users, and provide useful summaries and detailed usage notes.
 
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index acadd5efa3c..9f26319c327 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -172,10 +172,11 @@ targets to build. Here is an example::
    You can also run generated QEMU images with a command like 'runqemu qemux86-64'
 
 The default output of the ``oe-init-build-env`` script is from the
-``conf-notes.txt`` file, which is found in the ``meta-poky`` directory
+``conf-summary.txt`` and ``conf-notes.txt`` files, which are found in the ``meta-poky`` directory
 within the :term:`Source Directory`. If you design a
-custom distribution, you can include your own version of this
-configuration file to mention the targets defined by your distribution.
+custom distribution, you can include your own versions of these
+configuration files where you can provide a brief summary and detailed useage
+notes, such as a list of the targets defined by your distribution.
 See the
 ":ref:`dev-manual/custom-template-configuration-directory:creating a custom template configuration directory`"
 section in the Yocto Project Development Tasks Manual for more
-- 
2.39.2


