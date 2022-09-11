Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C51C54EE9
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 17:26:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.722.1662917187986051495
 for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FIE9S86U;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id d5so5616896wms.5
        for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BKf8WJWTW2eGiGBQT/4nceg38wpkB0OmEsNXVlWVWsI=;
        b=FIE9S86UfwqWQHbr0/ms3QqH3jAbV7qVfQGOolbbkG1wymeWLg4zENCYAe8CZRoMBo
         WonAkrUmrpuEvKicSYsmEyrHkIJmGg+cJL5cBWSXBCGJ34oI/l5DkJ4bUK0Mn/4dohjB
         j/S3LrFVLZHiyKRH4EW8ccHAq/b/W79GeD/nu1vd+MhAVtu47AH4KtUaUiW28GCj6Szp
         /xEJyl8A4bUQuGRQD3DVG1eOST+wnUM22xuzvQmtt1XZw5EK/InO65nnKtphEkINXeTu
         G5W6JNPMxPlj3Eia+YCsPnFNGW5vQhkepieDLafxAHiJTJhUWFZHBCZ4c9CPW96CRChE
         FhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BKf8WJWTW2eGiGBQT/4nceg38wpkB0OmEsNXVlWVWsI=;
        b=GAYPV4K/uX2UjK57Q0Umnml0p8A57ADCA01dOe+MB+a7r/ViNOCp4lJnLyigieWtBi
         0UEZ9x4wwdWM26d5JFFvscDowrT9ea5iq3UJrESwN4/6ktZgCulChDN1eyZM27N23rZs
         lds9QH8VpFPIwNsnaph+rKE/anfEIaZPs/zkJSGg8iFbO9qRAEFt6bTaJVqG1KccHFUR
         pBykuNVPRgO3InfHGonislQIKanSn6DgcVryIV/FcIGxiuiMdwWXyD9/EPojl3jBeOJA
         nf/sZnc2LR45+9/ZtKU2/YejAeqNhevgnTNyAY8esW2TbANYRbuBwo/xPnzlJZOMTc41
         oCgw==
X-Gm-Message-State: ACgBeo15I6I89OiYDiFqNyN18KFAAI826BK9A3SxWz/1Jpis3XhXFNhb
	RQQAhQCR2fmr2YGx0VPX/WHaGYUvqJU=
X-Google-Smtp-Source: 
 AA6agR5eg/sbJUcqwcMwEdsKZ70Rd4kgGIFEK4DcoXM2pmIIaVqXw+ki6Ul6Ue3V8oW+5SlEhTN5yQ==
X-Received: by 2002:a05:600c:34d3:b0:3a5:fea5:1be8 with SMTP id
 d19-20020a05600c34d300b003a5fea51be8mr11264992wmq.106.1662917186514;
        Sun, 11 Sep 2022 10:26:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b00228de58ae2bsm5280395wrq.12.2022.09.11.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 10:26:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/5] common-tasks.rst: describe the layer setup tooling
Date: Sun, 11 Sep 2022 19:26:07 +0200
Message-Id: <20220911172608.2542076-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220911172608.2542076-1-alex@linutronix.de>
References: <20220911172608.2542076-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 11 Sep 2022 17:26:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3150

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4d19bd921..6c2df9aa6 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -858,6 +858,60 @@ enables the build system to locate the layer during the build.
    During a build, the OpenEmbedded build system looks in the layers
    from the top of the list down to the bottom in that order.
 
+Saving and restoring the layers setup
+-------------------------------------
+
+Once you have a working build with the correct set of layers, it is beneficial
+to capture the layer setup - what they are, which repositories they come from
+and which SCM revisions they're at - into a configuration file, so that this
+setup can be easily replicated later, perhaps on a different machine. Here's
+how to do this:
+
+   $ bitbake-layers create-layers-setup /srv/work/alex/meta-alex/
+   NOTE: Starting bitbake server...
+   NOTE: Created /srv/work/alex/meta-alex/setup-layers.json
+   NOTE: Created /srv/work/alex/meta-alex/setup-layers
+
+The tool needs a single argument which tells where to place the output, consisting
+of a json formatted layer configuration, and a 'setup-layers' script that can use that configuration
+to restore the layers in a different location, or on a different host machine. The argument
+can point to a custom layer (which is then deemed a 'bootstrap' layer that needs to be
+checked out first), or into a completely independent location.
+
+The replication of the layers is performed by running the setup-layer script provided
+above:
+
+1. Clone the bootstrap layer or some other repository to obtain
+the json config and the setup script that can use it.
+
+2. Run the script directly with no options:
+(note: this will work to update an existing checkout as well)
+
+   alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
+   Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.
+
+   Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
+   Running 'git init -q /srv/work/alex/my-build/meta-intel'
+   Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
+   Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
+   Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel
+
+   Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
+   Running 'git init -q /srv/work/alex/my-build/poky'
+   Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
+   Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
+   Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
+   Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
+   Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' in /srv/work/alex/my-build/poky
+
+.. note::
+   The script is self-suffucient and requires only python3
+   and git on the host machne where it will run.
+
+.. note::
+   Both the 'create-layers-setup' and the 'setup-layers' provided several additional options
+   that customize their behavior - you are welcome to study them via '--help' command line parameter.
+
 Customizing Images
 ==================
 
-- 
2.30.2


