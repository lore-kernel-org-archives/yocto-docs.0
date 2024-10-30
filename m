Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C87ED5CCB7
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 15:00:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.17168.1730300443854557214
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 08:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gymf5uib;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43152b79d25so60466315e9.1
        for <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730300442; x=1730905242; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBogyL24XsA48m4DKRHJHjRD3rIzMHABvCnBlmmACBQ=;
        b=Gymf5uibs6q+KR0/donTJSe6PbxL2GZJ4OtHOzn8uUPcDCfIyJaZKXIl0UY5EK/lqw
         hwhbBcb1vEeEDaS/f6cyWZfp2AN4JqPheHB8Hp5noqgeSJFbzLPx3jNUzXtu/+ly8+om
         hs3pQDQw/quhMezfXhbox2jbt7MkgYDT/SdyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730300442; x=1730905242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBogyL24XsA48m4DKRHJHjRD3rIzMHABvCnBlmmACBQ=;
        b=YFHcNnZ1Fr6xwoDtKEEvImTApe5D0rWCCYTAKC6DTSa8Aiu0FbK22TEF8HljceItqV
         muDSwXzn6Ubyv6iNMtj695/F5y27kynAbdr4aBm/ZouJkhMFYF+x9ia5XUAB7MlRoE9M
         eGWaTPEC1AcMkBIfE9qwlThYPLuPw+DPQLPViCFExyfzui8hZvBpI/4Ibh2vrihB4LWb
         po2xtWJnAtBOoSsvLjLHoswvXXhu6DkgMjuuPkoYzdnEYM3LpKc7zStXS8JFgHPGCdP/
         z1Hpk/opNAfw0SD15NUYZ3i8YGwBfUuE/55BhVxmQMbQDpkm824Py6kzSf9KOyfEkQf2
         EEvA==
X-Gm-Message-State: AOJu0Yzmsr+C2/tKv8VPme+VOjCrXcitfYFBsVVMGYq7jWD+LzlEoryO
	36fvUfeGcSmNcCk6ppTQGQdTV8u5HqEXjVj3rqgFPWut/qBCYcEv6Xss5vwgNfmH+q3K0rHWsan
	pkxM=
X-Google-Smtp-Source: AGHT+IGqvw29sgE/ko+KOW9vDKc9efOZ3dPf6XNzXpb8fha1C9m8DOW2tSSQ9wLqSZ47I8wMaPcv8Q==
X-Received: by 2002:a05:600c:4510:b0:42c:c401:6d67 with SMTP id 5b1f17b1804b1-4319ac742fcmr114360285e9.6.1730300442077;
        Wed, 30 Oct 2024 08:00:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:65f1:8463:55dd:142d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910357sm24402635e9.11.2024.10.30.08.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 08:00:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@lists.yoctoproject.org
Cc: docs@lists.yoctoproject.org
Subject: [yocto-autobuilder-helper] [PATCH] scripts/run-docs-build: Add support for installing texlive for pdf generation
Date: Wed, 30 Oct 2024 15:00:40 +0000
Message-ID: <20241030150040.421769-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 15:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5622

To build the latexpdf output for the docs, we need Xetex (which can handle
international characters). Rather than require it on all autobuilder workers,
along with dependencies, we install a copy onto NFS which the workers can
use. The full install is 6GB so just install the pieces we've found we
need via tlmgr on top of a small install. This script creates the install
if it isn't present.

For local docs builds, we assume the user has the tools available from
the host OS. It is unlikely most users using this script would have the
NAS path present so this seems like a reasonable compromise.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/run-docs-build | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/run-docs-build b/scripts/run-docs-build
index 2e7298e..ad8fece 100755
--- a/scripts/run-docs-build
+++ b/scripts/run-docs-build
@@ -42,6 +42,20 @@ mkdir buildtools
 ${buildtools_localpath} -y -d $builddir/buildtools
 . $builddir/buildtools/environment-setup*
 
+textooldir=/srv/autobuilder/valkyrie.yocto.io/docs-build-tex-tools
+if [ -e /srv/autobuilder/valkyrie.yocto.io/ -a ! -e ${textooldir} ]; then
+    mkdir -p /tmp/textemp
+    pushd /tmp/textemp
+    wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
+    zcat < install-tl-unx.tar.gz | tar xf -
+    cd install-tl-*/
+    ./install-tl --scheme=small --texdir=${textooldir} --no-interaction
+    PATH=$PATH:${textooldir}/bin/x86_64-linux tlmgr install titlesec varwidth tabulary needspace upquote framed capt-of wrapfig fncychap gnu-freefont ctex
+    popd
+fi
+
+PATH=$PATH:${textooldir}/bin/x86_64-linux
+
 # Getting the old docbook built docs from an archive. Not rebuilding them.
 docbookarchive_localpath=${sharedir}/cluster-downloads-cache/`basename ${docbookarchive_url}`
 if [ ! -e ${docbookarchive_localpath} ]; then

