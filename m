Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.20375.1606490361260651664
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 07:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B6PNjkAf;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id u12so5968796wrt.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2020 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jeHV4bc1Dt3Fa3PkGOeJJK7bfGRUp4JLCa5KZ9AxE70=;
        b=B6PNjkAfLA2J5Mz4lPND4t3UymL2oxnG8STD0PaLfB327gbvEnDFHG6X5KVIrGIBXT
         L8ZR0/HkE/ljieFxzC91T4U71/1cOnoG2GADXoMriw12tPzIdGhKjlLOzv4iINCqbLuD
         JF5+4md4PGU+U1jDo70sTme9xOoWTOtllwcKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jeHV4bc1Dt3Fa3PkGOeJJK7bfGRUp4JLCa5KZ9AxE70=;
        b=LgiKn+HqQxxm+Fqp811vh//QU7WlC9K0EzD4rxEnIZL9Sg55TRftOzO4q8xNf9wEs8
         z4mLFzYIlraoiRVTjuvQZTCcrxTxOYXs2uE1Be4ezsb7VY00Yxl82GS404lb3jMCqqo1
         R9QwFxzOnP12cMzpNxcqo9z/0Ur4A4KRsY/0O/B/3LL6qeGRWhkUl0n896VqIysFqYBP
         zPpVzxiyBd2xAI4Wfyi2lioMvb+ABw4D1KKYMJv7MYQqLm1TkjiJ1wV0jyKpH1Ut4khy
         o8zft8vVocNnGGQxY/XvljmAd6zVcOZ4Mz/yOo93UMdWdRD3zergtSu6zmJAwvxgtBlO
         RYIA==
X-Gm-Message-State: AOAM533jCGn4EIxqxYFwC2H1auL+pCLcif5Onjp1u9gNS8OYPH1UkYJn
	XSvXIQWGTemiIf8UVvKLXorDpecpEWjDWw==
X-Google-Smtp-Source: ABdhPJwfsjl5B23M7PbduFDQNLxZg/3DksRvffHku0RaHQMBaE/xaYFoTO66LKEpbNP55hGubjBDsQ==
X-Received: by 2002:a5d:6286:: with SMTP id k6mr11361775wru.309.1606490359502;
        Fri, 27 Nov 2020 07:19:19 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id n123sm8326596wmn.7.2020.11.27.07.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 07:19:19 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 3/3] ref-manual: Simplify oe_git links
Date: Fri, 27 Nov 2020 15:19:10 +0000
Message-Id: <20201127151910.6397-4-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127151910.6397-1-pbarker@konsulko.com>
References: <20201127151910.6397-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Manual links to git.openembedded.org are converted to use the oe_git
directive where possible. Note that this directive can't be used in some
places such as example code.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/ref-manual/migration-1.5.rst | 2 +-
 documentation/ref-manual/migration-1.7.rst | 4 ++--
 documentation/ref-manual/migration-1.8.rst | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/ref-manual/migration-1.5.rst
index fc7aface9..5e1e23f21 100644
--- a/documentation/ref-manual/migration-1.5.rst
+++ b/documentation/ref-manual/migration-1.5.rst
@@ -181,7 +181,7 @@ The following changes have been made that relate to
 
 The ``/run`` directory from the Filesystem Hierarchy Standard 3.0 has
 been introduced. You can find some of the implications for this change
-`here <http://cgit.openembedded.org/openembedded-core/commit/?id=0e326280a15b0f2c4ef2ef4ec441f63f55b75873>`__.
+:oe_git:`here </openembedded-core/commit/?id=0e326280a15b0f2c4ef2ef4ec441f63f55b75873>`.
 The change also means that recipes that install files to ``/var/run``
 must be changed. You can find a guide on how to make these changes
 `here <https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg31649.html>`__.
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
index 5a5151ec1..c3f9469da 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -66,8 +66,8 @@ occurred:
    foreign mode themselves, the option is mostly superfluous. However,
    some recipes will need patches for this change. You can easily make
    the change by patching ``configure.ac`` so that it passes "foreign"
-   to ``AM_INIT_AUTOMAKE()``. See `this
-   commit <http://cgit.openembedded.org/openembedded-core/commit/?id=01943188f85ce6411717fb5bf702d609f55813f2>`__
+   to ``AM_INIT_AUTOMAKE()``. See :oe_git:`this
+   commit </openembedded-core/commit/?id=01943188f85ce6411717fb5bf702d609f55813f2>`
    for an example showing how to make the patch.
 
 .. _migration-1.7-binary-configuration-scripts-disabled:
diff --git a/documentation/ref-manual/migration-1.8.rst b/documentation/ref-manual/migration-1.8.rst
index d601e6b63..73789bd51 100644
--- a/documentation/ref-manual/migration-1.8.rst
+++ b/documentation/ref-manual/migration-1.8.rst
@@ -79,7 +79,7 @@ particular, users need to ensure that ``${S}`` (source files) and
 inherit from ``kernel-yocto`` or include ``linux-yocto.inc``, you might
 wish to refer to the ``linux.inc`` file in the ``meta-oe`` layer for the
 kinds of changes you need to make. For reference, here is the
-`commit <http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-kernel/linux/linux.inc?id=fc7132ede27ac67669448d3d2845ce7d46c6a1ee>`__
+:oe_git:`commit </meta-openembedded/commit/meta-oe/recipes-kernel/linux/linux.inc?id=fc7132ede27ac67669448d3d2845ce7d46c6a1ee>`
 where the ``linux.inc`` file in ``meta-oe`` was updated.
 
 Recipes that rely on the kernel source code and do not inherit the
-- 
2.26.2

