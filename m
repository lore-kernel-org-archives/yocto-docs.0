Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81872C98325
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 19:29:52 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6570.1790278183695674461
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 12:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=p6FGNU0q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260924192940b67337844000020731-z7zk7o@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260924192940b67337844000020731
        for <docs@lists.yoctoproject.org>;
        Thu, 24 Sep 2026 21:29:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rAA2E69aSR7rkOb6Hz2ldV3PMcErmpd1LUZL2LRgmVk=;
 b=p6FGNU0qmuRPxYI3Yew1HMQ90/a2XuOVKtC1M5ZG7UTZtJJRGZkvBEQEX/RLDQ7u2sCEUq
 MxtB82Pm+YQXrVMyywrrS0dDDJC1ZMa/q5d1MIYtwsoaL8Fz/RSFVLgr9kUCWXOuFucKShjH
 BHgegoiqp0VtsWbdyiGBYERReiDeZI4jMR3wr9ta1tLCm6w3ftuGeqYxW+w8Oz8EbPlxkEoa
 HY6Ro8s9zhlwHQcDAf7DXYXFciMUdspYXLSwyZPF1a/DSrsxgueZjwEP7a7P2wNS2GXOpJIu
 KT9CyL+uWb1EShz9uOwX0h29mbvOkVO+EtWiQfXTAHEJihlkg00Eg2dA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 4/5] dev-manual/devtool: add Mermaid diagrams for the ide-sdk workflow and architecture
Date: Thu, 24 Sep 2026 21:29:06 +0200
Message-ID: <20260924192929.907566-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260924192929.907566-1-adrian.freihofer@siemens.com>
References: <20260924192929.907566-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 19:29:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10635

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add three diagrams to the devtool ide-sdk section: a typical usage
workflow, the architecture of the SDK/IDE relationship, and a variant
of the architecture for the --nfs=rootfs-dbg mode.

The diagrams are Mermaid (.mmd) flowcharts, for easier long-term
maintenance than static images, included via the ".. mermaid::"
directive (see the previous commit), wrapped in ".. only:: html" since
non-HTML builders (e.g. latex, epub) would otherwise dump the raw,
HTML-escaped Mermaid source as literal text instead of rendering it.

Each diagram uses a consistent color palette: blue for the SDK/build
environment, teal for image content, purple for devtool-managed
workspace/NFS directories, coral for the target device, orange for
entry-point commands and green for editable/source elements.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/dev-manual/devtool.rst          | 27 ++++++++-
 .../figures/devtool-ide-sdk-architecture.mmd  | 53 +++++++++++++++++
 .../devtool-ide-sdk-nfs-architecture.mmd      | 58 +++++++++++++++++++
 .../figures/devtool-ide-sdk-workflow.mmd      | 43 ++++++++++++++
 4 files changed, 178 insertions(+), 3 deletions(-)
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index de2d5fef0..988c69da1 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -478,7 +478,14 @@ directly in the IDE, independently of ``devtool ide-sdk`` and without calling
 configuration that points the IDE directly at the build tool, the
 cross-toolchain and the debugger provided by the SDK. ``devtool ide-sdk``
 only needs to be re-run later on, e.g. if a recipe's dependencies or its
-build configuration change.
+build configuration change:
+
+.. only:: html
+
+   .. mermaid:: figures/devtool-ide-sdk-workflow.mmd
+      :align: center
+
+   .. centered:: Typical ``devtool ide-sdk`` use case
 
 Let's now take a closer look at how ``devtool ide-sdk`` and the generated IDE
 configuration make use of a regular ``bitbake`` environment as a SDK to
@@ -539,7 +546,14 @@ The same architecture also allows the IDE to be configured to use further
 tools beyond the build tool, cross-compiler and debugger, e.g.
 ``clang-tidy``: any such tool just needs to be added as a native tool in
 ``recipe-sysroot-native``, in the Yocto reproducible way, for
-``devtool ide-sdk`` to be able to point the IDE at it.
+``devtool ide-sdk`` to be able to point the IDE at it:
+
+.. only:: html
+
+   .. mermaid:: figures/devtool-ide-sdk-architecture.mmd
+      :align: center
+
+   .. centered:: Architecture of ``devtool ide-sdk``
 
 To summarize the design described above, for supported build systems
 modified mode brings two key benefits:
@@ -685,7 +699,14 @@ This changes the relationship between the SDK, the target device and the
 debug symbols compared to the architecture described above: instead of a
 separate ``rootfs`` booted by the target and a ``rootfs-dbg`` only
 consulted by the debugger on the host, both the target and the debugger
-now use the same NFS-exported ``rootfs-dbg``.
+now use the same NFS-exported ``rootfs-dbg``:
+
+.. only:: html
+
+   .. mermaid:: figures/devtool-ide-sdk-nfs-architecture.mmd
+      :align: center
+
+   .. centered:: Architecture of ``devtool ide-sdk --nfs=rootfs-dbg``
 
 Use ``--nfs-extract-dir=DIR`` to extract below ``DIR/<image-recipe>/``
 instead of the default location in the workspace, for example when the NFS
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
new file mode 100644
index 000000000..7e1a70889
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
@@ -0,0 +1,53 @@
+%%{init: {'theme': 'base', 'fontSize': 20, 'themeVariables': {'primaryColor': '#e9eef5', 'primaryBorderColor': '#4b5d75', 'primaryTextColor': '#1f2933', 'lineColor': '#5b6b82', 'edgeLabelBackground': '#f4f6f9', 'clusterBkg': '#f7f9fc', 'clusterBorder': '#b8c4d1', 'fontFamily': 'Helvetica, Arial, sans-serif', 'fontSize': '20px'}, 'flowchart': {'curve': 'basis', 'nodeSpacing': 35, 'rankSpacing': 55}}}%%
+flowchart TB
+    idesdk["devtool ide-sdk<br/>(bitbake tinfoil client)"]
+    ideconfig[["IDE configuration<br/>(e.g. build tool preset,<br/>debugger launch config)"]]
+    ide["IDE (e.g. VSCode)"]
+    srcdir[["S = e.g. workspace/sources/&lt;recipe&gt;<br/>(source code, extracted by<br/>devtool modify, edited in the IDE)"]]
+
+    subgraph sdk["SDK (regular bitbake environment)"]
+        subgraph recipe_workdir["Recipe WORKDIR(s)"]
+            native_sysroot[["recipe-sysroot-native<br/>build tool (e.g. CMake)<br/>cross-compiler (e.g. &lt;arch&gt;-gcc)<br/>debugger (e.g. gdb)<br/>more tools..."]]
+            builddir[["B (build directory)<br/>build artifacts)"]]
+            sysroot[["recipe-sysroot<br/>(target headers & libs)"]]
+            destdir[["D = image<br/>(non-stripped, relocated rpath,<br/>managed by pseudo)"]]
+        end
+
+        subgraph image_workdir["Image WORKDIR"]
+            rootfsdbg[["rootfs-dbg<br/>(debug symbols of other<br/>recipes' shared libraries)"]]
+            rootfs[["rootfs<br/>(target root filesystem)"]]
+        end
+    end
+
+    subgraph target["Target device"]
+        appbin["Application binary<br/>(running)"]
+        debugserver["debug-server<br/>(e.g. gdbserver)"]
+    end
+
+    idesdk -->|generates| ideconfig
+    idesdk -->|"generates the SDK (via bitbake)"| sdk
+    ideconfig --> ide
+    ideconfig --> native_sysroot
+    ide -->|"calls directly, no bitbake needed"| native_sysroot
+    ide -->|"edit source"| srcdir
+    native_sysroot -->|"reads source from"| srcdir
+    native_sysroot -->|"builds in"| builddir
+    native_sysroot -.->|"--sysroot"| sysroot
+    builddir -->|install| destdir
+    destdir -->|"deploy (--strip)"| appbin
+    native_sysroot -->|"debug symbols:<br/>unstripped binary"| destdir
+    native_sysroot -->|"debug symbols:<br/>shared libraries"| rootfsdbg
+    native_sysroot -->|"remote debug<br/>protocol"| debugserver
+    debugserver -->|"attach / run"| appbin
+    rootfs -->|"installed on target"| target
+
+    style sdk fill:#eaf1fb,stroke:#4b7bab,stroke-width:1px
+    style recipe_workdir fill:#dfeaf9,stroke:#6f9ac9,stroke-width:1px
+    style image_workdir fill:#e2f6f0,stroke:#3f9e86,stroke-width:1px
+    style target fill:#fdece0,stroke:#d97a3f,stroke-width:1px
+
+    classDef orange fill:#ffd9a8,stroke:#c9761f,stroke-width:1px,color:#402d05;
+    classDef green fill:#c8ecc8,stroke:#3f8f3f,stroke-width:1px,color:#173d17;
+    classDef default fill:#e9eef5,stroke:#4b5d75,stroke-width:1px,color:#1f2933;
+    class idesdk orange;
+    class srcdir green;
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.mmd b/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.mmd
new file mode 100644
index 000000000..ba3ec0ea2
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.mmd
@@ -0,0 +1,58 @@
+%%{init: {'theme': 'base', 'fontSize': 20, 'themeVariables': {'primaryColor': '#e9eef5', 'primaryBorderColor': '#4b5d75', 'primaryTextColor': '#1f2933', 'lineColor': '#5b6b82', 'edgeLabelBackground': '#f4f6f9', 'clusterBkg': '#f7f9fc', 'clusterBorder': '#b8c4d1', 'fontFamily': 'Helvetica, Arial, sans-serif', 'fontSize': '20px'}, 'flowchart': {'curve': 'basis', 'nodeSpacing': 35, 'rankSpacing': 55}}}%%
+flowchart TB
+    idesdk["devtool ide-sdk --nfs=rootfs-dbg<br/>(bitbake tinfoil client)"]
+    ideconfig[["IDE configuration<br/>(e.g. build tool preset,<br/>debugger launch config)"]]
+    ide["IDE (e.g. VSCode)"]
+    srcdir[["S = e.g. workspace/sources/&lt;recipe&gt;<br/>(source code, extracted by<br/>devtool modify, edited in the IDE)"]]
+
+    subgraph sdk["SDK (regular bitbake environment)"]
+        subgraph recipe_workdir["Recipe WORKDIR(s)"]
+            native_sysroot[["recipe-sysroot-native<br/>build tool (e.g. CMake)<br/>cross-compiler (e.g. &lt;arch&gt;-gcc)<br/>debugger (e.g. gdb)"]]
+            builddir[["B (build directory)<br/>build artifacts)"]]
+            sysroot[["recipe-sysroot<br/>(target headers & libs)"]]
+            destdir[["D = image<br/>(non-stripped, relocated rpath,<br/>managed by pseudo)"]]
+        end
+
+        subgraph image_workdir["Image WORKDIR"]
+            rootfsdbg_src[["rootfs-dbg<br/>(stripped binaries + debug symbols<br/>of every recipe, combined by<br/>image-combined-dbg)"]]
+        end
+    end
+
+    subgraph nfs["NFS export"]
+        rootfsdbg[["&lt;workspace&gt;/nfs-exports/&lt;image-recipe&gt;/rootfs-dbg<br/>(copy, kept in sync by devtool<br/>deploy-target; persists across<br/>debug sessions)"]]
+    end
+
+    subgraph target["Target device"]
+        appbin["Application binary<br/>(running)"]
+        debugserver["debug-server<br/>(e.g. gdbserver)"]
+    end
+
+    idesdk -->|generates| ideconfig
+    idesdk -->|"generates the SDK (via bitbake)"| sdk
+    rootfsdbg_src -->|"deployed, extracted<br/>(--nfs=rootfs-dbg)"| rootfsdbg
+    ideconfig --> ide
+    ideconfig --> native_sysroot
+    ide -->|"calls directly, no bitbake needed"| native_sysroot
+    ide -->|"edit source"| srcdir
+    native_sysroot -->|"reads source from"| srcdir
+    native_sysroot -->|"builds in"| builddir
+    native_sysroot -.->|"--sysroot"| sysroot
+    builddir -->|install| destdir
+    destdir -->|"devtool deploy-target<br/>(direct write, no SSH)"| rootfsdbg
+    native_sysroot -->|"debug symbols:<br/>unstripped binary"| destdir
+    native_sysroot -->|"debug symbols:<br/>other recipes'<br/>shared libraries"| rootfsdbg
+    native_sysroot -->|"remote debug<br/>protocol"| debugserver
+    debugserver -->|"attach / run"| appbin
+    target -->|"booted from<br/>(NFS-mounted<br/>root filesystem)"| rootfsdbg
+
+    style sdk fill:#eaf1fb,stroke:#4b7bab,stroke-width:1px
+    style recipe_workdir fill:#dfeaf9,stroke:#6f9ac9,stroke-width:1px
+    style image_workdir fill:#e2f6f0,stroke:#3f9e86,stroke-width:1px
+    style nfs fill:#f2ecfa,stroke:#8b6bb5,stroke-width:1px
+    style target fill:#fdece0,stroke:#d97a3f,stroke-width:1px
+
+    classDef orange fill:#ffd9a8,stroke:#c9761f,stroke-width:1px,color:#402d05;
+    classDef green fill:#c8ecc8,stroke:#3f8f3f,stroke-width:1px,color:#173d17;
+    classDef default fill:#e9eef5,stroke:#4b5d75,stroke-width:1px,color:#1f2933;
+    class idesdk orange;
+    class srcdir,rootfsdbg green;
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd
new file mode 100644
index 000000000..812dc1eed
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd
@@ -0,0 +1,43 @@
+%%{init: {'theme': 'base', 'fontSize': 20, 'themeVariables': {'primaryColor': '#e9eef5', 'primaryBorderColor': '#4b5d75', 'primaryTextColor': '#1f2933', 'lineColor': '#5b6b82', 'edgeLabelBackground': '#f4f6f9', 'clusterBkg': '#f7f9fc', 'clusterBorder': '#b8c4d1', 'fontFamily': 'Helvetica, Arial, sans-serif', 'fontSize': '20px'}, 'flowchart': {'curve': 'basis', 'nodeSpacing': 35, 'rankSpacing': 55, 'wrappingWidth': 400}}}%%
+flowchart TB
+    modify["devtool modify recipe --debug-build"]
+
+    subgraph workspace["devtool workspace"]
+        ws_appends[["appends/recipe.bbappend"]]
+        ws_src[["sources/recipe<br/>(extracted here)"]]
+    end
+
+    gensdk["devtool ide-sdk recipe image<br/>(generate SDK + IDE config)"]
+
+    subgraph loop["Edit/build/debug loop"]
+        edit["Edit source code"]
+        build["Build<br/>(build tool called<br/>directly by the IDE)"]
+        deploy["Deploy to target"]
+        debug["Debug remotely<br/>(e.g. GDB/LLDB + gdbserver/lldb-server)"]
+    end
+
+    finish["devtool finish recipe layer<br/>(turn changes into patches)"]
+    rerun_note>"rerun only if recipe<br/>deps/config change"]
+
+    modify -->|extracts| ws_src
+    modify --> ws_appends
+    ws_src --> gensdk
+    ws_appends --> gensdk
+    gensdk -->|"one-time setup"| edit
+    edit --> build
+    build --> deploy
+    deploy --> debug
+    debug -->|repeat| edit
+    edit -.->|"when done"| finish
+    gensdk -.- rerun_note
+
+    style workspace fill:#f2ecfa,stroke:#8b6bb5,stroke-width:1px
+    style loop fill:#e7f5e7,stroke:#4f9a4f,stroke-width:1px
+
+    classDef orange fill:#ffd9a8,stroke:#c9761f,stroke-width:1px,color:#402d05;
+    classDef green fill:#c8ecc8,stroke:#3f8f3f,stroke-width:1px,color:#173d17;
+    classDef note fill:#f4f6f9,stroke:#b8c4d1,stroke-width:1px,color:#4b5d75;
+    classDef default fill:#e9eef5,stroke:#4b5d75,stroke-width:1px,color:#1f2933;
+    class modify,gensdk,finish orange;
+    class ws_src,edit,build,deploy,debug green;
+    class rerun_note note;
-- 
2.55.0


