Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.7188.1605779941939155287
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zigGoP4f;
 spf=pass (domain: linaro.org, ip: 209.85.221.47, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f47.google.com with SMTP id m6so5735105wrg.7
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wDQKwi/Wwc6EJm+AW5Uvxxqob86b9apSmYMGo6htO0E=;
        b=zigGoP4fPu490Wu+o4TDcIK+N/Sx4qyEgJKbq22emZ93cPCsvSjWdJ6IuOyt58sRJd
         T4NY73MjoiB0Id+dBoggV8sxSZVaB13XJNswHC8DA3yz80jb6I2cJ+0zEWPVTxHXAIsE
         rAeQ2V3rRzwFOD2tMVfqW8NCme6AYbzP5oro9Ab9/VrHNGQvCweHL9jN9tYxk7WLdShs
         ZVOArPXGQ1hJU4OECD93W48hzexTu80HPiA82ams2FjnLspfv/IWyyTS+dBCAJ11s4Da
         gqiK2/7g25MHqu2pY0n5vAQoJQMrthT+zozBDCKoW1/WnAcL9SzO6fh9haq377jMqzXh
         8slQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wDQKwi/Wwc6EJm+AW5Uvxxqob86b9apSmYMGo6htO0E=;
        b=QbviwLy1JUHcu62dfpKTNg9K2OCIl8gE80uSSFmo8TRuTepyfi2T6noygo0FpUEz/Q
         GMkfSnHVyr3Nq+39Ki7Nykrxj9WJyzGCjziUiaVlA2fg/pcnOKbL4LDj3odA9isfLJ9T
         bXZdyoNMErXohLRiwr0eRpJfmYXn9iJ88vJbyi7KrMqDNiZLIjOndupdwk2ikAuapmA0
         9HzkSMr5ekGrZPQePOVaHYTz08KXBjhCR7kgi4ss3n1RobyNNIWiLcDP/10p+n/4Y8pH
         tOvzX1GJ7KO3ksZQ+aK0uDaLhcYM2+RucD3K+/L+WK1AEQre8c9T4m4kWvjkrKrR4uOB
         Sb5g==
X-Gm-Message-State: AOAM533DtMsZVaT/sulWUDCb53odwn5p9+/K0ZhlVUty/VqOS7DCBAP2
	+S/5cJs4MAW/UjiC8APTV0YjYi7Mqy7rG2jO
X-Google-Smtp-Source: ABdhPJwbgwqsh+doSYKUSkjfcBIQ2+UsaUklSeKyyV5wm4BUMx96W7NBdD7uS/d+eJM4tlD0R2khGg==
X-Received: by 2002:adf:f5c8:: with SMTP id k8mr9631558wrp.2.1605779939861;
        Thu, 19 Nov 2020 01:58:59 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:59 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 10/11] sdk-manual: remove unused labels
Date: Thu, 19 Nov 2020 10:58:33 +0100
Message-Id: <20201119095834.284864-11-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../sdk-manual/sdk-appendix-obtain.rst        |  2 -
 documentation/sdk-manual/sdk-extensible.rst   | 44 -------------------
 documentation/sdk-manual/sdk-intro.rst        |  4 --
 documentation/sdk-manual/sdk-using.rst        |  6 ---
 4 files changed, 56 deletions(-)

diff --git a/documentation/sdk-manual/sdk-appendix-obtain.rst b/documentation/sdk-manual/sdk-appendix-obtain.rst
index 8b0753969..eef425bdf 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.rst
+++ b/documentation/sdk-manual/sdk-appendix-obtain.rst
@@ -4,8 +4,6 @@
 Obtaining the SDK
 *****************
 
-.. _sdk-locating-pre-built-sdk-installers:
-
 Locating Pre-Built SDK Installers
 =================================
 
diff --git a/documentation/sdk-manual/sdk-extensible.rst b/documentation/sdk-manual/sdk-extensible.rst
index 5ff75ada2..10e4d2061 100644
--- a/documentation/sdk-manual/sdk-extensible.rst
+++ b/documentation/sdk-manual/sdk-extensible.rst
@@ -24,8 +24,6 @@ alternatively make use of the toolchain directly, for example from
 Makefile and Autotools. See the "`Using the SDK Toolchain
 Directly <#sdk-working-projects>`__" chapter for more information.
 
-.. _sdk-extensible-sdk-intro:
-
 Why use the Extensible SDK and What is in It?
 =============================================
 
@@ -40,8 +38,6 @@ Basically, it contains an SDK environment setup script, some
 configuration files, an internal build system, and the ``devtool``
 functionality.
 
-.. _sdk-installing-the-extensible-sdk:
-
 Installing the Extensible SDK
 =============================
 
@@ -138,8 +134,6 @@ architecture. The example assumes the SDK installer is located in
    Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
     $ . /home/scottrif/poky_sdk/environment-setup-core2-64-poky-linux
 
-.. _sdk-running-the-extensible-sdk-environment-setup-script:
-
 Running the Extensible SDK Environment Setup Script
 ===================================================
 
@@ -225,8 +219,6 @@ recipes and the source go into a "workspace" directory under the SDK.
 The remainder of this section presents the ``devtool add``,
 ``devtool modify``, and ``devtool upgrade`` workflows.
 
-.. _sdk-use-devtool-to-add-an-application:
-
 Use ``devtool add`` to Add an Application
 -----------------------------------------
 
@@ -401,8 +393,6 @@ command:
       proceed with your work. If you do use this command, realize that
       the source tree is preserved.
 
-.. _sdk-devtool-use-devtool-modify-to-modify-the-source-of-an-existing-component:
-
 Use ``devtool modify`` to Modify the Source of an Existing Component
 --------------------------------------------------------------------
 
@@ -613,8 +603,6 @@ command:
       proceed with your work. If you do use this command, realize that
       the source tree is preserved.
 
-.. _sdk-devtool-use-devtool-upgrade-to-create-a-version-of-the-recipe-that-supports-a-newer-version-of-the-software:
-
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 -------------------------------------------------------------------------------------------------------
 
@@ -783,8 +771,6 @@ The following diagram shows the common development flow used with the
       proceed with your work. If you do use this command, realize that
       the source tree is preserved.
 
-.. _sdk-a-closer-look-at-devtool-add:
-
 A Closer Look at ``devtool add``
 ================================
 
@@ -826,8 +812,6 @@ the source tree is assumed to be using CMake and is treated accordingly.
 The remainder of this section covers specifics regarding how parts of
 the recipe are generated.
 
-.. _sdk-name-and-version:
-
 Name and Version
 ----------------
 
@@ -851,8 +835,6 @@ incorrect. For such a case, you must reset the recipe:
 After running the ``devtool reset`` command, you need to
 run ``devtool add`` again and provide the name or the version.
 
-.. _sdk-dependency-detection-and-mapping:
-
 Dependency Detection and Mapping
 --------------------------------
 
@@ -887,8 +869,6 @@ following to your recipe:
    dependency with an option that disables the associated functionality
    passed to the configure script.
 
-.. _sdk-license-detection:
-
 License Detection
 -----------------
 
@@ -920,8 +900,6 @@ with development even though the settings are unlikely to be correct in
 all cases. You should check the documentation or source files for the
 software you are building to determine the actual license.
 
-.. _sdk-adding-makefile-only-software:
-
 Adding Makefile-Only Software
 -----------------------------
 
@@ -981,8 +959,6 @@ mind:
    ``ldconfig``. For such cases, you might be able to apply patches that
    remove these commands from the Makefile.
 
-.. _sdk-adding-native-tools:
-
 Adding Native Tools
 -------------------
 
@@ -1009,8 +985,6 @@ following methods when you run ``devtool add``:
    "DASHDASHalso-native" option, you can add the tool using just one
    recipe file.
 
-.. _sdk-adding-node-js-modules:
-
 Adding Node.js Modules
 ----------------------
 
@@ -1053,8 +1027,6 @@ fetches the specified Git repository, detects the code as Node.js code,
 fetches dependencies using ``npm``, and sets
 :term:`SRC_URI` accordingly.
 
-.. _sdk-working-with-recipes:
-
 Working With Recipes
 ====================
 
@@ -1093,8 +1065,6 @@ that most recipes typically need.
 The remainder of this section presents information useful when working
 with recipes.
 
-.. _sdk-finding-logs-and-work-files:
-
 Finding Logs and Work Files
 ---------------------------
 
@@ -1127,8 +1097,6 @@ links created within the source tree:
 You can use these links to get more information on what is happening at
 each build step.
 
-.. _sdk-setting-configure-arguments:
-
 Setting Configure Arguments
 ---------------------------
 
@@ -1155,8 +1123,6 @@ arguments specified through ``EXTRA_OECONF`` or
 the output of the configure script's "DASHDASHhelp" option as a
 reference.
 
-.. _sdk-sharing-files-between-recipes:
-
 Sharing Files Between Recipes
 -----------------------------
 
@@ -1179,8 +1145,6 @@ are cataloged in manifests in order to ensure they can be removed later
 when a recipe is modified or removed. Thus, the sysroot is able to
 remain free from stale files.
 
-.. _sdk-packaging:
-
 Packaging
 ---------
 
@@ -1221,8 +1185,6 @@ you do not even need to set these variables in your recipe unless the
 software the recipe is building installs files into non-standard
 locations.
 
-.. _sdk-restoring-the-target-device-to-its-original-state:
-
 Restoring the Target Device to its Original State
 =================================================
 
@@ -1263,8 +1225,6 @@ target machine.
    and package manager operations on the target device. Doing so could
    result in a conflicting set of files.
 
-.. _sdk-installing-additional-items-into-the-extensible-sdk:
-
 Installing Additional Items Into the Extensible SDK
 ===================================================
 
@@ -1298,8 +1258,6 @@ takes significantly longer than installing the pre-built artifact. Also,
 if no recipe exists for the item you want to add to the SDK, you must
 instead add the item using the ``devtool add`` command.
 
-.. _sdk-applying-updates-to-an-installed-extensible-sdk:
-
 Applying Updates to an Installed Extensible SDK
 ===============================================
 
@@ -1327,8 +1285,6 @@ path_to_update_directory
    The URL needs to point specifically to a published SDK and not to an
    SDK installer that you would download and install.
 
-.. _sdk-creating-a-derivative-sdk-with-additional-components:
-
 Creating a Derivative SDK With Additional Components
 ====================================================
 
diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/sdk-intro.rst
index acb3f455c..ca6138cce 100644
--- a/documentation/sdk-manual/sdk-intro.rst
+++ b/documentation/sdk-manual/sdk-intro.rst
@@ -4,8 +4,6 @@
 Introduction
 ************
 
-.. _sdk-manual-intro:
-
 eSDK Introduction
 =================
 
@@ -127,8 +125,6 @@ script or through a :term:`Build Directory` that is based on
 your metadata configuration or extension for your targeted device. The
 cross-toolchain works with a matching target sysroot.
 
-.. _sysroot:
-
 Sysroots
 --------
 
diff --git a/documentation/sdk-manual/sdk-using.rst b/documentation/sdk-manual/sdk-using.rst
index 4b151e45c..3a1cae773 100644
--- a/documentation/sdk-manual/sdk-using.rst
+++ b/documentation/sdk-manual/sdk-using.rst
@@ -19,8 +19,6 @@ You can use a standard SDK to work on Makefile and Autotools-based
 projects. See the "`Using the SDK Toolchain
 Directly <#sdk-working-projects>`__" chapter for more information.
 
-.. _sdk-standard-sdk-intro:
-
 Why use the Standard SDK and What is in It?
 ===========================================
 
@@ -37,8 +35,6 @@ usage. You can see the directory structure in the "`Installed Standard
 SDK Directory
 Structure <#sdk-installed-standard-sdk-directory-structure>`__" section.
 
-.. _sdk-installing-the-sdk:
-
 Installing the SDK
 ==================
 
@@ -129,8 +125,6 @@ Structure <#sdk-installed-standard-sdk-directory-structure>`__" section
 for more details on the resulting directory structure of the installed
 SDK.
 
-.. _sdk-running-the-sdk-environment-setup-script:
-
 Running the SDK Environment Setup Script
 ========================================
 
-- 
2.29.2

