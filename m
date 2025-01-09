Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A9FE7719D
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 22:20:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.5620.1736461232413451252
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 14:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gWvC1LBL;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso15747375e9.1
        for <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 14:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736461230; x=1737066030; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrwPgD6nqQAL9/HyYvdw+CiavcBtwuqw9sGZW8U2oHI=;
        b=gWvC1LBLH7SOnAOV1eA6GRFcFaU5gYZa3ELwfbAPXfcm5IB9tH9HfwovgfTLP1+HFS
         vC/vHpZ1uJ3r0fiw2SjamJcj60qCsxyErnXBJSAwdl5JdJJ6/w0usyQFiacQ2xEniPN4
         sXHSTjavgqvTnevj3oKDzdvm9bvFjD9CZF3qsQeh7884/q1CxcRoFElmsTriof437w18
         cpdAjJnOHaMZJkRA4o25DDE2aehpMFK+xI/BOHKVeazyCHz8blZ1VJ5uqtXC9VTS+br6
         udJE7gdsaZ9oKtXbB9L7I7cA9jSlra7BkeYZVehXURCqMrEvm9F+fpNEUP1p50wYFkmn
         Y8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736461230; x=1737066030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrwPgD6nqQAL9/HyYvdw+CiavcBtwuqw9sGZW8U2oHI=;
        b=bS0gaEwkZMtS8lE3o+n5bjE+i3eXy3ARE31zdjeOP5eEGqoHO98wqwy5KK2hnuB//z
         vB00EISQou3w4pAR2DqRgMjlfx4JejXapMf8yt+aMjwzgzk9pUqkNVtyJBtOKh8l9b2W
         UBf5yyS2d66FgqPI0hRNbIca4JF3zmTsgyajXyFhzlabkrw7Gy1+SNvxk57akHXotifi
         Bb6PbZ8BmVSaLrrhTnsYwRt4gBE52G3+sFJkapvTfT8LKLHkDVxu1lfWmGBzCvNvCOdc
         SxKOIRd6xTtZAhEfo2Cibtou124VAVuG5ZJmNMJrgm80NKNyeFqXUlBsKPlRkWzmc4AG
         7ylQ==
X-Gm-Message-State: AOJu0YwgjaJOswwXOMdPgBqylNdhIg5yWlqXordMsOT+Hjvns76bwRU3
	E70FduWHEYe5jZ6DwULWq0SndetVGaQO6NREb1i5LeJnCYgDobbhcLFUPQ==
X-Gm-Gg: ASbGnctnThjOo1q5HF4Tc00Xy+x7NNyvfeDoL0TLgD6YyBzIIKDdHvJy0kiTc5I806z
	n9ZufYWe2r1yW2nYEFGEQZrpVz1irx/IDp5Eh8UVuZiA0rR2JChJlLRwNK2/veNNEW8f9xphy1L
	J4gBFPBRfPm6yQ2OPr0xUXfyuBepVqKW1srZzDbQQ8690w8lGRM4CnQBnB89DFzUQCtouco1axz
	uop9nrItlISfRPPsI2LoHA2n2ZP0xxAsFC3nuBadQz3rwjRLAqiVHXE2JmdJJH3XFLaHnS91egd
	Hgwr
X-Google-Smtp-Source: AGHT+IHzTn9eqXoE99/4J0e9LbB4HcFL9vyXFriMYEcJ54gGdH6A5TuYXjnesFf+mCS09Ox5MCEy9g==
X-Received: by 2002:a05:6000:1445:b0:385:df6d:6fc7 with SMTP id ffacd0b85a97d-38a8730ce5amr7853456f8f.25.1736461230161;
        Thu, 09 Jan 2025 14:20:30 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1dc6sm2853265f8f.96.2025.01.09.14.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 14:20:29 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 2/3] sdk-manual: extensible.rst: update devtool ide-sdk
Date: Thu,  9 Jan 2025 23:17:20 +0100
Message-ID: <20250109222015.12658-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109222015.12658-1-adrian.freihofer@siemens.com>
References: <20250109222015.12658-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 22:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6077

Replace
  devtool ide-sdk --debug-build-config
by
  devtool modify --debug-build

This change was introduced with commit
https://git.yoctoproject.org/poky/commit/?id=1f7eb26c947dde14698ae6e2ab88f0637027f4cb

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 9a50d7fc5..3733997fa 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -669,7 +669,8 @@ The extensible SDK supports two different development modes.
       IMAGE_INSTALL:append = " my-recipe"
 
    Assuming the BitBake environment is set up correctly and a workspace has
-   been created for the recipe using ``devtool modify my-recipe``, the
+   been created for the recipe using ``devtool modify my-recipe`` or probably
+   even better by using ``devtool modify my-recipe --debug-build``, the
    following command can create the SDK and the configuration for VSCode in
    the recipe workspace::
 
@@ -786,8 +787,8 @@ The extensible SDK supports two different development modes.
    .. code-block:: sh
 
       # Create the SDK
-      devtool modify cmake-example
-      devtool ide-sdk cmake-example core-image-minimal -c --debug-build-config --ide=none
+      devtool modify cmake-example --debug-build
+      devtool ide-sdk cmake-example core-image-minimal -c --ide=none
 
       # Install the firmware on a target device or start QEMU
       runqemu
-- 
2.47.1


