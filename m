Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.361.1623085163312239007
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 09:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Huw1cfd3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id o127so90621wmo.4
        for <docs@lists.yoctoproject.org>; Mon, 07 Jun 2021 09:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iX4HBwml9iuNkx37JR1qkKLu6QNSKw0WLWoLGTQ5kfk=;
        b=Huw1cfd3VsDZkz028SuZpdy1eiDYZQXbnpePuQxzUmpK3TzDSZmIhXyLmIyLyy7F/M
         NmVZlbN/nrkv6N3Nojgr3+rxlGNTK87wRUEZCRNTGK58xLmZJ1oHxSu49ED+klvgdEYf
         NOS4f9zBpLf5vU9I7QaYlJ8zSsZjO2YFeUcP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iX4HBwml9iuNkx37JR1qkKLu6QNSKw0WLWoLGTQ5kfk=;
        b=oxWlYv3NXl31Bh5DOlc4ja4dFBIpXfJvgVnGDsG5/vKlg7iLKBC6/4DHtTUzucZZqi
         IWESHXw4tNYUaiKPrctJrP+jJ3qgY6e05s5uMouRCjL03PmCI7l+wbd7nekE2GxHZVvn
         JnMXa7tiMaW/ZiGi/e6CG131qqVmGrYbzFZHS8nmmoiv1dbMN85ZJTG6a/MgkBWi1vcv
         94pt0JYffgu/DukzzLqI+Ae2++DOET+Bhpww2dUyjQgbEqViuVcnjjT0cB3tLJekaP0x
         RLTXL9cllDgFw7cQmXxKRu+zDW4ZQhX9sL5D/BHl+IXQ9TYs+TT6BT2vhucX14bD7kx8
         NXZg==
X-Gm-Message-State: AOAM530/tqQLNbLYceyVA5XuhcBawZotHy/0i60Sbwtp07xtoY+IdXRP
	g624BYSnmBkO9zsoRPaiVu99L6T01Txiog==
X-Google-Smtp-Source: ABdhPJw/dHUZDAgVkapxzNzEaIvdqWiqJfEmtDoYQ73nJbSrDPEKwwtN++x6us/9J6dVZ+iDSbUhkg==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr59622wmc.105.1623085161688;
        Mon, 07 Jun 2021 09:59:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27])
        by smtp.gmail.com with ESMTPSA id a16sm14625309wmm.3.2021.06.07.09.59.21
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 09:59:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] test-manual: Add initial reproducibile builds documentation
Date: Mon,  7 Jun 2021 17:59:20 +0100
Message-Id: <20210607165920.3075340-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/test-manual/index.rst           |  1 +
 .../test-manual/reproducible-builds.rst       | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 documentation/test-manual/reproducible-builds.rst

diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
index e2198c4c3..d122b5e27 100644
--- a/documentation/test-manual/index.rst
+++ b/documentation/test-manual/index.rst
@@ -13,6 +13,7 @@ Yocto Project Test Environment Manual
    intro
    test-process
    understand-autobuilder
+   reproducible-builds
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
new file mode 100644
index 000000000..d0384333a
--- /dev/null
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+*******************
+Reproducible Builds
+*******************
+
+================
+How we define it
+================
+
+The Yocto Project defines reproducibility as where a given input build configuration will give the same binary output regardless of when it is built (now or in 5 years time), regardless of the path on the filesystem the build is run in and regardless of the distro and tools on the underlying host system the build is running on.
+
+==============
+Why it matters
+==============
+
+The project aligns with the Reproducibile Builds project (https://reproducible-builds.org/) and they have information about why it matters. In addition to being able to validate for security issues being introduced which they talk about at length, from a Yocto Project perspective, it is hugely important that our builds are deterministic. We expect that when you build a given input set of metadata, you get consistent output. This has always been a key focus but is now true down to the binary level including timestamps.
+
+For example, if you find at some point in the future life of a product that you need to rebuild to add a security fix, only the components that have changed should change at the binary level leading to much easier and clearer bounds on where validation is needed.
+
+This also gives an additional benefit to the project builds themselves, our hash equivalence for sstate object reuse works much more effecitvely when the binary outputis unchanging.
+
+===================
+How we implement it
+===================
+
+There are many different aspects to build reproducibility but some particular things we do within the build system to ensure reproducibility include:
+
+* Adding mappings to the compiler options to ensure debug filepaths are mapped to consistent target compatible paths. This is done through the ``DEBUG_PREFIX_MAP`` variable which sets the maco-prefix-map and debug-prefix-map compiler options correctly to mape to target paths.
+* Being explict about recipe dependencies and their configuration (no floating configure options or host dependencies creeping in). In particular this means making sure ``PACKAGECONFIG`` coverage covers configure options which may otherwise try and auto-detect host dependencies.
+* Using recipe specific sysroots to isolate recipes so they only see their dependencies. These are visible as "recipe-sysroot" and "recipe-sysroot-native" directories within ``WORKDIR`` of a given recipe and are poulated only with the dependencies a recipe has.
+* Build images from a reduced package set of only packages from recipes the image depends upon.
+* Filtering the tools availble from the host's PATH to only a specific set of tools, set using the ``HOSTTOOLS`` variable.
+
+=========================================
+Can we prove the project is reproducible?
+=========================================
+
+Yes, we can prove it and we now regularlly test this on the autobuilder. At the time of writing, OE-Core is 100% reproducible for all it's recipes (i.e. world builds) apart from go-lang and ruby's docs package. go-lang has some fundamental problems with reproducibility as it currently always depends upon the paths it is build in unfortunately.
+
+To run our automated selftest as we use in our CI on the autobuilder you can run::
+
+ oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
+
+This defaults to including a world build so if other layers are added, it would also run the tests for recipes in the additional layers. The first build will be run using sstate if available, the second build expliclty disables sstate and builds on the specific host the build is running on. This means we can test reproduibility builds between different host distributions over time on the autobuilder.
+
+If ``OEQA_DEBUGGING_SAVED_OUTPUT`` is set, any differing packages will be saved here. The test is also able to run diffoscope on the output and generate html files showing the differences between the packages which can aid debugging. On the autobuilder these appear under the url https://autobuilder.yocto.io/pub/repro-fail/ in the form oe-reproducible + <date> + <random ID>, e.g. "oe-reproducible-20200202-1lm8o1th".
+
+The project's current reproducibility status can be seen at: https://www.yoctoproject.org/reproducible-build-results/
+
+===============================
+Can I test my layer or recipes?
+===============================
+
+Yes, see the selftest in oe-selftest at meta/lib/oeqa/selftest/cases/reproducible.py which can be subclassed for specific use cases.
+
+
+
+
+
-- 
2.30.2

