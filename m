Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.7088.1605779938024854622
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cTutFf4Q;
 spf=pass (domain: linaro.org, ip: 209.85.221.51, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f51.google.com with SMTP id m6so5734925wrg.7
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GG8hwB8fYq7fxtMnywcMLsumXewzAuYt6Ew5WwtaNSI=;
        b=cTutFf4QLtOY9iF4zrj297rH8ECr8Z/zL8E2+KvhFbMMsoXdIQcoM+WH4abdxzEYbb
         yrgbREU70oKj72GYs64Cf/BHhOHLu5ohsAna55qRG1s8WmbS8eLp2vZgA1qw8rIDYYVy
         Xy8NTZwAmW+79vISTeRV8gGY6en/ayjk7xfcUcsYXolqZhSCk4e+TQko3leh/KAUb3l1
         aXrmwdOsTFvrbLphp67Q/4tJotsSEt3/F7fbJdVtFxTeKkjR3XrQaKqowO9BsAyYDMSZ
         s53B4uK4S8DfSVAdy0hhHG9U3Gk8VwB9z2aYrHfTUE0wTlaJLiT4h6jHTby88wVWNupL
         jDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GG8hwB8fYq7fxtMnywcMLsumXewzAuYt6Ew5WwtaNSI=;
        b=J+9QbaE3LH3/JXiJaFTVv70pKWZVPft9jzCl01NxvWISZOY3KRpFw5iI9cj67W3e/+
         2aca530t7TjhNjmtXFEzNvXuLtXPo7mulANo2lROwKMhDgcK87zSyNWoP2q82LePSYjB
         l8Gt9L4I5tNIC6HpnxdWLqvUBLoYsvpGoMxcKO5ZiXiGLKIXk2k2+GvdrybcOje9Jke1
         2j326QIpNCf2OPadb0QnBUP2DuaxjmP/Cmx7t7UN1tk4NuIfWHvkWs2NNrqJdq8ZxO/j
         erXynHgQK4tmJ91Y9W6qtxws6A5R5FDqAhhou6tJxpYAMHm1UJYVaHGxwKZbFOPUw/KV
         KVdg==
X-Gm-Message-State: AOAM532EgnJRysSzoUVx33ll5gEPdZB9O8TlLwOtbrxa9xMsQScqVFGK
	/9WvnDSzdpG2O2g/NR3J8PDchmEeHWpYmEs7
X-Google-Smtp-Source: ABdhPJwzDuspXUy7PciRQSGNJNh4QoR1bJm9Lg3ggXUH9bql+k8SnzvzlbvBKgbiQxzi7RLRTIfmGQ==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr8947984wrp.383.1605779936219;
        Thu, 19 Nov 2020 01:58:56 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:55 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 07/11] bsp-guide: remove unused labels
Date: Thu, 19 Nov 2020 10:58:30 +0100
Message-Id: <20201119095834.284864-8-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/bsp-guide/bsp.rst | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index d0275eea9..408620212 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -241,8 +241,6 @@ section.
    the script runs, your current working directory is set to the ``build``
    directory.
 
-.. _bsp-filelayout:
-
 Example Filesystem Layout
 =========================
 
@@ -451,8 +449,6 @@ the :yocto_git:`Source Respositories <>`:
 
 The following sections describe each part of the proposed BSP format.
 
-.. _bsp-filelayout-license:
-
 License Files
 -------------
 
@@ -471,8 +467,6 @@ developer. For information on how to maintain license compliance, see
 the ":ref:`dev-manual/dev-manual-common-tasks:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.
 
-.. _bsp-filelayout-readme:
-
 README File
 -----------
 
@@ -488,8 +482,6 @@ At a minimum, the ``README`` file must contain a list of dependencies,
 such as the names of any other layers on which the BSP depends and the
 name of the BSP maintainer with his or her contact information.
 
-.. _bsp-filelayout-readme-sources:
-
 README.sources File
 -------------------
 
@@ -509,8 +501,6 @@ used to generate the images that ship with the BSP.
    If the BSP's ``binary`` directory is missing or the directory has no images, an
    existing ``README.sources`` file is meaningless and usually does not exist.
 
-.. _bsp-filelayout-binary:
-
 Pre-built User Binaries
 -----------------------
 
@@ -534,8 +524,6 @@ hardware. Additionally, the
 present to locate the sources used to build the images and provide
 information on the Metadata.
 
-.. _bsp-filelayout-layer:
-
 Layer Configuration File
 ------------------------
 
@@ -586,8 +574,6 @@ This file simply makes :term:`BitBake` aware of the recipes and configuration
 directories. The file must exist so that the OpenEmbedded build system can
 recognize the BSP.
 
-.. _bsp-filelayout-machine:
-
 Hardware Configuration Options
 ------------------------------
 
@@ -626,8 +612,6 @@ configuration file. For example, the Raspberry Pi BSP
 
    include conf/machine/include/rpi-base.inc
 
-.. _bsp-filelayout-misc-recipes:
-
 Miscellaneous BSP-Specific Recipe Files
 ---------------------------------------
 
@@ -658,8 +642,6 @@ directory. Here is the ``machconfig`` file for the Raspberry Pi BSP: ::
    ``meta/recipes-bsp/formfactor/formfactor_0.0.bb``, which is found in
    the :term:`Source Directory`.
 
-.. _bsp-filelayout-recipes-graphics:
-
 Display Support Files
 ---------------------
 
@@ -671,8 +653,6 @@ This optional directory contains recipes for the BSP if it has special
 requirements for graphics support. All files that are needed for the BSP
 to support a display are kept here.
 
-.. _bsp-filelayout-kernel:
-
 Linux Kernel Configuration
 --------------------------
 
-- 
2.29.2

