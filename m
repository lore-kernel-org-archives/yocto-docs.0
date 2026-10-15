Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6289ECCA469
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 20:08:06 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6599.1792094877886050169
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 13:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=MHcVh4Ch;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202610152007552efeed1d290002070f-0ttakw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610152007552efeed1d290002070f
        for <docs@lists.yoctoproject.org>;
        Thu, 15 Oct 2026 22:07:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=G+JE/nb/nkV9WFL60/SIp6atBMW19mxq1K2bXds6JpI=;
 b=MHcVh4ChBhMtIBxmfKxLWyIHelSrQpMgVmP4z89GyMY2ER9oJgy+4+JkJoNbmCiVOU4vg0
 1hB6oKtKSKLExCoLOTCq2DvFXpAXOK9atrUotrMp9aKstXMB2xLFyw1ulfIJR+gX84DjwyV1
 zomyPFfzke6HcSaROgiijxotpTG6dJJ/KF+dzQf5wgalTZG0MdRSg6rrn79+57jhj3CqbESO
 I7jqxqQPyFWia38QyrdcUwdznDZE+t8v0HHRcU4RCUskvhjFyhDWN+2kZFuuW7t6dk/Bx8D+
 4E8K65dAdgcrnC8oQnZQRkAD8rtebqEo8E1nAk/t+TKdNBcI4ZE7BZ9A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 3/4] dev-manual/devtool: add diagrams for the ide-sdk workflow and architecture
Date: Thu, 15 Oct 2026 22:06:34 +0200
Message-ID: <20261015200726.2391599-4-adrian.freihofer@siemens.com>
In-Reply-To: <20261015200726.2391599-1-adrian.freihofer@siemens.com>
References: <20261015200726.2391599-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 20:08:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10688

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add three diagrams to the devtool ide-sdk section: a typical usage
workflow, the architecture of the SDK/IDE relationship, and a variant
of the architecture for the --nfs=3Drootfs-dbg mode.

The diagrams are Mermaid (.mmd) flowcharts, kept as the maintainable
source next to the pre-rendered SVGs that the documentation includes,
so building the documentation needs no Mermaid tooling. The command to
regenerate an SVG is documented at the top of each .mmd file. The
Mermaid configuration in each .mmd follows the documentation SVG
policy (GNOME HIG colors, Nimbus Roman 10pt text, rounded boxes, no
shadows).

Colors: blue for the SDK/build environment, purple for devtool-managed
workspace/NFS directories, brown for the target device, orange for
entry-point commands and green for editable/source elements.

The images are scaled with the page width but never beyond their
natural size, which is what the new max-natural-size CSS class is for.
The text then stays at the intended size.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/dev-manual/devtool.rst          | 27 +++++-
 .../figures/devtool-ide-sdk-architecture.mmd  | 84 +++++++++++++++++
 .../figures/devtool-ide-sdk-architecture.svg  |  1 +
 .../devtool-ide-sdk-nfs-architecture.mmd      | 89 +++++++++++++++++++
 .../devtool-ide-sdk-nfs-architecture.svg      |  1 +
 .../figures/devtool-ide-sdk-workflow.mmd      | 74 +++++++++++++++
 .../figures/devtool-ide-sdk-workflow.svg      |  1 +
 .../sphinx-static/theme_overrides.css         |  5 ++
 8 files changed, 279 insertions(+), 3 deletions(-)
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-archit=
ecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-archit=
ecture.svg
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-ar=
chitecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-ar=
chitecture.svg
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-workfl=
ow.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-workfl=
ow.svg

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manua=
l/devtool.rst
index e182b427b..ba0435a46 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -480,7 +480,14 @@ directly in the IDE, independently of ``devtool ide-sd=
k`` and without calling
 configuration that points the IDE directly at the build tool, the
 cross-toolchain and the debugger provided by the SDK. ``devtool ide-sdk``
 only needs to be re-run later on, e.g. if a recipe's dependencies or its
-build configuration change.
+build configuration change:
+
+.. image:: figures/devtool-ide-sdk-workflow.svg
+   :width: 100%
+   :align: center
+   :class: max-natural-size
+
+.. centered:: Typical ``devtool ide-sdk`` use case
=20
 Let's now take a closer look at how ``devtool ide-sdk`` and the generated =
IDE
 configuration make use of a regular ``bitbake`` environment as a SDK to
@@ -541,7 +548,14 @@ The same architecture also allows the IDE to be config=
ured to use further
 tools beyond the build tool, cross-compiler and debugger, e.g.
 ``clang-tidy``: any such tool just needs to be added as a native tool in
 ``recipe-sysroot-native``, in the Yocto reproducible way, for
-``devtool ide-sdk`` to be able to point the IDE at it.
+``devtool ide-sdk`` to be able to point the IDE at it:
+
+.. image:: figures/devtool-ide-sdk-architecture.svg
+   :width: 100%
+   :align: center
+   :class: max-natural-size
+
+.. centered:: Architecture of ``devtool ide-sdk``
=20
 To summarize the design described above, for supported build systems
 modified mode brings two key benefits:
@@ -713,7 +727,14 @@ This changes the relationship between the SDK, the tar=
get device and the
 debug symbols compared to the architecture described above: instead of a
 separate ``rootfs`` booted by the target and a ``rootfs-dbg`` only
 consulted by the debugger on the host, both the target and the debugger
-now use the same NFS-exported ``rootfs-dbg``.
+now use the same NFS-exported ``rootfs-dbg``:
+
+.. image:: figures/devtool-ide-sdk-nfs-architecture.svg
+   :width: 100%
+   :align: center
+   :class: max-natural-size
+
+.. centered:: Architecture of ``devtool ide-sdk --nfs=3Drootfs-dbg``
=20
 Use ``--nfs-extract-dir=3DDIR`` to extract below ``DIR/<image-recipe>/``
 instead of the default location in the workspace, for example when the NFS
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-architecture.=
mmd b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
new file mode 100644
index 000000000..2bbff25c4
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
@@ -0,0 +1,84 @@
+---
+config:
+  theme: base
+  look: classic
+  htmlLabels: false
+  fontFamily: '"Nimbus Roman", "Times New Roman", Times, serif'
+  fontSize: 13.33
+  themeVariables:
+    primaryColor: "#99c1f1"
+    primaryBorderColor: "#62a0ea"
+    primaryTextColor: "#000000"
+    lineColor: "#000000"
+    edgeLabelBackground: "#ffffff"
+    clusterBkg: "#f6f5f4"
+    clusterBorder: "#c0bfbc"
+    titleColor: "#000000"
+    fontSize: 13.33px
+  themeCSS: |
+    .cluster-label tspan { font-weight: bold; }
+    rect { rx: 7.5px; ry: 7.5px; }
+  flowchart:
+    htmlLabels: false
+    useMaxWidth: false
+    curve: basis
+    padding: 10
+    nodeSpacing: 23
+    rankSpacing: 37
+    wrappingWidth: 300
+---
+%% Regenerate: npx -y @mermaid-js/mermaid-cli -b transparent -i devtool-id=
e-sdk-architecture.mmd -o devtool-ide-sdk-architecture.svg
+%%   && sed -i 's/<text /<text xml:space=3D"preserve" /g' devtool-ide-sdk-=
architecture.svg
+%% (xml:space keeps the spaces between words in rsvg-convert, used for the=
 PDF output)
+flowchart TB
+    idesdk["devtool ide-sdk<br/>(bitbake tinfoil client)"]
+    ideconfig[["IDE configuration<br/>(e.g. build tool preset,<br/>debugge=
r launch config)"]]
+    ide["IDE (e.g. VSCode)"]
+    srcdir[["S =3D e.g. workspace/sources/&lt;recipe&gt;<br/>(source code,=
 extracted by<br/>devtool modify, edited in the IDE)"]]
+
+    subgraph sdk["SDK (regular bitbake environment)"]
+        subgraph recipe_workdir["Recipe WORKDIR(s)"]
+            native_sysroot[["recipe-sysroot-native<br/>build tool (e.g. CM=
ake)<br/>cross-compiler (e.g. &lt;arch&gt;-gcc)<br/>debugger (e.g. gdb)<br/=
>more tools..."]]
+            builddir[["B (build directory)<br/>build artifacts)"]]
+            sysroot[["recipe-sysroot<br/>(target headers & libs)"]]
+            destdir[["D =3D image<br/>(non-stripped, relocated rpath,<br/>=
managed by pseudo)"]]
+        end
+
+        subgraph image_workdir["Image WORKDIR"]
+            rootfsdbg[["rootfs-dbg<br/>(debug symbols of other<br/>recipes=
' shared libraries)"]]
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
+    style sdk fill:#f6f5f4,stroke:#3584e4,stroke-width:1px
+    style recipe_workdir fill:#ffffff,stroke:#62a0ea,stroke-width:1px
+    style image_workdir fill:#ffffff,stroke:#57e389,stroke-width:1px
+    style target fill:#f6f5f4,stroke:#b5835a,stroke-width:1px
+
+    classDef orange fill:#ffbe6f,stroke:#ffa348,stroke-width:1px,color:#00=
0000;
+    classDef green fill:#8ff0a4,stroke:#57e389,stroke-width:1px,color:#000=
000;
+    classDef default fill:#99c1f1,stroke:#62a0ea,stroke-width:1px,color:#0=
00000;
+    class idesdk orange;
+    class srcdir green;
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-architecture.=
svg b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.svg
new file mode 100644
index 000000000..44b7bf5fb
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.svg
@@ -0,0 +1 @@
+<svg id=3D"my-svg" width=3D"794.109130859375" xmlns=3D"http://www.w3.org/2=
000/svg" xmlns:xlink=3D"http://www.w3.org/1999/xlink" class=3D"flowchart" h=
eight=3D"1602.60791015625" viewBox=3D"4 3.999998092651367 794.109130859375 =
1602.60791015625" role=3D"graphics-document document" aria-roledescription=
=3D"flowchart-v2" style=3D"background-color: transparent;"><style>#my-svg{f=
ont-family:"Nimbus Roman","Times New Roman",Times,serif;font-size:13.33px;f=
ill:#000000;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@ke=
yframes dash{to{stroke-dashoffset:0;}}#my-svg .edge-animation-slow{stroke-d=
asharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infi=
nite;stroke-linecap:round;}#my-svg .edge-animation-fast{stroke-dasharray:9,=
5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke=
-linecap:round;}#my-svg .error-icon{fill:hsl(32.7272727273, 75.8620689655%,=
 82.2549019608%);}#my-svg .error-text{fill:rgb(10.9224137931, 42.1293103448=
, 79.5775862068);stroke:rgb(10.9224137931, 42.1293103448, 79.5775862068);}#=
my-svg .edge-thickness-normal{stroke-width:1px;}#my-svg .edge-thickness-thi=
ck{stroke-width:3.5px;}#my-svg .edge-pattern-solid{stroke-dasharray:0;}#my-=
svg .edge-thickness-invisible{stroke-width:0;fill:none;}#my-svg .edge-patte=
rn-dashed{stroke-dasharray:3;}#my-svg .edge-pattern-dotted{stroke-dasharray=
:2;}#my-svg .marker{fill:#000000;stroke:#000000;}#my-svg .marker.cross{stro=
ke:#000000;}#my-svg svg{font-family:"Nimbus Roman","Times New Roman",Times,=
serif;font-size:13.33px;}#my-svg p{margin:0;}#my-svg .label{font-family:"Ni=
mbus Roman","Times New Roman",Times,serif;color:#000000;}#my-svg .cluster-l=
abel text{fill:#000000;}#my-svg .cluster-label span{color:#000000;}#my-svg =
.cluster-label span p{background-color:transparent;}#my-svg .label text,#my=
-svg span{fill:#000000;color:#000000;}#my-svg .node rect,#my-svg .node circ=
le,#my-svg .node ellipse,#my-svg .node polygon,#my-svg .node path{fill:#99c=
1f1;stroke:#62a0ea;stroke-width:1px;}#my-svg .rough-node .label text,#my-sv=
g .node .label text,#my-svg .image-shape .label,#my-svg .icon-shape .label{=
text-anchor:middle;}#my-svg .node .katex path{fill:#000;stroke:#000;stroke-=
width:1px;}#my-svg .rough-node .label,#my-svg .node .label,#my-svg .image-s=
hape .label,#my-svg .icon-shape .label{text-align:center;}#my-svg .node.cli=
ckable{cursor:pointer;}#my-svg .root .anchor path{fill:#000000!important;st=
roke-width:0;stroke:#000000;}#my-svg .arrowheadPath{fill:#0b0b0b;}#my-svg .=
edgePaths .path{stroke:#000000;stroke-width:1px;}#my-svg .flowchart-link{st=
roke:#000000;fill:none;}#my-svg .edgeLabel{background-color:#ffffff;text-al=
ign:center;}#my-svg .edgeLabel p{background-color:#ffffff;}#my-svg .edgeLab=
el rect{opacity:0.5;background-color:#ffffff;fill:#ffffff;}#my-svg .labelBk=
g{background-color:rgba(255, 255, 255, 0.5);}#my-svg .cluster rect{fill:#f6=
f5f4;stroke:#c0bfbc;stroke-width:1px;}#my-svg .cluster text{fill:#000000;}#=
my-svg .cluster span{color:#000000;}#my-svg .node .collapsed-indicator{fill=
:#c0bfbc;stroke:none;opacity:0.6;}#my-svg .node .collapsed-separator{stroke=
:#c0bfbc;stroke-width:0.75px;}#my-svg div.mermaidTooltip{position:absolute;=
text-align:center;max-width:200px;padding:2px;font-family:"Nimbus Roman","T=
imes New Roman",Times,serif;font-size:12px;background:hsl(32.7272727273, 75=
.8620689655%, 82.2549019608%);border:1px solid hsl(32.7272727273, 35.862068=
9655%, 72.2549019608%);border-radius:2px;pointer-events:none;z-index:100;}#=
my-svg .flowchartTitleText{text-anchor:middle;font-size:18px;fill:#000000;}=
#my-svg rect.text{fill:none;stroke-width:0;}#my-svg .icon-shape,#my-svg .im=
age-shape{background-color:#ffffff;text-align:center;}#my-svg .icon-shape p=
,#my-svg .image-shape p{background-color:#ffffff;padding:2px;}#my-svg .icon=
-shape .label rect,#my-svg .image-shape .label rect{opacity:0.5;background-=
color:#ffffff;fill:#ffffff;}#my-svg .label-icon{display:inline-block;height=
:1em;overflow:visible;vertical-align:-0.125em;}#my-svg .node .label-icon pa=
th{fill:currentColor;stroke:revert;stroke-width:revert;}#my-svg .node .neo-=
node{stroke:#62a0ea;}#my-svg [data-look=3D"neo"].node rect,#my-svg [data-lo=
ok=3D"neo"].cluster rect,#my-svg [data-look=3D"neo"].node polygon{stroke:ur=
l(#my-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#=
my-svg [data-look=3D"neo"].swimlane.cluster rect{filter:none;}#my-svg [data=
-look=3D"neo"].node path{stroke:url(#my-svg-gradient);stroke-width:1px;}#my=
-svg [data-look=3D"neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px r=
gba(185,185,185,1));}#my-svg [data-look=3D"neo"].node .neo-line path{stroke=
:#62a0ea;filter:none;}#my-svg [data-look=3D"neo"].node circle{stroke:url(#m=
y-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-s=
vg [data-look=3D"neo"].node circle .state-start{fill:#000000;}#my-svg [data=
-look=3D"neo"].icon-shape .icon{fill:url(#my-svg-gradient);filter:drop-shad=
ow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [data-look=3D"neo"].icon-shap=
e .icon-neo path{stroke:url(#my-svg-gradient);filter:drop-shadow( 1px 2px 2=
px rgba(185,185,185,1));}#my-svg .cluster-label tspan{font-weight:bold;}#my=
-svg rect{rx:7.5px;ry:7.5px;}#my-svg :root{--mermaid-font-family:"Nimbus Ro=
man","Times New Roman",Times,serif;}#my-svg .orange rect{fill:rgb(255, 190,=
 111)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!importa=
nt;color:rgb(0, 0, 0)!important;}#my-svg .orange polygon{fill:rgb(255, 190,=
 111)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!importa=
nt;color:rgb(0, 0, 0)!important;}#my-svg .orange ellipse{fill:rgb(255, 190,=
 111)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!importa=
nt;color:rgb(0, 0, 0)!important;}#my-svg .orange circle{fill:rgb(255, 190, =
111)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!importan=
t;color:rgb(0, 0, 0)!important;}#my-svg .orange path{fill:rgb(255, 190, 111=
)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;c=
olor:rgb(0, 0, 0)!important;}#my-svg .orange tspan{fill:rgb(0, 0, 0)!import=
ant;}#my-svg .green rect{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 2=
27, 137)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;=
}#my-svg .green polygon{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 22=
7, 137)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}=
#my-svg .green ellipse{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227=
, 137)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#=
my-svg .green circle{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, =
137)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my=
-svg .green path{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)=
!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg=
 .green tspan{fill:rgb(0, 0, 0)!important;}#my-svg .default rect{fill:rgb(1=
53, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px=
!important;color:rgb(0, 0, 0)!important;}#my-svg .default polygon{fill:rgb(=
153, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1p=
x!important;color:rgb(0, 0, 0)!important;}#my-svg .default ellipse{fill:rgb=
(153, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1=
px!important;color:rgb(0, 0, 0)!important;}#my-svg .default circle{fill:rgb=
(153, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1=
px!important;color:rgb(0, 0, 0)!important;}#my-svg .default path{fill:rgb(1=
53, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px=
!important;color:rgb(0, 0, 0)!important;}#my-svg .default tspan{fill:rgb(0,=
 0, 0)!important;}</style><g><marker id=3D"my-svg_flowchart-v2-pointEnd" cl=
ass=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"5" refY=3D"5" mar=
kerUnits=3D"userSpaceOnUse" markerWidth=3D"8" markerHeight=3D"8" orient=3D"=
auto"><path d=3D"M 0 0 L 10 5 L 0 10 z" class=3D"arrowMarkerPath" style=3D"=
stroke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_fl=
owchart-v2-pointStart" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" =
refX=3D"4.5" refY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"8" ma=
rkerHeight=3D"8" orient=3D"auto"><path d=3D"M 0 5 L 10 10 L 10 0 z" class=
=3D"arrowMarkerPath" style=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></=
marker><marker id=3D"my-svg_flowchart-v2-pointEnd-margin" class=3D"marker f=
lowchart-v2" viewBox=3D"0 0 11.5 14" refX=3D"11.5" refY=3D"7" markerUnits=
=3D"userSpaceOnUse" markerWidth=3D"10.5" markerHeight=3D"14" orient=3D"auto=
"><path d=3D"M 0 0 L 11.5 7 L 0 14 z" class=3D"arrowMarkerPath" style=3D"st=
roke-width: 0; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flow=
chart-v2-pointStart-margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 11=
.5 14" refX=3D"1" refY=3D"7" markerUnits=3D"userSpaceOnUse" markerWidth=3D"=
11.5" markerHeight=3D"14" orient=3D"auto"><polygon points=3D"0,7 11.5,14 11=
.5,0" class=3D"arrowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray:=
 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-circleEnd" class=3D"mar=
ker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"11" refY=3D"5" markerUnits=
=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=3D"auto">=
<circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke=
-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchar=
t-v2-circleStart" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=
=3D"-1" refY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11" marker=
Height=3D"11" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"ar=
rowMarkerPath" style=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker=
><marker id=3D"my-svg_flowchart-v2-circleEnd-margin" class=3D"marker flowch=
art-v2" viewBox=3D"0 0 10 10" refY=3D"5" refX=3D"12.25" markerUnits=3D"user=
SpaceOnUse" markerWidth=3D"14" markerHeight=3D"14" orient=3D"auto"><circle =
cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: =
0; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-cir=
cleStart-margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=
=3D"-2" refY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"14" marker=
Height=3D"14" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"ar=
rowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray: 1, 0;"/></marker=
><marker id=3D"my-svg_flowchart-v2-crossEnd" class=3D"marker cross flowchar=
t-v2" viewBox=3D"0 0 11 11" refX=3D"12" refY=3D"5.2" markerUnits=3D"userSpa=
ceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=3D"auto"><path d=3D"=
M 1,1 l 9,9 M 10,1 l -9,9" class=3D"arrowMarkerPath" style=3D"stroke-width:=
 2; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-cr=
ossStart" class=3D"marker cross flowchart-v2" viewBox=3D"0 0 11 11" refX=3D=
"-1" refY=3D"5.2" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11" markerH=
eight=3D"11" orient=3D"auto"><path d=3D"M 1,1 l 9,9 M 10,1 l -9,9" class=3D=
"arrowMarkerPath" style=3D"stroke-width: 2; stroke-dasharray: 1, 0;"/></mar=
ker><marker id=3D"my-svg_flowchart-v2-crossEnd-margin" class=3D"marker cros=
s flowchart-v2" viewBox=3D"0 0 15 15" refX=3D"17.7" refY=3D"7.5" markerUnit=
s=3D"userSpaceOnUse" markerWidth=3D"12" markerHeight=3D"12" orient=3D"auto"=
><path d=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=3D"arrowMarkerPath" style=3D=
"stroke-width: 2.5;"/></marker><marker id=3D"my-svg_flowchart-v2-crossStart=
-margin" class=3D"marker cross flowchart-v2" viewBox=3D"0 0 15 15" refX=3D"=
-3.5" refY=3D"7.5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"12" marker=
Height=3D"12" orient=3D"auto"><path d=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=
=3D"arrowMarkerPath" style=3D"stroke-width: 2.5; stroke-dasharray: 1, 0;"/>=
</marker><g class=3D"root"><g class=3D"clusters"><g class=3D"cluster" id=3D=
"my-svg-target" data-look=3D"classic"><rect style=3D"fill:#f6f5f4 !importan=
t;stroke:#b5835a !important;stroke-width:1px !important" x=3D"382.189534723=
19106" y=3D"1337.2819843292236" width=3D"254" height=3D"261.3259963989258"/=
><g class=3D"cluster-label" transform=3D"translate(471.3668189639137, 1337.=
2819843292236)"><g><rect class=3D"background" style=3D"stroke: none"/><text=
 xml:space=3D"preserve" y=3D"-10.1" style=3D""><tspan class=3D"text-outer-t=
span row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" cl=
ass=3D"text-inner-tspan" font-weight=3D"normal">Target</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> device</=
tspan></tspan></text></g></g></g><g class=3D"cluster" id=3D"my-svg-sdk" dat=
a-look=3D"classic"><rect style=3D"fill:#f6f5f4 !important;stroke:#3584e4 !i=
mportant;stroke-width:1px !important" x=3D"181.95500735328318" y=3D"390.988=
9945983887" width=3D"607.1796875000001" height=3D"804.6299896240234"/><g cl=
ass=3D"cluster-label" transform=3D"translate(384.09172610328324, 390.988994=
5983887)"><g><rect class=3D"background" style=3D"stroke: none"/><text xml:s=
pace=3D"preserve" y=3D"-10.1" style=3D""><tspan class=3D"text-outer-tspan r=
ow" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D=
"text-inner-tspan" font-weight=3D"normal">SDK</tspan><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal"> (regular</tspan><=
tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norma=
l"> bitbake</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal"> environment)</tspan></tspan></text></g></g></g><g c=
lass=3D"cluster" id=3D"my-svg-image_workdir" data-look=3D"classic"><rect st=
yle=3D"fill:#ffffff !important;stroke:#57e389 !important;stroke-width:1px !=
important" x=3D"230.5304389590309" y=3D"1055.2929878234863" width=3D"400.02=
28271484375" height=3D"116.32599639892578"/><g class=3D"cluster-label" tran=
sform=3D"translate(377.07684093656997, 1055.2929878234863)"><g><rect class=
=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-=
10.1" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em"=
 dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal">Image</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> WORKDIR</tspan></tspan></text></g></g><=
/g><g class=3D"cluster" id=3D"my-svg-recipe_workdir" data-look=3D"classic">=
<rect style=3D"fill:#ffffff !important;stroke:#62a0ea !important;stroke-wid=
th:1px !important" x=3D"205.95500735328318" y=3D"441.9889945983887" width=
=3D"559.1796875000001" height=3D"464.64099884033203"/><g class=3D"cluster-l=
abel" transform=3D"translate(423.76360110328324, 441.9889945983887)"><g><re=
ct class=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve=
" y=3D"-10.1" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D=
"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal">Recipe</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> WORKDIR(s)</tspan></tspan></t=
ext></g></g></g></g><g class=3D"edges edgePaths"><path d=3D"M229.5642224266=
416,60.66299819946289L229.5642224266416,73.59193038759742Q229.5642224266416=
,80.66299819946289 222.49315461477613,80.66299819946289L157.7147173218404,8=
0.66299819946289Q150.64364950997492,80.66299819946289 150.64364950997492,87=
.73406601132837L150.64364950997492,153.6629981994629" id=3D"my-svg-L_idesdk=
_ideconfig_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickn=
ess-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true=
" data-et=3D"edge" data-id=3D"L_idesdk_ideconfig_0" data-points=3D"W3sieCI6=
MjI5LjU2NDIyMjQyNjY0MTYsInkiOjYwLjY2Mjk5ODE5OTQ2Mjg5fSx7IngiOjIyOS41NjQyMjI=
0MjY2NDE2LCJ5Ijo4MC42NjI5OTgxOTk0NjI4OX0seyJ4IjoxNTAuNjQzNjQ5NTA5OTc0OTIsIn=
kiOjgwLjY2Mjk5ODE5OTQ2Mjg5fSx7IngiOjE1MC42NDM2NDk1MDk5NzQ5MiwieSI6MTU3LjY2M=
jk5ODE5OTQ2Mjl9XQ=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_fl=
owchart-v2-pointEnd)"/><path d=3D"M276.2308890933083,60.66299819946289L276.=
2308890933083,73.59193038759742Q276.2308890933083,80.66299819946289 283.301=
95690517377,80.66299819946289L453.7761270414176,80.66299819946289Q460.84719=
48532831,80.66299819946289 460.8471948532831,87.73406601132837L460.84719485=
32831,109.16299819946289L460.8471948532831,266.4889945983887L460.8471948532=
831,331.9889945983887L460.8471948532831,353.9179267865232Q460.8471948532831=
,360.9889945983887 453.7761270414176,360.9889945983887L378.33232516514863,3=
60.9889945983887Q371.26125735328316,360.9889945983887 371.26125735328316,36=
8.06006241025415L371.26125735328316,386.9889945983887" id=3D"my-svg-L_idesd=
k_sdk_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-n=
ormal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" dat=
a-et=3D"edge" data-id=3D"L_idesdk_sdk_0" data-points=3D"W3sieCI6Mjc2LjIzMDg=
4OTA5MzMwODMsInkiOjYwLjY2Mjk5ODE5OTQ2Mjg5fSx7IngiOjI3Ni4yMzA4ODkwOTMzMDgzLC=
J5Ijo4MC42NjI5OTgxOTk0NjI4OX0seyJ4Ijo0NjAuODQ3MTk0ODUzMjgzMSwieSI6ODAuNjYyO=
Tk4MTk5NDYyODl9LHsieCI6NDYwLjg0NzE5NDg1MzI4MzEsInkiOjEwOS4xNjI5OTgxOTk0NjI4=
OX0seyJ4Ijo0NjAuODQ3MTk0ODUzMjgzMSwieSI6MjY2LjQ4ODk5NDU5ODM4ODd9LHsieCI6NDY=
wLjg0NzE5NDg1MzI4MzEsInkiOjMzMS45ODg5OTQ1OTgzODg3fSx7IngiOjQ2MC44NDcxOTQ4NT=
MyODMxLCJ5IjozNjAuOTg4OTk0NTk4Mzg4N30seyJ4IjozNzEuMjYxMjU3MzUzMjgzMTYsInkiO=
jM2MC45ODg5OTQ1OTgzODg3fSx7IngiOjM3MS4yNjEyNTczNTMyODMxNiwieSI6MzkwLjk4ODk5=
NDU5ODM4ODd9XQ=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowc=
hart-v2-pointEnd)"/><path d=3D"M128.30771200997492,209.98899459838867L128.3=
0771200997492,222.9179267865232Q128.30771200997492,229.98899459838867 121.2=
3664419810945,229.98899459838867L119.26898447853215,229.98899459838867Q112.=
19791666666667,229.98899459838867 112.19791666666667,237.06006241025415L112=
.19791666666667,245.98899459838867" id=3D"my-svg-L_ideconfig_ide_0" class=
=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-pat=
tern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" =
data-id=3D"L_ideconfig_ide_0" data-points=3D"W3sieCI6MTI4LjMwNzcxMjAwOTk3ND=
kyLCJ5IjoyMDkuOTg4OTk0NTk4Mzg4Njd9LHsieCI6MTI4LjMwNzcxMjAwOTk3NDkyLCJ5IjoyM=
jkuOTg4OTk0NTk4Mzg4Njd9LHsieCI6MTEyLjE5NzkxNjY2NjY2NjY3LCJ5IjoyMjkuOTg4OTk0=
NTk4Mzg4Njd9LHsieCI6MTEyLjE5NzkxNjY2NjY2NjY3LCJ5IjoyNDkuOTg4OTk0NTk4Mzg4Njd=
9XQ=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-poi=
ntEnd)"/><path d=3D"M172.97958700997492,209.98899459838867L172.979587009974=
92,222.9179267865232Q172.97958700997492,229.98899459838867 180.050654821840=
4,229.98899459838867L352.1901895414176,229.98899459838867Q359.2612573532831=
,229.98899459838867 359.2612573532831,237.06006241025415L359.2612573532831,=
266.4889945983887L359.2612573532831,331.9889945983887L359.2612573532831,380=
.9889945983887L359.2612573532831,431.9889945983887L359.2612573532831,477.98=
89945983887" id=3D"my-svg-L_ideconfig_native_sysroot_0" class=3D"edge-thick=
ness-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid flo=
wchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_i=
deconfig_native_sysroot_0" data-points=3D"W3sieCI6MTcyLjk3OTU4NzAwOTk3NDkyL=
CJ5IjoyMDkuOTg4OTk0NTk4Mzg4Njd9LHsieCI6MTcyLjk3OTU4NzAwOTk3NDkyLCJ5IjoyMjku=
OTg4OTk0NTk4Mzg4Njd9LHsieCI6MzU5LjI2MTI1NzM1MzI4MzEsInkiOjIyOS45ODg5OTQ1OTg=
zODg2N30seyJ4IjozNTkuMjYxMjU3MzUzMjgzMSwieSI6MjY2LjQ4ODk5NDU5ODM4ODd9LHsieC=
I6MzU5LjI2MTI1NzM1MzI4MzEsInkiOjMzMS45ODg5OTQ1OTgzODg3fSx7IngiOjM1OS4yNjEyN=
TczNTMyODMxLCJ5IjozODAuOTg4OTk0NTk4Mzg4N30seyJ4IjozNTkuMjYxMjU3MzUzMjgzMSwi=
eSI6NDMxLjk4ODk5NDU5ODM4ODd9LHsieCI6MzU5LjI2MTI1NzM1MzI4MzEsInkiOjQ4MS45ODg=
5OTQ1OTgzODg3fV0=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowch=
art-v2-pointEnd)"/><path d=3D"M135.53125,282.9889945983887L135.53125,295.91=
79267865232Q135.53125,302.9889945983887 142.60231781186548,302.988994598388=
7L217.6993796920873,302.9889945983887Q224.77044750395277,302.9889945983887 =
224.77044750395277,310.06006241025415L224.77044750395277,353.9179267865232Q=
224.77044750395277,360.9889945983887 231.84151531581824,360.9889945983887L2=
92.93706454141767,360.9889945983887Q300.00813235328314,360.9889945983887 30=
0.00813235328314,368.06006241025415L300.00813235328314,380.9889945983887L30=
0.00813235328314,431.9889945983887L300.00813235328314,477.9889945983887" id=
=3D"my-svg-L_ide_native_sysroot_0" class=3D"edge-thickness-normal edge-patt=
ern-solid edge-thickness-normal edge-pattern-solid flowchart-link" style=3D=
";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_ide_native_sysroot_0" =
data-points=3D"W3sieCI6MTM1LjUzMTI1LCJ5IjoyODIuOTg4OTk0NTk4Mzg4N30seyJ4Ijox=
MzUuNTMxMjUsInkiOjMwMi45ODg5OTQ1OTgzODg3fSx7IngiOjIyNC43NzA0NDc1MDM5NTI3Nyw=
ieSI6MzAyLjk4ODk5NDU5ODM4ODd9LHsieCI6MjI0Ljc3MDQ0NzUwMzk1Mjc3LCJ5IjozNjAuOT=
g4OTk0NTk4Mzg4N30seyJ4IjozMDAuMDA4MTMyMzUzMjgzMTQsInkiOjM2MC45ODg5OTQ1OTgzO=
Dg3fSx7IngiOjMwMC4wMDgxMzIzNTMyODMxNCwieSI6MzgwLjk4ODk5NDU5ODM4ODd9LHsieCI6=
MzAwLjAwODEzMjM1MzI4MzE0LCJ5Ijo0MzEuOTg4OTk0NTk4Mzg4N30seyJ4IjozMDAuMDA4MTM=
yMzUzMjgzMTQsInkiOjQ4MS45ODg5OTQ1OTgzODg3fV0=3D" data-look=3D"classic" mark=
er-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M88.8645833333333=
4,282.9889945983887L88.86458333333334,295.9179267865232Q88.86458333333334,3=
02.9889945983887 81.79351552146787,302.9889945983887L70.64344162894606,302.=
9889945983887Q63.57237381708059,302.9889945983887 63.57237381708059,310.060=
06241025415L63.57237381708059,331.9889945983887L63.57237381708059,1271.4504=
842758179L63.57237381708059,1300.210916517358Q63.57237381708059,1307.281984=
3292236 70.64344162894606,1307.2819843292236L81.79351552146787,1307.2819843=
292236Q88.86458333333334,1307.2819843292236 88.86458333333334,1314.35305214=
10892L88.86458333333334,1333.2819843292236" id=3D"my-svg-L_ide_srcdir_0" cl=
ass=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-=
pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edg=
e" data-id=3D"L_ide_srcdir_0" data-points=3D"W3sieCI6ODguODY0NTgzMzMzMzMzMz=
QsInkiOjI4Mi45ODg5OTQ1OTgzODg3fSx7IngiOjg4Ljg2NDU4MzMzMzMzMzM0LCJ5IjozMDIuO=
Tg4OTk0NTk4Mzg4N30seyJ4Ijo2My41NzIzNzM4MTcwODA1OSwieSI6MzAyLjk4ODk5NDU5ODM4=
ODd9LHsieCI6NjMuNTcyMzczODE3MDgwNTksInkiOjMzMS45ODg5OTQ1OTgzODg3fSx7IngiOjY=
zLjU3MjM3MzgxNzA4MDU5LCJ5IjoxMjcxLjQ1MDQ4NDI3NTgxNzl9LHsieCI6NjMuNTcyMzczOD=
E3MDgwNTksInkiOjEzMDcuMjgxOTg0MzI5MjIzNn0seyJ4Ijo4OC44NjQ1ODMzMzMzMzMzNCwie=
SI6MTMwNy4yODE5ODQzMjkyMjM2fSx7IngiOjg4Ljg2NDU4MzMzMzMzMzM0LCJ5IjoxMzM3LjI4=
MTk4NDMyOTIyMzZ9XQ=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_f=
lowchart-v2-pointEnd)"/><path d=3D"M266.14920378185457,563.6409950256348L26=
6.14920378185457,586.5699272137692Q266.14920378185457,593.6409950256348 259=
.0781359699891,593.6409950256348L247.31156623657716,593.6409950256348Q240.2=
404984247117,593.6409950256348 240.2404984247117,600.7120628375003L240.2404=
9842471163,916.6299934387207L240.24049842471163,939.5589256268552Q240.24049=
842471163,946.6299934387207 233.16943061284616,946.6299934387207L202.502957=
66375348,946.6299934387207Q195.431889851888,946.6299934387207 195.431889851=
888,953.7010612505861L195.43188985188806,1215.618984222412L195.431889851888=
06,1228.5479164105466Q195.43188985188806,1235.618984222412 188.360822040022=
58,1235.618984222412L184.7193044044762,1235.618984222412Q177.64823659261071=
,1235.618984222412 177.64823659261071,1242.6900520342776L177.64823659261071=
,1300.210916517358Q177.64823659261071,1307.2819843292236 170.57716878074524=
,1307.2819843292236L162.80023447853216,1307.2819843292236Q155.7291666666666=
9,1307.2819843292236 155.72916666666669,1314.3530521410892L155.729166666666=
69,1333.2819843292236" id=3D"my-svg-L_native_sysroot_srcdir_0" class=3D"edg=
e-thickness-normal edge-pattern-solid edge-thickness-normal edge-pattern-so=
lid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=
=3D"L_native_sysroot_srcdir_0" data-points=3D"W3sieCI6MjY2LjE0OTIwMzc4MTg1N=
DU3LCJ5Ijo1NjMuNjQwOTk1MDI1NjM0OH0seyJ4IjoyNjYuMTQ5MjAzNzgxODU0NTcsInkiOjU5=
My42NDA5OTUwMjU2MzQ4fSx7IngiOjI0MC4yNDA0OTg0MjQ3MTE3LCJ5Ijo1OTMuNjQwOTk1MDI=
1NjM0OH0seyJ4IjoyNDAuMjQwNDk4NDI0NzExNjMsInkiOjkxNi42Mjk5OTM0Mzg3MjA3fSx7In=
giOjI0MC4yNDA0OTg0MjQ3MTE2MywieSI6OTQ2LjYyOTk5MzQzODcyMDd9LHsieCI6MTk1LjQzM=
Tg4OTg1MTg4OCwieSI6OTQ2LjYyOTk5MzQzODcyMDd9LHsieCI6MTk1LjQzMTg4OTg1MTg4ODA2=
LCJ5IjoxMjE1LjYxODk4NDIyMjQxMn0seyJ4IjoxOTUuNDMxODg5ODUxODg4MDYsInkiOjEyMzU=
uNjE4OTg0MjIyNDEyfSx7IngiOjE3Ny42NDgyMzY1OTI2MTA3MSwieSI6MTIzNS42MTg5ODQyMj=
I0MTJ9LHsieCI6MTc3LjY0ODIzNjU5MjYxMDcxLCJ5IjoxMzA3LjI4MTk4NDMyOTIyMzZ9LHsie=
CI6MTU1LjcyOTE2NjY2NjY2NjY5LCJ5IjoxMzA3LjI4MTk4NDMyOTIyMzZ9LHsieCI6MTU1Ljcy=
OTE2NjY2NjY2NjY5LCJ5IjoxMzM3LjI4MTk4NDMyOTIyMzZ9XQ=3D=3D" data-look=3D"clas=
sic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M342.331=
79306756887,563.6409950256348L342.33179306756887,610.5699272137692Q342.3317=
9306756887,617.6409950256348 349.40286087943434,617.6409950256348L365.56362=
704141765,617.6409950256348Q372.6346948532831,617.6409950256348 372.6346948=
532831,624.7120628375003L372.6346948532831,685.6409950256348" id=3D"my-svg-=
L_native_sysroot_builddir_0" class=3D"edge-thickness-normal edge-pattern-so=
lid edge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" da=
ta-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_sysroot_builddir_0" d=
ata-points=3D"W3sieCI6MzQyLjMzMTc5MzA2NzU2ODg3LCJ5Ijo1NjMuNjQwOTk1MDI1NjM0O=
H0seyJ4IjozNDIuMzMxNzkzMDY3NTY4ODcsInkiOjYxNy42NDA5OTUwMjU2MzQ4fSx7IngiOjM3=
Mi42MzQ2OTQ4NTMyODMxLCJ5Ijo2MTcuNjQwOTk1MDI1NjM0OH0seyJ4IjozNzIuNjM0Njk0ODU=
zMjgzMSwieSI6Njg5LjY0MDk5NTAyNTYzNDh9XQ=3D=3D" data-look=3D"classic" marker=
-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M367.7259894961403,=
563.6409950256348L367.7259894961403,598.5699272137692Q367.7259894961403,605=
.6409950256348 374.7970573080058,605.6409950256348L561.5636270414177,605.64=
09950256348Q568.6346948532831,605.6409950256348 568.6346948532831,612.71206=
28375003L568.6346948532831,685.6409950256348" id=3D"my-svg-L_native_sysroot=
_sysroot_0" class=3D"edge-thickness-normal edge-pattern-dotted edge-thickne=
ss-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true"=
 data-et=3D"edge" data-id=3D"L_native_sysroot_sysroot_0" data-points=3D"W3s=
ieCI6MzY3LjcyNTk4OTQ5NjE0MDMsInkiOjU2My42NDA5OTUwMjU2MzQ4fSx7IngiOjM2Ny43Mj=
U5ODk0OTYxNDAzLCJ5Ijo2MDUuNjQwOTk1MDI1NjM0OH0seyJ4Ijo1NjguNjM0Njk0ODUzMjgzM=
SwieSI6NjA1LjY0MDk5NTAyNTYzNDh9LHsieCI6NTY4LjYzNDY5NDg1MzI4MzEsInkiOjY4OS42=
NDA5OTUwMjU2MzQ4fV0=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flo=
wchart-v2-pointEnd)"/><path d=3D"M372.6346948532831,728.3039786038389L372.6=
346948532831,728.3039970397949L372.6346948532831,793.2329292279294Q372.6346=
948532831,800.3039970397949 379.7057626651486,800.3039970397949L522.2000853=
747511,800.3039970397949Q529.2711531866165,800.3039970397949 529.2711531866=
165,807.3750648516605L529.2711531866165,826.3039970397949" id=3D"my-svg-L_b=
uilddir_destdir_0" class=3D"edge-thickness-normal edge-pattern-solid edge-t=
hickness-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D=
"true" data-et=3D"edge" data-id=3D"L_builddir_destdir_0" data-points=3D"W3s=
ieCI6MzcyLjYzNDY5NDg1MzI4MzEsInkiOjcyOC4zMDM5Nzg2MDM4Mzg5fSx7IngiOjM3Mi42Mz=
Q2OTQ4NTMyODMxLCJ5Ijo3MjguMzAzOTk3MDM5Nzk0OX0seyJ4IjozNzIuNjM0Njk0ODUzMjgzM=
SwieSI6ODAwLjMwMzk5NzAzOTc5NDl9LHsieCI6NTI5LjI3MTE1MzE4NjYxNjUsInkiOjgwMC4z=
MDM5OTcwMzk3OTQ5fSx7IngiOjUyOS4yNzExNTMxODY2MTY1LCJ5Ijo4MzAuMzAzOTk3MDM5Nzk=
0OX1d" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEn=
d)"/><path d=3D"M556.8846948532831,882.6299934387207L556.8846948532831,916.=
6299934387207L556.8846948532831,939.5589256268552Q556.8846948532831,946.629=
9934387207 563.9557626651485,946.6299934387207L635.4821982956029,946.629993=
4387207Q642.5532661074684,946.6299934387207 642.5532661074684,953.701061250=
5862L642.5532661074685,1215.618984222412L642.5532661074685,1234.93711853027=
34Q642.5532661074685,1235.618984222412 643.2351317996072,1235.618984222412L=
643.2351317996072,1235.618984222412Q643.9169974917457,1235.618984222412 643=
.9169974917457,1236.3008499145508L643.9169974917457,1300.210916517358Q643.9=
169974917457,1307.2819843292236 636.8459296798803,1307.2819843292236L585.26=
06025350565,1307.2819843292236Q578.1895347231911,1307.2819843292236 578.189=
5347231911,1314.3530521410892L578.1895347231911,1327.2819843292236L578.1895=
347231911,1488.873914716821Q578.1895347231911,1495.9449825286865 571.118466=
9113256,1495.9449825286865L562.3272692017231,1495.9449825286865Q555.2562013=
898577,1495.9449825286865 555.2562013898577,1503.016050340552L555.256201389=
8577,1521.9449825286865" id=3D"my-svg-L_destdir_appbin_0" class=3D"edge-thi=
ckness-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid f=
lowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L=
_destdir_appbin_0" data-points=3D"W3sieCI6NTU2Ljg4NDY5NDg1MzI4MzEsInkiOjg4M=
i42Mjk5OTM0Mzg3MjA3fSx7IngiOjU1Ni44ODQ2OTQ4NTMyODMxLCJ5Ijo5MTYuNjI5OTkzNDM4=
NzIwN30seyJ4Ijo1NTYuODg0Njk0ODUzMjgzMSwieSI6OTQ2LjYyOTk5MzQzODcyMDd9LHsieCI=
6NjQyLjU1MzI2NjEwNzQ2ODQsInkiOjk0Ni42Mjk5OTM0Mzg3MjA3fSx7IngiOjY0Mi41NTMyNj=
YxMDc0Njg1LCJ5IjoxMjE1LjYxODk4NDIyMjQxMn0seyJ4Ijo2NDIuNTUzMjY2MTA3NDY4NSwie=
SI6MTIzNS42MTg5ODQyMjI0MTJ9LHsieCI6NjQzLjkxNjk5NzQ5MTc0NTcsInkiOjEyMzUuNjE4=
OTg0MjIyNDEyfSx7IngiOjY0My45MTY5OTc0OTE3NDU3LCJ5IjoxMzA3LjI4MTk4NDMyOTIyMzZ=
9LHsieCI6NTc4LjE4OTUzNDcyMzE5MTEsInkiOjEzMDcuMjgxOTg0MzI5MjIzNn0seyJ4Ijo1Nz=
guMTg5NTM0NzIzMTkxMSwieSI6MTMyNy4yODE5ODQzMjkyMjM2fSx7IngiOjU3OC4xODk1MzQ3M=
jMxOTExLCJ5IjoxNDk1Ljk0NDk4MjUyODY4NjV9LHsieCI6NTU1LjI1NjIwMTM4OTg1NzcsInki=
OjE0OTUuOTQ0OTgyNTI4Njg2NX0seyJ4Ijo1NTUuMjU2MjAxMzg5ODU3NywieSI6MTUyNS45NDQ=
5ODI1Mjg2ODY1fV0=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowch=
art-v2-pointEnd)"/><path d=3D"M393.12018592471173,563.6409950256348L393.120=
18592471173,586.5699272137692Q393.12018592471173,593.6409950256348 400.1912=
537365772,593.6409950256348L734.0636270414177,593.6409950256348Q741.1346948=
532832,593.6409950256348 741.1346948532832,600.7120628375003L741.1346948532=
832,793.2329292279294Q741.1346948532832,800.3039970397949 734.0636270414177=
,800.3039970397949L591.5693043318154,800.3039970397949Q584.4982365199498,80=
0.3039970397949 584.4982365199498,807.3750648516605L584.4982365199498,826.3=
039970397949" id=3D"my-svg-L_native_sysroot_destdir_0" class=3D"edge-thickn=
ess-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid flow=
chart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_na=
tive_sysroot_destdir_0" data-points=3D"W3sieCI6MzkzLjEyMDE4NTkyNDcxMTczLCJ5=
Ijo1NjMuNjQwOTk1MDI1NjM0OH0seyJ4IjozOTMuMTIwMTg1OTI0NzExNzMsInkiOjU5My42NDA=
5OTUwMjU2MzQ4fSx7IngiOjc0MS4xMzQ2OTQ4NTMyODMyLCJ5Ijo1OTMuNjQwOTk1MDI1NjM0OH=
0seyJ4Ijo3NDEuMTM0Njk0ODUzMjgzMiwieSI6ODAwLjMwMzk5NzAzOTc5NDl9LHsieCI6NTg0L=
jQ5ODIzNjUxOTk0OTgsInkiOjgwMC4zMDM5OTcwMzk3OTQ5fSx7IngiOjU4NC40OTgyMzY1MTk5=
NDk4LCJ5Ijo4MzAuMzAzOTk3MDM5Nzk0OX1d" data-look=3D"classic" marker-end=3D"u=
rl(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M316.93759663899743,563.6409=
950256348L316.93759663899743,610.5699272137692Q316.93759663899743,617.64099=
50256348 309.86652882713196,617.6409950256348L293.7057626651486,617.6409950=
256348Q286.6346948532831,617.6409950256348 286.6346948532831,624.7120628375=
003L286.6346948532831,916.6299934387207L286.6346948532831,939.5589256268552=
Q286.6346948532831,946.6299934387207 293.7057626651486,946.6299934387207L32=
5.4707847213842,946.6299934387207Q332.54185253324965,946.6299934387207 332.=
54185253324965,953.7010612505862L332.54185253324965,1045.2929878234863L332.=
54185253324965,1091.2929878234863" id=3D"my-svg-L_native_sysroot_rootfsdbg_=
0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal =
edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=
=3D"edge" data-id=3D"L_native_sysroot_rootfsdbg_0" data-points=3D"W3sieCI6M=
zE2LjkzNzU5NjYzODk5NzQzLCJ5Ijo1NjMuNjQwOTk1MDI1NjM0OH0seyJ4IjozMTYuOTM3NTk2=
NjM4OTk3NDMsInkiOjYxNy42NDA5OTUwMjU2MzQ4fSx7IngiOjI4Ni42MzQ2OTQ4NTMyODMxLCJ=
5Ijo2MTcuNjQwOTk1MDI1NjM0OH0seyJ4IjoyODYuNjM0Njk0ODUzMjgzMSwieSI6OTE2LjYyOT=
k5MzQzODcyMDd9LHsieCI6Mjg2LjYzNDY5NDg1MzI4MzEsInkiOjk0Ni42Mjk5OTM0Mzg3MjA3f=
Sx7IngiOjMzMi41NDE4NTI1MzMyNDk2NSwieSI6OTQ2LjYyOTk5MzQzODcyMDd9LHsieCI6MzMy=
LjU0MTg1MjUzMzI0OTY1LCJ5IjoxMDQ1LjI5Mjk4NzgyMzQ4NjN9LHsieCI6MzMyLjU0MTg1MjU=
zMzI0OTY1LCJ5IjoxMDk1LjI5Mjk4NzgyMzQ4NjN9XQ=3D=3D" data-look=3D"classic" ma=
rker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M291.5434002104=
26,563.6409950256348L291.543400210426,598.5699272137692Q291.543400210426,60=
5.6409950256348 284.4723323985605,605.6409950256348L270.5086644508629,605.6=
409950256348Q263.43759663899743,605.6409950256348 263.43759663899743,612.71=
20628375003L263.43759663899743,916.6299934387207L263.43759663899743,951.558=
9256268552Q263.43759663899743,958.6299934387207 256.36652882713196,958.6299=
934387207L224.60150677089638,958.6299934387207Q217.5304389590309,958.629993=
4387207 217.5304389590309,965.7010612505862L217.5304389590309,1215.61898422=
2412L217.5304389590309,1228.5479164105466Q217.5304389590309,1235.6189842224=
12 224.60150677089638,1235.618984222412L333.0668894431801,1235.618984222412=
Q340.1379572550456,1235.618984222412 340.1379572550456,1242.6900520342776L3=
40.1379572550456,1300.210916517358Q340.1379572550456,1307.2819843292236 347=
.20902506691107,1307.2819843292236L479.1184669113256,1307.2819843292236Q486=
.18953472319106,1307.2819843292236 486.18953472319106,1314.3530521410892L48=
6.189534723191,1327.2819843292236L486.189534723191,1373.2819843292236" id=
=3D"my-svg-L_native_sysroot_debugserver_0" class=3D"edge-thickness-normal e=
dge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-link" =
style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_sysroot=
_debugserver_0" data-points=3D"W3sieCI6MjkxLjU0MzQwMDIxMDQyNiwieSI6NTYzLjY0=
MDk5NTAyNTYzNDh9LHsieCI6MjkxLjU0MzQwMDIxMDQyNiwieSI6NjA1LjY0MDk5NTAyNTYzNDh=
9LHsieCI6MjYzLjQzNzU5NjYzODk5NzQzLCJ5Ijo2MDUuNjQwOTk1MDI1NjM0OH0seyJ4IjoyNj=
MuNDM3NTk2NjM4OTk3NDMsInkiOjkxNi42Mjk5OTM0Mzg3MjA3fSx7IngiOjI2My40Mzc1OTY2M=
zg5OTc0MywieSI6OTU4LjYyOTk5MzQzODcyMDd9LHsieCI6MjE3LjUzMDQzODk1OTAzMDksInki=
Ojk1OC42Mjk5OTM0Mzg3MjA3fSx7IngiOjIxNy41MzA0Mzg5NTkwMzA5LCJ5IjoxMjE1LjYxODk=
4NDIyMjQxMn0seyJ4IjoyMTcuNTMwNDM4OTU5MDMwOSwieSI6MTIzNS42MTg5ODQyMjI0MTJ9LH=
sieCI6MzQwLjEzNzk1NzI1NTA0NTYsInkiOjEyMzUuNjE4OTg0MjIyNDEyfSx7IngiOjM0MC4xM=
zc5NTcyNTUwNDU2LCJ5IjoxMzA3LjI4MTk4NDMyOTIyMzZ9LHsieCI6NDg2LjE4OTUzNDcyMzE5=
MTA2LCJ5IjoxMzA3LjI4MTk4NDMyOTIyMzZ9LHsieCI6NDg2LjE4OTUzNDcyMzE5MSwieSI6MTM=
yNy4yODE5ODQzMjkyMjM2fSx7IngiOjQ4Ni4xODk1MzQ3MjMxOTEsInkiOjEzNzcuMjgxOTg0Mz=
I5MjIzNn1d" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-po=
intEnd)"/><path d=3D"M486.18953472319106,1424.9449825286865L486.18953472319=
106,1488.873914716821Q486.18953472319106,1495.9449825286865 493.26060253505=
653,1495.9449825286865L502.0518002446589,1495.9449825286865Q509.12286805652=
44,1495.9449825286865 509.1228680565244,1503.016050340552L509.1228680565244=
,1521.9449825286865" id=3D"my-svg-L_debugserver_appbin_0" class=3D"edge-thi=
ckness-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid f=
lowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L=
_debugserver_appbin_0" data-points=3D"W3sieCI6NDg2LjE4OTUzNDcyMzE5MTA2LCJ5I=
joxNDI0Ljk0NDk4MjUyODY4NjV9LHsieCI6NDg2LjE4OTUzNDcyMzE5MTA2LCJ5IjoxNDk1Ljk0=
NDk4MjUyODY4NjV9LHsieCI6NTA5LjEyMjg2ODA1NjUyNDQsInkiOjE0OTUuOTQ0OTgyNTI4Njg=
2NX0seyJ4Ijo1MDkuMTIyODY4MDU2NTI0NCwieSI6MTUyNS45NDQ5ODI1Mjg2ODY1fV0=3D" da=
ta-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><pat=
h d=3D"M533.5532661074664,1147.6189823150635L533.5532661074684,1147.6189842=
22412L533.5532661074684,1181.618984222412L533.5532661074685,1215.6189842224=
12L533.5532661074685,1234.9371185302734Q533.5532661074685,1235.618984222412=
 532.8714004153298,1235.618984222412L532.8714004153298,1235.618984222412Q53=
2.1895347231911,1235.618984222412 532.1895347231911,1236.3008499145508L532.=
1895347231911,1333.2819843292236" id=3D"my-svg-L_rootfs_target_0" class=3D"=
edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-pattern=
-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data=
-id=3D"L_rootfs_target_0" data-points=3D"W3sieCI6NTMzLjU1MzI2NjEwNzQ2NjQsIn=
kiOjExNDcuNjE4OTgyMzE1MDYzNX0seyJ4Ijo1MzMuNTUzMjY2MTA3NDY4NCwieSI6MTE0Ny42M=
Tg5ODQyMjI0MTJ9LHsieCI6NTMzLjU1MzI2NjEwNzQ2ODQsInkiOjExODEuNjE4OTg0MjIyNDEy=
fSx7IngiOjUzMy41NTMyNjYxMDc0Njg1LCJ5IjoxMjE1LjYxODk4NDIyMjQxMn0seyJ4Ijo1MzM=
uNTUzMjY2MTA3NDY4NSwieSI6MTIzNS42MTg5ODQyMjI0MTJ9LHsieCI6NTMyLjE4OTUzNDcyMz=
E5MTEsInkiOjEyMzUuNjE4OTg0MjIyNDEyfSx7IngiOjUzMi4xODk1MzQ3MjMxOTExLCJ5IjoxM=
zM3LjI4MTk4NDMyOTIyMzZ9XQ=3D=3D" data-look=3D"classic" marker-end=3D"url(#m=
y-svg_flowchart-v2-pointEnd)"/></g><g class=3D"edgeLabels"><g class=3D"edge=
Label" transform=3D"translate(150.48739950997492, 109.16299819946289)"><g c=
lass=3D"label" data-id=3D"L_idesdk_ideconfig_0" transform=3D"translate(0, -=
10.829999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-26.8437=
5" y=3D"2.3299999237060547" width=3D"53.6875" height=3D"17"/><text xml:spac=
e=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=
=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"=
middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal">generates</tspan></tspan></text></g></g></g><g class=3D"edgeLab=
el" transform=3D"translate(460.4643823532831, 183.82599639892578)"><g class=
=3D"label" data-id=3D"L_idesdk_sdk_0" transform=3D"translate(0, -10.3299999=
23706055)"><g><rect class=3D"background" style=3D"" x=3D"-87.1171875" y=3D"=
1.3299999237060547" width=3D"174.234375" height=3D"18"/><text xml:space=3D"=
preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"tex=
t-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"=
><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"nor=
mal">generates</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal"> the</tspan><tspan font-style=3D"normal" class=3D=
"text-inner-tspan" font-weight=3D"normal"> SDK</tspan><tspan font-style=3D"=
normal" class=3D"text-inner-tspan" font-weight=3D"normal"> (via</tspan><tsp=
an font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">=
 bitbake)</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transfor=
m=3D"translate(224.56292034330824, 331.9889945983887)"><g class=3D"label" d=
ata-id=3D"L_ide_native_sysroot_0" transform=3D"translate(-0.167472839355468=
75, -10.329999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-87=
.125" y=3D"1.3299999237060547" width=3D"174.58494567871094" height=3D"18"/>=
<text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D"">=
<tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" tex=
t-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan"=
 font-weight=3D"normal">calls</tspan><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal"> directly,</tspan><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> no</tspan><=
tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norma=
l"> bitbake</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal"> needed</tspan></tspan></text></g></g></g><g class=
=3D"edgeLabel" transform=3D"translate(63.10602707635793, 798.3039894104004)=
"><g class=3D"label" data-id=3D"L_ide_srcdir_0" transform=3D"translate(-0.0=
3365325927734375, -10.829999923706055)"><g><rect class=3D"background" style=
=3D"" x=3D"-31" y=3D"2.3299999237060547" width=3D"62.06730651855469" height=
=3D"17"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" st=
yle=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1=
.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">edit</tspan><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal"> source</tspan></tspan></t=
ext></g></g></g><g class=3D"edgeLabel" transform=3D"translate(177.523373921=
71222, 1271.4504842758179)"><g class=3D"label" data-id=3D"L_native_sysroot_=
srcdir_0" transform=3D"translate(-0.3126373291015625, -10.829999923706055)"=
><g><rect class=3D"background" style=3D"" x=3D"-49.5625" y=3D"2.32999992370=
60547" width=3D"99.75027465820312" height=3D"17"/><text xml:space=3D"preser=
ve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-oute=
r-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">r=
eads</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal"> source</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> from</tspan></tspan></text></g></g></g>=
<g class=3D"edgeLabel" transform=3D"translate(372.45017794654484, 656.64099=
50256348)"><g class=3D"label" data-id=3D"L_native_sysroot_builddir_0" trans=
form=3D"translate(-0.16704559326171875, -10.329999923706055)"><g><rect clas=
s=3D"background" style=3D"" x=3D"-25.1484375" y=3D"1.3299999237060547" widt=
h=3D"50.63096618652344" height=3D"18"/><text xml:space=3D"preserve" y=3D"-1=
0.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row=
" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">builds</tspa=
n><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"no=
rmal"> in</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transfor=
m=3D"translate(568.4995096115839, 656.6409950256348)"><g class=3D"label" da=
ta-id=3D"L_native_sysroot_sysroot_0" transform=3D"translate(-0.146064758300=
78125, -10.829999923706055)"><g><rect class=3D"background" style=3D"" x=3D"=
-25.21875" y=3D"2.3299999237060547" width=3D"50.72962951660156" height=3D"1=
7"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=
=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1e=
m" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal">--sysroot</tspan></tspan></text></g></g></g><=
g class=3D"edgeLabel" transform=3D"translate(372.5556543259394, 761.3039970=
397949)"><g class=3D"label" data-id=3D"L_builddir_destdir_0" transform=3D"t=
ranslate(-0.13970947265625, -10.329999923706055)"><g><rect class=3D"backgro=
und" style=3D"" x=3D"-18.28125" y=3D"1.3299999237060547" width=3D"36.841918=
9453125" height=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-ancho=
r=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"=
-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" cl=
ass=3D"text-inner-tspan" font-weight=3D"normal">install</tspan></tspan></te=
xt></g></g></g><g class=3D"edgeLabel" transform=3D"translate(643.7607474917=
456, 1271.4504842758179)"><g class=3D"label" data-id=3D"L_destdir_appbin_0"=
 transform=3D"translate(0, -10.329999923706055)"><g><rect class=3D"backgrou=
nd" style=3D"" x=3D"-42.34375" y=3D"1.3299999237060547" width=3D"84.6875" h=
eight=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middl=
e" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=
=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal">deploy</tspan><tspan font-style=3D"no=
rmal" class=3D"text-inner-tspan" font-weight=3D"normal"> (--strip)</tspan><=
/tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"translate(740=
.8719232468379, 708.9724960327148)"><g class=3D"label" data-id=3D"L_native_=
sysroot_destdir_0" transform=3D"translate(-0.1669158935546875, -17.66149997=
7111816)"><g><rect class=3D"background" style=3D"" x=3D"-49.0703125" y=3D"1=
.3299999237060547" width=3D"98.47445678710938" height=3D"32.66300010681152"=
/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D"=
"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" t=
ext-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal">debug</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> symbols:</tspan></tspan><tspa=
n class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em" text-anchor=
=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">unstripped</tspan><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal"> binary</tspan></tspan></text></g></g=
></g><g class=3D"edgeLabel" transform=3D"translate(332.28404003324965, 1004=
.9614906311035)"><g class=3D"label" data-id=3D"L_native_sysroot_rootfsdbg_0=
" transform=3D"translate(0, -17.661499977111816)"><g><rect class=3D"backgro=
und" style=3D"" x=3D"-43.7421875" y=3D"1.3299999237060547" width=3D"87.4843=
75" height=3D"32.66300010681152"/><text xml:space=3D"preserve" y=3D"-10.1" =
text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">debug</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> symbols:</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" =
class=3D"text-inner-tspan" font-weight=3D"normal">shared</tspan><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> librar=
ies</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"t=
ranslate(339.9662882486979, 1271.4504842758179)"><g class=3D"label" data-id=
=3D"L_native_sysroot_debugserver_0" transform=3D"translate(-0.1642684936523=
4375, -18.161499977111816)"><g><rect class=3D"background" style=3D"" x=3D"-=
38.1640625" y=3D"2.3299999237060547" width=3D"76.65666198730469" height=3D"=
31.663000106811523"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=
=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-=
0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal">remote</tspan><tspan font-st=
yle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> debug</ts=
pan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1=
.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">protocol</tspan></tspan></text></g></g></g=
><g class=3D"edgeLabel" transform=3D"translate(485.9728904360817, 1457.4449=
825286865)"><g class=3D"label" data-id=3D"L_debugserver_appbin_0" transform=
=3D"translate(-0.166168212890625, -10.829999923706055)"><g><rect class=3D"b=
ackground" style=3D"" x=3D"-32.1171875" y=3D"2.3299999237060547" width=3D"6=
4.56671142578125" height=3D"17"/><text xml:space=3D"preserve" y=3D"-10.1" t=
ext-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D=
"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal">attach</tspan><tsp=
an font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">=
 /</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> run</tspan></tspan></text></g></g></g><g class=3D"edgeLabel"=
 transform=3D"translate(531.8032661074684, 1271.4504842758179)"><g class=3D=
"label" data-id=3D"L_rootfs_target_0" transform=3D"translate(-0.14498138427=
734375, -10.329999923706055)"><g><rect class=3D"background" style=3D"" x=3D=
"-49.46875" y=3D"1.3299999237060547" width=3D"99.22746276855469" height=3D"=
18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=
=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1e=
m" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal">installed</tspan><tspan font-style=3D"normal"=
 class=3D"text-inner-tspan" font-weight=3D"normal"> on</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> target</=
tspan></tspan></text></g></g></g></g><g class=3D"nodes"><g class=3D"node de=
fault orange" id=3D"my-svg-flowchart-idesdk-0" data-look=3D"classic" transf=
orm=3D"translate(252.89755575997492, 36.331499099731445)"><rect class=3D"ba=
sic label-container" style=3D"fill:#ffbe6f !important;stroke:#ffa348 !impor=
tant;stroke-width:1px !important" x=3D"-80" y=3D"-24.33150005340576" width=
=3D"160" height=3D"48.66300010681152"/><g class=3D"label" style=3D"color:#0=
00000 !important" transform=3D"translate(0, -14.331500053405762)"><rect/><g=
><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D"pres=
erve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-ou=
ter-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"norma=
l" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> id=
e-sdk</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em=
" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font=
-weight=3D"normal">(bitbake</tspan><tspan font-style=3D"normal" class=3D"te=
xt-inner-tspan" font-weight=3D"normal"> tinfoil</tspan><tspan font-style=3D=
"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> client)</tspan>=
</tspan></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart=
-ideconfig-1" data-look=3D"classic" transform=3D"translate(150.643649509974=
92, 183.82599639892578)"><polygon points=3D"0,0 138.015625,0 138.015625,-52=
.32599639892578 0,-52.32599639892578 0,0 -8,0 146.015625,0 146.015625,-52.3=
2599639892578 -8,-52.32599639892578 -8,0" class=3D"label-container" transfo=
rm=3D"translate(-69.0078125,26.16299819946289)" style=3D"fill:#99c1f1 !impo=
rtant;stroke:#62a0ea !important;stroke-width:1px !important"/><g class=3D"l=
abel" style=3D"color:#000000 !important" transform=3D"translate(0, -21.1629=
9819946289)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><=
text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><=
tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tsp=
an font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">=
IDE</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal"> configuration</tspan></tspan><tspan class=3D"text-outer-tsp=
an row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal">(e.g.</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> build</tspan=
><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"nor=
mal"> tool</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> preset,</tspan></tspan><tspan class=3D"text-outer-ts=
pan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal">debugger</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> launch</=
tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> config)</tspan></tspan></text></g></g></g><g class=3D"node def=
ault" id=3D"my-svg-flowchart-ide-2" data-look=3D"classic" transform=3D"tran=
slate(112.19791666666667, 266.4889945983887)"><rect class=3D"basic label-co=
ntainer" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-=
width:1px !important" x=3D"-80" y=3D"-16.5" width=3D"160" height=3D"33"/><g=
 class=3D"label" style=3D"color:#000000 !important" transform=3D"translate(=
0, -6.5)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><tex=
t xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tsp=
an class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">IDE=
</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> (e.g.</tspan><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal"> VSCode)</tspan></tspan></text></g></g></g><g=
 class=3D"node default green" id=3D"my-svg-flowchart-srcdir-3" data-look=3D=
"classic" transform=3D"translate(122.296875, 1363.9449825286865)"><polygon =
points=3D"0,0 204.59375,0 204.59375,-53.32599639892578 0,-53.32599639892578=
 0,0 -8,0 212.59375,0 212.59375,-53.32599639892578 -8,-53.32599639892578 -8=
,0" class=3D"label-container" transform=3D"translate(-102.296875,26.6629981=
9946289)" style=3D"fill:#8ff0a4 !important;stroke:#57e389 !important;stroke=
-width:1px !important"/><g class=3D"label" style=3D"color:#000000 !importan=
t" transform=3D"translate(0, -21.66299819946289)"><rect/><g><rect class=3D"=
background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1=
" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text=
-inner-tspan" font-weight=3D"normal">S</tspan><tspan font-style=3D"normal" =
class=3D"text-inner-tspan" font-weight=3D"normal"> =3D</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> e.g.</ts=
pan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"=
normal"> workspace/sources/&lt;recipe&gt;</tspan></tspan><tspan class=3D"te=
xt-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal">(source</tspan><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =
code,</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-w=
eight=3D"normal"> extracted</tspan><tspan font-style=3D"normal" class=3D"te=
xt-inner-tspan" font-weight=3D"normal"> by</tspan></tspan><tspan class=3D"t=
ext-outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"=
normal" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><t=
span font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal=
"> modify,</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> edited</tspan><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal"> in</tspan><tspan font-style=3D"no=
rmal" class=3D"text-inner-tspan" font-weight=3D"normal"> the</tspan><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> ID=
E)</tspan></tspan></text></g></g></g><g class=3D"node default" id=3D"my-svg=
-flowchart-native_sysroot-4" data-look=3D"classic" transform=3D"translate(3=
29.6346948532831, 522.8149948120117)"><polygon points=3D"0,0 183.359375,0 1=
83.359375,-81.6520004272461 0,-81.6520004272461 0,0 -8,0 191.359375,0 191.3=
59375,-81.6520004272461 -8,-81.6520004272461 -8,0" class=3D"label-container=
" transform=3D"translate(-91.6796875,40.82600021362305)" style=3D"fill:#99c=
1f1 !important;stroke:#62a0ea !important;stroke-width:1px !important"/><g c=
lass=3D"label" style=3D"color:#000000 !important" transform=3D"translate(0,=
 -35.82600021362305)"><rect/><g><rect class=3D"background" style=3D"stroke:=
 none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !imp=
ortant"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.=
1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal">recipe-sysroot-native</tspan></tspan><tspan class=3D"text-outer-ts=
pan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal">build</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> tool</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> (e.g.</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> CMake)</tspan></tspan><tspan class=3D"text-outer-tsp=
an row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal">cross-compiler</tspan><tspan f=
ont-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> (e.=
g.</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> &lt;arch&gt;-gcc)</tspan></tspan><tspan class=3D"text-outer-=
tspan row" x=3D"0" y=3D"3.2em" dy=3D"1.1em"><tspan font-style=3D"normal" cl=
ass=3D"text-inner-tspan" font-weight=3D"normal">debugger</tspan><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> (e.g.<=
/tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> gdb)</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D=
"0" y=3D"4.300000000000001em" dy=3D"1.1em"><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal">more</tspan><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> tools...</t=
span></tspan></text></g></g></g><g class=3D"node default" id=3D"my-svg-flow=
chart-builddir-5" data-look=3D"classic" transform=3D"translate(372.63469485=
32831, 708.9724960327148)"><polygon points=3D"0,0 130,0 130,-38.66300010681=
152 0,-38.66300010681152 0,0 -8,0 138,0 138,-38.66300010681152 -8,-38.66300=
010681152 -8,0" class=3D"label-container" transform=3D"translate(-65,19.331=
50005340576)" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;st=
roke-width:1px !important"/><g class=3D"label" style=3D"color:#000000 !impo=
rtant" transform=3D"translate(0, -14.331500053405762)"><rect/><g><rect clas=
s=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"=
-10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan r=
ow" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D=
"text-inner-tspan" font-weight=3D"normal">B</tspan><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal"> (build</tspan><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =
directory)</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=
=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal">build</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> artifacts)</tspan></tspan></t=
ext></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-sysroot-6"=
 data-look=3D"classic" transform=3D"translate(568.6346948532831, 708.472496=
0327148)"><polygon points=3D"0,0 130,0 130,-37.66300010681152 0,-37.6630001=
0681152 0,0 -8,0 138,0 138,-37.66300010681152 -8,-37.66300010681152 -8,0" c=
lass=3D"label-container" transform=3D"translate(-65,18.83150005340576)" sty=
le=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !i=
mportant"/><g class=3D"label" style=3D"color:#000000 !important" transform=
=3D"translate(0, -13.831500053405762)"><rect/><g><rect class=3D"background"=
 style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"=
fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D=
"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal">recipe-sysroot</tspan></tspan><tspan class=3D"tex=
t-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal">(target</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> h=
eaders</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal"> &amp;</tspan><tspan font-style=3D"normal" class=3D"text-=
inner-tspan" font-weight=3D"normal"> libs)</tspan></tspan></text></g></g></=
g><g class=3D"node default" id=3D"my-svg-flowchart-destdir-7" data-look=3D"=
classic" transform=3D"translate(556.8846948532832, 856.4669952392578)"><pol=
ygon points=3D"0,0 171.28125,0 171.28125,-52.32599639892578 0,-52.325996398=
92578 0,0 -8,0 179.28125,0 179.28125,-52.32599639892578 -8,-52.325996398925=
78 -8,0" class=3D"label-container" transform=3D"translate(-85.640625,26.162=
99819946289)" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;st=
roke-width:1px !important"/><g class=3D"label" style=3D"color:#000000 !impo=
rtant" transform=3D"translate(0, -21.16299819946289)"><rect/><g><rect class=
=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-=
10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan ro=
w" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal">D</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> =3D</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> imag=
e</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=
=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal">(non-stripped,</tspan><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal"> relocated</tspan><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> rpath,</tsp=
an></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"=
1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal">managed</tspan><tspan font-style=3D"normal" class=3D"text-inner=
-tspan" font-weight=3D"normal"> by</tspan><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal"> pseudo)</tspan></tspan></tex=
t></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-rootfsdbg-8"=
 data-look=3D"classic" transform=3D"translate(332.54185253324965, 1121.4559=
860229492)"><polygon points=3D"0,0 140.0228271484375,0 140.0228271484375,-5=
2.32599639892578 0,-52.32599639892578 0,0 -8,0 148.0228271484375,0 148.0228=
271484375,-52.32599639892578 -8,-52.32599639892578 -8,0" class=3D"label-con=
tainer" transform=3D"translate(-70.01141357421875,26.16299819946289)" style=
=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !imp=
ortant"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D=
"translate(0, -21.16299819946289)"><rect/><g><rect class=3D"background" sty=
le=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill=
:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.=
1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal">rootfs-dbg</tspan></tspan><tspan class=3D"text-outer-=
tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal">(debug</tspan><tspan font-sty=
le=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> symbols</t=
span><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal"> of</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan"=
 font-weight=3D"normal"> other</tspan></tspan><tspan class=3D"text-outer-ts=
pan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal">recipes'</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> shared</=
tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> libraries)</tspan></tspan></text></g></g></g><g class=3D"node =
default" id=3D"my-svg-flowchart-rootfs-9" data-look=3D"classic" transform=
=3D"translate(533.5532661074684, 1128.787483215332)"><polygon points=3D"0,0=
 130,0 130,-37.66300010681152 0,-37.66300010681152 0,0 -8,0 138,0 138,-37.6=
6300010681152 -8,-37.66300010681152 -8,0" class=3D"label-container" transfo=
rm=3D"translate(-65,18.83150005340576)" style=3D"fill:#99c1f1 !important;st=
roke:#62a0ea !important;stroke-width:1px !important"/><g class=3D"label" st=
yle=3D"color:#000000 !important" transform=3D"translate(0, -13.831500053405=
762)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><text xm=
l:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan c=
lass=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">rootfs<=
/tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=
=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal">(target</tspan><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal"> root</tspan><tspan font-style=3D"normal"=
 class=3D"text-inner-tspan" font-weight=3D"normal"> filesystem)</tspan></ts=
pan></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-app=
bin-10" data-look=3D"classic" transform=3D"translate(532.1895347231911, 155=
0.276481628418)"><rect class=3D"basic label-container" style=3D"fill:#99c1f=
1 !important;stroke:#62a0ea !important;stroke-width:1px !important" x=3D"-8=
0" y=3D"-24.33150005340576" width=3D"160" height=3D"48.66300010681152"/><g =
class=3D"label" style=3D"color:#000000 !important" transform=3D"translate(0=
, -14.331500053405762)"><rect/><g><rect class=3D"background" style=3D"strok=
e: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !i=
mportant"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"=
1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal">Application</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> binary</tspan></tspan><tspan class=3D"t=
ext-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"no=
rmal" class=3D"text-inner-tspan" font-weight=3D"normal">(running)</tspan></=
tspan></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-d=
ebugserver-11" data-look=3D"classic" transform=3D"translate(486.18953472319=
106, 1401.113483428955)"><rect class=3D"basic label-container" style=3D"fil=
l:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !important"=
 x=3D"-80" y=3D"-23.83150005340576" width=3D"160" height=3D"47.663000106811=
52"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D"tra=
nslate(0, -13.831500053405762)"><rect/><g><rect class=3D"background" style=
=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#=
000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1e=
m" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" fon=
t-weight=3D"normal">debug-server</tspan></tspan><tspan class=3D"text-outer-=
tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal">(e.g.</tspan><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> gdbserver)<=
/tspan></tspan></text></g></g></g></g></g></g><defs><filter id=3D"my-svg-dr=
op-shadow" height=3D"130%" width=3D"130%"><feDropShadow dx=3D"4" dy=3D"4" s=
tdDeviation=3D"0" flood-opacity=3D"0.06" flood-color=3D"#000000"/></filter>=
</defs><defs><filter id=3D"my-svg-drop-shadow-small" height=3D"150%" width=
=3D"150%"><feDropShadow dx=3D"2" dy=3D"2" stdDeviation=3D"0" flood-opacity=
=3D"0.06" flood-color=3D"#000000"/></filter></defs><linearGradient id=3D"my=
-svg-gradient" gradientUnits=3D"objectBoundingBox" x1=3D"0%" y1=3D"0%" x2=
=3D"100%" y2=3D"0%"><stop offset=3D"0%" stop-color=3D"#62a0ea" stop-opacity=
=3D"1"/><stop offset=3D"100%" stop-color=3D"hsl(92.7272727273, 35.862068965=
5%, 67.2549019608%)" stop-opacity=3D"1"/></linearGradient></svg>
\ No newline at end of file
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architect=
ure.mmd b/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture=
.mmd
new file mode 100644
index 000000000..0ec733a2e
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.mmd
@@ -0,0 +1,89 @@
+---
+config:
+  theme: base
+  look: classic
+  htmlLabels: false
+  fontFamily: '"Nimbus Roman", "Times New Roman", Times, serif'
+  fontSize: 13.33
+  themeVariables:
+    primaryColor: "#99c1f1"
+    primaryBorderColor: "#62a0ea"
+    primaryTextColor: "#000000"
+    lineColor: "#000000"
+    edgeLabelBackground: "#ffffff"
+    clusterBkg: "#f6f5f4"
+    clusterBorder: "#c0bfbc"
+    titleColor: "#000000"
+    fontSize: 13.33px
+  themeCSS: |
+    .cluster-label tspan { font-weight: bold; }
+    rect { rx: 7.5px; ry: 7.5px; }
+  flowchart:
+    htmlLabels: false
+    useMaxWidth: false
+    curve: basis
+    padding: 10
+    nodeSpacing: 23
+    rankSpacing: 37
+    wrappingWidth: 300
+---
+%% Regenerate: npx -y @mermaid-js/mermaid-cli -b transparent -i devtool-id=
e-sdk-nfs-architecture.mmd -o devtool-ide-sdk-nfs-architecture.svg
+%%   && sed -i 's/<text /<text xml:space=3D"preserve" /g' devtool-ide-sdk-=
nfs-architecture.svg
+%% (xml:space keeps the spaces between words in rsvg-convert, used for the=
 PDF output)
+flowchart TB
+    idesdk["devtool ide-sdk --nfs=3Drootfs-dbg<br/>(bitbake tinfoil client=
)"]
+    ideconfig[["IDE configuration<br/>(e.g. build tool preset,<br/>debugge=
r launch config)"]]
+    ide["IDE (e.g. VSCode)"]
+    srcdir[["S =3D e.g. workspace/sources/&lt;recipe&gt;<br/>(source code,=
 extracted by<br/>devtool modify, edited in the IDE)"]]
+
+    subgraph sdk["SDK (regular bitbake environment)"]
+        subgraph recipe_workdir["Recipe WORKDIR(s)"]
+            native_sysroot[["recipe-sysroot-native<br/>build tool (e.g. CM=
ake)<br/>cross-compiler (e.g. &lt;arch&gt;-gcc)<br/>debugger (e.g. gdb)"]]
+            builddir[["B (build directory)<br/>build artifacts)"]]
+            sysroot[["recipe-sysroot<br/>(target headers & libs)"]]
+            destdir[["D =3D image<br/>(non-stripped, relocated rpath,<br/>=
managed by pseudo)"]]
+        end
+
+        subgraph image_workdir["Image WORKDIR"]
+            rootfsdbg_src[["rootfs-dbg<br/>(stripped binaries + debug symb=
ols<br/>of every recipe, combined by<br/>image-combined-dbg)"]]
+        end
+    end
+
+    subgraph nfs["NFS export"]
+        rootfsdbg[["&lt;workspace&gt;/nfs-exports/&lt;image-recipe&gt;/roo=
tfs-dbg<br/>(copy, kept in sync by devtool<br/>deploy-target; persists acro=
ss<br/>debug sessions)"]]
+    end
+
+    subgraph target["Target device"]
+        appbin["Application binary<br/>(running)"]
+        debugserver["debug-server<br/>(e.g. gdbserver)"]
+    end
+
+    idesdk -->|generates| ideconfig
+    idesdk -->|"generates the SDK (via bitbake)"| sdk
+    rootfsdbg_src -->|"deployed, extracted<br/>(--nfs=3Drootfs-dbg)"| root=
fsdbg
+    ideconfig --> ide
+    ideconfig --> native_sysroot
+    ide -->|"calls directly, no bitbake needed"| native_sysroot
+    ide -->|"edit source"| srcdir
+    native_sysroot -->|"reads source from"| srcdir
+    native_sysroot -->|"builds in"| builddir
+    native_sysroot -.->|"--sysroot"| sysroot
+    builddir -->|install| destdir
+    destdir -->|"devtool deploy-target<br/>(direct write, no SSH)"| rootfs=
dbg
+    native_sysroot -->|"debug symbols:<br/>unstripped binary"| destdir
+    native_sysroot -->|"debug symbols:<br/>other recipes'<br/>shared libra=
ries"| rootfsdbg
+    native_sysroot -->|"remote debug<br/>protocol"| debugserver
+    debugserver -->|"attach / run"| appbin
+    target -->|"booted from<br/>(NFS-mounted<br/>root filesystem)"| rootfs=
dbg
+
+    style sdk fill:#f6f5f4,stroke:#3584e4,stroke-width:1px
+    style recipe_workdir fill:#ffffff,stroke:#62a0ea,stroke-width:1px
+    style image_workdir fill:#ffffff,stroke:#57e389,stroke-width:1px
+    style nfs fill:#f6f5f4,stroke:#c061cb,stroke-width:1px
+    style target fill:#f6f5f4,stroke:#b5835a,stroke-width:1px
+
+    classDef orange fill:#ffbe6f,stroke:#ffa348,stroke-width:1px,color:#00=
0000;
+    classDef green fill:#8ff0a4,stroke:#57e389,stroke-width:1px,color:#000=
000;
+    classDef default fill:#99c1f1,stroke:#62a0ea,stroke-width:1px,color:#0=
00000;
+    class idesdk orange;
+    class srcdir,rootfsdbg green;
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architect=
ure.svg b/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture=
.svg
new file mode 100644
index 000000000..5d2cb1d30
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.svg
@@ -0,0 +1 @@
+<svg id=3D"my-svg" width=3D"1257.645263671875" xmlns=3D"http://www.w3.org/=
2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/xlink" class=3D"flowchart" =
height=3D"1595.27099609375" viewBox=3D"4 3.999998092651367 1257.64526367187=
5 1595.27099609375" role=3D"graphics-document document" aria-roledescriptio=
n=3D"flowchart-v2" style=3D"background-color: transparent;"><style>#my-svg{=
font-family:"Nimbus Roman","Times New Roman",Times,serif;font-size:13.33px;=
fill:#000000;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@k=
eyframes dash{to{stroke-dashoffset:0;}}#my-svg .edge-animation-slow{stroke-=
dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear inf=
inite;stroke-linecap:round;}#my-svg .edge-animation-fast{stroke-dasharray:9=
,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;strok=
e-linecap:round;}#my-svg .error-icon{fill:hsl(32.7272727273, 75.8620689655%=
, 82.2549019608%);}#my-svg .error-text{fill:rgb(10.9224137931, 42.129310344=
8, 79.5775862068);stroke:rgb(10.9224137931, 42.1293103448, 79.5775862068);}=
#my-svg .edge-thickness-normal{stroke-width:1px;}#my-svg .edge-thickness-th=
ick{stroke-width:3.5px;}#my-svg .edge-pattern-solid{stroke-dasharray:0;}#my=
-svg .edge-thickness-invisible{stroke-width:0;fill:none;}#my-svg .edge-patt=
ern-dashed{stroke-dasharray:3;}#my-svg .edge-pattern-dotted{stroke-dasharra=
y:2;}#my-svg .marker{fill:#000000;stroke:#000000;}#my-svg .marker.cross{str=
oke:#000000;}#my-svg svg{font-family:"Nimbus Roman","Times New Roman",Times=
,serif;font-size:13.33px;}#my-svg p{margin:0;}#my-svg .label{font-family:"N=
imbus Roman","Times New Roman",Times,serif;color:#000000;}#my-svg .cluster-=
label text{fill:#000000;}#my-svg .cluster-label span{color:#000000;}#my-svg=
 .cluster-label span p{background-color:transparent;}#my-svg .label text,#m=
y-svg span{fill:#000000;color:#000000;}#my-svg .node rect,#my-svg .node cir=
cle,#my-svg .node ellipse,#my-svg .node polygon,#my-svg .node path{fill:#99=
c1f1;stroke:#62a0ea;stroke-width:1px;}#my-svg .rough-node .label text,#my-s=
vg .node .label text,#my-svg .image-shape .label,#my-svg .icon-shape .label=
{text-anchor:middle;}#my-svg .node .katex path{fill:#000;stroke:#000;stroke=
-width:1px;}#my-svg .rough-node .label,#my-svg .node .label,#my-svg .image-=
shape .label,#my-svg .icon-shape .label{text-align:center;}#my-svg .node.cl=
ickable{cursor:pointer;}#my-svg .root .anchor path{fill:#000000!important;s=
troke-width:0;stroke:#000000;}#my-svg .arrowheadPath{fill:#0b0b0b;}#my-svg =
.edgePaths .path{stroke:#000000;stroke-width:1px;}#my-svg .flowchart-link{s=
troke:#000000;fill:none;}#my-svg .edgeLabel{background-color:#ffffff;text-a=
lign:center;}#my-svg .edgeLabel p{background-color:#ffffff;}#my-svg .edgeLa=
bel rect{opacity:0.5;background-color:#ffffff;fill:#ffffff;}#my-svg .labelB=
kg{background-color:rgba(255, 255, 255, 0.5);}#my-svg .cluster rect{fill:#f=
6f5f4;stroke:#c0bfbc;stroke-width:1px;}#my-svg .cluster text{fill:#000000;}=
#my-svg .cluster span{color:#000000;}#my-svg .node .collapsed-indicator{fil=
l:#c0bfbc;stroke:none;opacity:0.6;}#my-svg .node .collapsed-separator{strok=
e:#c0bfbc;stroke-width:0.75px;}#my-svg div.mermaidTooltip{position:absolute=
;text-align:center;max-width:200px;padding:2px;font-family:"Nimbus Roman","=
Times New Roman",Times,serif;font-size:12px;background:hsl(32.7272727273, 7=
5.8620689655%, 82.2549019608%);border:1px solid hsl(32.7272727273, 35.86206=
89655%, 72.2549019608%);border-radius:2px;pointer-events:none;z-index:100;}=
#my-svg .flowchartTitleText{text-anchor:middle;font-size:18px;fill:#000000;=
}#my-svg rect.text{fill:none;stroke-width:0;}#my-svg .icon-shape,#my-svg .i=
mage-shape{background-color:#ffffff;text-align:center;}#my-svg .icon-shape =
p,#my-svg .image-shape p{background-color:#ffffff;padding:2px;}#my-svg .ico=
n-shape .label rect,#my-svg .image-shape .label rect{opacity:0.5;background=
-color:#ffffff;fill:#ffffff;}#my-svg .label-icon{display:inline-block;heigh=
t:1em;overflow:visible;vertical-align:-0.125em;}#my-svg .node .label-icon p=
ath{fill:currentColor;stroke:revert;stroke-width:revert;}#my-svg .node .neo=
-node{stroke:#62a0ea;}#my-svg [data-look=3D"neo"].node rect,#my-svg [data-l=
ook=3D"neo"].cluster rect,#my-svg [data-look=3D"neo"].node polygon{stroke:u=
rl(#my-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}=
#my-svg [data-look=3D"neo"].swimlane.cluster rect{filter:none;}#my-svg [dat=
a-look=3D"neo"].node path{stroke:url(#my-svg-gradient);stroke-width:1px;}#m=
y-svg [data-look=3D"neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px =
rgba(185,185,185,1));}#my-svg [data-look=3D"neo"].node .neo-line path{strok=
e:#62a0ea;filter:none;}#my-svg [data-look=3D"neo"].node circle{stroke:url(#=
my-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-=
svg [data-look=3D"neo"].node circle .state-start{fill:#000000;}#my-svg [dat=
a-look=3D"neo"].icon-shape .icon{fill:url(#my-svg-gradient);filter:drop-sha=
dow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [data-look=3D"neo"].icon-sha=
pe .icon-neo path{stroke:url(#my-svg-gradient);filter:drop-shadow( 1px 2px =
2px rgba(185,185,185,1));}#my-svg .cluster-label tspan{font-weight:bold;}#m=
y-svg rect{rx:7.5px;ry:7.5px;}#my-svg :root{--mermaid-font-family:"Nimbus R=
oman","Times New Roman",Times,serif;}#my-svg .orange rect{fill:rgb(255, 190=
, 111)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!import=
ant;color:rgb(0, 0, 0)!important;}#my-svg .orange polygon{fill:rgb(255, 190=
, 111)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!import=
ant;color:rgb(0, 0, 0)!important;}#my-svg .orange ellipse{fill:rgb(255, 190=
, 111)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!import=
ant;color:rgb(0, 0, 0)!important;}#my-svg .orange circle{fill:rgb(255, 190,=
 111)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!importa=
nt;color:rgb(0, 0, 0)!important;}#my-svg .orange path{fill:rgb(255, 190, 11=
1)!important;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;=
color:rgb(0, 0, 0)!important;}#my-svg .orange tspan{fill:rgb(0, 0, 0)!impor=
tant;}#my-svg .green rect{fill:rgb(143, 240, 164)!important;stroke:rgb(87, =
227, 137)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important=
;}#my-svg .green polygon{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 2=
27, 137)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;=
}#my-svg .green ellipse{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 22=
7, 137)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}=
#my-svg .green circle{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227,=
 137)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#m=
y-svg .green path{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137=
)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-sv=
g .green tspan{fill:rgb(0, 0, 0)!important;}#my-svg .default rect{fill:rgb(=
153, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1p=
x!important;color:rgb(0, 0, 0)!important;}#my-svg .default polygon{fill:rgb=
(153, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1=
px!important;color:rgb(0, 0, 0)!important;}#my-svg .default ellipse{fill:rg=
b(153, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:=
1px!important;color:rgb(0, 0, 0)!important;}#my-svg .default circle{fill:rg=
b(153, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:=
1px!important;color:rgb(0, 0, 0)!important;}#my-svg .default path{fill:rgb(=
153, 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1p=
x!important;color:rgb(0, 0, 0)!important;}#my-svg .default tspan{fill:rgb(0=
, 0, 0)!important;}</style><g><marker id=3D"my-svg_flowchart-v2-pointEnd" c=
lass=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"5" refY=3D"5" ma=
rkerUnits=3D"userSpaceOnUse" markerWidth=3D"8" markerHeight=3D"8" orient=3D=
"auto"><path d=3D"M 0 0 L 10 5 L 0 10 z" class=3D"arrowMarkerPath" style=3D=
"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_f=
lowchart-v2-pointStart" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10"=
 refX=3D"4.5" refY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"8" m=
arkerHeight=3D"8" orient=3D"auto"><path d=3D"M 0 5 L 10 10 L 10 0 z" class=
=3D"arrowMarkerPath" style=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></=
marker><marker id=3D"my-svg_flowchart-v2-pointEnd-margin" class=3D"marker f=
lowchart-v2" viewBox=3D"0 0 11.5 14" refX=3D"11.5" refY=3D"7" markerUnits=
=3D"userSpaceOnUse" markerWidth=3D"10.5" markerHeight=3D"14" orient=3D"auto=
"><path d=3D"M 0 0 L 11.5 7 L 0 14 z" class=3D"arrowMarkerPath" style=3D"st=
roke-width: 0; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flow=
chart-v2-pointStart-margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 11=
.5 14" refX=3D"1" refY=3D"7" markerUnits=3D"userSpaceOnUse" markerWidth=3D"=
11.5" markerHeight=3D"14" orient=3D"auto"><polygon points=3D"0,7 11.5,14 11=
.5,0" class=3D"arrowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray:=
 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-circleEnd" class=3D"mar=
ker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"11" refY=3D"5" markerUnits=
=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=3D"auto">=
<circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke=
-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchar=
t-v2-circleStart" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=
=3D"-1" refY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11" marker=
Height=3D"11" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"ar=
rowMarkerPath" style=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker=
><marker id=3D"my-svg_flowchart-v2-circleEnd-margin" class=3D"marker flowch=
art-v2" viewBox=3D"0 0 10 10" refY=3D"5" refX=3D"12.25" markerUnits=3D"user=
SpaceOnUse" markerWidth=3D"14" markerHeight=3D"14" orient=3D"auto"><circle =
cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: =
0; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-cir=
cleStart-margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=
=3D"-2" refY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"14" marker=
Height=3D"14" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"ar=
rowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray: 1, 0;"/></marker=
><marker id=3D"my-svg_flowchart-v2-crossEnd" class=3D"marker cross flowchar=
t-v2" viewBox=3D"0 0 11 11" refX=3D"12" refY=3D"5.2" markerUnits=3D"userSpa=
ceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=3D"auto"><path d=3D"=
M 1,1 l 9,9 M 10,1 l -9,9" class=3D"arrowMarkerPath" style=3D"stroke-width:=
 2; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-cr=
ossStart" class=3D"marker cross flowchart-v2" viewBox=3D"0 0 11 11" refX=3D=
"-1" refY=3D"5.2" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11" markerH=
eight=3D"11" orient=3D"auto"><path d=3D"M 1,1 l 9,9 M 10,1 l -9,9" class=3D=
"arrowMarkerPath" style=3D"stroke-width: 2; stroke-dasharray: 1, 0;"/></mar=
ker><marker id=3D"my-svg_flowchart-v2-crossEnd-margin" class=3D"marker cros=
s flowchart-v2" viewBox=3D"0 0 15 15" refX=3D"17.7" refY=3D"7.5" markerUnit=
s=3D"userSpaceOnUse" markerWidth=3D"12" markerHeight=3D"12" orient=3D"auto"=
><path d=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=3D"arrowMarkerPath" style=3D=
"stroke-width: 2.5;"/></marker><marker id=3D"my-svg_flowchart-v2-crossStart=
-margin" class=3D"marker cross flowchart-v2" viewBox=3D"0 0 15 15" refX=3D"=
-3.5" refY=3D"7.5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"12" marker=
Height=3D"12" orient=3D"auto"><path d=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=
=3D"arrowMarkerPath" style=3D"stroke-width: 2.5; stroke-dasharray: 1, 0;"/>=
</marker><g class=3D"root"><g class=3D"clusters"><g class=3D"cluster" id=3D=
"my-svg-target" data-look=3D"classic"><rect style=3D"fill:#f6f5f4 !importan=
t;stroke:#b5835a !important;stroke-width:1px !important" x=3D"412.078125" y=
=3D"1077.629991531372" width=3D"208" height=3D"225.32599639892578"/><g clas=
s=3D"cluster-label" transform=3D"translate(478.25540924072266, 1077.6299915=
31372)"><g><rect class=3D"background" style=3D"stroke: none"/><text xml:spa=
ce=3D"preserve" y=3D"-10.1" style=3D""><tspan class=3D"text-outer-tspan row=
" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"t=
ext-inner-tspan" font-weight=3D"normal">Target</tspan><tspan font-style=3D"=
normal" class=3D"text-inner-tspan" font-weight=3D"normal"> device</tspan></=
tspan></text></g></g></g><g class=3D"cluster" id=3D"my-svg-nfs" data-look=
=3D"classic"><rect style=3D"fill:#f6f5f4 !important;stroke:#c061cb !importa=
nt;stroke-width:1px !important" x=3D"433.72412109375" y=3D"1459.28198432922=
36" width=3D"354.9580078125" height=3D"131.98899841308594"/><g class=3D"clu=
ster-label" transform=3D"translate(578.2842483520508, 1459.2819843292236)">=
<g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D"pr=
eserve" y=3D"-10.1" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0=
" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inne=
r-tspan" font-weight=3D"normal">NFS</tspan><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal"> export</tspan></tspan></tex=
t></g></g></g><g class=3D"cluster" id=3D"my-svg-sdk" data-look=3D"classic">=
<rect style=3D"fill:#f6f5f4 !important;stroke:#3584e4 !important;stroke-wid=
th:1px !important" x=3D"286.2724181402298" y=3D"390.9889945983887" width=3D=
"967.3728942871094" height=3D"524.9779968261719"/><g class=3D"cluster-label=
" transform=3D"translate(668.5057402837845, 390.9889945983887)"><g><rect cl=
ass=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=
=3D"-10.1" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0=
.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal">SDK</tspan><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal"> (regular</tspan><tspan font-style=3D=
"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> bitbake</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> environment)</tspan></tspan></text></g></g></g><g class=3D"cluster" id=
=3D"my-svg-image_workdir" data-look=3D"classic"><rect style=3D"fill:#ffffff=
 !important;stroke:#57e389 !important;stroke-width:1px !important" x=3D"968=
.4265624273391" y=3D"760.9779930114746" width=3D"261.21875" height=3D"130.9=
8899841308594"/><g class=3D"cluster-label" transform=3D"translate(1045.5709=
258306595, 760.9779930114746)"><g><rect class=3D"background" style=3D"strok=
e: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D""><tspan class=
=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-sty=
le=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">Image</tspa=
n><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"no=
rmal"> WORKDIR</tspan></tspan></text></g></g></g><g class=3D"cluster" id=3D=
"my-svg-recipe_workdir" data-look=3D"classic"><rect style=3D"fill:#ffffff !=
important;stroke:#62a0ea !important;stroke-width:1px !important" x=3D"310.2=
724181402298" y=3D"441.9889945983887" width=3D"559.1796875" height=3D"449.9=
779968261719"/><g class=3D"cluster-label" transform=3D"translate(528.081011=
8902298, 441.9889945983887)"><g><rect class=3D"background" style=3D"stroke:=
 none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D""><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">Recipe</tspan=
><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"nor=
mal"> WORKDIR(s)</tspan></tspan></text></g></g></g></g><g class=3D"edges ed=
gePaths"><path d=3D"M335.49623921712237,60.66299819946289L335.4962392171223=
7,73.59193038759742Q335.49623921712237,80.66299819946289 328.4251714052569,=
80.66299819946289L272.4364323951988,80.66299819946289Q265.3653645833333,80.=
66299819946289 265.3653645833333,87.73406601132837L265.3653645833333,153.66=
29981994629" id=3D"my-svg-L_idesdk_ideconfig_0" class=3D"edge-thickness-nor=
mal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-l=
ink" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_idesdk_id=
econfig_0" data-points=3D"W3sieCI6MzM1LjQ5NjIzOTIxNzEyMjM3LCJ5Ijo2MC42NjI5O=
TgxOTk0NjI4OX0seyJ4IjozMzUuNDk2MjM5MjE3MTIyMzcsInkiOjgwLjY2Mjk5ODE5OTQ2Mjg5=
fSx7IngiOjI2NS4zNjUzNjQ1ODMzMzMzLCJ5Ijo4MC42NjI5OTgxOTk0NjI4OX0seyJ4IjoyNjU=
uMzY1MzY0NTgzMzMzMywieSI6MTU3LjY2Mjk5ODE5OTQ2Mjl9XQ=3D=3D" data-look=3D"cla=
ssic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M399.74=
230244954424,60.66299819946289L399.74230244954424,73.59193038759742Q399.742=
30244954424,80.66299819946289 406.8133702614097,80.66299819946289L558.09353=
78283641,80.66299819946289Q565.1646056402296,80.66299819946289 565.16460564=
02296,87.73406601132837L565.1646056402296,109.16299819946289L565.1646056402=
296,266.4889945983887L565.1646056402296,331.9889945983887L565.1646056402296=
,353.9179267865232Q565.1646056402296,360.9889945983887 558.0935378283641,36=
0.9889945983887L482.6497359520952,360.9889945983887Q475.57866814022975,360.=
9889945983887 475.57866814022975,368.06006241025415L475.57866814022975,386.=
9889945983887" id=3D"my-svg-L_idesdk_sdk_0" class=3D"edge-thickness-normal =
edge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-link"=
 style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_idesdk_sdk_0"=
 data-points=3D"W3sieCI6Mzk5Ljc0MjMwMjQ0OTU0NDI0LCJ5Ijo2MC42NjI5OTgxOTk0NjI=
4OX0seyJ4IjozOTkuNzQyMzAyNDQ5NTQ0MjQsInkiOjgwLjY2Mjk5ODE5OTQ2Mjg5fSx7IngiOj=
U2NS4xNjQ2MDU2NDAyMjk2LCJ5Ijo4MC42NjI5OTgxOTk0NjI4OX0seyJ4Ijo1NjUuMTY0NjA1N=
jQwMjI5NiwieSI6MTA5LjE2Mjk5ODE5OTQ2Mjg5fSx7IngiOjU2NS4xNjQ2MDU2NDAyMjk2LCJ5=
IjoyNjYuNDg4OTk0NTk4Mzg4N30seyJ4Ijo1NjUuMTY0NjA1NjQwMjI5NiwieSI6MzMxLjk4ODk=
5NDU5ODM4ODd9LHsieCI6NTY1LjE2NDYwNTY0MDIyOTYsInkiOjM2MC45ODg5OTQ1OTgzODg3fS=
x7IngiOjQ3NS41Nzg2NjgxNDAyMjk3NSwieSI6MzYwLjk4ODk5NDU5ODM4ODd9LHsieCI6NDc1L=
jU3ODY2ODE0MDIyOTc1LCJ5IjozOTAuOTg4OTk0NTk4Mzg4N31d" data-look=3D"classic" =
marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M1099.0359374=
273391,867.9669914245605L1099.0359374273391,901.9669914245605L1099.03593742=
73391,935.9669914245605L1099.0359374273391,948.895923612695Q1099.0359374273=
391,955.9669914245605 1091.9648696154736,955.9669914245605L1046.94110870542=
02,955.9669914245605Q1039.8700408935547,955.9669914245605 1039.870040893554=
7,963.0380592364261L1039.8700408935547,1011.7984914779663L1039.870040893554=
7,1366.1189861297607L1039.8700408935547,1422.210916517358Q1039.870040893554=
7,1429.2819843292236 1032.7989730816892,1429.2819843292236L703.881595155615=
5,1429.2819843292236Q696.81052734375,1429.2819843292236 696.81052734375,143=
6.3530521410892L696.81052734375,1449.2819843292236L696.81052734375,1495.281=
9843292236" id=3D"my-svg-L_rootfsdbg_src_rootfsdbg_0" class=3D"edge-thickne=
ss-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowc=
hart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_roo=
tfsdbg_src_rootfsdbg_0" data-points=3D"W3sieCI6MTA5OS4wMzU5Mzc0MjczMzkxLCJ5=
Ijo4NjcuOTY2OTkxNDI0NTYwNX0seyJ4IjoxMDk5LjAzNTkzNzQyNzMzOTEsInkiOjkwMS45NjY=
5OTE0MjQ1NjA1fSx7IngiOjEwOTkuMDM1OTM3NDI3MzM5MSwieSI6OTM1Ljk2Njk5MTQyNDU2MD=
V9LHsieCI6MTA5OS4wMzU5Mzc0MjczMzkxLCJ5Ijo5NTUuOTY2OTkxNDI0NTYwNX0seyJ4IjoxM=
DM5Ljg3MDA0MDg5MzU1NDcsInkiOjk1NS45NjY5OTE0MjQ1NjA1fSx7IngiOjEwMzkuODcwMDQw=
ODkzNTU0NywieSI6MTAxMS43OTg0OTE0Nzc5NjYzfSx7IngiOjEwMzkuODcwMDQwODkzNTU0Nyw=
ieSI6MTM2Ni4xMTg5ODYxMjk3NjA3fSx7IngiOjEwMzkuODcwMDQwODkzNTU0NywieSI6MTQyOS=
4yODE5ODQzMjkyMjM2fSx7IngiOjY5Ni44MTA1MjczNDM3NSwieSI6MTQyOS4yODE5ODQzMjkyM=
jM2fSx7IngiOjY5Ni44MTA1MjczNDM3NSwieSI6MTQ0OS4yODE5ODQzMjkyMjM2fSx7IngiOjY5=
Ni44MTA1MjczNDM3NSwieSI6MTQ5OS4yODE5ODQzMjkyMjM2fV0=3D" data-look=3D"classi=
c" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M243.02942=
708333333,209.98899459838867L243.02942708333333,227.13624906994045Q243.0294=
2708333333,229.98899459838867 240.17668155488514,229.98899459838867L240.176=
68155488514,229.98899459838867Q237.3239360264369,229.98899459838867 237.323=
9360264369,232.8417401268369L237.3239360264369,245.98899459838867" id=3D"my=
-svg-L_ideconfig_ide_0" class=3D"edge-thickness-normal edge-pattern-solid e=
dge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-ed=
ge=3D"true" data-et=3D"edge" data-id=3D"L_ideconfig_ide_0" data-points=3D"W=
3sieCI6MjQzLjAyOTQyNzA4MzMzMzMzLCJ5IjoyMDkuOTg4OTk0NTk4Mzg4Njd9LHsieCI6MjQz=
LjAyOTQyNzA4MzMzMzMzLCJ5IjoyMjkuOTg4OTk0NTk4Mzg4Njd9LHsieCI6MjM3LjMyMzkzNjA=
yNjQzNjksInkiOjIyOS45ODg5OTQ1OTgzODg2N30seyJ4IjoyMzcuMzIzOTM2MDI2NDM2OSwieS=
I6MjQ5Ljk4ODk5NDU5ODM4ODY3fV0=3D" data-look=3D"classic" marker-end=3D"url(#=
my-svg_flowchart-v2-pointEnd)"/><path d=3D"M287.7013020833333,209.988994598=
38867L287.7013020833333,222.9179267865232Q287.7013020833333,229.98899459838=
867 294.7723698951988,229.98899459838867L456.50760032836416,229.98899459838=
867Q463.57866814022964,229.98899459838867 463.57866814022964,237.0600624102=
5415L463.57866814022964,266.4889945983887L463.57866814022964,331.9889945983=
887L463.57866814022975,380.9889945983887L463.57866814022975,431.98899459838=
87L463.57866814022975,477.9889945983887" id=3D"my-svg-L_ideconfig_native_sy=
sroot_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-n=
ormal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" dat=
a-et=3D"edge" data-id=3D"L_ideconfig_native_sysroot_0" data-points=3D"W3sie=
CI6Mjg3LjcwMTMwMjA4MzMzMzMsInkiOjIwOS45ODg5OTQ1OTgzODg2N30seyJ4IjoyODcuNzAx=
MzAyMDgzMzMzMywieSI6MjI5Ljk4ODk5NDU5ODM4ODY3fSx7IngiOjQ2My41Nzg2NjgxNDAyMjk=
2NCwieSI6MjI5Ljk4ODk5NDU5ODM4ODY3fSx7IngiOjQ2My41Nzg2NjgxNDAyMjk2NCwieSI6Mj=
Y2LjQ4ODk5NDU5ODM4ODd9LHsieCI6NDYzLjU3ODY2ODE0MDIyOTY0LCJ5IjozMzEuOTg4OTk0N=
Tk4Mzg4N30seyJ4Ijo0NjMuNTc4NjY4MTQwMjI5NzUsInkiOjM4MC45ODg5OTQ1OTgzODg3fSx7=
IngiOjQ2My41Nzg2NjgxNDAyMjk3NSwieSI6NDMxLjk4ODk5NDU5ODM4ODd9LHsieCI6NDYzLjU=
3ODY2ODE0MDIyOTc1LCJ5Ijo0ODEuOTg4OTk0NTk4Mzg4N31d" data-look=3D"classic" ma=
rker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M260.6572693597=
702,282.9889945983887L260.6572693597702,295.9179267865232Q260.6572693597702=
,302.9889945983887 267.7283371716357,302.9889945983887L332.4210947654457,30=
2.9889945983887Q339.49216257731115,302.9889945983887 339.49216257731115,310=
.06006241025415L339.49216257731115,353.9179267865232Q339.49216257731115,360=
.9889945983887 346.5632303891766,360.9889945983887L397.2544753283642,360.98=
89945983887Q404.3255431402297,360.9889945983887 404.3255431402297,368.06006=
241025415L404.32554314022974,380.9889945983887L404.3255431402298,431.988994=
5983887L404.3255431402298,477.9889945983887" id=3D"my-svg-L_ide_native_sysr=
oot_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-nor=
mal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-=
et=3D"edge" data-id=3D"L_ide_native_sysroot_0" data-points=3D"W3sieCI6MjYwL=
jY1NzI2OTM1OTc3MDIsInkiOjI4Mi45ODg5OTQ1OTgzODg3fSx7IngiOjI2MC42NTcyNjkzNTk3=
NzAyLCJ5IjozMDIuOTg4OTk0NTk4Mzg4N30seyJ4IjozMzkuNDkyMTYyNTc3MzExMTUsInkiOjM=
wMi45ODg5OTQ1OTgzODg3fSx7IngiOjMzOS40OTIxNjI1NzczMTExNSwieSI6MzYwLjk4ODk5ND=
U5ODM4ODd9LHsieCI6NDA0LjMyNTU0MzE0MDIyOTcsInkiOjM2MC45ODg5OTQ1OTgzODg3fSx7I=
ngiOjQwNC4zMjU1NDMxNDAyMjk3NCwieSI6MzgwLjk4ODk5NDU5ODM4ODd9LHsieCI6NDA0LjMy=
NTU0MzE0MDIyOTgsInkiOjQzMS45ODg5OTQ1OTgzODg3fSx7IngiOjQwNC4zMjU1NDMxNDAyMjk=
4LCJ5Ijo0ODEuOTg4OTk0NTk4Mzg4N31d" data-look=3D"classic" marker-end=3D"url(=
#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M213.99060269310357,282.9889945=
983887L213.99060269310357,295.9179267865232Q213.99060269310357,302.98899459=
83887 206.9195348812381,302.9889945983887L95.93565114519882,302.98899459838=
87Q88.86458333333334,302.9889945983887 88.86458333333334,310.06006241025415=
L88.86458333333334,331.9889945983887L88.86458333333334,1011.7984914779663L8=
8.86458333333334,1073.629991531372" id=3D"my-svg-L_ide_srcdir_0" class=3D"e=
dge-thickness-normal edge-pattern-solid edge-thickness-normal edge-pattern-=
solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-=
id=3D"L_ide_srcdir_0" data-points=3D"W3sieCI6MjEzLjk5MDYwMjY5MzEwMzU3LCJ5Ij=
oyODIuOTg4OTk0NTk4Mzg4N30seyJ4IjoyMTMuOTkwNjAyNjkzMTAzNTcsInkiOjMwMi45ODg5O=
TQ1OTgzODg3fSx7IngiOjg4Ljg2NDU4MzMzMzMzMzM0LCJ5IjozMDIuOTg4OTk0NTk4Mzg4N30s=
eyJ4Ijo4OC44NjQ1ODMzMzMzMzMzNCwieSI6MzMxLjk4ODk5NDU5ODM4ODd9LHsieCI6ODguODY=
0NTgzMzMzMzMzMzQsInkiOjEwMTEuNzk4NDkxNDc3OTY2M30seyJ4Ijo4OC44NjQ1ODMzMzMzMz=
MzNCwieSI6MTA3Ny42Mjk5OTE1MzEzNzJ9XQ=3D=3D" data-look=3D"classic" marker-en=
d=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M370.4666145688011,548=
.9779930114746L370.4666145688011,571.9069251996091Q370.4666145688011,578.97=
79930114746 363.39554675693563,578.9779930114746L351.6289770235237,578.9779=
930114746Q344.5579092116582,578.9779930114746 344.5579092116582,586.0490608=
2334L344.5579092116583,901.9669914245605L344.5579092116583,935.966991424560=
5L344.5579092116583,948.895923612695Q344.5579092116583,955.9669914245605 33=
7.4868413997928,955.9669914245605L162.80023447853216,955.9669914245605Q155.=
72916666666669,955.9669914245605 155.72916666666669,963.0380592364261L155.7=
2916666666669,1073.629991531372" id=3D"my-svg-L_native_sysroot_srcdir_0" cl=
ass=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-=
pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edg=
e" data-id=3D"L_native_sysroot_srcdir_0" data-points=3D"W3sieCI6MzcwLjQ2NjY=
xNDU2ODgwMTEsInkiOjU0OC45Nzc5OTMwMTE0NzQ2fSx7IngiOjM3MC40NjY2MTQ1Njg4MDExLC=
J5Ijo1NzguOTc3OTkzMDExNDc0Nn0seyJ4IjozNDQuNTU3OTA5MjExNjU4MiwieSI6NTc4Ljk3N=
zk5MzAxMTQ3NDZ9LHsieCI6MzQ0LjU1NzkwOTIxMTY1ODMsInkiOjkwMS45NjY5OTE0MjQ1NjA1=
fSx7IngiOjM0NC41NTc5MDkyMTE2NTgzLCJ5Ijo5MzUuOTY2OTkxNDI0NTYwNX0seyJ4IjozNDQ=
uNTU3OTA5MjExNjU4MywieSI6OTU1Ljk2Njk5MTQyNDU2MDV9LHsieCI6MTU1LjcyOTE2NjY2Nj=
Y2NjY5LCJ5Ijo5NTUuOTY2OTkxNDI0NTYwNX0seyJ4IjoxNTUuNzI5MTY2NjY2NjY2NjksInkiO=
jEwNzcuNjI5OTkxNTMxMzcyfV0=3D" data-look=3D"classic" marker-end=3D"url(#my-=
svg_flowchart-v2-pointEnd)"/><path d=3D"M446.64920385451546,548.97799301147=
46L446.64920385451546,595.9069251996091Q446.64920385451546,602.977993011474=
6 453.72027166638094,602.9779930114746L469.88103782836424,602.9779930114746=
Q476.9521056402297,602.9779930114746 476.9521056402297,610.0490608233401L47=
6.9521056402297,670.9779930114746" id=3D"my-svg-L_native_sysroot_builddir_0=
" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal e=
dge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D=
"edge" data-id=3D"L_native_sysroot_builddir_0" data-points=3D"W3sieCI6NDQ2L=
jY0OTIwMzg1NDUxNTQ2LCJ5Ijo1NDguOTc3OTkzMDExNDc0Nn0seyJ4Ijo0NDYuNjQ5MjAzODU0=
NTE1NDYsInkiOjYwMi45Nzc5OTMwMTE0NzQ2fSx7IngiOjQ3Ni45NTIxMDU2NDAyMjk3LCJ5Ijo=
2MDIuOTc3OTkzMDExNDc0Nn0seyJ4Ijo0NzYuOTUyMTA1NjQwMjI5NywieSI6Njc0Ljk3Nzk5Mz=
AxMTQ3NDZ9XQ=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowcha=
rt-v2-pointEnd)"/><path d=3D"M472.04340028308684,548.9779930114746L472.0434=
0028308684,583.9069251996091Q472.04340028308684,590.9779930114746 479.11446=
80949523,590.9779930114746L665.8810378283642,590.9779930114746Q672.95210564=
02298,590.9779930114746 672.9521056402298,598.0490608233401L672.95210564022=
98,670.9779930114746" id=3D"my-svg-L_native_sysroot_sysroot_0" class=3D"edg=
e-thickness-normal edge-pattern-dotted edge-thickness-normal edge-pattern-s=
olid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-i=
d=3D"L_native_sysroot_sysroot_0" data-points=3D"W3sieCI6NDcyLjA0MzQwMDI4MzA=
4Njg0LCJ5Ijo1NDguOTc3OTkzMDExNDc0Nn0seyJ4Ijo0NzIuMDQzNDAwMjgzMDg2ODQsInkiOj=
U5MC45Nzc5OTMwMTE0NzQ2fSx7IngiOjY3Mi45NTIxMDU2NDAyMjk4LCJ5Ijo1OTAuOTc3OTkzM=
DExNDc0Nn0seyJ4Ijo2NzIuOTUyMTA1NjQwMjI5OCwieSI6Njc0Ljk3Nzk5MzAxMTQ3NDZ9XQ=
=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointE=
nd)"/><path d=3D"M476.9521056402297,713.6409765896788L476.9521056402297,713=
.6409950256348L476.9521056402297,778.5699272137692Q476.9521056402297,785.64=
09950256348 484.0231734520952,785.6409950256348L626.5174961616976,785.64099=
50256348Q633.588563973563,785.6409950256348 633.588563973563,792.7120628375=
003L633.588563973563,811.6409950256348" id=3D"my-svg-L_builddir_destdir_0" =
class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edg=
e-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"e=
dge" data-id=3D"L_builddir_destdir_0" data-points=3D"W3sieCI6NDc2Ljk1MjEwNT=
Y0MDIyOTcsInkiOjcxMy42NDA5NzY1ODk2Nzg4fSx7IngiOjQ3Ni45NTIxMDU2NDAyMjk3LCJ5I=
jo3MTMuNjQwOTk1MDI1NjM0OH0seyJ4Ijo0NzYuOTUyMTA1NjQwMjI5NywieSI6Nzg1LjY0MDk5=
NTAyNTYzNDh9LHsieCI6NjMzLjU4ODU2Mzk3MzU2MywieSI6Nzg1LjY0MDk5NTAyNTYzNDh9LHs=
ieCI6NjMzLjU4ODU2Mzk3MzU2MywieSI6ODE1LjY0MDk5NTAyNTYzNDh9XQ=3D=3D" data-loo=
k=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D=
"M661.2021056402297,867.9669914245605L661.2021056402298,901.9669914245605L6=
61.2021056402298,935.9669914245605L661.2021056402298,948.895923612695Q661.2=
021056402298,955.9669914245605 668.2731734520953,955.9669914245605L746.6320=
571881345,955.9669914245605Q753.703125,955.9669914245605 753.703125,963.038=
0592364261L753.703125,1011.7984914779663L753.703125,1366.1189861297607L753.=
703125,1402.210916517358Q753.703125,1409.2819843292236 746.6320571881345,14=
09.2819843292236L646.8099935931155,1409.2819843292236Q639.7389257812499,140=
9.2819843292236 639.7389257812499,1416.3530521410892L639.7389257812499,1449=
.2819843292236L639.7389257812499,1495.2819843292236" id=3D"my-svg-L_destdir=
_rootfsdbg_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickn=
ess-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true=
" data-et=3D"edge" data-id=3D"L_destdir_rootfsdbg_0" data-points=3D"W3sieCI=
6NjYxLjIwMjEwNTY0MDIyOTcsInkiOjg2Ny45NjY5OTE0MjQ1NjA1fSx7IngiOjY2MS4yMDIxMD=
U2NDAyMjk4LCJ5Ijo5MDEuOTY2OTkxNDI0NTYwNX0seyJ4Ijo2NjEuMjAyMTA1NjQwMjI5OCwie=
SI6OTM1Ljk2Njk5MTQyNDU2MDV9LHsieCI6NjYxLjIwMjEwNTY0MDIyOTgsInkiOjk1NS45NjY5=
OTE0MjQ1NjA1fSx7IngiOjc1My43MDMxMjUsInkiOjk1NS45NjY5OTE0MjQ1NjA1fSx7IngiOjc=
1My43MDMxMjUsInkiOjEwMTEuNzk4NDkxNDc3OTY2M30seyJ4Ijo3NTMuNzAzMTI1LCJ5IjoxMz=
Y2LjExODk4NjEyOTc2MDd9LHsieCI6NzUzLjcwMzEyNSwieSI6MTQwOS4yODE5ODQzMjkyMjM2f=
Sx7IngiOjYzOS43Mzg5MjU3ODEyNDk5LCJ5IjoxNDA5LjI4MTk4NDMyOTIyMzZ9LHsieCI6NjM5=
LjczODkyNTc4MTI0OTksInkiOjE0NDkuMjgxOTg0MzI5MjIzNn0seyJ4Ijo2MzkuNzM4OTI1Nzg=
xMjQ5OSwieSI6MTQ5OS4yODE5ODQzMjkyMjM2fV0=3D" data-look=3D"classic" marker-e=
nd=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M497.43759671165833,5=
48.9779930114746L497.43759671165833,571.9069251996091Q497.43759671165833,57=
8.9779930114746 504.5086645235238,578.9779930114746L838.3810378283642,578.9=
779930114746Q845.4521056402298,578.9779930114746 845.4521056402298,586.0490=
608233401L845.4521056402298,778.5699272137692Q845.4521056402298,785.6409950=
256348 838.3810378283642,785.6409950256348L695.8867151187619,785.6409950256=
348Q688.8156473068964,785.6409950256348 688.8156473068964,792.7120628375003=
L688.8156473068964,811.6409950256348" id=3D"my-svg-L_native_sysroot_destdir=
_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal=
 edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=
=3D"edge" data-id=3D"L_native_sysroot_destdir_0" data-points=3D"W3sieCI6NDk=
3LjQzNzU5NjcxMTY1ODMzLCJ5Ijo1NDguOTc3OTkzMDExNDc0Nn0seyJ4Ijo0OTcuNDM3NTk2Nz=
ExNjU4MzMsInkiOjU3OC45Nzc5OTMwMTE0NzQ2fSx7IngiOjg0NS40NTIxMDU2NDAyMjk4LCJ5I=
jo1NzguOTc3OTkzMDExNDc0Nn0seyJ4Ijo4NDUuNDUyMTA1NjQwMjI5OCwieSI6Nzg1LjY0MDk5=
NTAyNTYzNDh9LHsieCI6Njg4LjgxNTY0NzMwNjg5NjQsInkiOjc4NS42NDA5OTUwMjU2MzQ4fSx=
7IngiOjY4OC44MTU2NDczMDY4OTY0LCJ5Ijo4MTUuNjQwOTk1MDI1NjM0OH1d" data-look=3D=
"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M39=
5.86081099737254,548.9779930114746L395.86081099737254,583.9069251996091Q395=
.86081099737254,590.9779930114746 388.78974318550706,590.9779930114746L374.=
82607523780945,590.9779930114746Q367.755007425944,590.9779930114746 367.755=
007425944,598.0490608233401L367.755007425944,901.9669914245605L367.75500742=
59441,935.9669914245605L367.7550074259441,968.895923612695Q367.755007425944=
1,975.9669914245605 360.6839396140786,975.9669914245605L323.6648178118655,9=
75.9669914245605Q316.59375,975.9669914245605 316.59375,983.0380592364261L31=
6.59375,1011.7984914779663L316.59375,1366.1189861297607L316.59375,1422.2109=
16517358Q316.59375,1429.2819843292236 323.6648178118655,1429.2819843292236L=
518.5246548443846,1429.2819843292236Q525.59572265625,1429.2819843292236 525=
.59572265625,1436.3530521410892L525.5957226562499,1449.2819843292236L525.59=
57226562499,1495.2819843292236" id=3D"my-svg-L_native_sysroot_rootfsdbg_0" =
class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edg=
e-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"e=
dge" data-id=3D"L_native_sysroot_rootfsdbg_0" data-points=3D"W3sieCI6Mzk1Lj=
g2MDgxMDk5NzM3MjU0LCJ5Ijo1NDguOTc3OTkzMDExNDc0Nn0seyJ4IjozOTUuODYwODEwOTk3M=
zcyNTQsInkiOjU5MC45Nzc5OTMwMTE0NzQ2fSx7IngiOjM2Ny43NTUwMDc0MjU5NDQsInkiOjU5=
MC45Nzc5OTMwMTE0NzQ2fSx7IngiOjM2Ny43NTUwMDc0MjU5NDQsInkiOjkwMS45NjY5OTE0MjQ=
1NjA1fSx7IngiOjM2Ny43NTUwMDc0MjU5NDQxLCJ5Ijo5MzUuOTY2OTkxNDI0NTYwNX0seyJ4Ij=
ozNjcuNzU1MDA3NDI1OTQ0MSwieSI6OTc1Ljk2Njk5MTQyNDU2MDV9LHsieCI6MzE2LjU5Mzc1L=
CJ5Ijo5NzUuOTY2OTkxNDI0NTYwNX0seyJ4IjozMTYuNTkzNzUsInkiOjEwMTEuNzk4NDkxNDc3=
OTY2M30seyJ4IjozMTYuNTkzNzUsInkiOjEzNjYuMTE4OTg2MTI5NzYwN30seyJ4IjozMTYuNTk=
zNzUsInkiOjE0MjkuMjgxOTg0MzI5MjIzNn0seyJ4Ijo1MjUuNTk1NzIyNjU2MjUsInkiOjE0Mj=
kuMjgxOTg0MzI5MjIzNn0seyJ4Ijo1MjUuNTk1NzIyNjU2MjQ5OSwieSI6MTQ0OS4yODE5ODQzM=
jkyMjM2fSx7IngiOjUyNS41OTU3MjI2NTYyNDk5LCJ5IjoxNDk5LjI4MTk4NDMyOTIyMzZ9XQ=
=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointE=
nd)"/><path d=3D"M421.255007425944,548.9779930114746L421.255007425944,595.9=
069251996091Q421.255007425944,602.9779930114746 414.1839396140785,602.97799=
30114746L398.02317345209514,602.9779930114746Q390.95210564022966,602.977993=
0114746 390.95210564022966,610.0490608233401L390.95210564022966,901.9669914=
245605L390.9521056402298,935.9669914245605L390.9521056402298,948.8959236126=
95Q390.9521056402298,955.9669914245605 398.02317345209525,955.9669914245605=
L509.0070571881345,955.9669914245605Q516.078125,955.9669914245605 516.07812=
5,963.0380592364261L516.078125,1067.629991531372L516.078125,1113.6299915313=
72" id=3D"my-svg-L_native_sysroot_debugserver_0" class=3D"edge-thickness-no=
rmal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-=
link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_s=
ysroot_debugserver_0" data-points=3D"W3sieCI6NDIxLjI1NTAwNzQyNTk0NCwieSI6NT=
Q4Ljk3Nzk5MzAxMTQ3NDZ9LHsieCI6NDIxLjI1NTAwNzQyNTk0NCwieSI6NjAyLjk3Nzk5MzAxM=
TQ3NDZ9LHsieCI6MzkwLjk1MjEwNTY0MDIyOTY2LCJ5Ijo2MDIuOTc3OTkzMDExNDc0Nn0seyJ4=
IjozOTAuOTUyMTA1NjQwMjI5NjYsInkiOjkwMS45NjY5OTE0MjQ1NjA1fSx7IngiOjM5MC45NTI=
xMDU2NDAyMjk4LCJ5Ijo5MzUuOTY2OTkxNDI0NTYwNX0seyJ4IjozOTAuOTUyMTA1NjQwMjI5OC=
wieSI6OTU1Ljk2Njk5MTQyNDU2MDV9LHsieCI6NTE2LjA3ODEyNSwieSI6OTU1Ljk2Njk5MTQyN=
DU2MDV9LHsieCI6NTE2LjA3ODEyNSwieSI6MTA2Ny42Mjk5OTE1MzEzNzJ9LHsieCI6NTE2LjA3=
ODEyNSwieSI6MTExNy42Mjk5OTE1MzEzNzJ9XQ=3D=3D" data-look=3D"classic" marker-=
end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M516.078125,1165.292=
989730835L516.078125,1226.292989730835" id=3D"my-svg-L_debugserver_appbin_0=
" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal e=
dge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D=
"edge" data-id=3D"L_debugserver_appbin_0" data-points=3D"W3sieCI6NTE2LjA3OD=
EyNSwieSI6MTE2NS4yOTI5ODk3MzA4MzV9LHsieCI6NTE2LjA3ODEyNSwieSI6MTIzMC4yOTI5O=
Dk3MzA4MzV9XQ=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowch=
art-v2-pointEnd)"/><path d=3D"M436.078125,1302.9559879302979L436.078125,140=
2.210916517358Q436.078125,1409.2819843292236 443.1491928118655,1409.2819843=
292236L575.5962564068845,1409.2819843292236Q582.66732421875,1409.2819843292=
236 582.66732421875,1416.3530521410892L582.66732421875,1449.2819843292236L5=
82.66732421875,1495.2819843292236" id=3D"my-svg-L_target_rootfsdbg_0" class=
=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-pat=
tern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" =
data-id=3D"L_target_rootfsdbg_0" data-points=3D"W3sieCI6NDM2LjA3ODEyNSwieSI=
6MTMwMi45NTU5ODc5MzAyOTc5fSx7IngiOjQzNi4wNzgxMjUsInkiOjE0MDkuMjgxOTg0MzI5Mj=
IzNn0seyJ4Ijo1ODIuNjY3MzI0MjE4NzUsInkiOjE0MDkuMjgxOTg0MzI5MjIzNn0seyJ4Ijo1O=
DIuNjY3MzI0MjE4NzUsInkiOjE0NDkuMjgxOTg0MzI5MjIzNn0seyJ4Ijo1ODIuNjY3MzI0MjE4=
NzUsInkiOjE0OTkuMjgxOTg0MzI5MjIzNn1d" data-look=3D"classic" marker-end=3D"u=
rl(#my-svg_flowchart-v2-pointEnd)"/></g><g class=3D"edgeLabels"><g class=3D=
"edgeLabel" transform=3D"translate(265.2091145833333, 109.16299819946289)">=
<g class=3D"label" data-id=3D"L_idesdk_ideconfig_0" transform=3D"translate(=
0, -10.829999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-26.=
84375" y=3D"2.3299999237060547" width=3D"53.6875" height=3D"17"/><text xml:=
space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan cla=
ss=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=
=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">generates</tspan></tspan></text></g></g></g><g class=3D"edg=
eLabel" transform=3D"translate(564.7817931402296, 183.82599639892578)"><g c=
lass=3D"label" data-id=3D"L_idesdk_sdk_0" transform=3D"translate(0, -10.329=
999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-87.1171875" y=
=3D"1.3299999237060547" width=3D"174.234375" height=3D"18"/><text xml:space=
=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"mid=
dle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal">generates</tspan><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal"> the</tspan><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal"> SDK</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> (via</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> bitbake)</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" tran=
sform=3D"translate(1039.4548721313477, 1185.292989730835)"><g class=3D"labe=
l" data-id=3D"L_rootfsdbg_src_rootfsdbg_0" transform=3D"translate(-0.162956=
23779296875, -17.661499977111816)"><g><rect class=3D"background" style=3D""=
 x=3D"-53.421875" y=3D"1.3299999237060547" width=3D"107.16966247558594" hei=
ght=3D"32.66300010681152"/><text xml:space=3D"preserve" y=3D"-10.1" text-an=
chor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=
=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal">deployed,</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> e=
xtracted</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"=
1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal">(--nfs=3Drootfs-dbg)</tspan></=
tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"translate(339.=
2846354166666, 331.9889945983887)"><g class=3D"label" data-id=3D"L_ide_nati=
ve_sysroot_0" transform=3D"translate(-0.16747283935546875, -10.329999923706=
055)"><g><rect class=3D"background" style=3D"" x=3D"-87.125" y=3D"1.3299999=
237060547" width=3D"174.58494567871094" height=3D"18"/><text xml:space=3D"p=
reserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text=
-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle">=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al">calls</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" fo=
nt-weight=3D"normal"> directly,</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> no</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> bitbake</tsp=
an><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"n=
ormal"> needed</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" tra=
nsform=3D"translate(88.86458333333334, 658.4779930114746)"><g class=3D"labe=
l" data-id=3D"L_ide_srcdir_0" transform=3D"translate(-0.03365325927734375, =
-10.829999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-31" y=
=3D"2.3299999237060547" width=3D"62.06730651855469" height=3D"17"/><text xm=
l:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan c=
lass=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=
=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">edit</tspan><tspan font-style=3D"normal" class=3D"text-inne=
r-tspan" font-weight=3D"normal"> source</tspan></tspan></text></g></g></g><=
g class=3D"edgeLabel" transform=3D"translate(155.72916666666669, 1011.79849=
14779663)"><g class=3D"label" data-id=3D"L_native_sysroot_srcdir_0" transfo=
rm=3D"translate(-0.3126373291015625, -10.829999923706055)"><g><rect class=
=3D"background" style=3D"" x=3D"-49.5625" y=3D"2.3299999237060547" width=3D=
"99.75027465820312" height=3D"17"/><text xml:space=3D"preserve" y=3D"-10.1"=
 text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">reads</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> source</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal"> from</tspan></tspan></text></g></g></g><g class=3D"=
edgeLabel" transform=3D"translate(476.76758873349144, 641.9779930114746)"><=
g class=3D"label" data-id=3D"L_native_sysroot_builddir_0" transform=3D"tran=
slate(-0.16704559326171875, -10.329999923706055)"><g><rect class=3D"backgro=
und" style=3D"" x=3D"-25.1484375" y=3D"1.3299999237060547" width=3D"50.6309=
6618652344" height=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-an=
chor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=
=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal">builds</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> in</=
tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"transl=
ate(672.8169203985306, 641.9779930114746)"><g class=3D"label" data-id=3D"L_=
native_sysroot_sysroot_0" transform=3D"translate(-0.14606475830078125, -10.=
829999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-25.21875" =
y=3D"2.3299999237060547" width=3D"50.72962951660156" height=3D"17"/><text x=
ml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan =
class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-ancho=
r=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-w=
eight=3D"normal">--sysroot</tspan></tspan></text></g></g></g><g class=3D"ed=
geLabel" transform=3D"translate(476.87306511288597, 746.6409950256348)"><g =
class=3D"label" data-id=3D"L_builddir_destdir_0" transform=3D"translate(-0.=
13970947265625, -10.329999923706055)"><g><rect class=3D"background" style=
=3D"" x=3D"-18.28125" y=3D"1.3299999237060547" width=3D"36.8419189453125" h=
eight=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middl=
e" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=
=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal">install</tspan></tspan></text></g></g=
></g><g class=3D"edgeLabel" transform=3D"translate(753.4531249999999, 1185.=
292989730835)"><g class=3D"label" data-id=3D"L_destdir_rootfsdbg_0" transfo=
rm=3D"translate(0, -17.661499977111816)"><g><rect class=3D"background" styl=
e=3D"" x=3D"-60.75" y=3D"1.3299999237060547" width=3D"121.5" height=3D"32.6=
6300010681152"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"mid=
dle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" =
dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"t=
ext-inner-tspan" font-weight=3D"normal">devtool</tspan><tspan font-style=3D=
"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> deploy-target</=
tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D=
"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal">(direct</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> write,</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> n=
o</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weigh=
t=3D"normal"> SSH)</tspan></tspan></text></g></g></g><g class=3D"edgeLabel"=
 transform=3D"translate(845.1893340337845, 694.3094940185547)"><g class=3D"=
label" data-id=3D"L_native_sysroot_destdir_0" transform=3D"translate(-0.166=
9158935546875, -17.661499977111816)"><g><rect class=3D"background" style=3D=
"" x=3D"-49.0703125" y=3D"1.3299999237060547" width=3D"98.47445678710938" h=
eight=3D"32.66300010681152"/><text xml:space=3D"preserve" y=3D"-10.1" text-=
anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"norma=
l" class=3D"text-inner-tspan" font-weight=3D"normal">debug</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> symb=
ols:</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em"=
 dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal">unstripped</tspan><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> binary</tsp=
an></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"translate=
(316.33593749999994, 1185.292989730835)"><g class=3D"label" data-id=3D"L_na=
tive_sysroot_rootfsdbg_0" transform=3D"translate(0, -24.992998123168945)"><=
g><rect class=3D"background" style=3D"" x=3D"-43.7421875" y=3D"1.3299999237=
060547" width=3D"87.484375" height=3D"47.32599639892578"/><text xml:space=
=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"mid=
dle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal">debug</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal"> symbols:</tspan></tspan><tspan class=3D"text-out=
er-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">oth=
er</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> recipes'</tspan></tspan><tspan class=3D"text-outer-tspan row=
" x=3D"0" y=3D"2.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">shared</tspan=
><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"nor=
mal"> libraries</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" tr=
ansform=3D"translate(515.9064559936523, 1011.7984914779663)"><g class=3D"la=
bel" data-id=3D"L_native_sysroot_debugserver_0" transform=3D"translate(-0.1=
6426849365234375, -18.161499977111816)"><g><rect class=3D"background" style=
=3D"" x=3D"-38.1640625" y=3D"2.3299999237060547" width=3D"76.65666198730469=
" height=3D"31.663000106811523"/><text xml:space=3D"preserve" y=3D"-10.1" t=
ext-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D=
"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal">remote</tspan><tsp=
an font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">=
 debug</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1e=
m" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal">protocol</tspan></tspan></text=
></g></g></g><g class=3D"edgeLabel" transform=3D"translate(515.861480712890=
6, 1197.792989730835)"><g class=3D"label" data-id=3D"L_debugserver_appbin_0=
" transform=3D"translate(-0.166168212890625, -10.829999923706055)"><g><rect=
 class=3D"background" style=3D"" x=3D"-32.1171875" y=3D"2.3299999237060547"=
 width=3D"64.56671142578125" height=3D"17"/><text xml:space=3D"preserve" y=
=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tsp=
an row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan fon=
t-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">attach=
</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> /</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal"> run</tspan></tspan></text></g></g></g><g class=
=3D"edgeLabel" transform=3D"translate(435.6640625, 1366.1189861297607)"><g =
class=3D"label" data-id=3D"L_target_rootfsdbg_0" transform=3D"translate(0, =
-25.492998123168945)"><g><rect class=3D"background" style=3D"" x=3D"-43.085=
9375" y=3D"2.3299999237060547" width=3D"86.171875" height=3D"46.32599639892=
578"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=
=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1e=
m" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal">booted</tspan><tspan font-style=3D"normal" cl=
ass=3D"text-inner-tspan" font-weight=3D"normal"> from</tspan></tspan><tspan=
 class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em" text-anchor=
=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">(NFS-mounted</tspan></tspan><tspan class=3D"text-outer-tspa=
n row" x=3D"0" y=3D"2.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">root</ts=
pan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"=
normal"> filesystem)</tspan></tspan></text></g></g></g></g><g class=3D"node=
s"><g class=3D"node default orange" id=3D"my-svg-flowchart-idesdk-0" data-l=
ook=3D"classic" transform=3D"translate(367.6192708333333, 36.33149909973144=
5)"><rect class=3D"basic label-container" style=3D"fill:#ffbe6f !important;=
stroke:#ffa348 !important;stroke-width:1px !important" x=3D"-106.3690948486=
3281" y=3D"-24.33150005340576" width=3D"212.73818969726562" height=3D"48.66=
300010681152"/><g class=3D"label" style=3D"color:#000000 !important" transf=
orm=3D"translate(0, -14.331500053405762)"><rect/><g><rect class=3D"backgrou=
nd" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=
=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal">devtool</tspan><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal"> ide-sdk</tspan><tspan fon=
t-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> --nfs=
=3Drootfs-dbg</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tsp=
an" font-weight=3D"normal">(bitbake</tspan><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal"> tinfoil</tspan><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> client)=
</tspan></tspan></text></g></g></g><g class=3D"node default" id=3D"my-svg-f=
lowchart-ideconfig-1" data-look=3D"classic" transform=3D"translate(265.3653=
645833333, 183.82599639892578)"><polygon points=3D"0,0 138.015625,0 138.015=
625,-52.32599639892578 0,-52.32599639892578 0,0 -8,0 146.015625,0 146.01562=
5,-52.32599639892578 -8,-52.32599639892578 -8,0" class=3D"label-container" =
transform=3D"translate(-69.0078125,26.16299819946289)" style=3D"fill:#99c1f=
1 !important;stroke:#62a0ea !important;stroke-width:1px !important"/><g cla=
ss=3D"label" style=3D"color:#000000 !important" transform=3D"translate(0, -=
21.16299819946289)"><rect/><g><rect class=3D"background" style=3D"stroke: n=
one"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !impor=
tant"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1e=
m"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"n=
ormal">IDE</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> configuration</tspan></tspan><tspan class=3D"text-ou=
ter-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" =
class=3D"text-inner-tspan" font-weight=3D"normal">(e.g.</tspan><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> build</=
tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> tool</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> preset,</tspan></tspan><tspan class=3D"text-o=
uter-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"norma=
l" class=3D"text-inner-tspan" font-weight=3D"normal">debugger</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> l=
aunch</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-w=
eight=3D"normal"> config)</tspan></tspan></text></g></g></g><g class=3D"nod=
e default" id=3D"my-svg-flowchart-ide-2" data-look=3D"classic" transform=3D=
"translate(237.3239360264369, 266.4889945983887)"><rect class=3D"basic labe=
l-container" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;str=
oke-width:1px !important" x=3D"-80" y=3D"-16.5" width=3D"160" height=3D"33"=
/><g class=3D"label" style=3D"color:#000000 !important" transform=3D"transl=
ate(0, -6.5)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/>=
<text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important">=
<tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><ts=
pan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"=
>IDE</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal"> (e.g.</tspan><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal"> VSCode)</tspan></tspan></text></g></g></=
g><g class=3D"node default green" id=3D"my-svg-flowchart-srcdir-3" data-loo=
k=3D"classic" transform=3D"translate(122.296875, 1104.292989730835)"><polyg=
on points=3D"0,0 204.59375,0 204.59375,-53.32599639892578 0,-53.32599639892=
578 0,0 -8,0 212.59375,0 212.59375,-53.32599639892578 -8,-53.32599639892578=
 -8,0" class=3D"label-container" transform=3D"translate(-102.296875,26.6629=
9819946289)" style=3D"fill:#8ff0a4 !important;stroke:#57e389 !important;str=
oke-width:1px !important"/><g class=3D"label" style=3D"color:#000000 !impor=
tant" transform=3D"translate(0, -21.66299819946289)"><rect/><g><rect class=
=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-=
10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan ro=
w" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal">S</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> =3D</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> e.g.=
</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> workspace/sources/&lt;recipe&gt;</tspan></tspan><tspan class=
=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">(source</tspa=
n><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"no=
rmal"> code,</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan"=
 font-weight=3D"normal"> extracted</tspan><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal"> by</tspan></tspan><tspan cla=
ss=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-st=
yle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</t=
span><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal"> modify,</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> edited</tspan><tspan font-style=3D"normal" cl=
ass=3D"text-inner-tspan" font-weight=3D"normal"> in</tspan><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> the</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> IDE)</tspan></tspan></text></g></g></g><g class=3D"node default" id=3D=
"my-svg-flowchart-native_sysroot-4" data-look=3D"classic" transform=3D"tran=
slate(433.9521056402297, 515.4834938049316)"><polygon points=3D"0,0 183.359=
375,0 183.359375,-66.98899841308594 0,-66.98899841308594 0,0 -8,0 191.35937=
5,0 191.359375,-66.98899841308594 -8,-66.98899841308594 -8,0" class=3D"labe=
l-container" transform=3D"translate(-91.6796875,33.49449920654297)" style=
=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !imp=
ortant"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D=
"translate(0, -28.49449920654297)"><rect/><g><rect class=3D"background" sty=
le=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill=
:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.=
1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal">recipe-sysroot-native</tspan></tspan><tspan class=3D"=
text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal">build</tspan><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =
tool</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal"> (e.g.</tspan><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal"> CMake)</tspan></tspan><tspan class=3D"te=
xt-outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal">cross-compiler</ts=
pan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"=
normal"> (e.g.</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal"> &lt;arch&gt;-gcc)</tspan></tspan><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"3.2em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">debugger</tsp=
an><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"n=
ormal"> (e.g.</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan=
" font-weight=3D"normal"> gdb)</tspan></tspan></text></g></g></g><g class=
=3D"node default" id=3D"my-svg-flowchart-builddir-5" data-look=3D"classic" =
transform=3D"translate(476.9521056402297, 694.3094940185547)"><polygon poin=
ts=3D"0,0 130,0 130,-38.66300010681152 0,-38.66300010681152 0,0 -8,0 138,0 =
138,-38.66300010681152 -8,-38.66300010681152 -8,0" class=3D"label-container=
" transform=3D"translate(-65,19.33150005340576)" style=3D"fill:#99c1f1 !imp=
ortant;stroke:#62a0ea !important;stroke-width:1px !important"/><g class=3D"=
label" style=3D"color:#000000 !important" transform=3D"translate(0, -14.331=
500053405762)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/=
><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"=
><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><t=
span font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal=
">B</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal"> (build</tspan><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal"> directory)</tspan></tspan><tspan class=
=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">build</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> artifacts)</tspan></tspan></text></g></g></g><g class=3D"node default"=
 id=3D"my-svg-flowchart-sysroot-6" data-look=3D"classic" transform=3D"trans=
late(672.9521056402298, 693.8094940185547)"><polygon points=3D"0,0 130,0 13=
0,-37.66300010681152 0,-37.66300010681152 0,0 -8,0 138,0 138,-37.6630001068=
1152 -8,-37.66300010681152 -8,0" class=3D"label-container" transform=3D"tra=
nslate(-65,18.83150005340576)" style=3D"fill:#99c1f1 !important;stroke:#62a=
0ea !important;stroke-width:1px !important"/><g class=3D"label" style=3D"co=
lor:#000000 !important" transform=3D"translate(0, -13.831500053405762)"><re=
ct/><g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=
=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">recipe-sysroo=
t</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=
=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal">(target</tspan><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal"> headers</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> &amp;</tspan><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> li=
bs)</tspan></tspan></text></g></g></g><g class=3D"node default" id=3D"my-sv=
g-flowchart-destdir-7" data-look=3D"classic" transform=3D"translate(661.202=
1056402298, 841.8039932250977)"><polygon points=3D"0,0 171.28125,0 171.2812=
5,-52.32599639892578 0,-52.32599639892578 0,0 -8,0 179.28125,0 179.28125,-5=
2.32599639892578 -8,-52.32599639892578 -8,0" class=3D"label-container" tran=
sform=3D"translate(-85.640625,26.16299819946289)" style=3D"fill:#99c1f1 !im=
portant;stroke:#62a0ea !important;stroke-width:1px !important"/><g class=3D=
"label" style=3D"color:#000000 !important" transform=3D"translate(0, -21.16=
299819946289)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/=
><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"=
><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><t=
span font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal=
">D</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal"> =3D</tspan><tspan font-style=3D"normal" class=3D"text-inner=
-tspan" font-weight=3D"normal"> image</tspan></tspan><tspan class=3D"text-o=
uter-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal"=
 class=3D"text-inner-tspan" font-weight=3D"normal">(non-stripped,</tspan><t=
span font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal=
"> relocated</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan"=
 font-weight=3D"normal"> rpath,</tspan></tspan><tspan class=3D"text-outer-t=
span row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal">managed</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> by</tspa=
n><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"no=
rmal"> pseudo)</tspan></tspan></text></g></g></g><g class=3D"node default" =
id=3D"my-svg-flowchart-rootfsdbg_src-8" data-look=3D"classic" transform=3D"=
translate(1099.0359374273391, 834.4724922180176)"><polygon points=3D"0,0 19=
7.21875,0 197.21875,-66.98899841308594 0,-66.98899841308594 0,0 -8,0 205.21=
875,0 205.21875,-66.98899841308594 -8,-66.98899841308594 -8,0" class=3D"lab=
el-container" transform=3D"translate(-98.609375,33.49449920654297)" style=
=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !imp=
ortant"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D=
"translate(0, -28.49449920654297)"><rect/><g><rect class=3D"background" sty=
le=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill=
:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.=
1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal">rootfs-dbg</tspan></tspan><tspan class=3D"text-outer-=
tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal">(stripped</tspan><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> binarie=
s</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weigh=
t=3D"normal"> +</tspan><tspan font-style=3D"normal" class=3D"text-inner-tsp=
an" font-weight=3D"normal"> debug</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> symbols</tspan></tspan><tspan=
 class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan fon=
t-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">of</ts=
pan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"=
normal"> every</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal"> recipe,</tspan><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal"> combined</tspan><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> by</tsp=
an></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"3.2em" dy=3D"=
1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal">image-combined-dbg)</tspan></tspan></text></g></g></g><g class=
=3D"node default green" id=3D"my-svg-flowchart-rootfsdbg-9" data-look=3D"cl=
assic" transform=3D"translate(611.203125, 1533.2764835357666)"><polygon poi=
nts=3D"0,0 290.9580078125,0 290.9580078125,-67.98899841308594 0,-67.9889984=
1308594 0,0 -8,0 298.9580078125,0 298.9580078125,-67.98899841308594 -8,-67.=
98899841308594 -8,0" class=3D"label-container" transform=3D"translate(-145.=
47900390625,33.99449920654297)" style=3D"fill:#8ff0a4 !important;stroke:#57=
e389 !important;stroke-width:1px !important"/><g class=3D"label" style=3D"c=
olor:#000000 !important" transform=3D"translate(0, -28.99449920654297)"><re=
ct/><g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=
=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">&lt;workspace=
&gt;/nfs-exports/&lt;image-recipe&gt;/rootfs-dbg</tspan></tspan><tspan clas=
s=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">(copy,</tspan=
><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"nor=
mal"> kept</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> in</tspan><tspan font-style=3D"normal" class=3D"text=
-inner-tspan" font-weight=3D"normal"> sync</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> by</tspan><tspan fon=
t-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> devto=
ol</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em"=
 dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal">deploy-target;</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> persists</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> across</=
tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"3.2em" dy=
=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal">debug</tspan><tspan font-style=3D"normal" class=3D"text-inne=
r-tspan" font-weight=3D"normal"> sessions)</tspan></tspan></text></g></g></=
g><g class=3D"node default" id=3D"my-svg-flowchart-appbin-10" data-look=3D"=
classic" transform=3D"translate(516.078125, 1254.6244888305664)"><rect clas=
s=3D"basic label-container" style=3D"fill:#99c1f1 !important;stroke:#62a0ea=
 !important;stroke-width:1px !important" x=3D"-80" y=3D"-24.33150005340576"=
 width=3D"160" height=3D"48.66300010681152"/><g class=3D"label" style=3D"co=
lor:#000000 !important" transform=3D"translate(0, -14.331500053405762)"><re=
ct/><g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=
=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">Application</=
tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> binary</tspan></tspan><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal">(running)</tspan></tspan></text></g></g><=
/g><g class=3D"node default" id=3D"my-svg-flowchart-debugserver-11" data-lo=
ok=3D"classic" transform=3D"translate(516.078125, 1141.4614906311035)"><rec=
t class=3D"basic label-container" style=3D"fill:#99c1f1 !important;stroke:#=
62a0ea !important;stroke-width:1px !important" x=3D"-80" y=3D"-23.831500053=
40576" width=3D"160" height=3D"47.66300010681152"/><g class=3D"label" style=
=3D"color:#000000 !important" transform=3D"translate(0, -13.831500053405762=
)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><text xml:s=
pace=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan clas=
s=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-st=
yle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">debug-serv=
er</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" d=
y=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">(e.g.</tspan><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal"> gdbserver)</tspan></tspan></text></g></g>=
</g></g></g></g><defs><filter id=3D"my-svg-drop-shadow" height=3D"130%" wid=
th=3D"130%"><feDropShadow dx=3D"4" dy=3D"4" stdDeviation=3D"0" flood-opacit=
y=3D"0.06" flood-color=3D"#000000"/></filter></defs><defs><filter id=3D"my-=
svg-drop-shadow-small" height=3D"150%" width=3D"150%"><feDropShadow dx=3D"2=
" dy=3D"2" stdDeviation=3D"0" flood-opacity=3D"0.06" flood-color=3D"#000000=
"/></filter></defs><linearGradient id=3D"my-svg-gradient" gradientUnits=3D"=
objectBoundingBox" x1=3D"0%" y1=3D"0%" x2=3D"100%" y2=3D"0%"><stop offset=
=3D"0%" stop-color=3D"#62a0ea" stop-opacity=3D"1"/><stop offset=3D"100%" st=
op-color=3D"hsl(92.7272727273, 35.8620689655%, 67.2549019608%)" stop-opacit=
y=3D"1"/></linearGradient></svg>
\ No newline at end of file
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd =
b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd
new file mode 100644
index 000000000..7584dcbb3
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd
@@ -0,0 +1,74 @@
+---
+config:
+  theme: base
+  look: classic
+  htmlLabels: false
+  fontFamily: '"Nimbus Roman", "Times New Roman", Times, serif'
+  fontSize: 13.33
+  themeVariables:
+    primaryColor: "#99c1f1"
+    primaryBorderColor: "#62a0ea"
+    primaryTextColor: "#000000"
+    lineColor: "#000000"
+    edgeLabelBackground: "#ffffff"
+    clusterBkg: "#f6f5f4"
+    clusterBorder: "#c0bfbc"
+    titleColor: "#000000"
+    fontSize: 13.33px
+  themeCSS: |
+    .cluster-label tspan { font-weight: bold; }
+    rect { rx: 7.5px; ry: 7.5px; }
+  flowchart:
+    htmlLabels: false
+    useMaxWidth: false
+    curve: basis
+    padding: 10
+    nodeSpacing: 23
+    rankSpacing: 37
+    wrappingWidth: 270
+---
+%% Regenerate: npx -y @mermaid-js/mermaid-cli -b transparent -i devtool-id=
e-sdk-workflow.mmd -o devtool-ide-sdk-workflow.svg
+%%   && sed -i 's/<text /<text xml:space=3D"preserve" /g' devtool-ide-sdk-=
workflow.svg
+%% (xml:space keeps the spaces between words in rsvg-convert, used for the=
 PDF output)
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
+    modify --> ws_appends
+    modify -->|extracts| ws_src
+    ws_appends --> gensdk
+    ws_src --> gensdk
+    gensdk -->|"one-time setup"| edit
+    edit --> build
+    build --> deploy
+    deploy --> debug
+    debug -->|repeat| edit
+    edit -.->|"when done"| finish
+    gensdk -.- rerun_note
+
+    style workspace fill:#f6f5f4,stroke:#c061cb,stroke-width:1px
+    style loop fill:#f6f5f4,stroke:#57e389,stroke-width:1px
+
+    classDef orange fill:#ffbe6f,stroke:#ffa348,stroke-width:1px,color:#00=
0000;
+    classDef green fill:#8ff0a4,stroke:#57e389,stroke-width:1px,color:#000=
000;
+    classDef note fill:#f6f5f4,stroke:#c0bfbc,stroke-width:1px,color:#5e5c=
64;
+    classDef default fill:#99c1f1,stroke:#62a0ea,stroke-width:1px,color:#0=
00000;
+    class modify,gensdk,finish orange;
+    class ws_src,edit,build,deploy,debug green;
+    class rerun_note note;
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-workflow.svg =
b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.svg
new file mode 100644
index 000000000..389b64a6b
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.svg
@@ -0,0 +1 @@
+<svg id=3D"my-svg" width=3D"474.1289978027344" xmlns=3D"http://www.w3.org/=
2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/xlink" class=3D"flowchart" =
height=3D"1037.1031494140625" viewBox=3D"4 4 474.1289978027344 1037.1031494=
140625" role=3D"graphics-document document" aria-roledescription=3D"flowcha=
rt-v2" style=3D"background-color: transparent;"><style>#my-svg{font-family:=
"Nimbus Roman","Times New Roman",Times,serif;font-size:13.33px;fill:#000000=
;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes das=
h{to{stroke-dashoffset:0;}}#my-svg .edge-animation-slow{stroke-dasharray:9,=
5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke=
-linecap:round;}#my-svg .edge-animation-fast{stroke-dasharray:9,5!important=
;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:ro=
und;}#my-svg .error-icon{fill:hsl(32.7272727273, 75.8620689655%, 82.2549019=
608%);}#my-svg .error-text{fill:rgb(10.9224137931, 42.1293103448, 79.577586=
2068);stroke:rgb(10.9224137931, 42.1293103448, 79.5775862068);}#my-svg .edg=
e-thickness-normal{stroke-width:1px;}#my-svg .edge-thickness-thick{stroke-w=
idth:3.5px;}#my-svg .edge-pattern-solid{stroke-dasharray:0;}#my-svg .edge-t=
hickness-invisible{stroke-width:0;fill:none;}#my-svg .edge-pattern-dashed{s=
troke-dasharray:3;}#my-svg .edge-pattern-dotted{stroke-dasharray:2;}#my-svg=
 .marker{fill:#000000;stroke:#000000;}#my-svg .marker.cross{stroke:#000000;=
}#my-svg svg{font-family:"Nimbus Roman","Times New Roman",Times,serif;font-=
size:13.33px;}#my-svg p{margin:0;}#my-svg .label{font-family:"Nimbus Roman"=
,"Times New Roman",Times,serif;color:#000000;}#my-svg .cluster-label text{f=
ill:#000000;}#my-svg .cluster-label span{color:#000000;}#my-svg .cluster-la=
bel span p{background-color:transparent;}#my-svg .label text,#my-svg span{f=
ill:#000000;color:#000000;}#my-svg .node rect,#my-svg .node circle,#my-svg =
.node ellipse,#my-svg .node polygon,#my-svg .node path{fill:#99c1f1;stroke:=
#62a0ea;stroke-width:1px;}#my-svg .rough-node .label text,#my-svg .node .la=
bel text,#my-svg .image-shape .label,#my-svg .icon-shape .label{text-anchor=
:middle;}#my-svg .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}=
#my-svg .rough-node .label,#my-svg .node .label,#my-svg .image-shape .label=
,#my-svg .icon-shape .label{text-align:center;}#my-svg .node.clickable{curs=
or:pointer;}#my-svg .root .anchor path{fill:#000000!important;stroke-width:=
0;stroke:#000000;}#my-svg .arrowheadPath{fill:#0b0b0b;}#my-svg .edgePaths .=
path{stroke:#000000;stroke-width:1px;}#my-svg .flowchart-link{stroke:#00000=
0;fill:none;}#my-svg .edgeLabel{background-color:#ffffff;text-align:center;=
}#my-svg .edgeLabel p{background-color:#ffffff;}#my-svg .edgeLabel rect{opa=
city:0.5;background-color:#ffffff;fill:#ffffff;}#my-svg .labelBkg{backgroun=
d-color:rgba(255, 255, 255, 0.5);}#my-svg .cluster rect{fill:#f6f5f4;stroke=
:#c0bfbc;stroke-width:1px;}#my-svg .cluster text{fill:#000000;}#my-svg .clu=
ster span{color:#000000;}#my-svg .node .collapsed-indicator{fill:#c0bfbc;st=
roke:none;opacity:0.6;}#my-svg .node .collapsed-separator{stroke:#c0bfbc;st=
roke-width:0.75px;}#my-svg div.mermaidTooltip{position:absolute;text-align:=
center;max-width:200px;padding:2px;font-family:"Nimbus Roman","Times New Ro=
man",Times,serif;font-size:12px;background:hsl(32.7272727273, 75.8620689655=
%, 82.2549019608%);border:1px solid hsl(32.7272727273, 35.8620689655%, 72.2=
549019608%);border-radius:2px;pointer-events:none;z-index:100;}#my-svg .flo=
wchartTitleText{text-anchor:middle;font-size:18px;fill:#000000;}#my-svg rec=
t.text{fill:none;stroke-width:0;}#my-svg .icon-shape,#my-svg .image-shape{b=
ackground-color:#ffffff;text-align:center;}#my-svg .icon-shape p,#my-svg .i=
mage-shape p{background-color:#ffffff;padding:2px;}#my-svg .icon-shape .lab=
el rect,#my-svg .image-shape .label rect{opacity:0.5;background-color:#ffff=
ff;fill:#ffffff;}#my-svg .label-icon{display:inline-block;height:1em;overfl=
ow:visible;vertical-align:-0.125em;}#my-svg .node .label-icon path{fill:cur=
rentColor;stroke:revert;stroke-width:revert;}#my-svg .node .neo-node{stroke=
:#62a0ea;}#my-svg [data-look=3D"neo"].node rect,#my-svg [data-look=3D"neo"]=
.cluster rect,#my-svg [data-look=3D"neo"].node polygon{stroke:url(#my-svg-g=
radient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [dat=
a-look=3D"neo"].swimlane.cluster rect{filter:none;}#my-svg [data-look=3D"ne=
o"].node path{stroke:url(#my-svg-gradient);stroke-width:1px;}#my-svg [data-=
look=3D"neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185=
,185,1));}#my-svg [data-look=3D"neo"].node .neo-line path{stroke:#62a0ea;fi=
lter:none;}#my-svg [data-look=3D"neo"].node circle{stroke:url(#my-svg-gradi=
ent);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [data-lo=
ok=3D"neo"].node circle .state-start{fill:#000000;}#my-svg [data-look=3D"ne=
o"].icon-shape .icon{fill:url(#my-svg-gradient);filter:drop-shadow( 1px 2px=
 2px rgba(185,185,185,1));}#my-svg [data-look=3D"neo"].icon-shape .icon-neo=
 path{stroke:url(#my-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(185=
,185,185,1));}#my-svg .cluster-label tspan{font-weight:bold;}#my-svg rect{r=
x:7.5px;ry:7.5px;}#my-svg :root{--mermaid-font-family:"Nimbus Roman","Times=
 New Roman",Times,serif;}#my-svg .orange rect{fill:rgb(255, 190, 111)!impor=
tant;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rg=
b(0, 0, 0)!important;}#my-svg .orange polygon{fill:rgb(255, 190, 111)!impor=
tant;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rg=
b(0, 0, 0)!important;}#my-svg .orange ellipse{fill:rgb(255, 190, 111)!impor=
tant;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rg=
b(0, 0, 0)!important;}#my-svg .orange circle{fill:rgb(255, 190, 111)!import=
ant;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb=
(0, 0, 0)!important;}#my-svg .orange path{fill:rgb(255, 190, 111)!important=
;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(0,=
 0, 0)!important;}#my-svg .orange tspan{fill:rgb(0, 0, 0)!important;}#my-sv=
g .green rect{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!im=
portant;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .g=
reen polygon{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!imp=
ortant;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .gr=
een ellipse{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!impo=
rtant;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .gre=
en circle{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!import=
ant;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green=
 path{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!important;=
stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green tsp=
an{fill:rgb(0, 0, 0)!important;}#my-svg .note rect{fill:rgb(246, 245, 244)!=
important;stroke:rgb(192, 191, 188)!important;stroke-width:1px!important;co=
lor:rgb(94, 92, 100)!important;}#my-svg .note polygon{fill:rgb(246, 245, 24=
4)!important;stroke:rgb(192, 191, 188)!important;stroke-width:1px!important=
;color:rgb(94, 92, 100)!important;}#my-svg .note ellipse{fill:rgb(246, 245,=
 244)!important;stroke:rgb(192, 191, 188)!important;stroke-width:1px!import=
ant;color:rgb(94, 92, 100)!important;}#my-svg .note circle{fill:rgb(246, 24=
5, 244)!important;stroke:rgb(192, 191, 188)!important;stroke-width:1px!impo=
rtant;color:rgb(94, 92, 100)!important;}#my-svg .note path{fill:rgb(246, 24=
5, 244)!important;stroke:rgb(192, 191, 188)!important;stroke-width:1px!impo=
rtant;color:rgb(94, 92, 100)!important;}#my-svg .note tspan{fill:rgb(94, 92=
, 100)!important;}#my-svg .default rect{fill:rgb(153, 193, 241)!important;s=
troke:rgb(98, 160, 234)!important;stroke-width:1px!important;color:rgb(0, 0=
, 0)!important;}#my-svg .default polygon{fill:rgb(153, 193, 241)!important;=
stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;color:rgb(0, =
0, 0)!important;}#my-svg .default ellipse{fill:rgb(153, 193, 241)!important=
;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;color:rgb(0,=
 0, 0)!important;}#my-svg .default circle{fill:rgb(153, 193, 241)!important=
;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;color:rgb(0,=
 0, 0)!important;}#my-svg .default path{fill:rgb(153, 193, 241)!important;s=
troke:rgb(98, 160, 234)!important;stroke-width:1px!important;color:rgb(0, 0=
, 0)!important;}#my-svg .default tspan{fill:rgb(0, 0, 0)!important;}</style=
><g><marker id=3D"my-svg_flowchart-v2-pointEnd" class=3D"marker flowchart-v=
2" viewBox=3D"0 0 10 10" refX=3D"5" refY=3D"5" markerUnits=3D"userSpaceOnUs=
e" markerWidth=3D"8" markerHeight=3D"8" orient=3D"auto"><path d=3D"M 0 0 L =
10 5 L 0 10 z" class=3D"arrowMarkerPath" style=3D"stroke-width: 1; stroke-d=
asharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-pointStart" cl=
ass=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"4.5" refY=3D"5" m=
arkerUnits=3D"userSpaceOnUse" markerWidth=3D"8" markerHeight=3D"8" orient=
=3D"auto"><path d=3D"M 0 5 L 10 10 L 10 0 z" class=3D"arrowMarkerPath" styl=
e=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-s=
vg_flowchart-v2-pointEnd-margin" class=3D"marker flowchart-v2" viewBox=3D"0=
 0 11.5 14" refX=3D"11.5" refY=3D"7" markerUnits=3D"userSpaceOnUse" markerW=
idth=3D"10.5" markerHeight=3D"14" orient=3D"auto"><path d=3D"M 0 0 L 11.5 7=
 L 0 14 z" class=3D"arrowMarkerPath" style=3D"stroke-width: 0; stroke-dasha=
rray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-pointStart-margin"=
 class=3D"marker flowchart-v2" viewBox=3D"0 0 11.5 14" refX=3D"1" refY=3D"7=
" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11.5" markerHeight=3D"14" o=
rient=3D"auto"><polygon points=3D"0,7 11.5,14 11.5,0" class=3D"arrowMarkerP=
ath" style=3D"stroke-width: 0; stroke-dasharray: 1, 0;"/></marker><marker i=
d=3D"my-svg_flowchart-v2-circleEnd" class=3D"marker flowchart-v2" viewBox=
=3D"0 0 10 10" refX=3D"11" refY=3D"5" markerUnits=3D"userSpaceOnUse" marker=
Width=3D"11" markerHeight=3D"11" orient=3D"auto"><circle cx=3D"5" cy=3D"5" =
r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: 1; stroke-dasharra=
y: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-circleStart" class=3D=
"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"-1" refY=3D"5" markerUn=
its=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=3D"aut=
o"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"str=
oke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowc=
hart-v2-circleEnd-margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 1=
0" refY=3D"5" refX=3D"12.25" markerUnits=3D"userSpaceOnUse" markerWidth=3D"=
14" markerHeight=3D"14" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" c=
lass=3D"arrowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray: 1, 0;"=
/></marker><marker id=3D"my-svg_flowchart-v2-circleStart-margin" class=3D"m=
arker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"-2" refY=3D"5" markerUnit=
s=3D"userSpaceOnUse" markerWidth=3D"14" markerHeight=3D"14" orient=3D"auto"=
><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"strok=
e-width: 0; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowcha=
rt-v2-crossEnd" class=3D"marker cross flowchart-v2" viewBox=3D"0 0 11 11" r=
efX=3D"12" refY=3D"5.2" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11" m=
arkerHeight=3D"11" orient=3D"auto"><path d=3D"M 1,1 l 9,9 M 10,1 l -9,9" cl=
ass=3D"arrowMarkerPath" style=3D"stroke-width: 2; stroke-dasharray: 1, 0;"/=
></marker><marker id=3D"my-svg_flowchart-v2-crossStart" class=3D"marker cro=
ss flowchart-v2" viewBox=3D"0 0 11 11" refX=3D"-1" refY=3D"5.2" markerUnits=
=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=3D"auto">=
<path d=3D"M 1,1 l 9,9 M 10,1 l -9,9" class=3D"arrowMarkerPath" style=3D"st=
roke-width: 2; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flow=
chart-v2-crossEnd-margin" class=3D"marker cross flowchart-v2" viewBox=3D"0 =
0 15 15" refX=3D"17.7" refY=3D"7.5" markerUnits=3D"userSpaceOnUse" markerWi=
dth=3D"12" markerHeight=3D"12" orient=3D"auto"><path d=3D"M 1,1 L 14,14 M 1=
,14 L 14,1" class=3D"arrowMarkerPath" style=3D"stroke-width: 2.5;"/></marke=
r><marker id=3D"my-svg_flowchart-v2-crossStart-margin" class=3D"marker cros=
s flowchart-v2" viewBox=3D"0 0 15 15" refX=3D"-3.5" refY=3D"7.5" markerUnit=
s=3D"userSpaceOnUse" markerWidth=3D"12" markerHeight=3D"12" orient=3D"auto"=
><path d=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=3D"arrowMarkerPath" style=3D=
"stroke-width: 2.5; stroke-dasharray: 1, 0;"/></marker><g class=3D"root"><g=
 class=3D"clusters"><g class=3D"cluster" id=3D"my-svg-loop" data-look=3D"cl=
assic"><rect style=3D"fill:#f6f5f4 !important;stroke:#57e389 !important;str=
oke-width:1px !important" x=3D"12" y=3D"489.4511375427246" width=3D"334.739=
6469116211" height=3D"387.9889945983887"/><g class=3D"cluster-label" transf=
orm=3D"translate(117.22919845581055, 489.4511375427246)"><g><rect class=3D"=
background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1=
" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=
=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal">Edit/build/debug</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> loop</tspan></tspan></text></=
g></g></g><g class=3D"cluster" id=3D"my-svg-workspace" data-look=3D"classic=
"><rect style=3D"fill:#f6f5f4 !important;stroke:#c061cb !important;stroke-w=
idth:1px !important" x=3D"64.92638193766277" y=3D"153" width=3D"405.2026214=
5996094" height=3D"102.66300201416016"/><g class=3D"cluster-label" transfor=
m=3D"translate(215.396772257487, 153)"><g><rect class=3D"background" style=
=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D""><tsp=
an class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">dev=
tool</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal"> workspace</tspan></tspan></text></g></g></g></g><g class=
=3D"edges edgePaths"><path d=3D"M261.91944554646807,46L261.91944554646807,5=
8.928932188134524Q261.91944554646807,66 254.8483777346026,66L202.7643412290=
204,66Q195.69327341715493,66 195.69327341715493,73.07106781186548L195.69327=
341715493,94.5L195.69327341715493,115.92893218813452Q195.69327341715493,123=
 188.62220560528945,123L176.59876047950868,123Q169.5276926676432,123 169.52=
76926676432,130.07106781186548L169.5276926676432,143L169.52769266764318,197=
.33150100708008" id=3D"my-svg-L_modify_ws_appends_0" class=3D"edge-thicknes=
s-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowch=
art-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_modi=
fy_ws_appends_0" data-points=3D"W3sieCI6MjYxLjkxOTQ0NTU0NjQ2ODA3LCJ5Ijo0Nn0=
seyJ4IjoyNjEuOTE5NDQ1NTQ2NDY4MDcsInkiOjY2fSx7IngiOjE5NS42OTMyNzM0MTcxNTQ5My=
wieSI6NjZ9LHsieCI6MTk1LjY5MzI3MzQxNzE1NDkzLCJ5Ijo5NC41fSx7IngiOjE5NS42OTMyN=
zM0MTcxNTQ5MywieSI6MTIzfSx7IngiOjE2OS41Mjc2OTI2Njc2NDMyLCJ5IjoxMjN9LHsieCI6=
MTY5LjUyNzY5MjY2NzY0MzIsInkiOjE0M30seyJ4IjoxNjkuNTI3NjkyNjY3NjQzMTgsInkiOjI=
wMS4zMzE1MDEwMDcwODAwOH1d" data-look=3D"classic" marker-end=3D"url(#my-svg_=
flowchart-v2-pointEnd)"/><path d=3D"M333.0684120178222,46L333.0684120178222=
,115.92893218813452Q333.0684120178222,123 340.1394798296877,123L366.0579355=
8575823,123Q373.1290033976237,123 373.1290033976237,130.07106781186548L373.=
1290033976237,143L373.1290033976237,190" id=3D"my-svg-L_modify_ws_src_0" cl=
ass=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-=
pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edg=
e" data-id=3D"L_modify_ws_src_0" data-points=3D"W3sieCI6MzMzLjA2ODQxMjAxNzg=
yMjIsInkiOjQ2fSx7IngiOjMzMy4wNjg0MTIwMTc4MjIyLCJ5IjoxMjN9LHsieCI6MzczLjEyOT=
AwMzM5NzYyMzcsInkiOjEyM30seyJ4IjozNzMuMTI5MDAzMzk3NjIzNywieSI6MTQzfSx7IngiO=
jM3My4xMjkwMDMzOTc2MjM3LCJ5IjoxOTR9XQ=3D=3D" data-look=3D"classic" marker-e=
nd=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M169.52769266764318,2=
24.33150100708008L169.5276926676432,272.12513732910156L169.5276926676432,28=
5.0540695172361Q169.5276926676432,292.12513732910156 176.59876047950868,292=
.12513732910156L234.64456583478164,292.12513732910156Q241.71563364664712,29=
2.12513732910156 241.71563364664712,299.19620514096704L241.71563364664712,3=
08.12513732910156" id=3D"my-svg-L_ws_appends_gensdk_0" class=3D"edge-thickn=
ess-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid flow=
chart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_ws=
_appends_gensdk_0" data-points=3D"W3sieCI6MTY5LjUyNzY5MjY2NzY0MzE4LCJ5IjoyM=
jQuMzMxNTAxMDA3MDgwMDh9LHsieCI6MTY5LjUyNzY5MjY2NzY0MzIsInkiOjI3Mi4xMjUxMzcz=
MjkxMDE1Nn0seyJ4IjoxNjkuNTI3NjkyNjY3NjQzMiwieSI6MjkyLjEyNTEzNzMyOTEwMTU2fSx=
7IngiOjI0MS43MTU2MzM2NDY2NDcxMiwieSI6MjkyLjEyNTEzNzMyOTEwMTU2fSx7IngiOjI0MS=
43MTU2MzM2NDY2NDcxMiwieSI6MzEyLjEyNTEzNzMyOTEwMTU2fV0=3D" data-look=3D"clas=
sic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M373.129=
0033976237,231.6629840550413L373.1290033976237,231.66300201416016L373.12900=
33976237,272.12513732910156L373.1290033976237,285.0540695172361Q373.1290033=
976237,292.12513732910156 366.05793558575823,292.12513732910156L307.4169097=
9184597,292.12513732910156Q300.3458419799805,292.12513732910156 300.3458419=
799805,299.19620514096704L300.3458419799805,308.12513732910156" id=3D"my-sv=
g-L_ws_src_gensdk_0" class=3D"edge-thickness-normal edge-pattern-solid edge=
-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=
=3D"true" data-et=3D"edge" data-id=3D"L_ws_src_gensdk_0" data-points=3D"W3s=
ieCI6MzczLjEyOTAwMzM5NzYyMzcsInkiOjIzMS42NjI5ODQwNTUwNDEzfSx7IngiOjM3My4xMj=
kwMDMzOTc2MjM3LCJ5IjoyMzEuNjYzMDAyMDE0MTYwMTZ9LHsieCI6MzczLjEyOTAwMzM5NzYyM=
zcsInkiOjI3Mi4xMjUxMzczMjkxMDE1Nn0seyJ4IjozNzMuMTI5MDAzMzk3NjIzNywieSI6Mjky=
LjEyNTEzNzMyOTEwMTU2fSx7IngiOjMwMC4zNDU4NDE5Nzk5ODA1LCJ5IjoyOTIuMTI1MTM3MzI=
5MTAxNTZ9LHsieCI6MzAwLjM0NTg0MTk3OTk4MDUsInkiOjMxMi4xMjUxMzczMjkxMDE1Nn1d" =
data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><p=
ath d=3D"M241.71563364664712,360.78813552856445L241.71563364664712,373.7170=
67716699Q241.71563364664712,380.78813552856445 234.64456583478164,380.78813=
552856445L228.92992197853212,380.78813552856445Q221.85885416666665,380.7881=
3552856445 221.85885416666665,387.85920334042993L221.85885416666665,479.451=
1375427246L221.85885416666665,526.4511375427246" id=3D"my-svg-L_gensdk_edit=
_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal=
 edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=
=3D"edge" data-id=3D"L_gensdk_edit_0" data-points=3D"W3sieCI6MjQxLjcxNTYzMz=
Y0NjY0NzEyLCJ5IjozNjAuNzg4MTM1NTI4NTY0NDV9LHsieCI6MjQxLjcxNTYzMzY0NjY0NzEyL=
CJ5IjozODAuNzg4MTM1NTI4NTY0NDV9LHsieCI6MjIxLjg1ODg1NDE2NjY2NjY1LCJ5IjozODAu=
Nzg4MTM1NTI4NTY0NDV9LHsieCI6MjIxLjg1ODg1NDE2NjY2NjY1LCJ5Ijo0NzkuNDUxMTM3NTQ=
yNzI0Nn0seyJ4IjoyMjEuODU4ODU0MTY2NjY2NjUsInkiOjUzMC40NTExMzc1NDI3MjQ2fV0=3D=
" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/>=
<path d=3D"M221.85885416666662,563.4511375427246L221.85885416666662,586.380=
0697308591Q221.85885416666662,593.4511375427246 228.9299219785321,593.45113=
75427246L235.66857909975556,593.4511375427246Q242.73964691162104,593.451137=
5427246 242.73964691162104,600.5222053545901L242.73964691162104,619.4511375=
427246" id=3D"my-svg-L_edit_build_0" class=3D"edge-thickness-normal edge-pa=
ttern-solid edge-thickness-normal edge-pattern-solid flowchart-link" style=
=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_edit_build_0" data-=
points=3D"W3sieCI6MjIxLjg1ODg1NDE2NjY2NjYyLCJ5Ijo1NjMuNDUxMTM3NTQyNzI0Nn0se=
yJ4IjoyMjEuODU4ODU0MTY2NjY2NjIsInkiOjU5My40NTExMzc1NDI3MjQ2fSx7IngiOjI0Mi43=
Mzk2NDY5MTE2MjEwNCwieSI6NTkzLjQ1MTEzNzU0MjcyNDZ9LHsieCI6MjQyLjczOTY0NjkxMTY=
yMTA0LCJ5Ijo2MjMuNDUxMTM3NTQyNzI0Nn1d" data-look=3D"classic" marker-end=3D"=
url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M242.73964691162104,686.777=
1339416504L242.73964691162104,706.7771339416504" id=3D"my-svg-L_build_deplo=
y_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-norma=
l edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=
=3D"edge" data-id=3D"L_build_deploy_0" data-points=3D"W3sieCI6MjQyLjczOTY0N=
jkxMTYyMTA0LCJ5Ijo2ODYuNzc3MTMzOTQxNjUwNH0seyJ4IjoyNDIuNzM5NjQ2OTExNjIxMDQs=
InkiOjcxMC43NzcxMzM5NDE2NTA0fV0=3D" data-look=3D"classic" marker-end=3D"url=
(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M242.73964691162104,744.777133=
9416504L242.73964691162104,767.7060661297849Q242.73964691162104,774.7771339=
416504 235.66857909975556,774.7771339416504L216.39815114519877,774.77713394=
16504Q209.3270833333333,774.7771339416504 209.3270833333333,781.84820175351=
59L209.3270833333333,800.7771339416504" id=3D"my-svg-L_deploy_debug_0" clas=
s=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-pa=
ttern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge"=
 data-id=3D"L_deploy_debug_0" data-points=3D"W3sieCI6MjQyLjczOTY0NjkxMTYyMT=
A0LCJ5Ijo3NDQuNzc3MTMzOTQxNjUwNH0seyJ4IjoyNDIuNzM5NjQ2OTExNjIxMDQsInkiOjc3N=
C43NzcxMzM5NDE2NTA0fSx7IngiOjIwOS4zMjcwODMzMzMzMzMzLCJ5Ijo3NzQuNzc3MTMzOTQx=
NjUwNH0seyJ4IjoyMDkuMzI3MDgzMzMzMzMzMywieSI6ODA0Ljc3NzEzMzk0MTY1MDR9XQ=3D=
=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)=
"/><path d=3D"M128.06354166666665,804.7771339416504L128.06354166666665,781.=
8482017535159Q128.06354166666665,774.7771339416504 120.99247385480118,774.7=
771339416504L101.72204590024435,774.7771339416504Q94.65097808837888,774.777=
1339416504 94.65097808837888,767.7060661297849L94.65097808837888,600.522205=
3545901Q94.65097808837888,593.4511375427246 101.72204590024435,593.45113754=
27246L180.18778635480118,593.4511375427246Q187.25885416666665,593.451137542=
7246 187.25885416666665,586.3800697308591L187.25885416666665,567.4511375427=
246" id=3D"my-svg-L_debug_edit_0" class=3D"edge-thickness-normal edge-patte=
rn-solid edge-thickness-normal edge-pattern-solid flowchart-link" style=3D"=
;" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_debug_edit_0" data-poin=
ts=3D"W3sieCI6MTI4LjA2MzU0MTY2NjY2NjY1LCJ5Ijo4MDQuNzc3MTMzOTQxNjUwNH0seyJ4I=
joxMjguMDYzNTQxNjY2NjY2NjUsInkiOjc3NC43NzcxMzM5NDE2NTA0fSx7IngiOjk0LjY1MDk3=
ODA4ODM3ODg4LCJ5Ijo3NzQuNzc3MTMzOTQxNjUwNH0seyJ4Ijo5NC42NTA5NzgwODgzNzg4OCw=
ieSI6NTkzLjQ1MTEzNzU0MjcyNDZ9LHsieCI6MTg3LjI1ODg1NDE2NjY2NjY1LCJ5Ijo1OTMuND=
UxMTM3NTQyNzI0Nn0seyJ4IjoxODcuMjU4ODU0MTY2NjY2NjUsInkiOjU2My40NTExMzc1NDI3M=
jQ2fV0=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-poi=
ntEnd)"/><path d=3D"M256.45885416666664,563.4511375427246L256.4588541666666=
4,586.3800697308591Q256.45885416666664,593.4511375427246 263.5299219785321,=
593.4511375427246L333.70034993308894,593.4511375427246Q340.7714177449544,59=
3.4511375427246 340.7714177449544,600.5222053545901L340.7714177449544,887.4=
401321411133L340.7714177449544,980.4401321411133" id=3D"my-svg-L_edit_finis=
h_0" class=3D"edge-thickness-normal edge-pattern-dotted edge-thickness-norm=
al edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-e=
t=3D"edge" data-id=3D"L_edit_finish_0" data-points=3D"W3sieCI6MjU2LjQ1ODg1N=
DE2NjY2NjY0LCJ5Ijo1NjMuNDUxMTM3NTQyNzI0Nn0seyJ4IjoyNTYuNDU4ODU0MTY2NjY2NjQs=
InkiOjU5My40NTExMzc1NDI3MjQ2fSx7IngiOjM0MC43NzE0MTc3NDQ5NTQ0LCJ5Ijo1OTMuNDU=
xMTM3NTQyNzI0Nn0seyJ4IjozNDAuNzcxNDE3NzQ0OTU0NCwieSI6ODg3LjQ0MDEzMjE0MTExMz=
N9LHsieCI6MzQwLjc3MTQxNzc0NDk1NDQsInkiOjk4NC40NDAxMzIxNDExMTMzfV0=3D" data-=
look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=
=3D"M300.3458419799805,360.78813552856445L300.3458419799805,373.71706771669=
9Q300.3458419799805,380.78813552856445 307.41690979184597,380.7881355285644=
5L366.05793558575823,380.78813552856445Q373.1290033976237,380.7881355285644=
5 373.1290033976237,387.85920334042993L373.1290033976237,400.78813552856445=
" id=3D"my-svg-L_gensdk_rerun_note_0" class=3D"edge-thickness-normal edge-p=
attern-dotted edge-thickness-normal edge-pattern-solid flowchart-link" styl=
e=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_gensdk_rerun_note_=
0" data-points=3D"W3sieCI6MzAwLjM0NTg0MTk3OTk4MDUsInkiOjM2MC43ODgxMzU1Mjg1N=
jQ0NX0seyJ4IjozMDAuMzQ1ODQxOTc5OTgwNSwieSI6MzgwLjc4ODEzNTUyODU2NDQ1fSx7Ingi=
OjM3My4xMjkwMDMzOTc2MjM3LCJ5IjozODAuNzg4MTM1NTI4NTY0NDV9LHsieCI6MzczLjEyOTA=
wMzM5NzYyMzcsInkiOjQwMC43ODgxMzU1Mjg1NjQ0NX1d" data-look=3D"classic"/></g><=
g class=3D"edgeLabels"><g class=3D"edgeLabel" transform=3D"translate(333.06=
84120178222, 94.5)"><g class=3D"label" data-id=3D"L_modify_ws_src_0" transf=
orm=3D"translate(0, -10.829999923706055)"><g><rect class=3D"background" sty=
le=3D"" x=3D"-22.484375" y=3D"2.3299999237060547" width=3D"44.96875" height=
=3D"17"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" st=
yle=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1=
.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">extracts</tspan></tspan></text></g></g></g=
><g class=3D"edgeLabel" transform=3D"translate(221.57748972574868, 420.1196=
3653564453)"><g class=3D"label" data-id=3D"L_gensdk_edit_0" transform=3D"tr=
anslate(-0.16394805908203125, -10.829999923706055)"><g><rect class=3D"backg=
round" style=3D"" x=3D"-41.5546875" y=3D"2.3299999237060547" width=3D"83.43=
727111816406" height=3D"17"/><text xml:space=3D"preserve" y=3D"-10.1" text-=
anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"norma=
l" class=3D"text-inner-tspan" font-weight=3D"normal">one-time</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> s=
etup</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"=
translate(94.44531249999997, 655.1141357421875)"><g class=3D"label" data-id=
=3D"L_debug_edit_0" transform=3D"translate(-0.14589691162109375, -10.829999=
923706055)"><g><rect class=3D"background" style=3D"" x=3D"-18.1484375" y=3D=
"2.3299999237060547" width=3D"36.58866882324219" height=3D"17"/><text xml:s=
pace=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan clas=
s=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D=
"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weigh=
t=3D"normal">repeat</tspan></tspan></text></g></g></g><g class=3D"edgeLabel=
" transform=3D"translate(340.3709737141927, 935.9401321411133)"><g class=3D=
"label" data-id=3D"L_edit_finish_0" transform=3D"translate(-0.0370559692382=
8125, -10.829999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-=
31.0625" y=3D"2.3299999237060547" width=3D"62.19911193847656" height=3D"17"=
/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D"=
"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" t=
ext-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal">when</tspan><tspan font-style=3D"normal" class=3D=
"text-inner-tspan" font-weight=3D"normal"> done</tspan></tspan></text></g><=
/g></g></g><g class=3D"nodes"><g class=3D"node default orange" id=3D"my-svg=
-flowchart-modify-0" data-look=3D"classic" transform=3D"translate(297.49392=
87821452, 29)"><rect class=3D"basic label-container" style=3D"fill:#ffbe6f =
!important;stroke:#ffa348 !important;stroke-width:1px !important" x=3D"-116=
.72344970703125" y=3D"-17" width=3D"233.4468994140625" height=3D"34"/><g cl=
ass=3D"label" style=3D"color:#000000 !important" transform=3D"translate(0, =
-7)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><text xml=
:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan cl=
ass=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">devtool<=
/tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> modify</tspan><tspan font-style=3D"normal" class=3D"text-inner=
-tspan" font-weight=3D"normal"> recipe</tspan><tspan font-style=3D"normal" =
class=3D"text-inner-tspan" font-weight=3D"normal"> --debug-build</tspan></t=
span></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-ws=
_appends-1" data-look=3D"classic" transform=3D"translate(169.5276926676432,=
 212.83150100708008)"><polygon points=3D"0,0 145.20262145996094,0 145.20262=
145996094,-23 0,-23 0,0 -8,0 153.20262145996094,0 153.20262145996094,-23 -8=
,-23 -8,0" class=3D"label-container" transform=3D"translate(-72.60131072998=
047,11.5)" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;strok=
e-width:1px !important"/><g class=3D"label" style=3D"color:#000000 !importa=
nt" transform=3D"translate(0, -6.5)"><rect/><g><rect class=3D"background" s=
tyle=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fi=
ll:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-=
0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan"=
 font-weight=3D"normal">appends/recipe.bbappend</tspan></tspan></text></g><=
/g></g><g class=3D"node default green" id=3D"my-svg-flowchart-ws_src-2" dat=
a-look=3D"classic" transform=3D"translate(373.1290033976237, 212.8315010070=
8008)"><polygon points=3D"0,0 130,0 130,-37.66300010681152 0,-37.6630001068=
1152 0,0 -8,0 138,0 138,-37.66300010681152 -8,-37.66300010681152 -8,0" clas=
s=3D"label-container" transform=3D"translate(-65,18.83150005340576)" style=
=3D"fill:#8ff0a4 !important;stroke:#57e389 !important;stroke-width:1px !imp=
ortant"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D=
"translate(0, -13.831500053405762)"><rect/><g><rect class=3D"background" st=
yle=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fil=
l:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0=
.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal">sources/recipe</tspan></tspan><tspan class=3D"text-o=
uter-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal"=
 class=3D"text-inner-tspan" font-weight=3D"normal">(extracted</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> h=
ere)</tspan></tspan></text></g></g></g><g class=3D"node default orange" id=
=3D"my-svg-flowchart-gensdk-3" data-look=3D"classic" transform=3D"translate=
(271.03073781331375, 336.456636428833)"><rect class=3D"basic label-containe=
r" style=3D"fill:#ffbe6f !important;stroke:#ffa348 !important;stroke-width:=
1px !important" x=3D"-97.9453125" y=3D"-24.33150005340576" width=3D"195.890=
625" height=3D"48.66300010681152"/><g class=3D"label" style=3D"color:#00000=
0 !important" transform=3D"translate(0, -14.331500053405762)"><rect/><g><re=
ct class=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve=
" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-=
tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> ide-sd=
k</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weigh=
t=3D"normal"> recipe</tspan><tspan font-style=3D"normal" class=3D"text-inne=
r-tspan" font-weight=3D"normal"> image</tspan></tspan><tspan class=3D"text-=
outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal">(generate</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> S=
DK</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> +</tspan><tspan font-style=3D"normal" class=3D"text-inner-ts=
pan" font-weight=3D"normal"> IDE</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> config)</tspan></tspan></text=
></g></g></g><g class=3D"node default green" id=3D"my-svg-flowchart-edit-4"=
 data-look=3D"classic" transform=3D"translate(221.85885416666665, 546.95113=
75427246)"><rect class=3D"basic label-container" style=3D"fill:#8ff0a4 !imp=
ortant;stroke:#57e389 !important;stroke-width:1px !important" x=3D"-80" y=
=3D"-16.5" width=3D"160" height=3D"33"/><g class=3D"label" style=3D"color:#=
000000 !important" transform=3D"translate(0, -6.5)"><rect/><g><rect class=
=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-=
10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan ro=
w" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal">Edit</tspan><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal"> source</tspan><ts=
pan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"=
> code</tspan></tspan></text></g></g></g><g class=3D"node default green" id=
=3D"my-svg-flowchart-build-5" data-look=3D"classic" transform=3D"translate(=
242.73964691162107, 655.1141357421875)"><rect class=3D"basic label-containe=
r" style=3D"fill:#8ff0a4 !important;stroke:#57e389 !important;stroke-width:=
1px !important" x=3D"-80" y=3D"-31.66299819946289" width=3D"160" height=3D"=
63.32599639892578"/><g class=3D"label" style=3D"color:#000000 !important" t=
ransform=3D"translate(0, -21.66299819946289)"><rect/><g><rect class=3D"back=
ground" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" st=
yle=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"=
0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">Build</tspan></tspan><tspan class=3D"text-=
outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal">(build</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> tool=
</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> called</tspan></tspan><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-=
inner-tspan" font-weight=3D"normal">directly</tspan><tspan font-style=3D"no=
rmal" class=3D"text-inner-tspan" font-weight=3D"normal"> by</tspan><tspan f=
ont-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> the=
</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> IDE)</tspan></tspan></text></g></g></g><g class=3D"node defaul=
t green" id=3D"my-svg-flowchart-deploy-6" data-look=3D"classic" transform=
=3D"translate(242.73964691162107, 727.7771339416504)"><rect class=3D"basic =
label-container" style=3D"fill:#8ff0a4 !important;stroke:#57e389 !important=
;stroke-width:1px !important" x=3D"-80" y=3D"-17" width=3D"160" height=3D"3=
4"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D"tran=
slate(0, -7)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/>=
<text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important">=
<tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><ts=
pan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"=
>Deploy</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font=
-weight=3D"normal"> to</tspan><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal"> target</tspan></tspan></text></g></g></g=
><g class=3D"node default green" id=3D"my-svg-flowchart-debug-7" data-look=
=3D"classic" transform=3D"translate(168.6953125, 829.1086330413818)"><rect =
class=3D"basic label-container" style=3D"fill:#8ff0a4 !important;stroke:#57=
e389 !important;stroke-width:1px !important" x=3D"-132.6953125" y=3D"-24.33=
150005340576" width=3D"265.390625" height=3D"48.66300010681152"/><g class=
=3D"label" style=3D"color:#000000 !important" transform=3D"translate(0, -14=
.331500053405762)"><rect/><g><rect class=3D"background" style=3D"stroke: no=
ne"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !import=
ant"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em=
"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"no=
rmal">Debug</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal"> remotely</tspan></tspan><tspan class=3D"text-outer-=
tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal">(e.g.</tspan><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> GDB/LLDB</t=
span><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal"> +</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal"> gdbserver/lldb-server)</tspan></tspan></text></g></=
g></g><g class=3D"node default orange" id=3D"my-svg-flowchart-finish-8" dat=
a-look=3D"classic" transform=3D"translate(340.7714177449544, 1008.771631240=
8447)"><rect class=3D"basic label-container" style=3D"fill:#ffbe6f !importa=
nt;stroke:#ffa348 !important;stroke-width:1px !important" x=3D"-91.4296875"=
 y=3D"-24.33150005340576" width=3D"182.859375" height=3D"48.66300010681152"=
/><g class=3D"label" style=3D"color:#000000 !important" transform=3D"transl=
ate(0, -14.331500053405762)"><rect/><g><rect class=3D"background" style=3D"=
stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#0000=
00 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" d=
y=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">devtool</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> finish</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> recipe</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> l=
ayer</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em"=
 dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal">(turn</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> changes</tspan><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal"> into</tspan><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> pa=
tches)</tspan></tspan></text></g></g></g><g class=3D"node default note" id=
=3D"my-svg-flowchart-rerun_note-9" data-look=3D"classic" transform=3D"trans=
late(373.1290033976237, 420.11963653564453)"><g class=3D"basic label-contai=
ner outer-path" transform=3D"translate(4.83287501335144,0)"><path d=3D"M-74=
.66575002670288 -19.33150005340576 C-71.81081832369532 -13.621636647390641,=
 -68.95588662068776 -7.911773241375522, -65 0 C-68.41475458107954 6.8295091=
62159082, -71.82950916215908 13.659018324318165, -74.66575002670288 19.3315=
0005340576 C-42.14355957053174 19.33150005340576, -9.621369114360604 19.331=
50005340576, 65 19.33150005340576 C65 5.070088766914385, 65 -9.191322519576=
993, 65 -19.33150005340576 C14.73133435747387 -19.33150005340576, -35.53733=
128505226 -19.33150005340576, -74.66575002670288 -19.33150005340576" stroke=
=3D"none" stroke-width=3D"0" fill=3D"#f6f5f4" style=3D"fill:#f6f5f4 !import=
ant;stroke:#c0bfbc !important;stroke-width:1px !important"/><path d=3D"M-74=
.66575002670288 -19.33150005340576 C-72.7068635475771 -15.41372709515419, -=
70.7479770684513 -11.495954136902618, -65 0 M-74.66575002670288 -19.3315000=
5340576 C-71.4714319250667 -12.9428638501334, -68.27711382343051 -6.5542276=
46861037, -65 0 M-65 0 C-68.22327074297088 6.4465414859417525, -71.44654148=
594175 12.893082971883505, -74.66575002670288 19.33150005340576 M-65 0 C-67=
.61763053044977 5.235261060899553, -70.23526106089955 10.470522121799107, -=
74.66575002670288 19.33150005340576 M-74.66575002670288 19.33150005340576 C=
-30.467000641108264 19.33150005340576, 13.731748744486353 19.33150005340576=
, 65 19.33150005340576 M-74.66575002670288 19.33150005340576 C-44.895367057=
66545 19.33150005340576, -15.124984088628018 19.33150005340576, 65 19.33150=
005340576 M65 19.33150005340576 C65 7.155197923932967, 65 -5.02110420553982=
8, 65 -19.33150005340576 M65 19.33150005340576 C65 8.673802657021279, 65 -1=
.9838947393632047, 65 -19.33150005340576 M65 -19.33150005340576 C25.4668485=
6712566 -19.33150005340576, -14.066302865748682 -19.33150005340576, -74.665=
75002670288 -19.33150005340576 M65 -19.33150005340576 C29.464748686343484 -=
19.33150005340576, -6.070502627313033 -19.33150005340576, -74.6657500267028=
8 -19.33150005340576" stroke=3D"#c0bfbc" stroke-width=3D"1" fill=3D"none" s=
troke-dasharray=3D"0 0" style=3D"fill:#f6f5f4 !important;stroke:#c0bfbc !im=
portant;stroke-width:1px !important"/></g><g class=3D"label" style=3D"color=
:#5e5c64 !important" transform=3D"translate(4.791706800460815, -17.66149997=
7111816)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><tex=
t xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#5e5c64 !important"><tsp=
an class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">rer=
un</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> only</tspan><tspan font-style=3D"normal" class=3D"text-inner=
-tspan" font-weight=3D"normal"> if</tspan><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal"> recipe</tspan></tspan><tspan=
 class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">deps/con=
fig</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal"> change</tspan></tspan></text></g></g></g></g></g></g><defs>=
<filter id=3D"my-svg-drop-shadow" height=3D"130%" width=3D"130%"><feDropSha=
dow dx=3D"4" dy=3D"4" stdDeviation=3D"0" flood-opacity=3D"0.06" flood-color=
=3D"#000000"/></filter></defs><defs><filter id=3D"my-svg-drop-shadow-small"=
 height=3D"150%" width=3D"150%"><feDropShadow dx=3D"2" dy=3D"2" stdDeviatio=
n=3D"0" flood-opacity=3D"0.06" flood-color=3D"#000000"/></filter></defs><li=
nearGradient id=3D"my-svg-gradient" gradientUnits=3D"objectBoundingBox" x1=
=3D"0%" y1=3D"0%" x2=3D"100%" y2=3D"0%"><stop offset=3D"0%" stop-color=3D"#=
62a0ea" stop-opacity=3D"1"/><stop offset=3D"100%" stop-color=3D"hsl(92.7272=
727273, 35.8620689655%, 67.2549019608%)" stop-opacity=3D"1"/></linearGradie=
nt></svg>
\ No newline at end of file
diff --git a/documentation/sphinx-static/theme_overrides.css b/documentatio=
n/sphinx-static/theme_overrides.css
index f9e067239..9c4b23f06 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -96,6 +96,11 @@ em {
   color: #444;
 }
=20
+/* Scale with the page, but never beyond the size the text is meant for */
+img.max-natural-size {
+    max-width: max-content;
+}
+
 [alt=3D'Permalink'] { color: #eee; }
 [alt=3D'Permalink']:hover { color: black; }
=20
--=20
2.56.0


