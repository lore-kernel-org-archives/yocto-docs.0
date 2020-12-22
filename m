Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.9661.1608631084746788043
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=THOdcuvY;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id r3so13931896wrt.2
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 01:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H6q1WL4mVeCjeSfjofEkwUlfMFygqFzcTcrycRpQ9fw=;
        b=THOdcuvYOi+mHQY9qYK75twb8nGhOQumdMdhoKghBCrfzUqVe9MXS81MVXHo8jtO6I
         SlMsZSu38/9kKJav0/0r3lXr11kpY6Z/F8PhnJuf7n358eXREBCEt4qvVbxtsrnTrvzx
         KsWPFCa/3Hn7bThjOlKmn7dRFqaJArHS7zN0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H6q1WL4mVeCjeSfjofEkwUlfMFygqFzcTcrycRpQ9fw=;
        b=mN4e2LX+3CHWVNF7Jqi2zeuPn/bX8p3H3786p/P9YzlA5pqF9hC+FIWnNiqKxZWjHk
         sSH+gxKEY1s+IoMHuCxGiRpklxCrNiSy9hxOWxSszigOQNZK2GW590JhHJ4joxFygjsx
         e0MGaMZkIl+1Nmr/ahKJc2/J1l1EWUugnV1Z1aYp0IH+v2gRkiv18See3HO2JovEsQ9R
         v+47FY9CAeTVG3hFYcrq8c8REOvC17TPTmqY7Rc4OzMgZI4gxee7pqaLpo2NgZ1z8gv7
         KR9ybPh9+0Mmvu8TTreodXs2WvCom58RNyifCgwXlsdAG/VyXFG7acWzR0H+YCnps+QK
         RMJg==
X-Gm-Message-State: AOAM531BaErPgJu3GqgeXaLbyIeDymeYT6+ZtUT4xW8qXB57hDwjtCas
	g5TQ5CPCg2RyWaR10ZJ+OzMgoRc2TiWH6g==
X-Google-Smtp-Source: ABdhPJwUltR8EvioKkEIS71aLvjTVtgjVziu1AnecolN7GRaRDHFE7hONdeEZZ6beVAavnIxpPUj7Q==
X-Received: by 2002:adf:fdcb:: with SMTP id i11mr23536673wrs.349.1608631082661;
        Tue, 22 Dec 2020 01:58:02 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id o125sm27291772wmo.30.2020.12.22.01.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:58:02 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 2/6] documentation: Simplify layerindex and layer links
Date: Tue, 22 Dec 2020 09:57:54 +0000
Message-Id: <20201222095758.7411-3-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222095758.7411-1-pbarker@konsulko.com>
References: <20201222095758.7411-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/conf.py                             |  2 ++
 documentation/dev-manual/common-tasks.rst         |  9 ++++-----
 documentation/overview-manual/concepts.rst        | 15 ++++++---------
 documentation/overview-manual/yp-intro.rst        |  6 ++----
 documentation/ref-manual/migration-2.3.rst        |  2 +-
 documentation/toaster-manual/intro.rst            |  2 +-
 documentation/toaster-manual/reference.rst        |  4 ++--
 documentation/toaster-manual/setup-and-use.rst    | 11 +++++------
 .../transitioning-to-a-custom-environment.rst     |  4 ++--
 documentation/what-i-wish-id-known.rst            | 11 +++++------
 10 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index b5351599d..68eb92b0a 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -80,6 +80,8 @@ extlinks = {
     'oe_lists': ('https://lists.openembedded.org%s', None),
     'oe_git': ('https://git.openembedded.org%s', None),
     'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
+    'oe_layerindex': ('https://layers.openembedded.org%s', None),
+    'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
 }
 
 # Intersphinx config to use cross reference with Bitbake user manual
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 39db6563c..b2f433e1d 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -38,9 +38,8 @@ Follow these general steps to create your layer without using tools:
 
 1. *Check Existing Layers:* Before creating a new layer, you should be
    sure someone has not already created a layer containing the Metadata
-   you need. You can see the `OpenEmbedded Metadata
-   Index <https://layers.openembedded.org/layerindex/layers/>`__ for a
-   list of layers from the OpenEmbedded community that can be used in
+   you need. You can see the :oe_layer:`OpenEmbedded Metadata Index <>`
+   for a list of layers from the OpenEmbedded community that can be used in
    the Yocto Project. You could find a layer that is identical or close
    to what you need.
 
@@ -1194,8 +1193,8 @@ Before writing a recipe from scratch, it is often useful to discover
 whether someone else has already written one that meets (or comes close
 to meeting) your needs. The Yocto Project and OpenEmbedded communities
 maintain many recipes that might be candidates for what you are doing.
-You can find a good central index of these recipes in the `OpenEmbedded
-Layer Index <https://layers.openembedded.org>`__.
+You can find a good central index of these recipes in the
+:oe_layerindex:`OpenEmbedded Layer Index <>`.
 
 Working from an existing recipe or a skeleton recipe is the best way to
 get started. Here are some points on both methods:
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 8fbbabbac..98c7b4f6b 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -144,8 +144,7 @@ several pieces of hardware.
 Many layers exist that work in the Yocto Project development
 environment. The `Yocto Project Curated Layer
 Index <https://www.yoctoproject.org/software-overview/layers/>`__
-and `OpenEmbedded Layer
-Index <http://layers.openembedded.org/layerindex/branch/master/layers/>`__
+and :oe_layer:`OpenEmbedded Layer Index <>`
 both contain layers from which you can use or leverage.
 
 By convention, layers in the Yocto Project follow a specific form.
@@ -380,13 +379,11 @@ figure <#general-workflow-figure>`__:
 
 -  *Metadata (.bb + Patches):* Software layers containing
    user-supplied recipe files, patches, and append files. A good example
-   of a software layer might be the
-   `meta-qt5 layer <https://github.com/meta-qt5/meta-qt5>`__ from
-   the `OpenEmbedded Layer
-   Index <http://layers.openembedded.org/layerindex/branch/master/layers/>`__.
-   This layer is for version 5.0 of the popular
-   `Qt <https://wiki.qt.io/About_Qt>`__ cross-platform application
-   development framework for desktop, embedded and mobile.
+   of a software layer might be the :oe_layer:`meta-qt5 layer </meta-qt5/>`
+   from the :oe_layerindex:`OpenEmbedded Layer Index <>`. This layer is for
+   version 5.0 of the popular `Qt <https://wiki.qt.io/About_Qt>`__
+   cross-platform application development framework for desktop, embedded and
+   mobile.
 
 -  *Machine BSP Configuration:* Board Support Package (BSP) layers (i.e.
    "BSP Layer" in the following figure) providing machine-specific
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 456bfc549..980bfe5c2 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -221,8 +221,7 @@ your Metadata, the easier it is to cope with future changes.
 
    -  Familiarize yourself with the `Yocto Project curated layer
       index <https://www.yoctoproject.org/software-overview/layers/>`__
-      or the `OpenEmbedded layer
-      index <http://layers.openembedded.org/layerindex/branch/master/layers/>`__.
+      or the :oe_layer:`OpenEmbedded layer index <>`.
       The latter contains more layers but they are less universally
       validated.
 
@@ -364,8 +363,7 @@ activities using the Yocto Project:
    versions available for Yocto Project. The main purpose of the system
    is to help you manage the recipes you maintain and to offer a dynamic
    overview of the project. The Recipe Reporting System is built on top
-   of the `OpenEmbedded Layer
-   Index <http://layers.openembedded.org/layerindex/layers/>`__, which
+   of the :oe_layerindex:`OpenEmbedded Layer Index <>`, which
    is a website that indexes OpenEmbedded-Core layers.
 
 -  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`__
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index 3e9758119..57ff011e7 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -238,7 +238,7 @@ to substitute a GPLv2 version of a GPLv3 recipe, then you must add the
 .. note::
 
    You can ``find meta-gplv2`` layer in the OpenEmbedded layer index at
-   https://layers.openembedded.org/layerindex/branch/master/layer/meta-gplv2/.
+   :oe_layer:`/meta-gplv2/`.
 
 These relocated GPLv2 recipes do not receive the same level of
 maintenance as other core recipes. The recipes do not get security fixes
diff --git a/documentation/toaster-manual/intro.rst b/documentation/toaster-manual/intro.rst
index c78b3f53d..57e5b2bb7 100644
--- a/documentation/toaster-manual/intro.rst
+++ b/documentation/toaster-manual/intro.rst
@@ -27,7 +27,7 @@ extensive information about the build process.
    -  Browse layers listed in the various
       :ref:`layer sources <toaster-manual/reference:layer source>`
       that are available in your project (e.g. the OpenEmbedded Layer Index at
-      http://layers.openembedded.org/layerindex/).
+      :oe_layerindex:`/`).
 
    -  Browse images, recipes, and machines provided by those layers.
 
diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index dfe51889e..34a1f39cf 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -24,7 +24,7 @@ type of layer source called a "layer index."
 A layer index is a web application that contains information about a set
 of custom layers. A good example of an existing layer index is the
 OpenEmbedded Layer Index. A public instance of this layer index exists
-at http://layers.openembedded.org. You can find the code for this
+at :oe_layerindex:`/`. You can find the code for this
 layer index's web application at :yocto_git:`/layerindex-web/`.
 
 When you tie a layer source into Toaster, it can query the layer source
@@ -81,7 +81,7 @@ describes two methods by which you can configure and use your layer
 index.
 
 In the previous section, the code for the OpenEmbedded Metadata Index
-(i.e. http://layers.openembedded.org) was referenced. You can use
+(i.e. :oe_layerindex:`/`) was referenced. You can use
 this code, which is at :yocto_git:`/layerindex-web/`, as a base to create
 your own layer index.
 
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index 2cb7884eb..a3225da91 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -462,9 +462,8 @@ Using the Toaster Web Interface
 
 The Toaster web interface allows you to do the following:
 
--  Browse published layers in the `OpenEmbedded Layer
-   Index <http://layers.openembedded.org>`__ that are available for your
-   selected version of the build system.
+-  Browse published layers in the :oe_layer:`OpenEmbedded Layer Index <>`
+   that are available for your selected version of the build system.
 
 -  Import your own layers for building.
 
@@ -573,11 +572,11 @@ However, the "Local Yocto Project" release will not provide you with any
 compatible layers, other than the three core layers that come with the
 Yocto Project:
 
--  `openembedded-core <http://layers.openembedded.org/layerindex/branch/master/layer/openembedded-core/>`__
+-  :oe_layer:`openembedded-core </openembedded-core/>`
 
--  `meta-poky <http://layers.openembedded.org/layerindex/branch/master/layer/meta-poky/>`__
+-  :oe_layer:`meta-poky </meta-poky/>`
 
--  `meta-yocto-bsp <http://layers.openembedded.org/layerindex/branch/master/layer/meta-yocto-bsp/>`__
+-  :oe_layer:`meta-yocto-bsp </meta-yocto-bsp/>`
 
 .. image:: figures/compatible-layers.png
    :align: center
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 415f295b3..76a3215de 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -29,8 +29,8 @@ Transitioning to a custom environment for systems development
 
 #. **Find and acquire the best BSP for your target**.
    Use the :yocto_home:`Yocto Project curated layer index
-   </software-overview/layers/>` or even the `OpenEmbedded layer index
-   <https://layers.openembedded.org>`_ to find and acquire the best BSP for your
+   </software-overview/layers/>` or even the :oe_layer:`OpenEmbedded
+   layer index <>` to find and acquire the best BSP for your
    target board. The Yocto Project layer index BSPs are regularly validated. The
    best place to get your first BSP is from your silicon manufacturer or board
    vendor – they can point you to their most qualified efforts. In general, for
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index a051036bb..a52a16656 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -27,11 +27,10 @@ contact us with other suggestions.
    to be responsible for your own updates.
 
 #. **Get to know the layer index:**
-   All layers can be found in the `layer index
-   <https://layers.openembedded.org/>`_. Layers which have applied for Yocto
-   Project Compatible status (structure continuity assurance and testing) can be
-   found in the :yocto_home:`Yocto Project Compatible index
-   </software-over/layer/>`.  Generally check the Compatible layer index first,
+   All layers can be found in the :oe_layer:`layer index <>`. Layers which
+   have applied for Yocto Project Compatible status (structure continuity
+   assurance and testing) can be found in the :yocto_home:`Yocto Project Compatible index
+   </software-over/layer/>`. Generally check the Compatible layer index first,
    and if you don't find the necessary layer check the general layer index. The
    layer index is an original artifact from the Open Embedded Project. As such,
    that index doesn't have the curating and testing that the Yocto Project
@@ -172,7 +171,7 @@ contact us with other suggestions.
    * add an ssh server to an image (enable transferring of files to target)
    * know the anatomy of a recipe
    * know how to create and use layers
-   * find recipes (with the `OpenEmbedded Layer index <https://layers.openembedded.org>`_)
+   * find recipes (with the :oe_layerindex:`OpenEmbedded Layer index <>`)
    * understand difference between machine and distro settings
    * find and use the right BSP (machine) for your hardware
    * find examples of distro features and know where to set them
-- 
2.26.2

