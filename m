Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2847.1792485847520821550
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2026 01:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=I5Kg3TqN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202610200844030e4cb2b29e00020742-4b_e5d@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610200844030e4cb2b29e00020742
        for <docs@lists.yoctoproject.org>;
        Tue, 20 Oct 2026 10:44:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ab3JCK5Z7FtDnLkDEvAGb2IvNNQi940f7QrP5KV3yLg=;
 b=I5Kg3TqNnSdPtaLk8kINChlgpLFRzCnBkd+g16GhHP1MbvigRBDvTlNvhBvtY1CH0M/2Cc
 g+7yw0C/5ERDpIWB3gpgD2Kf7XxD0oqdcfYWvTk4QmbbbjnLQs1zYvZfOtmSZ55vjZMAiWSO
 GcOFe9NRJ877W/65uphdFj98tfwjmjG++LXfgH6J/Pk283UTtffglM1P5D2MZmfKHs731aEx
 Q9TUWAV+WCB/qWaaZiKKe+2P+cjVE2MHHOOSnRlm9o+lJsSkt1nv/Mp39pTb/NcLPYKqU7Xe
 G/wZ8lJQ0ROKncdF2eh+quTPqun6BJJgn9TB8yrMqB9aRTPM7XaRnmLw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 3/4] dev-manual/devtool: add diagrams for the ide-sdk workflow and architecture
Date: Tue, 20 Oct 2026 10:43:39 +0200
Message-ID: <20261020084359.354498-4-adrian.freihofer@siemens.com>
In-Reply-To: <20261020084359.354498-1-adrian.freihofer@siemens.com>
References: <20261020084359.354498-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2026 08:44:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10696
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add three diagrams to the devtool ide-sdk section: a typical usage
workflow, the architecture of the SDK/IDE relationship, and a variant
of the architecture for the --nfs=3Drootfs-dbg mode.

The diagrams are Mermaid (.mmd) flowcharts, kept as the maintainable
source next to the pre-rendered SVGs that the documentation includes,
so building the documentation needs no Mermaid tooling. The command to
regenerate an SVG is documented at the top of each .mmd file. The
Mermaid configuration in each .mmd follows the documentation SVG
policy (GNOME HIG colors, Nimbus Sans 10pt text, rounded boxes, no
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
 .../figures/devtool-ide-sdk-workflow.mmd      | 76 ++++++++++++++++
 .../figures/devtool-ide-sdk-workflow.svg      |  1 +
 .../sphinx-static/theme_overrides.css         |  5 ++
 8 files changed, 281 insertions(+), 3 deletions(-)
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
index 3f716515f..15e7dbb73 100644
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
+.. figure:: figures/devtool-ide-sdk-workflow.*
+   :width: 100%
+   :align: center
+   :class: max-natural-size
+
+   Typical ``devtool ide-sdk`` use case
=20
 Let's now take a closer look at how ``devtool ide-sdk`` and the generated =
IDE
 configuration make use of a regular ``bitbake`` environment as a SDK to
@@ -542,7 +549,14 @@ The same architecture also allows the IDE to be config=
ured to use further
 tools beyond the build tool, cross-compiler and debugger, e.g.
 ``clang-tidy``: any such tool just needs to be added as a native tool in
 ``recipe-sysroot-native``, in the Yocto reproducible way, for
-``devtool ide-sdk`` to be able to point the IDE at it.
+``devtool ide-sdk`` to be able to point the IDE at it:
+
+.. figure:: figures/devtool-ide-sdk-architecture.*
+   :width: 100%
+   :align: center
+   :class: max-natural-size
+
+   Architecture of ``devtool ide-sdk``
=20
 To summarize the design described above, for supported build systems
 modified mode brings two key benefits:
@@ -722,7 +736,14 @@ This changes the relationship between the SDK, the tar=
get device and the
 debug symbols compared to the architecture described above: instead of a
 separate ``rootfs`` booted by the target and a ``rootfs-dbg`` only
 consulted by the debugger on the host, both the target and the debugger
-now use the same NFS-exported ``rootfs-dbg``.
+now use the same NFS-exported ``rootfs-dbg``:
+
+.. figure:: figures/devtool-ide-sdk-nfs-architecture.*
+   :width: 100%
+   :align: center
+   :class: max-natural-size
+
+   Architecture of ``devtool ide-sdk --nfs=3Drootfs-dbg``
=20
 Use ``--nfs-extract-dir=3DDIR`` to extract below ``DIR/<image-recipe>/``
 instead of the default location in the ``devtool`` workspace, for example =
when
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-architecture.=
mmd b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
new file mode 100644
index 000000000..4ba2e7e7a
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
@@ -0,0 +1,84 @@
+---
+config:
+  theme: base
+  look: classic
+  htmlLabels: false
+  fontFamily: '"Nimbus Sans", Helvetica, Arial, sans-serif'
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
+            builddir[["B (build directory)<br/>build artifacts"]]
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
index 000000000..09ba0551c
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-architecture.svg
@@ -0,0 +1 @@
+<svg id=3D"my-svg" width=3D"830.0081176757812" xmlns=3D"http://www.w3.org/=
2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/xlink" class=3D"flowchart" =
height=3D"1614.60791015625" viewBox=3D"4 3.999998092651367 830.008117675781=
2 1614.60791015625" role=3D"graphics-document document" aria-roledescriptio=
n=3D"flowchart-v2" style=3D"background-color: transparent;"><style>#my-svg{=
font-family:"Nimbus Sans",Helvetica,Arial,sans-serif;font-size:13.33px;fill=
:#000000;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyfr=
ames dash{to{stroke-dashoffset:0;}}#my-svg .edge-animation-slow{stroke-dash=
array:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinit=
e;stroke-linecap:round;}#my-svg .edge-animation-fast{stroke-dasharray:9,5!i=
mportant;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-li=
necap:round;}#my-svg .error-icon{fill:hsl(32.7272727273, 75.8620689655%, 82=
.2549019608%);}#my-svg .error-text{fill:rgb(10.9224137931, 42.1293103448, 7=
9.5775862068);stroke:rgb(10.9224137931, 42.1293103448, 79.5775862068);}#my-=
svg .edge-thickness-normal{stroke-width:1px;}#my-svg .edge-thickness-thick{=
stroke-width:3.5px;}#my-svg .edge-pattern-solid{stroke-dasharray:0;}#my-svg=
 .edge-thickness-invisible{stroke-width:0;fill:none;}#my-svg .edge-pattern-=
dashed{stroke-dasharray:3;}#my-svg .edge-pattern-dotted{stroke-dasharray:2;=
}#my-svg .marker{fill:#000000;stroke:#000000;}#my-svg .marker.cross{stroke:=
#000000;}#my-svg svg{font-family:"Nimbus Sans",Helvetica,Arial,sans-serif;f=
ont-size:13.33px;}#my-svg p{margin:0;}#my-svg .label{font-family:"Nimbus Sa=
ns",Helvetica,Arial,sans-serif;color:#000000;}#my-svg .cluster-label text{f=
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
center;max-width:200px;padding:2px;font-family:"Nimbus Sans",Helvetica,Aria=
l,sans-serif;font-size:12px;background:hsl(32.7272727273, 75.8620689655%, 8=
2.2549019608%);border:1px solid hsl(32.7272727273, 35.8620689655%, 72.25490=
19608%);border-radius:2px;pointer-events:none;z-index:100;}#my-svg .flowcha=
rtTitleText{text-anchor:middle;font-size:18px;fill:#000000;}#my-svg rect.te=
xt{fill:none;stroke-width:0;}#my-svg .icon-shape,#my-svg .image-shape{backg=
round-color:#ffffff;text-align:center;}#my-svg .icon-shape p,#my-svg .image=
-shape p{background-color:#ffffff;padding:2px;}#my-svg .icon-shape .label r=
ect,#my-svg .image-shape .label rect{opacity:0.5;background-color:#ffffff;f=
ill:#ffffff;}#my-svg .label-icon{display:inline-block;height:1em;overflow:v=
isible;vertical-align:-0.125em;}#my-svg .node .label-icon path{fill:current=
Color;stroke:revert;stroke-width:revert;}#my-svg .node .neo-node{stroke:#62=
a0ea;}#my-svg [data-look=3D"neo"].node rect,#my-svg [data-look=3D"neo"].clu=
ster rect,#my-svg [data-look=3D"neo"].node polygon{stroke:url(#my-svg-gradi=
ent);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [data-lo=
ok=3D"neo"].swimlane.cluster rect{filter:none;}#my-svg [data-look=3D"neo"].=
node path{stroke:url(#my-svg-gradient);stroke-width:1px;}#my-svg [data-look=
=3D"neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185=
,1));}#my-svg [data-look=3D"neo"].node .neo-line path{stroke:#62a0ea;filter=
:none;}#my-svg [data-look=3D"neo"].node circle{stroke:url(#my-svg-gradient)=
;filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [data-look=
=3D"neo"].node circle .state-start{fill:#000000;}#my-svg [data-look=3D"neo"=
].icon-shape .icon{fill:url(#my-svg-gradient);filter:drop-shadow( 1px 2px 2=
px rgba(185,185,185,1));}#my-svg [data-look=3D"neo"].icon-shape .icon-neo p=
ath{stroke:url(#my-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,1=
85,185,1));}#my-svg .cluster-label tspan{font-weight:bold;}#my-svg rect{rx:=
7.5px;ry:7.5px;}#my-svg :root{--mermaid-font-family:"Nimbus Sans",Helvetica=
,Arial,sans-serif;}#my-svg .orange rect{fill:rgb(255, 190, 111)!important;s=
troke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(0, 0=
, 0)!important;}#my-svg .orange polygon{fill:rgb(255, 190, 111)!important;s=
troke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(0, 0=
, 0)!important;}#my-svg .orange ellipse{fill:rgb(255, 190, 111)!important;s=
troke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(0, 0=
, 0)!important;}#my-svg .orange circle{fill:rgb(255, 190, 111)!important;st=
roke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(0, 0,=
 0)!important;}#my-svg .orange path{fill:rgb(255, 190, 111)!important;strok=
e:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(0, 0, 0)=
!important;}#my-svg .orange tspan{fill:rgb(0, 0, 0)!important;}#my-svg .gre=
en rect{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!importan=
t;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green p=
olygon{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!important=
;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green el=
lipse{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!important;=
stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green cir=
cle{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!important;st=
roke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green path{=
fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!important;stroke=
-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green tspan{fil=
l:rgb(0, 0, 0)!important;}#my-svg .default rect{fill:rgb(153, 193, 241)!imp=
ortant;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;color:=
rgb(0, 0, 0)!important;}#my-svg .default polygon{fill:rgb(153, 193, 241)!im=
portant;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;color=
:rgb(0, 0, 0)!important;}#my-svg .default ellipse{fill:rgb(153, 193, 241)!i=
mportant;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;colo=
r:rgb(0, 0, 0)!important;}#my-svg .default circle{fill:rgb(153, 193, 241)!i=
mportant;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;colo=
r:rgb(0, 0, 0)!important;}#my-svg .default path{fill:rgb(153, 193, 241)!imp=
ortant;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;color:=
rgb(0, 0, 0)!important;}#my-svg .default tspan{fill:rgb(0, 0, 0)!important;=
}</style><g><marker id=3D"my-svg_flowchart-v2-pointEnd" class=3D"marker flo=
wchart-v2" viewBox=3D"0 0 10 10" refX=3D"5" refY=3D"5" markerUnits=3D"userS=
paceOnUse" markerWidth=3D"8" markerHeight=3D"8" orient=3D"auto"><path d=3D"=
M 0 0 L 10 5 L 0 10 z" class=3D"arrowMarkerPath" style=3D"stroke-width: 1; =
stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-pointS=
tart" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"4.5" refY=
=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"8" markerHeight=3D"8" =
orient=3D"auto"><path d=3D"M 0 5 L 10 10 L 10 0 z" class=3D"arrowMarkerPath=
" style=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=
=3D"my-svg_flowchart-v2-pointEnd-margin" class=3D"marker flowchart-v2" view=
Box=3D"0 0 11.5 14" refX=3D"11.5" refY=3D"7" markerUnits=3D"userSpaceOnUse"=
 markerWidth=3D"10.5" markerHeight=3D"14" orient=3D"auto"><path d=3D"M 0 0 =
L 11.5 7 L 0 14 z" class=3D"arrowMarkerPath" style=3D"stroke-width: 0; stro=
ke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-pointStart=
-margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 11.5 14" refX=3D"1" r=
efY=3D"7" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11.5" markerHeight=
=3D"14" orient=3D"auto"><polygon points=3D"0,7 11.5,14 11.5,0" class=3D"arr=
owMarkerPath" style=3D"stroke-width: 0; stroke-dasharray: 1, 0;"/></marker>=
<marker id=3D"my-svg_flowchart-v2-circleEnd" class=3D"marker flowchart-v2" =
viewBox=3D"0 0 10 10" refX=3D"11" refY=3D"5" markerUnits=3D"userSpaceOnUse"=
 markerWidth=3D"11" markerHeight=3D"11" orient=3D"auto"><circle cx=3D"5" cy=
=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: 1; stroke-d=
asharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-circleStart" c=
lass=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"-1" refY=3D"5" m=
arkerUnits=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=
=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=
=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-sv=
g_flowchart-v2-circleEnd-margin" class=3D"marker flowchart-v2" viewBox=3D"0=
 0 10 10" refY=3D"5" refX=3D"12.25" markerUnits=3D"userSpaceOnUse" markerWi=
dth=3D"14" markerHeight=3D"14" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=
=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray=
: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-circleStart-margin" cl=
ass=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"-2" refY=3D"5" ma=
rkerUnits=3D"userSpaceOnUse" markerWidth=3D"14" markerHeight=3D"14" orient=
=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=
=3D"stroke-width: 0; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-sv=
g_flowchart-v2-crossEnd" class=3D"marker cross flowchart-v2" viewBox=3D"0 0=
 11 11" refX=3D"12" refY=3D"5.2" markerUnits=3D"userSpaceOnUse" markerWidth=
=3D"11" markerHeight=3D"11" orient=3D"auto"><path d=3D"M 1,1 l 9,9 M 10,1 l=
 -9,9" class=3D"arrowMarkerPath" style=3D"stroke-width: 2; stroke-dasharray=
: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-crossStart" class=3D"m=
arker cross flowchart-v2" viewBox=3D"0 0 11 11" refX=3D"-1" refY=3D"5.2" ma=
rkerUnits=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=
=3D"auto"><path d=3D"M 1,1 l 9,9 M 10,1 l -9,9" class=3D"arrowMarkerPath" s=
tyle=3D"stroke-width: 2; stroke-dasharray: 1, 0;"/></marker><marker id=3D"m=
y-svg_flowchart-v2-crossEnd-margin" class=3D"marker cross flowchart-v2" vie=
wBox=3D"0 0 15 15" refX=3D"17.7" refY=3D"7.5" markerUnits=3D"userSpaceOnUse=
" markerWidth=3D"12" markerHeight=3D"12" orient=3D"auto"><path d=3D"M 1,1 L=
 14,14 M 1,14 L 14,1" class=3D"arrowMarkerPath" style=3D"stroke-width: 2.5;=
"/></marker><marker id=3D"my-svg_flowchart-v2-crossStart-margin" class=3D"m=
arker cross flowchart-v2" viewBox=3D"0 0 15 15" refX=3D"-3.5" refY=3D"7.5" =
markerUnits=3D"userSpaceOnUse" markerWidth=3D"12" markerHeight=3D"12" orien=
t=3D"auto"><path d=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=3D"arrowMarkerPath=
" style=3D"stroke-width: 2.5; stroke-dasharray: 1, 0;"/></marker><g class=
=3D"root"><g class=3D"clusters"><g class=3D"cluster" id=3D"my-svg-target" d=
ata-look=3D"classic"><rect style=3D"fill:#f6f5f4 !important;stroke:#b5835a =
!important;stroke-width:1px !important" x=3D"413.88625066848033" y=3D"1346.=
2819786071777" width=3D"254" height=3D"264.3259963989258"/><g class=3D"clus=
ter-label" transform=3D"translate(498.55812566848033, 1346.2819786071777)">=
<g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D"pr=
eserve" y=3D"-10.1" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0=
" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inne=
r-tspan" font-weight=3D"normal">Target</tspan><tspan font-style=3D"normal" =
class=3D"text-inner-tspan" font-weight=3D"normal"> device</tspan></tspan></=
text></g></g></g><g class=3D"cluster" id=3D"my-svg-sdk" data-look=3D"classi=
c"><rect style=3D"fill:#f6f5f4 !important;stroke:#3584e4 !important;stroke-=
width:1px !important" x=3D"189.5945431663876" y=3D"393.9889945983887" width=
=3D"631.1328125" height=3D"809.6299896240234"/><g class=3D"cluster-label" t=
ransform=3D"translate(395.4265744163876, 393.9889945983887)"><g><rect class=
=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-=
10.1" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em"=
 dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal">SDK</tspan><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal"> (regular</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> bitbake</tspan><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =
environment)</tspan></tspan></text></g></g></g><g class=3D"cluster" id=3D"m=
y-svg-image_workdir" data-look=3D"classic"><rect style=3D"fill:#ffffff !imp=
ortant;stroke:#57e389 !important;stroke-width:1px !important" x=3D"243.0300=
3423781618" y=3D"1061.2929878234863" width=3D"425.81249999999994" height=3D=
"118.32599639892578"/><g class=3D"cluster-label" transform=3D"translate(402=
.24897497267943, 1061.2929878234863)"><g><rect class=3D"background" style=
=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D""><tsp=
an class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">Ima=
ge</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> WORKDIR</tspan></tspan></text></g></g></g><g class=3D"cluste=
r" id=3D"my-svg-recipe_workdir" data-look=3D"classic"><rect style=3D"fill:#=
ffffff !important;stroke:#62a0ea !important;stroke-width:1px !important" x=
=3D"213.5945431663876" y=3D"444.9889945983887" width=3D"583.1328125" height=
=3D"467.64099884033203"/><g class=3D"cluster-label" transform=3D"translate(=
440.9265744163876, 444.9889945983887)"><g><rect class=3D"background" style=
=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D""><tsp=
an class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">Rec=
ipe</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal"> WORKDIR(s)</tspan></tspan></text></g></g></g></g><g class=
=3D"edges edgePaths"><path d=3D"M244.59787277948288,60.66299819946289L244.5=
9787277948288,73.59193038759742Q244.59787277948288,80.66299819946289 237.52=
68049676174,80.66299819946289L164.67805517468167,80.66299819946289Q157.6069=
873628162,80.66299819946289 157.6069873628162,87.73406601132837L157.6069873=
628162,154.6629981994629" id=3D"my-svg-L_idesdk_ideconfig_0" class=3D"edge-=
thickness-normal edge-pattern-solid edge-thickness-normal edge-pattern-soli=
d flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=
=3D"L_idesdk_ideconfig_0" data-points=3D"W3sieCI6MjQ0LjU5Nzg3Mjc3OTQ4Mjg4LC=
J5Ijo2MC42NjI5OTgxOTk0NjI4OX0seyJ4IjoyNDQuNTk3ODcyNzc5NDgyODgsInkiOjgwLjY2M=
jk5ODE5OTQ2Mjg5fSx7IngiOjE1Ny42MDY5ODczNjI4MTYyLCJ5Ijo4MC42NjI5OTgxOTk0NjI4=
OX0seyJ4IjoxNTcuNjA2OTg3MzYyODE2MiwieSI6MTU4LjY2Mjk5ODE5OTQ2Mjl9XQ=3D=3D" d=
ata-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><pa=
th d=3D"M291.65516444614957,60.66299819946289L291.65516444614957,73.5919303=
8759742Q291.65516444614957,80.66299819946289 298.72623225801505,80.66299819=
946289L480.55107952118885,80.66299819946289Q487.62214733305433,80.662998199=
46289 487.62214733305433,87.73406601132837L487.62214733305433,109.662998199=
46289L487.62214733305433,268.9889945983887L487.62214733305433,334.988994598=
3887L487.62214733305433,356.9179267865232Q487.62214733305433,363.9889945983=
887 480.55107952118885,363.9889945983887L398.0968609782531,363.988994598388=
7Q391.02579316638764,363.9889945983887 391.02579316638764,371.0600624102541=
5L391.02579316638764,389.9889945983887" id=3D"my-svg-L_idesdk_sdk_0" class=
=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-pat=
tern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" =
data-id=3D"L_idesdk_sdk_0" data-points=3D"W3sieCI6MjkxLjY1NTE2NDQ0NjE0OTU3L=
CJ5Ijo2MC42NjI5OTgxOTk0NjI4OX0seyJ4IjoyOTEuNjU1MTY0NDQ2MTQ5NTcsInkiOjgwLjY2=
Mjk5ODE5OTQ2Mjg5fSx7IngiOjQ4Ny42MjIxNDczMzMwNTQzMywieSI6ODAuNjYyOTk4MTk5NDY=
yODl9LHsieCI6NDg3LjYyMjE0NzMzMzA1NDMzLCJ5IjoxMDkuNjYyOTk4MTk5NDYyODl9LHsieC=
I6NDg3LjYyMjE0NzMzMzA1NDMzLCJ5IjoyNjguOTg4OTk0NTk4Mzg4N30seyJ4Ijo0ODcuNjIyM=
TQ3MzMzMDU0MzMsInkiOjMzNC45ODg5OTQ1OTgzODg3fSx7IngiOjQ4Ny42MjIxNDczMzMwNTQz=
MywieSI6MzYzLjk4ODk5NDU5ODM4ODd9LHsieCI6MzkxLjAyNTc5MzE2NjM4NzY0LCJ5IjozNjM=
uOTg4OTk0NTk4Mzg4N30seyJ4IjozOTEuMDI1NzkzMTY2Mzg3NjQsInkiOjM5My45ODg5OTQ1OT=
gzODg3fV0=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-=
pointEnd)"/><path d=3D"M132.7606331961495,211.98899459838867L132.7606331961=
495,225.79912294660298Q132.7606331961495,231.98899459838867 126.57076154436=
382,231.98899459838867L126.57076154436382,231.98899459838867Q120.3808898925=
7811,231.98899459838867 120.38088989257811,238.17886625017437L120.380889892=
57811,247.98899459838867" id=3D"my-svg-L_ideconfig_ide_0" class=3D"edge-thi=
ckness-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid f=
lowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L=
_ideconfig_ide_0" data-points=3D"W3sieCI6MTMyLjc2MDYzMzE5NjE0OTUsInkiOjIxMS=
45ODg5OTQ1OTgzODg2N30seyJ4IjoxMzIuNzYwNjMzMTk2MTQ5NSwieSI6MjMxLjk4ODk5NDU5O=
DM4ODY3fSx7IngiOjEyMC4zODA4ODk4OTI1NzgxMSwieSI6MjMxLjk4ODk5NDU5ODM4ODY3fSx7=
IngiOjEyMC4zODA4ODk4OTI1NzgxMSwieSI6MjUxLjk4ODk5NDU5ODM4ODY3fV0=3D" data-lo=
ok=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=
=3D"M182.45334152948283,211.98899459838867L182.45334152948283,224.917926786=
5232Q182.45334152948283,231.98899459838867 189.5244093413483,231.9889945983=
8867L371.95472535452217,231.98899459838867Q379.02579316638764,231.988994598=
38867 379.02579316638764,239.06006241025415L379.02579316638764,268.98899459=
83887L379.02579316638764,334.9889945983887L379.02579316638764,383.988994598=
3887L379.02579316638753,434.9889945983887L379.02579316638753,481.9889945983=
887" id=3D"my-svg-L_ideconfig_native_sysroot_0" class=3D"edge-thickness-nor=
mal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-l=
ink" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_ideconfig=
_native_sysroot_0" data-points=3D"W3sieCI6MTgyLjQ1MzM0MTUyOTQ4MjgzLCJ5IjoyM=
TEuOTg4OTk0NTk4Mzg4Njd9LHsieCI6MTgyLjQ1MzM0MTUyOTQ4MjgzLCJ5IjoyMzEuOTg4OTk0=
NTk4Mzg4Njd9LHsieCI6Mzc5LjAyNTc5MzE2NjM4NzY0LCJ5IjoyMzEuOTg4OTk0NTk4Mzg4Njd=
9LHsieCI6Mzc5LjAyNTc5MzE2NjM4NzY0LCJ5IjoyNjguOTg4OTk0NTk4Mzg4N30seyJ4IjozNz=
kuMDI1NzkzMTY2Mzg3NjQsInkiOjMzNC45ODg5OTQ1OTgzODg3fSx7IngiOjM3OS4wMjU3OTMxN=
jYzODc2NCwieSI6MzgzLjk4ODk5NDU5ODM4ODd9LHsieCI6Mzc5LjAyNTc5MzE2NjM4NzUzLCJ5=
Ijo0MzQuOTg4OTk0NTk4Mzg4N30seyJ4IjozNzkuMDI1NzkzMTY2Mzg3NTMsInkiOjQ4NS45ODg=
5OTQ1OTgzODg3fV0=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowch=
art-v2-pointEnd)"/><path d=3D"M143.71422322591144,285.9889945983887L143.714=
22322591144,298.9179267865232Q143.71422322591144,305.9889945983887 150.7852=
9103777691,305.9889945983887L231.73904455095072,305.9889945983887Q238.81011=
23628162,305.9889945983887 238.8101123628162,313.06006241025415L238.8101123=
628162,356.9179267865232Q238.8101123628162,363.9889945983887 245.8811801746=
8167,363.9889945983887L306.6391003545221,363.9889945983887Q313.710168166387=
6,363.9889945983887 313.7101681663876,371.06006241025415L313.7101681663876,=
383.9889945983887L313.7101681663876,434.9889945983887L313.7101681663875,481=
.9889945983887" id=3D"my-svg-L_ide_native_sysroot_0" class=3D"edge-thicknes=
s-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowch=
art-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_ide_=
native_sysroot_0" data-points=3D"W3sieCI6MTQzLjcxNDIyMzIyNTkxMTQ0LCJ5IjoyOD=
UuOTg4OTk0NTk4Mzg4N30seyJ4IjoxNDMuNzE0MjIzMjI1OTExNDQsInkiOjMwNS45ODg5OTQ1O=
TgzODg3fSx7IngiOjIzOC44MTAxMTIzNjI4MTYyLCJ5IjozMDUuOTg4OTk0NTk4Mzg4N30seyJ4=
IjoyMzguODEwMTEyMzYyODE2MiwieSI6MzYzLjk4ODk5NDU5ODM4ODd9LHsieCI6MzEzLjcxMDE=
2ODE2NjM4NzYsInkiOjM2My45ODg5OTQ1OTgzODg3fSx7IngiOjMxMy43MTAxNjgxNjYzODc2LC=
J5IjozODMuOTg4OTk0NTk4Mzg4N30seyJ4IjozMTMuNzEwMTY4MTY2Mzg3NiwieSI6NDM0Ljk4O=
Dk5NDU5ODM4ODd9LHsieCI6MzEzLjcxMDE2ODE2NjM4NzUsInkiOjQ4NS45ODg5OTQ1OTgzODg3=
fV0=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointE=
nd)"/><path d=3D"M97.04755655924478,285.9889945983887L97.04755655924478,298=
.9179267865232Q97.04755655924478,305.9889945983887 89.9764887473793,305.988=
9945983887L73.03955071039597,305.9889945983887Q65.9684828985305,305.9889945=
983887 65.9684828985305,313.06006241025415L65.9684828985305,334.98899459838=
87L65.9684828985305,1279.950481414795L65.9684828985305,1309.2109107953122Q6=
5.9684828985305,1316.2819786071777 73.03955071039597,1316.2819786071777L89.=
9764887473793,1316.2819786071777Q97.04755655924478,1316.2819786071777 97.04=
755655924478,1323.3530464190433L97.04755655924478,1342.2819786071777" id=3D=
"my-svg-L_ide_srcdir_0" class=3D"edge-thickness-normal edge-pattern-solid e=
dge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-ed=
ge=3D"true" data-et=3D"edge" data-id=3D"L_ide_srcdir_0" data-points=3D"W3si=
eCI6OTcuMDQ3NTU2NTU5MjQ0NzgsInkiOjI4NS45ODg5OTQ1OTgzODg3fSx7IngiOjk3LjA0NzU=
1NjU1OTI0NDc4LCJ5IjozMDUuOTg4OTk0NTk4Mzg4N30seyJ4Ijo2NS45Njg0ODI4OTg1MzA1LC=
J5IjozMDUuOTg4OTk0NTk4Mzg4N30seyJ4Ijo2NS45Njg0ODI4OTg1MzA1LCJ5IjozMzQuOTg4O=
Tk0NTk4Mzg4N30seyJ4Ijo2NS45Njg0ODI4OTg1MzA1LCJ5IjoxMjc5Ljk1MDQ4MTQxNDc5NX0s=
eyJ4Ijo2NS45Njg0ODI4OTg1MzA1LCJ5IjoxMzE2LjI4MTk3ODYwNzE3Nzd9LHsieCI6OTcuMDQ=
3NTU2NTU5MjQ0NzgsInkiOjEzMTYuMjgxOTc4NjA3MTc3N30seyJ4Ijo5Ny4wNDc1NTY1NTkyND=
Q3OCwieSI6MTM0Ni4yODE5Nzg2MDcxNzc3fV0=3D" data-look=3D"classic" marker-end=
=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M276.3869538806733,568.=
6409950256348L276.3869538806733,591.5699272137692Q276.3869538806733,598.640=
9950256348 269.3158860688078,598.6409950256348L261.4466377639673,598.640995=
0256348Q254.37556995210184,598.6409950256348 254.37556995210184,605.7120628=
375003L254.37556995210184,922.6299934387207L254.37556995210184,945.55892562=
68552Q254.37556995210184,952.6299934387207 247.30450214023637,952.629993438=
7207L214.35299937111017,952.6299934387207Q207.2819315592447,952.62999343872=
07 207.2819315592447,959.7010612505861L207.28193155924475,1223.618984222412=
L207.28193155924475,1236.5479164105466Q207.28193155924475,1243.618984222412=
 200.21086374737928,1243.618984222412L197.73581187111023,1243.618984222412Q=
190.66474405924475,1243.618984222412 190.66474405924475,1250.6900520342776L=
190.66474405924475,1309.2109107953122Q190.66474405924475,1316.2819786071777=
 183.59367624737928,1316.2819786071777L179.16618093035504,1316.281978607177=
7Q172.09511311848956,1316.2819786071777 172.09511311848956,1323.35304641904=
33L172.09511311848956,1342.2819786071777" id=3D"my-svg-L_native_sysroot_src=
dir_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-nor=
mal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-=
et=3D"edge" data-id=3D"L_native_sysroot_srcdir_0" data-points=3D"W3sieCI6Mj=
c2LjM4Njk1Mzg4MDY3MzMsInkiOjU2OC42NDA5OTUwMjU2MzQ4fSx7IngiOjI3Ni4zODY5NTM4O=
DA2NzMzLCJ5Ijo1OTguNjQwOTk1MDI1NjM0OH0seyJ4IjoyNTQuMzc1NTY5OTUyMTAxODQsInki=
OjU5OC42NDA5OTUwMjU2MzQ4fSx7IngiOjI1NC4zNzU1Njk5NTIxMDE4NCwieSI6OTIyLjYyOTk=
5MzQzODcyMDd9LHsieCI6MjU0LjM3NTU2OTk1MjEwMTg0LCJ5Ijo5NTIuNjI5OTkzNDM4NzIwN3=
0seyJ4IjoyMDcuMjgxOTMxNTU5MjQ0NywieSI6OTUyLjYyOTk5MzQzODcyMDd9LHsieCI6MjA3L=
jI4MTkzMTU1OTI0NDc1LCJ5IjoxMjIzLjYxODk4NDIyMjQxMn0seyJ4IjoyMDcuMjgxOTMxNTU5=
MjQ0NzUsInkiOjEyNDMuNjE4OTg0MjIyNDEyfSx7IngiOjE5MC42NjQ3NDQwNTkyNDQ3NSwieSI=
6MTI0My42MTg5ODQyMjI0MTJ9LHsieCI6MTkwLjY2NDc0NDA1OTI0NDc1LCJ5IjoxMzE2LjI4MT=
k3ODYwNzE3Nzd9LHsieCI6MTcyLjA5NTExMzExODQ4OTU2LCJ5IjoxMzE2LjI4MTk3ODYwNzE3N=
zd9LHsieCI6MTcyLjA5NTExMzExODQ4OTU2LCJ5IjoxMzQ2LjI4MTk3ODYwNzE3Nzd9XQ=3D=3D=
" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/>=
<path d=3D"M360.36418602353046,568.6409950256348L360.36418602353046,615.569=
9272137692Q360.36418602353046,622.6409950256348 367.43525383539594,622.6409=
950256348L382.2969128545222,622.6409950256348Q389.36798066638767,622.640995=
0256348 389.36798066638767,629.7120628375003L389.36798066638767,690.6409950=
256348" id=3D"my-svg-L_native_sysroot_builddir_0" class=3D"edge-thickness-n=
ormal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart=
-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_=
sysroot_builddir_0" data-points=3D"W3sieCI6MzYwLjM2NDE4NjAyMzUzMDQ2LCJ5Ijo1=
NjguNjQwOTk1MDI1NjM0OH0seyJ4IjozNjAuMzY0MTg2MDIzNTMwNDYsInkiOjYyMi42NDA5OTU=
wMjU2MzQ4fSx7IngiOjM4OS4zNjc5ODA2NjYzODc2NywieSI6NjIyLjY0MDk5NTAyNTYzNDh9LH=
sieCI6Mzg5LjM2Nzk4MDY2NjM4NzY3LCJ5Ijo2OTQuNjQwOTk1MDI1NjM0OH1d" data-look=
=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"=
M388.3565967378162,568.6409950256348L388.3565967378162,603.5699272137692Q38=
8.3565967378162,610.6409950256348 395.42766454968165,610.6409950256348L583.=
7266003545221,610.6409950256348Q590.7976681663877,610.6409950256348 590.797=
6681663877,617.7120628375003L590.7976681663877,690.6409950256348" id=3D"my-=
svg-L_native_sysroot_sysroot_0" class=3D"edge-thickness-normal edge-pattern=
-dotted edge-thickness-normal edge-pattern-solid flowchart-link" style=3D";=
" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_sysroot_sysroot_0=
" data-points=3D"W3sieCI6Mzg4LjM1NjU5NjczNzgxNjIsInkiOjU2OC42NDA5OTUwMjU2Mz=
Q4fSx7IngiOjM4OC4zNTY1OTY3Mzc4MTYyLCJ5Ijo2MTAuNjQwOTk1MDI1NjM0OH0seyJ4Ijo1O=
TAuNzk3NjY4MTY2Mzg3NywieSI6NjEwLjY0MDk5NTAyNTYzNDh9LHsieCI6NTkwLjc5NzY2ODE2=
NjM4NzcsInkiOjY5NC42NDA5OTUwMjU2MzQ4fV0=3D" data-look=3D"classic" marker-en=
d=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M389.36798066638767,73=
3.3039786038389L389.36798066638767,733.3039970397949L389.36798066638767,798=
.2329292279294Q389.36798066638767,805.3039970397949 396.43904847825314,805.=
3039970397949L543.6286836878555,805.3039970397949Q550.699751499721,805.3039=
970397949 550.699751499721,812.3750648516605L550.699751499721,831.303997039=
7949" id=3D"my-svg-L_builddir_destdir_0" class=3D"edge-thickness-normal edg=
e-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-link" st=
yle=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_builddir_destdir=
_0" data-points=3D"W3sieCI6Mzg5LjM2Nzk4MDY2NjM4NzY3LCJ5Ijo3MzMuMzAzOTc4NjAz=
ODM4OX0seyJ4IjozODkuMzY3OTgwNjY2Mzg3NjcsInkiOjczMy4zMDM5OTcwMzk3OTQ5fSx7Ing=
iOjM4OS4zNjc5ODA2NjYzODc2NywieSI6ODA1LjMwMzk5NzAzOTc5NDl9LHsieCI6NTUwLjY5OT=
c1MTQ5OTcyMSwieSI6ODA1LjMwMzk5NzAzOTc5NDl9LHsieCI6NTUwLjY5OTc1MTQ5OTcyMSwie=
SI6ODM1LjMwMzk5NzAzOTc5NDl9XQ=3D=3D" data-look=3D"classic" marker-end=3D"ur=
l(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M581.0476681663876,888.629993=
4387207L581.0476681663876,922.6299934387207L581.0476681663876,945.558925626=
8552Q581.0476681663876,952.6299934387207 588.118735978253,952.6299934387207=
L673.7714664259506,952.6299934387207Q680.8425342378162,952.6299934387207 68=
0.8425342378162,959.7010612505862L680.8425342378162,1223.618984222412L680.8=
425342378162,1242.5041236877441Q680.8425342378162,1243.618984222412 681.957=
3947724841,1243.618984222412L681.9573947724841,1243.618984222412Q683.072255=
3071521,1243.618984222412 683.0722553071521,1244.73384475708L683.0722553071=
521,1309.2109107953122Q683.0722553071521,1316.2819786071777 676.00118749528=
66,1316.2819786071777L616.9573184803459,1316.2819786071777Q609.886250668480=
3,1316.2819786071777 609.8862506684803,1323.3530464190433L609.8862506684802=
,1336.2819786071777L609.8862506684802,1500.873908994775Q609.8862506684802,1=
507.9449768066406 602.8151828566147,1507.9449768066406L594.0239851470124,15=
07.9449768066406Q586.9529173351469,1507.9449768066406 586.9529173351469,151=
5.0160446185062L586.9529173351469,1533.9449768066406" id=3D"my-svg-L_destdi=
r_appbin_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thicknes=
s-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" =
data-et=3D"edge" data-id=3D"L_destdir_appbin_0" data-points=3D"W3sieCI6NTgx=
LjA0NzY2ODE2NjM4NzYsInkiOjg4OC42Mjk5OTM0Mzg3MjA3fSx7IngiOjU4MS4wNDc2NjgxNjY=
zODc2LCJ5Ijo5MjIuNjI5OTkzNDM4NzIwN30seyJ4Ijo1ODEuMDQ3NjY4MTY2Mzg3NiwieSI6OT=
UyLjYyOTk5MzQzODcyMDd9LHsieCI6NjgwLjg0MjUzNDIzNzgxNjIsInkiOjk1Mi42Mjk5OTM0M=
zg3MjA3fSx7IngiOjY4MC44NDI1MzQyMzc4MTYyLCJ5IjoxMjIzLjYxODk4NDIyMjQxMn0seyJ4=
Ijo2ODAuODQyNTM0MjM3ODE2MiwieSI6MTI0My42MTg5ODQyMjI0MTJ9LHsieCI6NjgzLjA3MjI=
1NTMwNzE1MjEsInkiOjEyNDMuNjE4OTg0MjIyNDEyfSx7IngiOjY4My4wNzIyNTUzMDcxNTIxLC=
J5IjoxMzE2LjI4MTk3ODYwNzE3Nzd9LHsieCI6NjA5Ljg4NjI1MDY2ODQ4MDMsInkiOjEzMTYuM=
jgxOTc4NjA3MTc3N30seyJ4Ijo2MDkuODg2MjUwNjY4NDgwMiwieSI6MTMzNi4yODE5Nzg2MDcx=
Nzc3fSx7IngiOjYwOS44ODYyNTA2Njg0ODAyLCJ5IjoxNTA3Ljk0NDk3NjgwNjY0MDZ9LHsieCI=
6NTg2Ljk1MjkxNzMzNTE0NjksInkiOjE1MDcuOTQ0OTc2ODA2NjQwNn0seyJ4Ijo1ODYuOTUyOT=
E3MzM1MTQ2OSwieSI6MTUzNy45NDQ5NzY4MDY2NDA2fV0=3D" data-look=3D"classic" mar=
ker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M416.34900745210=
19,568.6409950256348L416.3490074521019,591.5699272137692Q416.3490074521019,=
598.6409950256348 423.42007526396736,598.6409950256348L765.6562878545221,59=
8.6409950256348Q772.7273556663877,598.6409950256348 772.7273556663877,605.7=
120628375003L772.7273556663877,798.2329292279294Q772.7273556663877,805.3039=
970397949 765.6562878545221,805.3039970397949L618.4666526449198,805.3039970=
397949Q611.3955848330543,805.3039970397949 611.3955848330543,812.3750648516=
605L611.3955848330543,831.3039970397949" id=3D"my-svg-L_native_sysroot_dest=
dir_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-nor=
mal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-=
et=3D"edge" data-id=3D"L_native_sysroot_destdir_0" data-points=3D"W3sieCI6N=
DE2LjM0OTAwNzQ1MjEwMTksInkiOjU2OC42NDA5OTUwMjU2MzQ4fSx7IngiOjQxNi4zNDkwMDc0=
NTIxMDE5LCJ5Ijo1OTguNjQwOTk1MDI1NjM0OH0seyJ4Ijo3NzIuNzI3MzU1NjY2Mzg3NywieSI=
6NTk4LjY0MDk5NTAyNTYzNDh9LHsieCI6NzcyLjcyNzM1NTY2NjM4NzcsInkiOjgwNS4zMDM5OT=
cwMzk3OTQ5fSx7IngiOjYxMS4zOTU1ODQ4MzMwNTQzLCJ5Ijo4MDUuMzAzOTk3MDM5Nzk0OX0se=
yJ4Ijo2MTEuMzk1NTg0ODMzMDU0MywieSI6ODM1LjMwMzk5NzAzOTc5NDl9XQ=3D=3D" data-l=
ook=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=
=3D"M332.37177530924475,568.6409950256348L332.37177530924475,615.5699272137=
692Q332.37177530924475,622.6409950256348 325.3007074973793,622.640995025634=
8L310.4390484782531,622.6409950256348Q303.3679806663876,622.6409950256348 3=
03.3679806663876,629.7120628375003L303.3679806663876,922.6299934387207L303.=
3679806663876,945.5589256268552Q303.3679806663876,952.6299934387207 310.439=
0484782531,952.6299934387207L345.13865392595073,952.6299934387207Q352.20972=
17378162,952.6299934387207 352.2097217378162,959.7010612505862L352.20972173=
78162,1051.2929878234863L352.2097217378162,1098.2929878234863" id=3D"my-svg=
-L_native_sysroot_rootfsdbg_0" class=3D"edge-thickness-normal edge-pattern-=
solid edge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" =
data-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_sysroot_rootfsdbg_0=
" data-points=3D"W3sieCI6MzMyLjM3MTc3NTMwOTI0NDc1LCJ5Ijo1NjguNjQwOTk1MDI1Nj=
M0OH0seyJ4IjozMzIuMzcxNzc1MzA5MjQ0NzUsInkiOjYyMi42NDA5OTUwMjU2MzQ4fSx7IngiO=
jMwMy4zNjc5ODA2NjYzODc2LCJ5Ijo2MjIuNjQwOTk1MDI1NjM0OH0seyJ4IjozMDMuMzY3OTgw=
NjY2Mzg3NiwieSI6OTIyLjYyOTk5MzQzODcyMDd9LHsieCI6MzAzLjM2Nzk4MDY2NjM4NzYsInk=
iOjk1Mi42Mjk5OTM0Mzg3MjA3fSx7IngiOjM1Mi4yMDk3MjE3Mzc4MTYyLCJ5Ijo5NTIuNjI5OT=
kzNDM4NzIwN30seyJ4IjozNTIuMjA5NzIxNzM3ODE2MiwieSI6MTA1MS4yOTI5ODc4MjM0ODYzf=
Sx7IngiOjM1Mi4yMDk3MjE3Mzc4MTYyLCJ5IjoxMTAyLjI5Mjk4NzgyMzQ4NjN9XQ=3D=3D" da=
ta-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><pat=
h d=3D"M304.379364594959,568.6409950256348L304.379364594959,603.56992721376=
92Q304.379364594959,610.6409950256348 297.3082967830935,610.6409950256348L2=
85.94284312111023,610.6409950256348Q278.87177530924475,610.6409950256348 27=
8.87177530924475,617.7120628375003L278.87177530924475,922.6299934387207L278=
.87177530924475,957.5589256268552Q278.87177530924475,964.6299934387207 271.=
8007074973793,964.6299934387207L237.10110204968163,964.6299934387207Q230.03=
003423781615,964.6299934387207 230.03003423781615,971.7010612505861L230.030=
0342378162,1223.618984222412L230.0300342378162,1236.5479164105466Q230.03003=
42378162,1243.618984222412 237.10110204968169,1243.618984222412L356.2115453=
066241,1243.618984222412Q363.28261311848956,1243.618984222412 363.282613118=
48956,1250.6900520342776L363.28261311848956,1309.2109107953122Q363.28261311=
848956,1316.2819786071777 370.35368093035504,1316.2819786071777L510.8151828=
5661485,1316.2819786071777Q517.8862506684803,1316.2819786071777 517.8862506=
684803,1323.3530464190433L517.8862506684802,1336.2819786071777L517.88625066=
84802,1383.2819786071777" id=3D"my-svg-L_native_sysroot_debugserver_0" clas=
s=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-pa=
ttern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge"=
 data-id=3D"L_native_sysroot_debugserver_0" data-points=3D"W3sieCI6MzA0LjM3=
OTM2NDU5NDk1OSwieSI6NTY4LjY0MDk5NTAyNTYzNDh9LHsieCI6MzA0LjM3OTM2NDU5NDk1OSw=
ieSI6NjEwLjY0MDk5NTAyNTYzNDh9LHsieCI6Mjc4Ljg3MTc3NTMwOTI0NDc1LCJ5Ijo2MTAuNj=
QwOTk1MDI1NjM0OH0seyJ4IjoyNzguODcxNzc1MzA5MjQ0NzUsInkiOjkyMi42Mjk5OTM0Mzg3M=
jA3fSx7IngiOjI3OC44NzE3NzUzMDkyNDQ3NSwieSI6OTY0LjYyOTk5MzQzODcyMDd9LHsieCI6=
MjMwLjAzMDAzNDIzNzgxNjE1LCJ5Ijo5NjQuNjI5OTkzNDM4NzIwN30seyJ4IjoyMzAuMDMwMDM=
0MjM3ODE2MiwieSI6MTIyMy42MTg5ODQyMjI0MTJ9LHsieCI6MjMwLjAzMDAzNDIzNzgxNjIsIn=
kiOjEyNDMuNjE4OTg0MjIyNDEyfSx7IngiOjM2My4yODI2MTMxMTg0ODk1NiwieSI6MTI0My42M=
Tg5ODQyMjI0MTJ9LHsieCI6MzYzLjI4MjYxMzExODQ4OTU2LCJ5IjoxMzE2LjI4MTk3ODYwNzE3=
Nzd9LHsieCI6NTE3Ljg4NjI1MDY2ODQ4MDMsInkiOjEzMTYuMjgxOTc4NjA3MTc3N30seyJ4Ijo=
1MTcuODg2MjUwNjY4NDgwMiwieSI6MTMzNi4yODE5Nzg2MDcxNzc3fSx7IngiOjUxNy44ODYyNT=
A2Njg0ODAyLCJ5IjoxMzg3LjI4MTk3ODYwNzE3Nzd9XQ=3D=3D" data-look=3D"classic" m=
arker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M517.886250668=
4803,1435.9449768066406L517.8862506684803,1500.873908994775Q517.88625066848=
03,1507.9449768066406 524.9573184803457,1507.9449768066406L533.748516189948=
1,1507.9449768066406Q540.8195840018136,1507.9449768066406 540.8195840018136=
,1515.0160446185062L540.8195840018136,1533.9449768066406" id=3D"my-svg-L_de=
bugserver_appbin_0" class=3D"edge-thickness-normal edge-pattern-solid edge-=
thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=
=3D"true" data-et=3D"edge" data-id=3D"L_debugserver_appbin_0" data-points=
=3D"W3sieCI6NTE3Ljg4NjI1MDY2ODQ4MDMsInkiOjE0MzUuOTQ0OTc2ODA2NjQwNn0seyJ4Ijo=
1MTcuODg2MjUwNjY4NDgwMywieSI6MTUwNy45NDQ5NzY4MDY2NDA2fSx7IngiOjU0MC44MTk1OD=
QwMDE4MTM2LCJ5IjoxNTA3Ljk0NDk3NjgwNjY0MDZ9LHsieCI6NTQwLjgxOTU4NDAwMTgxMzYsI=
nkiOjE1MzcuOTQ0OTc2ODA2NjQwNn1d" data-look=3D"classic" marker-end=3D"url(#m=
y-svg_flowchart-v2-pointEnd)"/><path d=3D"M566.1159717378155,1155.618982315=
0635L566.1159717378162,1155.618984222412L566.1159717378162,1189.61898422241=
2L566.1159717378162,1223.618984222412L566.1159717378162,1242.5041236877441Q=
566.1159717378162,1243.618984222412 565.0011112031482,1243.618984222412L565=
.0011112031482,1243.618984222412Q563.8862506684802,1243.618984222412 563.88=
62506684802,1244.73384475708L563.8862506684803,1342.2819786071777" id=3D"my=
-svg-L_rootfs_target_0" class=3D"edge-thickness-normal edge-pattern-solid e=
dge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-ed=
ge=3D"true" data-et=3D"edge" data-id=3D"L_rootfs_target_0" data-points=3D"W=
3sieCI6NTY2LjExNTk3MTczNzgxNTUsInkiOjExNTUuNjE4OTgyMzE1MDYzNX0seyJ4Ijo1NjYu=
MTE1OTcxNzM3ODE2MiwieSI6MTE1NS42MTg5ODQyMjI0MTJ9LHsieCI6NTY2LjExNTk3MTczNzg=
xNjIsInkiOjExODkuNjE4OTg0MjIyNDEyfSx7IngiOjU2Ni4xMTU5NzE3Mzc4MTYyLCJ5IjoxMj=
IzLjYxODk4NDIyMjQxMn0seyJ4Ijo1NjYuMTE1OTcxNzM3ODE2MiwieSI6MTI0My42MTg5ODQyM=
jI0MTJ9LHsieCI6NTYzLjg4NjI1MDY2ODQ4MDIsInkiOjEyNDMuNjE4OTg0MjIyNDEyfSx7Ingi=
OjU2My44ODYyNTA2Njg0ODAzLCJ5IjoxMzQ2LjI4MTk3ODYwNzE3Nzd9XQ=3D=3D" data-look=
=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/></g><g clas=
s=3D"edgeLabels"><g class=3D"edgeLabel" transform=3D"translate(157.15669286=
81873, 109.66299819946289)"><g class=3D"label" data-id=3D"L_idesdk_ideconfi=
g_0" transform=3D"translate(-0.16689300537109375, -10.329999923706055)"><g>=
<rect class=3D"background" style=3D"" x=3D"-31.3828125" y=3D"1.329999923706=
0547" width=3D"63.09941101074219" height=3D"18"/><text xml:space=3D"preserv=
e" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer=
-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">ge=
nerates</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transform=
=3D"translate(487.15339733305433, 185.32599639892578)"><g class=3D"label" d=
ata-id=3D"L_idesdk_sdk_0" transform=3D"translate(0, -10.329999923706055)"><=
g><rect class=3D"background" style=3D"" x=3D"-96.03125" y=3D"1.329999923706=
0547" width=3D"192.0625" height=3D"18"/><text xml:space=3D"preserve" y=3D"-=
10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan ro=
w" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-sty=
le=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">generates</=
tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> the</tspan><tspan font-style=3D"normal" class=3D"text-inner-ts=
pan" font-weight=3D"normal"> SDK</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> (via</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> bitbake)</ts=
pan></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"translat=
e(238.5366748628162, 334.9889945983887)"><g class=3D"label" data-id=3D"L_id=
e_native_sysroot_0" transform=3D"translate(0, -10.329999923706055)"><g><rec=
t class=3D"background" style=3D"" x=3D"-96.2265625" y=3D"1.3299999237060547=
" width=3D"192.453125" height=3D"18"/><text xml:space=3D"preserve" y=3D"-10=
.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row"=
 x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">calls</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> directly,</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal"> no</tspan><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal"> bitbake</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> needed</tspa=
n></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"translate(=
65.5856703985305, 803.8039894104004)"><g class=3D"label" data-id=3D"L_ide_s=
rcdir_0" transform=3D"translate(0, -10.329999923706055)"><g><rect class=3D"=
background" style=3D"" x=3D"-34.6171875" y=3D"1.3299999237060547" width=3D"=
69.234375" height=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anc=
hor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=
=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal">edit</tspan><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> source=
</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"tran=
slate(190.2350565592447, 1279.950481414795)"><g class=3D"label" data-id=3D"=
L_native_sysroot_srcdir_0" transform=3D"translate(0, -10.329999923706055)">=
<g><rect class=3D"background" style=3D"" x=3D"-55.5703125" y=3D"1.329999923=
7060547" width=3D"111.140625" height=3D"18"/><text xml:space=3D"preserve" y=
=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tsp=
an row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan fon=
t-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">reads<=
/tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> source</tspan><tspan font-style=3D"normal" class=3D"text-inner=
-tspan" font-weight=3D"normal"> from</tspan></tspan></text></g></g></g><g c=
lass=3D"edgeLabel" transform=3D"translate(389.32110566638767, 661.640995025=
6348)"><g class=3D"label" data-id=3D"L_native_sysroot_builddir_0" transform=
=3D"translate(0, -10.329999923706055)"><g><rect class=3D"background" style=
=3D"" x=3D"-26.453125" y=3D"1.3299999237060547" width=3D"52.90625" height=
=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" st=
yle=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1=
.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">builds</tspan><tspan font-style=3D"normal"=
 class=3D"text-inner-tspan" font-weight=3D"normal"> in</tspan></tspan></tex=
t></g></g></g><g class=3D"edgeLabel" transform=3D"translate(590.52825135730=
56, 661.6409950256348)"><g class=3D"label" data-id=3D"L_native_sysroot_sysr=
oot_0" transform=3D"translate(-0.14464569091796875, -10.329999923706055)"><=
g><rect class=3D"background" style=3D"" x=3D"-27.5859375" y=3D"1.3299999237=
060547" width=3D"55.46116638183594" height=3D"18"/><text xml:space=3D"prese=
rve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-out=
er-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tsp=
an font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">=
--sysroot</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transfor=
m=3D"translate(388.8885189964658, 766.3039970397949)"><g class=3D"label" da=
ta-id=3D"L_builddir_destdir_0" transform=3D"translate(-0.020538330078125, -=
10.329999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-19" y=
=3D"1.3299999237060547" width=3D"38.04107666015625" height=3D"18"/><text xm=
l:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan c=
lass=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=
=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">install</tspan></tspan></text></g></g></g><g class=3D"edgeL=
abel" transform=3D"translate(682.7988178071521, 1279.950481414795)"><g clas=
s=3D"label" data-id=3D"L_destdir_appbin_0" transform=3D"translate(0, -10.32=
9999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-44.7265625" =
y=3D"1.3299999237060547" width=3D"89.453125" height=3D"18"/><text xml:space=
=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"mid=
dle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal">deploy</tspan><tspan font-style=3D"normal" class=3D"text-inner-tsp=
an" font-weight=3D"normal"> (--strip)</tspan></tspan></text></g></g></g><g =
class=3D"edgeLabel" transform=3D"translate(772.6177288963681, 713.972496032=
7148)"><g class=3D"label" data-id=3D"L_native_sysroot_destdir_0" transform=
=3D"translate(-0.16381072998046875, -17.661499977111816)"><g><rect class=3D=
"background" style=3D"" x=3D"-53.2265625" y=3D"1.3299999237060547" width=3D=
"106.78074645996094" height=3D"32.66300010681152"/><text xml:space=3D"prese=
rve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-out=
er-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tsp=
an font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">=
debug</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-w=
eight=3D"normal"> symbols:</tspan></tspan><tspan class=3D"text-outer-tspan =
row" x=3D"0" y=3D"1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">unstripped</=
tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> binary</tspan></tspan></text></g></g></g><g class=3D"edgeLabel=
" transform=3D"translate(351.7175342378162, 1010.9614906311035)"><g class=
=3D"label" data-id=3D"L_native_sysroot_rootfsdbg_0" transform=3D"translate(=
0, -17.661499977111816)"><g><rect class=3D"background" style=3D"" x=3D"-48.=
5078125" y=3D"1.3299999237060547" width=3D"97.015625" height=3D"32.66300010=
681152"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" st=
yle=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1=
.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">debug</tspan><tspan font-style=3D"normal" =
class=3D"text-inner-tspan" font-weight=3D"normal"> symbols:</tspan></tspan>=
<tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em" text-a=
nchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" fo=
nt-weight=3D"normal">shared</tspan><tspan font-style=3D"normal" class=3D"te=
xt-inner-tspan" font-weight=3D"normal"> libraries</tspan></tspan></text></g=
></g></g><g class=3D"edgeLabel" transform=3D"translate(363.2044881184895, 1=
279.950481414795)"><g class=3D"label" data-id=3D"L_native_sysroot_debugserv=
er_0" transform=3D"translate(0, -17.661499977111816)"><g><rect class=3D"bac=
kground" style=3D"" x=3D"-42.921875" y=3D"1.3299999237060547" width=3D"85.8=
4375" height=3D"32.66300010681152"/><text xml:space=3D"preserve" y=3D"-10.1=
" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">remote</tspan=
><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"nor=
mal"> debug</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=
=3D"1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal">protocol</tspan></tspan></=
text></g></g></g><g class=3D"edgeLabel" transform=3D"translate(517.80812566=
84803, 1468.9449768066406)"><g class=3D"label" data-id=3D"L_debugserver_app=
bin_0" transform=3D"translate(0, -10.329999923706055)"><g><rect class=3D"ba=
ckground" style=3D"" x=3D"-35.421875" y=3D"1.3299999237060547" width=3D"70.=
84375" height=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=
=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-=
0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal">attach</tspan><tspan font-st=
yle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> /</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> run</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transform=
=3D"translate(563.4792529878162, 1279.950481414795)"><g class=3D"label" dat=
a-id=3D"L_rootfs_target_0" transform=3D"translate(-0.1398773193359375, -10.=
329999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-54.453125"=
 y=3D"1.3299999237060547" width=3D"109.18600463867188" height=3D"18"/><text=
 xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspa=
n class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anc=
hor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font=
-weight=3D"normal">installed</tspan><tspan font-style=3D"normal" class=3D"t=
ext-inner-tspan" font-weight=3D"normal"> on</tspan><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal"> target</tspan></tsp=
an></text></g></g></g></g><g class=3D"nodes"><g class=3D"node default orang=
e" id=3D"my-svg-flowchart-idesdk-0" data-look=3D"classic" transform=3D"tran=
slate(268.1265186128162, 36.331499099731445)"><rect class=3D"basic label-co=
ntainer" style=3D"fill:#ffbe6f !important;stroke:#ffa348 !important;stroke-=
width:1px !important" x=3D"-80.5859375" y=3D"-24.33150005340576" width=3D"1=
61.171875" height=3D"48.66300010681152"/><g class=3D"label" style=3D"color:=
#000000 !important" transform=3D"translate(0, -14.331500053405762)"><rect/>=
<g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D"pr=
eserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-=
outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =
ide-sdk</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1=
em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" fo=
nt-weight=3D"normal">(bitbake</tspan><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal"> tinfoil</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> client)</tsp=
an></tspan></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowch=
art-ideconfig-1" data-look=3D"classic" transform=3D"translate(157.606987362=
8162, 185.32599639892578)"><polygon points=3D"0,0 153.078125,0 153.078125,-=
53.32599639892578 0,-53.32599639892578 0,0 -8,0 161.078125,0 161.078125,-53=
.32599639892578 -8,-53.32599639892578 -8,0" class=3D"label-container" trans=
form=3D"translate(-76.5390625,26.66299819946289)" style=3D"fill:#99c1f1 !im=
portant;stroke:#62a0ea !important;stroke-width:1px !important"/><g class=3D=
"label" style=3D"color:#000000 !important" transform=3D"translate(0, -21.66=
299819946289)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/=
><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"=
><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><t=
span font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal=
">IDE</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-w=
eight=3D"normal"> configuration</tspan></tspan><tspan class=3D"text-outer-t=
span row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=
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
slate(120.38088989257811, 268.9889945983887)"><rect class=3D"basic label-co=
ntainer" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-=
width:1px !important" x=3D"-80" y=3D"-17" width=3D"160" height=3D"34"/><g c=
lass=3D"label" style=3D"color:#000000 !important" transform=3D"translate(0,=
 -7)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><text xm=
l:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan c=
lass=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">IDE</ts=
pan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"=
normal"> (e.g.</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal"> VSCode)</tspan></tspan></text></g></g></g><g cla=
ss=3D"node default green" id=3D"my-svg-flowchart-srcdir-3" data-look=3D"cla=
ssic" transform=3D"translate(134.5713348388672, 1372.9449768066406)"><polyg=
on points=3D"0,0 229.14266967773438,0 229.14266967773438,-53.32599639892578=
 0,-53.32599639892578 0,0 -8,0 237.14266967773438,0 237.14266967773438,-53.=
32599639892578 -8,-53.32599639892578 -8,0" class=3D"label-container" transf=
orm=3D"translate(-114.57133483886719,26.66299819946289)" style=3D"fill:#8ff=
0a4 !important;stroke:#57e389 !important;stroke-width:1px !important"/><g c=
lass=3D"label" style=3D"color:#000000 !important" transform=3D"translate(0,=
 -21.66299819946289)"><rect/><g><rect class=3D"background" style=3D"stroke:=
 none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !imp=
ortant"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.=
1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal">S</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> =3D</tspan><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal"> e.g.</tspan><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal"> workspace/sources/&=
lt;recipe&gt;</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tsp=
an" font-weight=3D"normal">(source</tspan><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal"> code,</tspan><tspan font-sty=
le=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> extracted<=
/tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> by</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0=
" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner=
-tspan" font-weight=3D"normal">devtool</tspan><tspan font-style=3D"normal" =
class=3D"text-inner-tspan" font-weight=3D"normal"> modify,</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> edit=
ed</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> in</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> the</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> IDE)</tspan></tspan></text></=
g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-native_sysroot-4=
" data-look=3D"classic" transform=3D"translate(346.3679806663876, 527.31499=
48120117)"><polygon points=3D"0,0 201.546875,0 201.546875,-82.6520004272461=
 0,-82.6520004272461 0,0 -8,0 209.546875,0 209.546875,-82.6520004272461 -8,=
-82.6520004272461 -8,0" class=3D"label-container" transform=3D"translate(-1=
00.7734375,41.32600021362305)" style=3D"fill:#99c1f1 !important;stroke:#62a=
0ea !important;stroke-width:1px !important"/><g class=3D"label" style=3D"co=
lor:#000000 !important" transform=3D"translate(0, -36.32600021362305)"><rec=
t/><g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D=
"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D"te=
xt-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"=
normal" class=3D"text-inner-tspan" font-weight=3D"normal">recipe-sysroot-na=
tive</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em"=
 dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal">build</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> tool</tspan><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal"> (e.g.</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> CMak=
e)</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em"=
 dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal">cross-compiler</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> (e.g.</tspan><tspan font-styl=
e=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> &lt;arch&gt=
;-gcc)</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"3.=
2em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal">debugger</tspan><tspan font-style=3D"normal" class=3D=
"text-inner-tspan" font-weight=3D"normal"> (e.g.</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> gdb)</tspan>=
</tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"4.30000000000000=
1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal">more</tspan><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal"> tools...</tspan></tspan></text></g><=
/g></g><g class=3D"node default" id=3D"my-svg-flowchart-builddir-5" data-lo=
ok=3D"classic" transform=3D"translate(389.36798066638767, 713.9724960327148=
)"><polygon points=3D"0,0 130,0 130,-38.66300010681152 0,-38.66300010681152=
 0,0 -8,0 138,0 138,-38.66300010681152 -8,-38.66300010681152 -8,0" class=3D=
"label-container" transform=3D"translate(-65,19.33150005340576)" style=3D"f=
ill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !importan=
t"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D"tran=
slate(0, -14.331500053405762)"><rect/><g><rect class=3D"background" style=
=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#=
000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1e=
m" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" fon=
t-weight=3D"normal">B</tspan><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal"> (build</tspan><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal"> directory)</tspan></ts=
pan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><t=
span font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal=
">build</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font=
-weight=3D"normal"> artifacts</tspan></tspan></text></g></g></g><g class=3D=
"node default" id=3D"my-svg-flowchart-sysroot-6" data-look=3D"classic" tran=
sform=3D"translate(590.7976681663877, 713.9724960327148)"><polygon points=
=3D"0,0 140.859375,0 140.859375,-38.66300010681152 0,-38.66300010681152 0,0=
 -8,0 148.859375,0 148.859375,-38.66300010681152 -8,-38.66300010681152 -8,0=
" class=3D"label-container" transform=3D"translate(-70.4296875,19.331500053=
40576)" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-w=
idth:1px !important"/><g class=3D"label" style=3D"color:#000000 !important"=
 transform=3D"translate(0, -14.331500053405762)"><rect/><g><rect class=3D"b=
ackground" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1"=
 style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text=
-inner-tspan" font-weight=3D"normal">recipe-sysroot</tspan></tspan><tspan c=
lass=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-st=
yle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">(target</t=
span><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal"> headers</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> &amp;</tspan><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal"> libs)</tspan></tspan></text=
></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-destdir-7" da=
ta-look=3D"classic" transform=3D"translate(581.0476681663877, 861.966995239=
2578)"><polygon points=3D"0,0 187.6875,0 187.6875,-53.32599639892578 0,-53.=
32599639892578 0,0 -8,0 195.6875,0 195.6875,-53.32599639892578 -8,-53.32599=
639892578 -8,0" class=3D"label-container" transform=3D"translate(-93.84375,=
26.66299819946289)" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !import=
ant;stroke-width:1px !important"/><g class=3D"label" style=3D"color:#000000=
 !important" transform=3D"translate(0, -21.66299819946289)"><rect/><g><rect=
 class=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" =
y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-ts=
pan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal">D</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =3D</tspan><=
tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norma=
l"> image</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D=
"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal">(non-stripped,</tspan><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal"> relocated</tspan><tspan f=
ont-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> rpa=
th,</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em=
" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font=
-weight=3D"normal">managed</tspan><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal"> by</tspan><tspan font-style=3D"norma=
l" class=3D"text-inner-tspan" font-weight=3D"normal"> pseudo)</tspan></tspa=
n></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-rootf=
sdbg-8" data-look=3D"classic" transform=3D"translate(352.2097217378162, 112=
8.9559860229492)"><polygon points=3D"0,0 154.359375,0 154.359375,-53.325996=
39892578 0,-53.32599639892578 0,0 -8,0 162.359375,0 162.359375,-53.32599639=
892578 -8,-53.32599639892578 -8,0" class=3D"label-container" transform=3D"t=
ranslate(-77.1796875,26.66299819946289)" style=3D"fill:#99c1f1 !important;s=
troke:#62a0ea !important;stroke-width:1px !important"/><g class=3D"label" s=
tyle=3D"color:#000000 !important" transform=3D"translate(0, -21.66299819946=
289)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><text xm=
l:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan c=
lass=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">rootfs-=
dbg</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" =
dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-w=
eight=3D"normal">(debug</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> symbols</tspan><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal"> of</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> othe=
r</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em" =
dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-w=
eight=3D"normal">recipes'</tspan><tspan font-style=3D"normal" class=3D"text=
-inner-tspan" font-weight=3D"normal"> shared</tspan><tspan font-style=3D"no=
rmal" class=3D"text-inner-tspan" font-weight=3D"normal"> libraries)</tspan>=
</tspan></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart=
-rootfs-9" data-look=3D"classic" transform=3D"translate(566.1159717378162, =
1136.287483215332)"><polygon points=3D"0,0 141.453125,0 141.453125,-38.6630=
0010681152 0,-38.66300010681152 0,0 -8,0 149.453125,0 149.453125,-38.663000=
10681152 -8,-38.66300010681152 -8,0" class=3D"label-container" transform=3D=
"translate(-70.7265625,19.33150005340576)" style=3D"fill:#99c1f1 !important=
;stroke:#62a0ea !important;stroke-width:1px !important"/><g class=3D"label"=
 style=3D"color:#000000 !important" transform=3D"translate(0, -14.331500053=
405762)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><text=
 xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspa=
n class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan f=
ont-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">root=
fs</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" d=
y=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">(target</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> root</tspan><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal"> filesystem)</tspan></t=
span></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-ap=
pbin-10" data-look=3D"classic" transform=3D"translate(563.8862506684803, 15=
62.276475906372)"><rect class=3D"basic label-container" style=3D"fill:#99c1=
f1 !important;stroke:#62a0ea !important;stroke-width:1px !important" x=3D"-=
80" y=3D"-24.33150005340576" width=3D"160" height=3D"48.66300010681152"/><g=
 class=3D"label" style=3D"color:#000000 !important" transform=3D"translate(=
0, -14.331500053405762)"><rect/><g><rect class=3D"background" style=3D"stro=
ke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !=
important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D=
"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal">Application</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> binary</tspan></tspan><tspan class=3D"t=
ext-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"no=
rmal" class=3D"text-inner-tspan" font-weight=3D"normal">(running)</tspan></=
tspan></text></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-d=
ebugserver-11" data-look=3D"classic" transform=3D"translate(517.88625066848=
03, 1411.6134777069092)"><rect class=3D"basic label-container" style=3D"fil=
l:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !important"=
 x=3D"-80" y=3D"-24.33150005340576" width=3D"160" height=3D"48.663000106811=
52"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D"tra=
nslate(0, -14.331500053405762)"><rect/><g><rect class=3D"background" style=
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
index 000000000..e6141cde5
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.mmd
@@ -0,0 +1,89 @@
+---
+config:
+  theme: base
+  look: classic
+  htmlLabels: false
+  fontFamily: '"Nimbus Sans", Helvetica, Arial, sans-serif'
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
+            builddir[["B (build directory)<br/>build artifacts"]]
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
+        rootfsdbg[["&lt;workspace&gt;/nfs-exports/<br/>&lt;image-recipe&gt=
;/rootfs-dbg<br/>(copy, kept in sync by<br/>devtool deploy-target;<br/>pers=
ists across debug sessions)"]]
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
index 000000000..fa2876a19
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.svg
@@ -0,0 +1 @@
+<svg id=3D"my-svg" width=3D"1323.3128662109375" xmlns=3D"http://www.w3.org=
/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/xlink" class=3D"flowchart"=
 height=3D"1621.9339599609375" viewBox=3D"4 3.999998092651367 1323.31286621=
09375 1621.9339599609375" role=3D"graphics-document document" aria-roledesc=
ription=3D"flowchart-v2" style=3D"background-color: transparent;"><style>#m=
y-svg{font-family:"Nimbus Sans",Helvetica,Arial,sans-serif;font-size:13.33p=
x;fill:#000000;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}=
@keyframes dash{to{stroke-dashoffset:0;}}#my-svg .edge-animation-slow{strok=
e-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear i=
nfinite;stroke-linecap:round;}#my-svg .edge-animation-fast{stroke-dasharray=
:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;str=
oke-linecap:round;}#my-svg .error-icon{fill:hsl(32.7272727273, 75.862068965=
5%, 82.2549019608%);}#my-svg .error-text{fill:rgb(10.9224137931, 42.1293103=
448, 79.5775862068);stroke:rgb(10.9224137931, 42.1293103448, 79.5775862068)=
;}#my-svg .edge-thickness-normal{stroke-width:1px;}#my-svg .edge-thickness-=
thick{stroke-width:3.5px;}#my-svg .edge-pattern-solid{stroke-dasharray:0;}#=
my-svg .edge-thickness-invisible{stroke-width:0;fill:none;}#my-svg .edge-pa=
ttern-dashed{stroke-dasharray:3;}#my-svg .edge-pattern-dotted{stroke-dashar=
ray:2;}#my-svg .marker{fill:#000000;stroke:#000000;}#my-svg .marker.cross{s=
troke:#000000;}#my-svg svg{font-family:"Nimbus Sans",Helvetica,Arial,sans-s=
erif;font-size:13.33px;}#my-svg p{margin:0;}#my-svg .label{font-family:"Nim=
bus Sans",Helvetica,Arial,sans-serif;color:#000000;}#my-svg .cluster-label =
text{fill:#000000;}#my-svg .cluster-label span{color:#000000;}#my-svg .clus=
ter-label span p{background-color:transparent;}#my-svg .label text,#my-svg =
span{fill:#000000;color:#000000;}#my-svg .node rect,#my-svg .node circle,#m=
y-svg .node ellipse,#my-svg .node polygon,#my-svg .node path{fill:#99c1f1;s=
troke:#62a0ea;stroke-width:1px;}#my-svg .rough-node .label text,#my-svg .no=
de .label text,#my-svg .image-shape .label,#my-svg .icon-shape .label{text-=
anchor:middle;}#my-svg .node .katex path{fill:#000;stroke:#000;stroke-width=
:1px;}#my-svg .rough-node .label,#my-svg .node .label,#my-svg .image-shape =
.label,#my-svg .icon-shape .label{text-align:center;}#my-svg .node.clickabl=
e{cursor:pointer;}#my-svg .root .anchor path{fill:#000000!important;stroke-=
width:0;stroke:#000000;}#my-svg .arrowheadPath{fill:#0b0b0b;}#my-svg .edgeP=
aths .path{stroke:#000000;stroke-width:1px;}#my-svg .flowchart-link{stroke:=
#000000;fill:none;}#my-svg .edgeLabel{background-color:#ffffff;text-align:c=
enter;}#my-svg .edgeLabel p{background-color:#ffffff;}#my-svg .edgeLabel re=
ct{opacity:0.5;background-color:#ffffff;fill:#ffffff;}#my-svg .labelBkg{bac=
kground-color:rgba(255, 255, 255, 0.5);}#my-svg .cluster rect{fill:#f6f5f4;=
stroke:#c0bfbc;stroke-width:1px;}#my-svg .cluster text{fill:#000000;}#my-sv=
g .cluster span{color:#000000;}#my-svg .node .collapsed-indicator{fill:#c0b=
fbc;stroke:none;opacity:0.6;}#my-svg .node .collapsed-separator{stroke:#c0b=
fbc;stroke-width:0.75px;}#my-svg div.mermaidTooltip{position:absolute;text-=
align:center;max-width:200px;padding:2px;font-family:"Nimbus Sans",Helvetic=
a,Arial,sans-serif;font-size:12px;background:hsl(32.7272727273, 75.86206896=
55%, 82.2549019608%);border:1px solid hsl(32.7272727273, 35.8620689655%, 72=
.2549019608%);border-radius:2px;pointer-events:none;z-index:100;}#my-svg .f=
lowchartTitleText{text-anchor:middle;font-size:18px;fill:#000000;}#my-svg r=
ect.text{fill:none;stroke-width:0;}#my-svg .icon-shape,#my-svg .image-shape=
{background-color:#ffffff;text-align:center;}#my-svg .icon-shape p,#my-svg =
.image-shape p{background-color:#ffffff;padding:2px;}#my-svg .icon-shape .l=
abel rect,#my-svg .image-shape .label rect{opacity:0.5;background-color:#ff=
ffff;fill:#ffffff;}#my-svg .label-icon{display:inline-block;height:1em;over=
flow:visible;vertical-align:-0.125em;}#my-svg .node .label-icon path{fill:c=
urrentColor;stroke:revert;stroke-width:revert;}#my-svg .node .neo-node{stro=
ke:#62a0ea;}#my-svg [data-look=3D"neo"].node rect,#my-svg [data-look=3D"neo=
"].cluster rect,#my-svg [data-look=3D"neo"].node polygon{stroke:url(#my-svg=
-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [d=
ata-look=3D"neo"].swimlane.cluster rect{filter:none;}#my-svg [data-look=3D"=
neo"].node path{stroke:url(#my-svg-gradient);stroke-width:1px;}#my-svg [dat=
a-look=3D"neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,1=
85,185,1));}#my-svg [data-look=3D"neo"].node .neo-line path{stroke:#62a0ea;=
filter:none;}#my-svg [data-look=3D"neo"].node circle{stroke:url(#my-svg-gra=
dient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [data-=
look=3D"neo"].node circle .state-start{fill:#000000;}#my-svg [data-look=3D"=
neo"].icon-shape .icon{fill:url(#my-svg-gradient);filter:drop-shadow( 1px 2=
px 2px rgba(185,185,185,1));}#my-svg [data-look=3D"neo"].icon-shape .icon-n=
eo path{stroke:url(#my-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(1=
85,185,185,1));}#my-svg .cluster-label tspan{font-weight:bold;}#my-svg rect=
{rx:7.5px;ry:7.5px;}#my-svg :root{--mermaid-font-family:"Nimbus Sans",Helve=
tica,Arial,sans-serif;}#my-svg .orange rect{fill:rgb(255, 190, 111)!importa=
nt;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(=
0, 0, 0)!important;}#my-svg .orange polygon{fill:rgb(255, 190, 111)!importa=
nt;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(=
0, 0, 0)!important;}#my-svg .orange ellipse{fill:rgb(255, 190, 111)!importa=
nt;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(=
0, 0, 0)!important;}#my-svg .orange circle{fill:rgb(255, 190, 111)!importan=
t;stroke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(0=
, 0, 0)!important;}#my-svg .orange path{fill:rgb(255, 190, 111)!important;s=
troke:rgb(255, 163, 72)!important;stroke-width:1px!important;color:rgb(0, 0=
, 0)!important;}#my-svg .orange tspan{fill:rgb(0, 0, 0)!important;}#my-svg =
.green rect{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!impo=
rtant;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .gre=
en polygon{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!impor=
tant;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .gree=
n ellipse{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!import=
ant;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green=
 circle{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!importan=
t;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green p=
ath{fill:rgb(143, 240, 164)!important;stroke:rgb(87, 227, 137)!important;st=
roke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-svg .green tspan=
{fill:rgb(0, 0, 0)!important;}#my-svg .default rect{fill:rgb(153, 193, 241)=
!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;co=
lor:rgb(0, 0, 0)!important;}#my-svg .default polygon{fill:rgb(153, 193, 241=
)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;c=
olor:rgb(0, 0, 0)!important;}#my-svg .default ellipse{fill:rgb(153, 193, 24=
1)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;=
color:rgb(0, 0, 0)!important;}#my-svg .default circle{fill:rgb(153, 193, 24=
1)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;=
color:rgb(0, 0, 0)!important;}#my-svg .default path{fill:rgb(153, 193, 241)=
!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!important;co=
lor:rgb(0, 0, 0)!important;}#my-svg .default tspan{fill:rgb(0, 0, 0)!import=
ant;}</style><g><marker id=3D"my-svg_flowchart-v2-pointEnd" class=3D"marker=
 flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"5" refY=3D"5" markerUnits=3D"u=
serSpaceOnUse" markerWidth=3D"8" markerHeight=3D"8" orient=3D"auto"><path d=
=3D"M 0 0 L 10 5 L 0 10 z" class=3D"arrowMarkerPath" style=3D"stroke-width:=
 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-po=
intStart" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"4.5" =
refY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"8" markerHeight=3D=
"8" orient=3D"auto"><path d=3D"M 0 5 L 10 10 L 10 0 z" class=3D"arrowMarker=
Path" style=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker =
id=3D"my-svg_flowchart-v2-pointEnd-margin" class=3D"marker flowchart-v2" vi=
ewBox=3D"0 0 11.5 14" refX=3D"11.5" refY=3D"7" markerUnits=3D"userSpaceOnUs=
e" markerWidth=3D"10.5" markerHeight=3D"14" orient=3D"auto"><path d=3D"M 0 =
0 L 11.5 7 L 0 14 z" class=3D"arrowMarkerPath" style=3D"stroke-width: 0; st=
roke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-pointSta=
rt-margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 11.5 14" refX=3D"1"=
 refY=3D"7" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11.5" markerHeigh=
t=3D"14" orient=3D"auto"><polygon points=3D"0,7 11.5,14 11.5,0" class=3D"ar=
rowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray: 1, 0;"/></marker=
><marker id=3D"my-svg_flowchart-v2-circleEnd" class=3D"marker flowchart-v2"=
 viewBox=3D"0 0 10 10" refX=3D"11" refY=3D"5" markerUnits=3D"userSpaceOnUse=
" markerWidth=3D"11" markerHeight=3D"11" orient=3D"auto"><circle cx=3D"5" c=
y=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: 1; stroke-=
dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-circleStart" =
class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"-1" refY=3D"5" =
markerUnits=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orien=
t=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" styl=
e=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-s=
vg_flowchart-v2-circleEnd-margin" class=3D"marker flowchart-v2" viewBox=3D"=
0 0 10 10" refY=3D"5" refX=3D"12.25" markerUnits=3D"userSpaceOnUse" markerW=
idth=3D"14" markerHeight=3D"14" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=
=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray=
: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-circleStart-margin" cl=
ass=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"-2" refY=3D"5" ma=
rkerUnits=3D"userSpaceOnUse" markerWidth=3D"14" markerHeight=3D"14" orient=
=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=
=3D"stroke-width: 0; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-sv=
g_flowchart-v2-crossEnd" class=3D"marker cross flowchart-v2" viewBox=3D"0 0=
 11 11" refX=3D"12" refY=3D"5.2" markerUnits=3D"userSpaceOnUse" markerWidth=
=3D"11" markerHeight=3D"11" orient=3D"auto"><path d=3D"M 1,1 l 9,9 M 10,1 l=
 -9,9" class=3D"arrowMarkerPath" style=3D"stroke-width: 2; stroke-dasharray=
: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-crossStart" class=3D"m=
arker cross flowchart-v2" viewBox=3D"0 0 11 11" refX=3D"-1" refY=3D"5.2" ma=
rkerUnits=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=
=3D"auto"><path d=3D"M 1,1 l 9,9 M 10,1 l -9,9" class=3D"arrowMarkerPath" s=
tyle=3D"stroke-width: 2; stroke-dasharray: 1, 0;"/></marker><marker id=3D"m=
y-svg_flowchart-v2-crossEnd-margin" class=3D"marker cross flowchart-v2" vie=
wBox=3D"0 0 15 15" refX=3D"17.7" refY=3D"7.5" markerUnits=3D"userSpaceOnUse=
" markerWidth=3D"12" markerHeight=3D"12" orient=3D"auto"><path d=3D"M 1,1 L=
 14,14 M 1,14 L 14,1" class=3D"arrowMarkerPath" style=3D"stroke-width: 2.5;=
"/></marker><marker id=3D"my-svg_flowchart-v2-crossStart-margin" class=3D"m=
arker cross flowchart-v2" viewBox=3D"0 0 15 15" refX=3D"-3.5" refY=3D"7.5" =
markerUnits=3D"userSpaceOnUse" markerWidth=3D"12" markerHeight=3D"12" orien=
t=3D"auto"><path d=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=3D"arrowMarkerPath=
" style=3D"stroke-width: 2.5; stroke-dasharray: 1, 0;"/></marker><g class=
=3D"root"><g class=3D"clusters"><g class=3D"cluster" id=3D"my-svg-target" d=
ata-look=3D"classic"><rect style=3D"fill:#f6f5f4 !important;stroke:#b5835a =
!important;stroke-width:1px !important" x=3D"446.1582946777344" y=3D"1084.6=
299858093262" width=3D"208" height=3D"228.32599639892578"/><g class=3D"clus=
ter-label" transform=3D"translate(507.8301696777344, 1084.6299858093262)"><=
g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D"pre=
serve" y=3D"-10.1" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0"=
 y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner=
-tspan" font-weight=3D"normal">Target</tspan><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal"> device</tspan></tspan></t=
ext></g></g></g><g class=3D"cluster" id=3D"my-svg-nfs" data-look=3D"classic=
"><rect style=3D"fill:#f6f5f4 !important;stroke:#c061cb !important;stroke-w=
idth:1px !important" x=3D"517.1856384277344" y=3D"1470.2819786071777" width=
=3D"263.625" height=3D"147.6520004272461"/><g class=3D"cluster-label" trans=
form=3D"translate(613.4903259277344, 1470.2819786071777)"><g><rect class=3D=
"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.=
1" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=
=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal">NFS</tspan><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal"> export</tspan></tspan></text></g></g></g><g =
class=3D"cluster" id=3D"my-svg-sdk" data-look=3D"classic"><rect style=3D"fi=
ll:#f6f5f4 !important;stroke:#3584e4 !important;stroke-width:1px !important=
" x=3D"303.8333943684897" y=3D"393.9889945983887" width=3D"1015.47944641113=
29" height=3D"527.9779968261719"/><g class=3D"cluster-label" transform=3D"t=
ranslate(701.8387425740561, 393.9889945983887)"><g><rect class=3D"backgroun=
d" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=
=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1e=
m"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"n=
ormal">SDK</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> (regular</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> bitbake</tspan><tspan font-st=
yle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> environme=
nt)</tspan></tspan></text></g></g></g><g class=3D"cluster" id=3D"my-svg-ima=
ge_workdir" data-look=3D"classic"><rect style=3D"fill:#ffffff !important;st=
roke:#57e389 !important;stroke-width:1px !important" x=3D"1014.246953328450=
7" y=3D"764.9779930114746" width=3D"281.0658874511719" height=3D"132.988998=
41308594"/><g class=3D"cluster-label" transform=3D"translate(1101.092587788=
9, 764.9779930114746)"><g><rect class=3D"background" style=3D"stroke: none"=
/><text xml:space=3D"preserve" y=3D"-10.1" style=3D""><tspan class=3D"text-=
outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal">Image</tspan><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> WO=
RKDIR</tspan></tspan></text></g></g></g><g class=3D"cluster" id=3D"my-svg-r=
ecipe_workdir" data-look=3D"classic"><rect style=3D"fill:#ffffff !important=
;stroke:#62a0ea !important;stroke-width:1px !important" x=3D"327.8333943684=
896" y=3D"444.9889945983887" width=3D"583.1328125" height=3D"452.9779968261=
719"/><g class=3D"cluster-label" transform=3D"translate(555.1654256184896, =
444.9889945983887)"><g><rect class=3D"background" style=3D"stroke: none"/><=
text xml:space=3D"preserve" y=3D"-10.1" style=3D""><tspan class=3D"text-out=
er-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal">Recipe</tspan><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> WORK=
DIR(s)</tspan></tspan></text></g></g></g></g><g class=3D"edges edgePaths"><=
path d=3D"M356.96698811848955,60.66299819946289L356.96698811848955,73.59193=
038759742Q356.96698811848955,80.66299819946289 349.8959203066241,80.6629981=
9946289L288.07321218035503,80.66299819946289Q281.00214436848955,80.66299819=
946289 281.00214436848955,87.73406601132837L281.00214436848955,154.66299819=
94629" id=3D"my-svg-L_idesdk_ideconfig_0" class=3D"edge-thickness-normal ed=
ge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-link" s=
tyle=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_idesdk_ideconfi=
g_0" data-points=3D"W3sieCI6MzU2Ljk2Njk4ODExODQ4OTU1LCJ5Ijo2MC42NjI5OTgxOTk=
0NjI4OX0seyJ4IjozNTYuOTY2OTg4MTE4NDg5NTUsInkiOjgwLjY2Mjk5ODE5OTQ2Mjg5fSx7In=
giOjI4MS4wMDIxNDQzNjg0ODk1NSwieSI6ODAuNjYyOTk4MTk5NDYyODl9LHsieCI6MjgxLjAwM=
jE0NDM2ODQ4OTU1LCJ5IjoxNTguNjYyOTk4MTk5NDYyOX1d" data-look=3D"classic" mark=
er-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M426.076363118489=
55,60.66299819946289L426.07636311848955,73.59193038759742Q426.0763631184895=
5,80.66299819946289 433.14743093035503,80.66299819946289L594.7899307232908,=
80.66299819946289Q601.8609985351562,80.66299819946289 601.8609985351562,87.=
73406601132837L601.8609985351562,109.66299819946289L601.8609985351562,268.9=
889945983887L601.8609985351562,334.9889945983887L601.8609985351562,356.9179=
267865232Q601.8609985351562,363.9889945983887 594.7899307232908,363.9889945=
983887L512.3357121803551,363.9889945983887Q505.2646443684896,363.9889945983=
887 505.2646443684896,371.06006241025415L505.2646443684896,389.988994598388=
7" id=3D"my-svg-L_idesdk_sdk_0" class=3D"edge-thickness-normal edge-pattern=
-solid edge-thickness-normal edge-pattern-solid flowchart-link" style=3D";"=
 data-edge=3D"true" data-et=3D"edge" data-id=3D"L_idesdk_sdk_0" data-points=
=3D"W3sieCI6NDI2LjA3NjM2MzExODQ4OTU1LCJ5Ijo2MC42NjI5OTgxOTk0NjI4OX0seyJ4Ijo=
0MjYuMDc2MzYzMTE4NDg5NTUsInkiOjgwLjY2Mjk5ODE5OTQ2Mjg5fSx7IngiOjYwMS44NjA5OT=
g1MzUxNTYyLCJ5Ijo4MC42NjI5OTgxOTk0NjI4OX0seyJ4Ijo2MDEuODYwOTk4NTM1MTU2Miwie=
SI6MTA5LjY2Mjk5ODE5OTQ2Mjg5fSx7IngiOjYwMS44NjA5OTg1MzUxNTYyLCJ5IjoyNjguOTg4=
OTk0NTk4Mzg4N30seyJ4Ijo2MDEuODYwOTk4NTM1MTU2MiwieSI6MzM0Ljk4ODk5NDU5ODM4ODd=
9LHsieCI6NjAxLjg2MDk5ODUzNTE1NjIsInkiOjM2My45ODg5OTQ1OTgzODg3fSx7IngiOjUwNS=
4yNjQ2NDQzNjg0ODk2LCJ5IjozNjMuOTg4OTk0NTk4Mzg4N30seyJ4Ijo1MDUuMjY0NjQ0MzY4N=
Dg5NiwieSI6MzkzLjk4ODk5NDU5ODM4ODd9XQ=3D=3D" data-look=3D"classic" marker-e=
nd=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M1154.7798970540366,8=
73.9669914245605L1154.7798970540366,907.9669914245605L1154.7798970540366,94=
1.9669914245605L1154.7798970540366,954.895923612695Q1154.7798970540366,961.=
9669914245605 1147.708829242171,961.9669914245605L1102.5658950823733,961.96=
69914245605Q1095.4948272705078,961.9669914245605 1095.4948272705078,969.038=
0592364261L1095.4948272705078,1018.2984886169434L1095.4948272705078,1376.61=
89804077148L1095.4948272705078,1433.2109107953122Q1095.4948272705078,1440.2=
819786071777 1088.4237594586423,1440.2819786071777L714.2767062396001,1440.2=
819786071777Q707.2056384277346,1440.2819786071777 707.2056384277346,1447.35=
30464190433L707.2056384277346,1460.2819786071777L707.2056384277346,1507.281=
9786071777" id=3D"my-svg-L_rootfsdbg_src_rootfsdbg_0" class=3D"edge-thickne=
ss-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowc=
hart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_roo=
tfsdbg_src_rootfsdbg_0" data-points=3D"W3sieCI6MTE1NC43Nzk4OTcwNTQwMzY2LCJ5=
Ijo4NzMuOTY2OTkxNDI0NTYwNX0seyJ4IjoxMTU0Ljc3OTg5NzA1NDAzNjYsInkiOjkwNy45NjY=
5OTE0MjQ1NjA1fSx7IngiOjExNTQuNzc5ODk3MDU0MDM2NiwieSI6OTQxLjk2Njk5MTQyNDU2MD=
V9LHsieCI6MTE1NC43Nzk4OTcwNTQwMzY2LCJ5Ijo5NjEuOTY2OTkxNDI0NTYwNX0seyJ4IjoxM=
Dk1LjQ5NDgyNzI3MDUwNzgsInkiOjk2MS45NjY5OTE0MjQ1NjA1fSx7IngiOjEwOTUuNDk0ODI3=
MjcwNTA3OCwieSI6MTAxOC4yOTg0ODg2MTY5NDM0fSx7IngiOjEwOTUuNDk0ODI3MjcwNTA3OCw=
ieSI6MTM3Ni42MTg5ODA0MDc3MTQ4fSx7IngiOjEwOTUuNDk0ODI3MjcwNTA3OCwieSI6MTQ0MC=
4yODE5Nzg2MDcxNzc3fSx7IngiOjcwNy4yMDU2Mzg0Mjc3MzQ2LCJ5IjoxNDQwLjI4MTk3ODYwN=
zE3Nzd9LHsieCI6NzA3LjIwNTYzODQyNzczNDYsInkiOjE0NjAuMjgxOTc4NjA3MTc3N30seyJ4=
Ijo3MDcuMjA1NjM4NDI3NzM0NiwieSI6MTUxMS4yODE5Nzg2MDcxNzc3fV0=3D" data-look=
=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"=
M256.1557902018229,211.98899459838867L256.1557902018229,230.37727584838865Q=
256.1557902018229,231.98899459838867 254.5440714518229,231.98899459838867L2=
54.5440714518229,231.98899459838867Q252.93235270182288,231.98899459838867 2=
52.93235270182288,233.6007133483887L252.93235270182288,247.98899459838867" =
id=3D"my-svg-L_ideconfig_ide_0" class=3D"edge-thickness-normal edge-pattern=
-solid edge-thickness-normal edge-pattern-solid flowchart-link" style=3D";"=
 data-edge=3D"true" data-et=3D"edge" data-id=3D"L_ideconfig_ide_0" data-poi=
nts=3D"W3sieCI6MjU2LjE1NTc5MDIwMTgyMjksInkiOjIxMS45ODg5OTQ1OTgzODg2N30seyJ4=
IjoyNTYuMTU1NzkwMjAxODIyOSwieSI6MjMxLjk4ODk5NDU5ODM4ODY3fSx7IngiOjI1Mi45MzI=
zNTI3MDE4MjI4OCwieSI6MjMxLjk4ODk5NDU5ODM4ODY3fSx7IngiOjI1Mi45MzIzNTI3MDE4Mj=
I4OCwieSI6MjUxLjk4ODk5NDU5ODM4ODY3fV0=3D" data-look=3D"classic" marker-end=
=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M305.84849853515624,211=
.98899459838867L305.84849853515624,224.9179267865232Q305.84849853515624,231=
.98899459838867 312.9195663470217,231.98899459838867L486.19357655662407,231=
.98899459838867Q493.26464436848954,231.98899459838867 493.26464436848954,23=
9.06006241025415L493.26464436848954,268.9889945983887L493.26464436848954,33=
4.9889945983887L493.2646443684896,383.9889945983887L493.2646443684896,434.9=
889945983887L493.2646443684896,481.9889945983887" id=3D"my-svg-L_ideconfig_=
native_sysroot_0" class=3D"edge-thickness-normal edge-pattern-solid edge-th=
ickness-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"=
true" data-et=3D"edge" data-id=3D"L_ideconfig_native_sysroot_0" data-points=
=3D"W3sieCI6MzA1Ljg0ODQ5ODUzNTE1NjI0LCJ5IjoyMTEuOTg4OTk0NTk4Mzg4Njd9LHsieCI=
6MzA1Ljg0ODQ5ODUzNTE1NjI0LCJ5IjoyMzEuOTg4OTk0NTk4Mzg4Njd9LHsieCI6NDkzLjI2ND=
Y0NDM2ODQ4OTU0LCJ5IjoyMzEuOTg4OTk0NTk4Mzg4Njd9LHsieCI6NDkzLjI2NDY0NDM2ODQ4O=
TU0LCJ5IjoyNjguOTg4OTk0NTk4Mzg4N30seyJ4Ijo0OTMuMjY0NjQ0MzY4NDg5NTQsInkiOjMz=
NC45ODg5OTQ1OTgzODg3fSx7IngiOjQ5My4yNjQ2NDQzNjg0ODk2LCJ5IjozODMuOTg4OTk0NTk=
4Mzg4N30seyJ4Ijo0OTMuMjY0NjQ0MzY4NDg5NiwieSI6NDM0Ljk4ODk5NDU5ODM4ODd9LHsieC=
I6NDkzLjI2NDY0NDM2ODQ4OTYsInkiOjQ4NS45ODg5OTQ1OTgzODg3fV0=3D" data-look=3D"=
classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M276=
.2656860351562,285.9889945983887L276.2656860351562,298.9179267865232Q276.26=
56860351562,305.9889945983887 283.33675384702167,305.9889945983887L355.1342=
015566241,305.9889945983887Q362.20526936848955,305.9889945983887 362.205269=
36848955,313.06006241025415L362.20526936848955,356.9179267865232Q362.205269=
36848955,363.9889945983887 369.27633718035503,363.9889945983887L420.8779515=
5662417,363.9889945983887Q427.94901936848964,363.9889945983887 427.94901936=
848964,371.06006241025415L427.94901936848964,383.9889945983887L427.94901936=
848964,434.9889945983887L427.9490193684896,481.9889945983887" id=3D"my-svg-=
L_ide_native_sysroot_0" class=3D"edge-thickness-normal edge-pattern-solid e=
dge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-ed=
ge=3D"true" data-et=3D"edge" data-id=3D"L_ide_native_sysroot_0" data-points=
=3D"W3sieCI6Mjc2LjI2NTY4NjAzNTE1NjIsInkiOjI4NS45ODg5OTQ1OTgzODg3fSx7IngiOjI=
3Ni4yNjU2ODYwMzUxNTYyLCJ5IjozMDUuOTg4OTk0NTk4Mzg4N30seyJ4IjozNjIuMjA1MjY5Mz=
Y4NDg5NTUsInkiOjMwNS45ODg5OTQ1OTgzODg3fSx7IngiOjM2Mi4yMDUyNjkzNjg0ODk1NSwie=
SI6MzYzLjk4ODk5NDU5ODM4ODd9LHsieCI6NDI3Ljk0OTAxOTM2ODQ4OTY0LCJ5IjozNjMuOTg4=
OTk0NTk4Mzg4N30seyJ4Ijo0MjcuOTQ5MDE5MzY4NDg5NjQsInkiOjM4My45ODg5OTQ1OTgzODg=
3fSx7IngiOjQyNy45NDkwMTkzNjg0ODk2NCwieSI6NDM0Ljk4ODk5NDU5ODM4ODd9LHsieCI6ND=
I3Ljk0OTAxOTM2ODQ4OTYsInkiOjQ4NS45ODg5OTQ1OTgzODg3fV0=3D" data-look=3D"clas=
sic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M229.599=
01936848954,285.9889945983887L229.59901936848954,298.9179267865232Q229.5990=
1936848954,305.9889945983887 222.52795155662406,305.9889945983887L104.11862=
437111026,305.9889945983887Q97.04755655924478,305.9889945983887 97.04755655=
924478,313.06006241025415L97.04755655924478,334.9889945983887L97.0475565592=
4478,1018.2984886169434L97.04755655924478,1080.6299858093262" id=3D"my-svg-=
L_ide_srcdir_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thic=
kness-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"tr=
ue" data-et=3D"edge" data-id=3D"L_ide_srcdir_0" data-points=3D"W3sieCI6MjI5=
LjU5OTAxOTM2ODQ4OTU0LCJ5IjoyODUuOTg4OTk0NTk4Mzg4N30seyJ4IjoyMjkuNTk5MDE5MzY=
4NDg5NTQsInkiOjMwNS45ODg5OTQ1OTgzODg3fSx7IngiOjk3LjA0NzU1NjU1OTI0NDc4LCJ5Ij=
ozMDUuOTg4OTk0NTk4Mzg4N30seyJ4Ijo5Ny4wNDc1NTY1NTkyNDQ3OCwieSI6MzM0Ljk4ODk5N=
DU5ODM4ODd9LHsieCI6OTcuMDQ3NTU2NTU5MjQ0NzgsInkiOjEwMTguMjk4NDg4NjE2OTQzNH0s=
eyJ4Ijo5Ny4wNDc1NTY1NTkyNDQ3OCwieSI6MTA4NC42Mjk5ODU4MDkzMjYyfV0=3D" data-lo=
ok=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=
=3D"M390.62580508277534,553.9779930114746L390.62580508277534,576.9069251996=
091Q390.62580508277534,583.9779930114746 383.55473727090987,583.97799301147=
46L375.6854889660694,583.9779930114746Q368.6144211542039,583.9779930114746 =
368.6144211542039,591.0490608233401L368.6144211542039,907.9669914245605L368=
.6144211542039,941.9669914245605L368.6144211542039,954.895923612695Q368.614=
4211542039,961.9669914245605 361.54335334233843,961.9669914245605L179.16618=
093035504,961.9669914245605Q172.09511311848956,961.9669914245605 172.095113=
11848956,969.0380592364261L172.09511311848956,1080.6299858093262" id=3D"my-=
svg-L_native_sysroot_srcdir_0" class=3D"edge-thickness-normal edge-pattern-=
solid edge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" =
data-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_sysroot_srcdir_0" d=
ata-points=3D"W3sieCI6MzkwLjYyNTgwNTA4Mjc3NTM0LCJ5Ijo1NTMuOTc3OTkzMDExNDc0N=
n0seyJ4IjozOTAuNjI1ODA1MDgyNzc1MzQsInkiOjU4My45Nzc5OTMwMTE0NzQ2fSx7IngiOjM2=
OC42MTQ0MjExNTQyMDM5LCJ5Ijo1ODMuOTc3OTkzMDExNDc0Nn0seyJ4IjozNjguNjE0NDIxMTU=
0MjAzOSwieSI6OTA3Ljk2Njk5MTQyNDU2MDV9LHsieCI6MzY4LjYxNDQyMTE1NDIwMzksInkiOj=
k0MS45NjY5OTE0MjQ1NjA1fSx7IngiOjM2OC42MTQ0MjExNTQyMDM5LCJ5Ijo5NjEuOTY2OTkxN=
DI0NTYwNX0seyJ4IjoxNzIuMDk1MTEzMTE4NDg5NTYsInkiOjk2MS45NjY5OTE0MjQ1NjA1fSx7=
IngiOjE3Mi4wOTUxMTMxMTg0ODk1NiwieSI6MTA4NC42Mjk5ODU4MDkzMjYyfV0=3D" data-lo=
ok=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=
=3D"M474.6030372256325,553.9779930114746L474.6030372256325,600.906925199609=
1Q474.6030372256325,607.9779930114746 481.67410503749795,607.9779930114746L=
496.53576405662415,607.9779930114746Q503.6068318684896,607.9779930114746 50=
3.6068318684896,615.0490608233401L503.6068318684896,675.9779930114746" id=
=3D"my-svg-L_native_sysroot_builddir_0" class=3D"edge-thickness-normal edge=
-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-link" sty=
le=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_sysroot_bu=
ilddir_0" data-points=3D"W3sieCI6NDc0LjYwMzAzNzIyNTYzMjUsInkiOjU1My45Nzc5OT=
MwMTE0NzQ2fSx7IngiOjQ3NC42MDMwMzcyMjU2MzI1LCJ5Ijo2MDcuOTc3OTkzMDExNDc0Nn0se=
yJ4Ijo1MDMuNjA2ODMxODY4NDg5NiwieSI6NjA3Ljk3Nzk5MzAxMTQ3NDZ9LHsieCI6NTAzLjYw=
NjgzMTg2ODQ4OTYsInkiOjY3OS45Nzc5OTMwMTE0NzQ2fV0=3D" data-look=3D"classic" m=
arker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M502.595447939=
9182,553.9779930114746L502.5954479399182,588.9069251996091Q502.595447939918=
2,595.9779930114746 509.66651575178366,595.9779930114746L697.9654515566242,=
595.9779930114746Q705.0365193684896,595.9779930114746 705.0365193684896,603=
.0490608233401L705.0365193684896,675.9779930114746" id=3D"my-svg-L_native_s=
ysroot_sysroot_0" class=3D"edge-thickness-normal edge-pattern-dotted edge-t=
hickness-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D=
"true" data-et=3D"edge" data-id=3D"L_native_sysroot_sysroot_0" data-points=
=3D"W3sieCI6NTAyLjU5NTQ0NzkzOTkxODIsInkiOjU1My45Nzc5OTMwMTE0NzQ2fSx7IngiOjU=
wMi41OTU0NDc5Mzk5MTgyLCJ5Ijo1OTUuOTc3OTkzMDExNDc0Nn0seyJ4Ijo3MDUuMDM2NTE5Mz=
Y4NDg5NiwieSI6NTk1Ljk3Nzk5MzAxMTQ3NDZ9LHsieCI6NzA1LjAzNjUxOTM2ODQ4OTYsInkiO=
jY3OS45Nzc5OTMwMTE0NzQ2fV0=3D" data-look=3D"classic" marker-end=3D"url(#my-=
svg_flowchart-v2-pointEnd)"/><path d=3D"M503.6068318684896,718.640976589678=
8L503.6068318684896,718.6409950256348L503.6068318684896,783.5699272137692Q5=
03.6068318684896,790.6409950256348 510.6778996803551,790.6409950256348L657.=
8675348899574,790.6409950256348Q664.9386027018229,790.6409950256348 664.938=
6027018229,797.7120628375003L664.9386027018229,816.6409950256348" id=3D"my-=
svg-L_builddir_destdir_0" class=3D"edge-thickness-normal edge-pattern-solid=
 edge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-=
edge=3D"true" data-et=3D"edge" data-id=3D"L_builddir_destdir_0" data-points=
=3D"W3sieCI6NTAzLjYwNjgzMTg2ODQ4OTYsInkiOjcxOC42NDA5NzY1ODk2Nzg4fSx7IngiOjU=
wMy42MDY4MzE4Njg0ODk2LCJ5Ijo3MTguNjQwOTk1MDI1NjM0OH0seyJ4Ijo1MDMuNjA2ODMxOD=
Y4NDg5NiwieSI6NzkwLjY0MDk5NTAyNTYzNDh9LHsieCI6NjY0LjkzODYwMjcwMTgyMjksInkiO=
jc5MC42NDA5OTUwMjU2MzQ4fSx7IngiOjY2NC45Mzg2MDI3MDE4MjI5LCJ5Ijo4MjAuNjQwOTk1=
MDI1NjM0OH1d" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-=
pointEnd)"/><path d=3D"M695.2865193684896,873.9669914245605L695.28651936848=
96,907.9669914245605L695.2865193684896,941.9669914245605L695.2865193684896,=
954.895923612695Q695.2865193684896,961.9669914245605 702.357587180355,961.9=
669914245605L786.4270706158688,961.9669914245605Q793.4981384277344,961.9669=
914245605 793.4981384277344,969.0380592364261L793.4981384277344,1018.298488=
6169434L793.4981384277344,1376.6189804077148L793.4981384277344,1413.2109107=
953122Q793.4981384277344,1420.2819786071777 786.4270706158688,1420.28197860=
71777L675.4717062395998,1420.2819786071777Q668.4006384277344,1420.281978607=
1777 668.4006384277344,1427.3530464190433L668.4006384277344,1460.2819786071=
777L668.4006384277345,1507.2819786071777" id=3D"my-svg-L_destdir_rootfsdbg_=
0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal =
edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=
=3D"edge" data-id=3D"L_destdir_rootfsdbg_0" data-points=3D"W3sieCI6Njk1LjI4=
NjUxOTM2ODQ4OTYsInkiOjg3My45NjY5OTE0MjQ1NjA1fSx7IngiOjY5NS4yODY1MTkzNjg0ODk=
2LCJ5Ijo5MDcuOTY2OTkxNDI0NTYwNX0seyJ4Ijo2OTUuMjg2NTE5MzY4NDg5NiwieSI6OTQxLj=
k2Njk5MTQyNDU2MDV9LHsieCI6Njk1LjI4NjUxOTM2ODQ4OTYsInkiOjk2MS45NjY5OTE0MjQ1N=
jA1fSx7IngiOjc5My40OTgxMzg0Mjc3MzQ0LCJ5Ijo5NjEuOTY2OTkxNDI0NTYwNX0seyJ4Ijo3=
OTMuNDk4MTM4NDI3NzM0NCwieSI6MTAxOC4yOTg0ODg2MTY5NDM0fSx7IngiOjc5My40OTgxMzg=
0Mjc3MzQ0LCJ5IjoxMzc2LjYxODk4MDQwNzcxNDh9LHsieCI6NzkzLjQ5ODEzODQyNzczNDQsIn=
kiOjE0MjAuMjgxOTc4NjA3MTc3N30seyJ4Ijo2NjguNDAwNjM4NDI3NzM0NCwieSI6MTQyMC4yO=
DE5Nzg2MDcxNzc3fSx7IngiOjY2OC40MDA2Mzg0Mjc3MzQ0LCJ5IjoxNDYwLjI4MTk3ODYwNzE3=
Nzd9LHsieCI6NjY4LjQwMDYzODQyNzczNDUsInkiOjE1MTEuMjgxOTc4NjA3MTc3N31d" data-=
look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=
=3D"M530.587858654204,553.9779930114746L530.587858654204,576.9069251996091Q=
530.587858654204,583.9779930114746 537.6589264660695,583.9779930114746L879.=
8951390566242,583.9779930114746Q886.9662068684896,583.9779930114746 886.966=
2068684896,591.0490608233401L886.9662068684896,783.5699272137692Q886.966206=
8684896,790.6409950256348 879.8951390566242,790.6409950256348L732.705503847=
0219,790.6409950256348Q725.6344360351563,790.6409950256348 725.634436035156=
3,797.7120628375003L725.6344360351563,816.6409950256348" id=3D"my-svg-L_nat=
ive_sysroot_destdir_0" class=3D"edge-thickness-normal edge-pattern-solid ed=
ge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-edg=
e=3D"true" data-et=3D"edge" data-id=3D"L_native_sysroot_destdir_0" data-poi=
nts=3D"W3sieCI6NTMwLjU4Nzg1ODY1NDIwNCwieSI6NTUzLjk3Nzk5MzAxMTQ3NDZ9LHsieCI6=
NTMwLjU4Nzg1ODY1NDIwNCwieSI6NTgzLjk3Nzk5MzAxMTQ3NDZ9LHsieCI6ODg2Ljk2NjIwNjg=
2ODQ4OTYsInkiOjU4My45Nzc5OTMwMTE0NzQ2fSx7IngiOjg4Ni45NjYyMDY4Njg0ODk2LCJ5Ij=
o3OTAuNjQwOTk1MDI1NjM0OH0seyJ4Ijo3MjUuNjM0NDM2MDM1MTU2MywieSI6NzkwLjY0MDk5N=
TAyNTYzNDh9LHsieCI6NzI1LjYzNDQzNjAzNTE1NjMsInkiOjgyMC42NDA5OTUwMjU2MzQ4fV0=
=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)=
"/><path d=3D"M418.61821579706105,553.9779930114746L418.61821579706105,588.=
9069251996091Q418.61821579706105,595.9779930114746 411.5471479851956,595.97=
79930114746L400.1816943232123,595.9779930114746Q393.1106265113468,595.97799=
30114746 393.1106265113468,603.0490608233401L393.1106265113468,907.96699142=
45605L393.1106265113468,941.9669914245605L393.1106265113468,974.89592361269=
5Q393.1106265113468,981.9669914245605 386.03955869948135,981.9669914245605L=
353.21373748959985,981.9669914245605Q346.1426696777344,981.9669914245605 34=
6.1426696777344,989.0380592364261L346.1426696777344,1018.2984886169434L346.=
1426696777344,1376.6189804077148L346.1426696777344,1433.2109107953122Q346.1=
426696777344,1440.2819786071777 353.21373748959985,1440.2819786071777L583.7=
195706158689,1440.2819786071777Q590.7906384277344,1440.2819786071777 590.79=
06384277344,1447.3530464190433L590.7906384277345,1460.2819786071777L590.790=
6384277345,1507.2819786071777" id=3D"my-svg-L_native_sysroot_rootfsdbg_0" c=
lass=3D"edge-thickness-normal edge-pattern-solid edge-thickness-normal edge=
-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"ed=
ge" data-id=3D"L_native_sysroot_rootfsdbg_0" data-points=3D"W3sieCI6NDE4LjY=
xODIxNTc5NzA2MTA1LCJ5Ijo1NTMuOTc3OTkzMDExNDc0Nn0seyJ4Ijo0MTguNjE4MjE1Nzk3MD=
YxMDUsInkiOjU5NS45Nzc5OTMwMTE0NzQ2fSx7IngiOjM5My4xMTA2MjY1MTEzNDY4LCJ5Ijo1O=
TUuOTc3OTkzMDExNDc0Nn0seyJ4IjozOTMuMTEwNjI2NTExMzQ2OCwieSI6OTA3Ljk2Njk5MTQy=
NDU2MDV9LHsieCI6MzkzLjExMDYyNjUxMTM0NjgsInkiOjk0MS45NjY5OTE0MjQ1NjA1fSx7Ing=
iOjM5My4xMTA2MjY1MTEzNDY4LCJ5Ijo5ODEuOTY2OTkxNDI0NTYwNX0seyJ4IjozNDYuMTQyNj=
Y5Njc3NzM0NCwieSI6OTgxLjk2Njk5MTQyNDU2MDV9LHsieCI6MzQ2LjE0MjY2OTY3NzczNDQsI=
nkiOjEwMTguMjk4NDg4NjE2OTQzNH0seyJ4IjozNDYuMTQyNjY5Njc3NzM0NCwieSI6MTM3Ni42=
MTg5ODA0MDc3MTQ4fSx7IngiOjM0Ni4xNDI2Njk2Nzc3MzQ0LCJ5IjoxNDQwLjI4MTk3ODYwNzE=
3Nzd9LHsieCI6NTkwLjc5MDYzODQyNzczNDQsInkiOjE0NDAuMjgxOTc4NjA3MTc3N30seyJ4Ij=
o1OTAuNzkwNjM4NDI3NzM0NSwieSI6MTQ2MC4yODE5Nzg2MDcxNzc3fSx7IngiOjU5MC43OTA2M=
zg0Mjc3MzQ1LCJ5IjoxNTExLjI4MTk3ODYwNzE3Nzd9XQ=3D=3D" data-look=3D"classic" =
marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M446.61062651=
134677,553.9779930114746L446.61062651134677,600.9069251996091Q446.610626511=
34677,607.9779930114746 439.5395586994813,607.9779930114746L424.67789968035=
51,607.9779930114746Q417.6068318684896,607.9779930114746 417.6068318684896,=
615.0490608233401L417.6068318684896,907.9669914245605L417.6068318684896,941=
.9669914245605L417.6068318684896,954.895923612695Q417.6068318684896,961.966=
9914245605 424.6778996803551,961.9669914245605L543.0872268658688,961.966991=
4245605Q550.1582946777344,961.9669914245605 550.1582946777344,969.038059236=
4261L550.1582946777344,1074.6299858093262L550.1582946777344,1121.6299858093=
262" id=3D"my-svg-L_native_sysroot_debugserver_0" class=3D"edge-thickness-n=
ormal edge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart=
-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_native_=
sysroot_debugserver_0" data-points=3D"W3sieCI6NDQ2LjYxMDYyNjUxMTM0Njc3LCJ5I=
jo1NTMuOTc3OTkzMDExNDc0Nn0seyJ4Ijo0NDYuNjEwNjI2NTExMzQ2NzcsInkiOjYwNy45Nzc5=
OTMwMTE0NzQ2fSx7IngiOjQxNy42MDY4MzE4Njg0ODk2LCJ5Ijo2MDcuOTc3OTkzMDExNDc0Nn0=
seyJ4Ijo0MTcuNjA2ODMxODY4NDg5NiwieSI6OTA3Ljk2Njk5MTQyNDU2MDV9LHsieCI6NDE3Lj=
YwNjgzMTg2ODQ4OTYsInkiOjk0MS45NjY5OTE0MjQ1NjA1fSx7IngiOjQxNy42MDY4MzE4Njg0O=
Dk2LCJ5Ijo5NjEuOTY2OTkxNDI0NTYwNX0seyJ4Ijo1NTAuMTU4Mjk0Njc3NzM0NCwieSI6OTYx=
Ljk2Njk5MTQyNDU2MDV9LHsieCI6NTUwLjE1ODI5NDY3NzczNDQsInkiOjEwNzQuNjI5OTg1ODA=
5MzI2Mn0seyJ4Ijo1NTAuMTU4Mjk0Njc3NzM0NCwieSI6MTEyNS42Mjk5ODU4MDkzMjYyfV0=3D=
" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/>=
<path d=3D"M550.1582946777344,1174.292984008789L550.1582946777344,1236.2929=
84008789" id=3D"my-svg-L_debugserver_appbin_0" class=3D"edge-thickness-norm=
al edge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-li=
nk" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_debugserve=
r_appbin_0" data-points=3D"W3sieCI6NTUwLjE1ODI5NDY3NzczNDQsInkiOjExNzQuMjky=
OTg0MDA4Nzg5fSx7IngiOjU1MC4xNTgyOTQ2Nzc3MzQ0LCJ5IjoxMjQwLjI5Mjk4NDAwODc4OX1=
d" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/=
><path d=3D"M470.1582946777344,1312.955982208252L470.1582946777344,1413.210=
9107953122Q470.1582946777344,1420.2819786071777 477.22936248959985,1420.281=
9786071777L622.5245706158689,1420.2819786071777Q629.5956384277345,1420.2819=
786071777 629.5956384277345,1427.3530464190433L629.5956384277345,1460.28197=
86071777L629.5956384277345,1507.2819786071777" id=3D"my-svg-L_target_rootfs=
dbg_0" class=3D"edge-thickness-normal edge-pattern-solid edge-thickness-nor=
mal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"true" data-=
et=3D"edge" data-id=3D"L_target_rootfsdbg_0" data-points=3D"W3sieCI6NDcwLjE=
1ODI5NDY3NzczNDQsInkiOjEzMTIuOTU1OTgyMjA4MjUyfSx7IngiOjQ3MC4xNTgyOTQ2Nzc3Mz=
Q0LCJ5IjoxNDIwLjI4MTk3ODYwNzE3Nzd9LHsieCI6NjI5LjU5NTYzODQyNzczNDUsInkiOjE0M=
jAuMjgxOTc4NjA3MTc3N30seyJ4Ijo2MjkuNTk1NjM4NDI3NzM0NSwieSI6MTQ2MC4yODE5Nzg2=
MDcxNzc3fSx7IngiOjYyOS41OTU2Mzg0Mjc3MzQ1LCJ5IjoxNTExLjI4MTk3ODYwNzE3Nzd9XQ=
=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointE=
nd)"/></g><g class=3D"edgeLabels"><g class=3D"edgeLabel" transform=3D"trans=
late(280.55184987386065, 109.66299819946289)"><g class=3D"label" data-id=3D=
"L_idesdk_ideconfig_0" transform=3D"translate(-0.16689300537109375, -10.329=
999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-31.3828125" y=
=3D"1.3299999237060547" width=3D"63.09941101074219" height=3D"18"/><text xm=
l:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan c=
lass=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=
=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal">generates</tspan></tspan></text></g></g></g><g class=3D"edg=
eLabel" transform=3D"translate(601.3922485351562, 185.32599639892578)"><g c=
lass=3D"label" data-id=3D"L_idesdk_sdk_0" transform=3D"translate(0, -10.329=
999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-96.03125" y=
=3D"1.3299999237060547" width=3D"192.0625" height=3D"18"/><text xml:space=
=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"mid=
dle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal">generates</tspan><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal"> the</tspan><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal"> SDK</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> (via</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> bitbake)</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" tran=
sform=3D"translate(1095.4557647705078, 1193.792984008789)"><g class=3D"labe=
l" data-id=3D"L_rootfsdbg_src_rootfsdbg_0" transform=3D"translate(0, -17.66=
1499977111816)"><g><rect class=3D"background" style=3D"" x=3D"-59.4609375" =
y=3D"1.3299999237060547" width=3D"118.921875" height=3D"32.66300010681152"/=
><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""=
><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" te=
xt-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan=
" font-weight=3D"normal">deployed,</tspan><tspan font-style=3D"normal" clas=
s=3D"text-inner-tspan" font-weight=3D"normal"> extracted</tspan></tspan><ts=
pan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em" text-anch=
or=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal">(--nfs=3Drootfs-dbg)</tspan></tspan></text></g></g></g><g=
 class=3D"edgeLabel" transform=3D"translate(361.93183186848955, 334.9889945=
983887)"><g class=3D"label" data-id=3D"L_ide_native_sysroot_0" transform=3D=
"translate(0, -10.329999923706055)"><g><rect class=3D"background" style=3D"=
" x=3D"-96.2265625" y=3D"1.3299999237060547" width=3D"192.453125" height=3D=
"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=
=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1e=
m" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal">calls</tspan><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal"> directly,</tspan><tspan fon=
t-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> no</t=
span><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal"> bitbake</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> needed</tspan></tspan></text></g></g></g><g c=
lass=3D"edgeLabel" transform=3D"translate(97.04755655924478, 662.9779930114=
746)"><g class=3D"label" data-id=3D"L_ide_srcdir_0" transform=3D"translate(=
0, -10.329999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-34.=
6171875" y=3D"1.3299999237060547" width=3D"69.234375" height=3D"18"/><text =
xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan=
 class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anch=
or=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal">edit</tspan><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal"> source</tspan></tspan></text></g></g></g=
><g class=3D"edgeLabel" transform=3D"translate(172.09511311848956, 1018.298=
4886169434)"><g class=3D"label" data-id=3D"L_native_sysroot_srcdir_0" trans=
form=3D"translate(0, -10.329999923706055)"><g><rect class=3D"background" st=
yle=3D"" x=3D"-55.5703125" y=3D"1.3299999237060547" width=3D"111.140625" he=
ight=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle=
" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=
=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal">reads</tspan><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal"> source</tspan><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =
from</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"=
translate(503.5599568684896, 646.9779930114746)"><g class=3D"label" data-id=
=3D"L_native_sysroot_builddir_0" transform=3D"translate(0, -10.329999923706=
055)"><g><rect class=3D"background" style=3D"" x=3D"-26.453125" y=3D"1.3299=
999237060547" width=3D"52.90625" height=3D"18"/><text xml:space=3D"preserve=
" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-=
tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">bui=
lds</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-wei=
ght=3D"normal"> in</tspan></tspan></text></g></g></g><g class=3D"edgeLabel"=
 transform=3D"translate(704.7671025594076, 646.9779930114746)"><g class=3D"=
label" data-id=3D"L_native_sysroot_sysroot_0" transform=3D"translate(-0.144=
64569091796875, -10.329999923706055)"><g><rect class=3D"background" style=
=3D"" x=3D"-27.5859375" y=3D"1.3299999237060547" width=3D"55.46116638183594=
" height=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"mi=
ddle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em"=
 dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal">--sysroot</tspan></tspan></text></=
g></g></g><g class=3D"edgeLabel" transform=3D"translate(503.12737019856775,=
 751.6409950256348)"><g class=3D"label" data-id=3D"L_builddir_destdir_0" tr=
ansform=3D"translate(-0.020538330078125, -10.329999923706055)"><g><rect cla=
ss=3D"background" style=3D"" x=3D"-19" y=3D"1.3299999237060547" width=3D"38=
.04107666015625" height=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" te=
xt-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"=
0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"no=
rmal" class=3D"text-inner-tspan" font-weight=3D"normal">install</tspan></ts=
pan></text></g></g></g><g class=3D"edgeLabel" transform=3D"translate(793.49=
81384277344, 1193.792984008789)"><g class=3D"label" data-id=3D"L_destdir_ro=
otfsdbg_0" transform=3D"translate(0, -17.661499977111816)"><g><rect class=
=3D"background" style=3D"" x=3D"-65" y=3D"1.3299999237060547" width=3D"130"=
 height=3D"32.66300010681152"/><text xml:space=3D"preserve" y=3D"-10.1" tex=
t-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0=
" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =
deploy-target</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" =
class=3D"text-inner-tspan" font-weight=3D"normal">(direct</tspan><tspan fon=
t-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> write=
,</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weigh=
t=3D"normal"> no</tspan><tspan font-style=3D"normal" class=3D"text-inner-ts=
pan" font-weight=3D"normal"> SSH)</tspan></tspan></text></g></g></g><g clas=
s=3D"edgeLabel" transform=3D"translate(886.8565800984701, 699.3094940185547=
)"><g class=3D"label" data-id=3D"L_native_sysroot_destdir_0" transform=3D"t=
ranslate(-0.16381072998046875, -17.661499977111816)"><g><rect class=3D"back=
ground" style=3D"" x=3D"-53.2265625" y=3D"1.3299999237060547" width=3D"106.=
78074645996094" height=3D"32.66300010681152"/><text xml:space=3D"preserve" =
y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-ts=
pan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">debug=
</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> symbols:</tspan></tspan><tspan class=3D"text-outer-tspan row" =
x=3D"0" y=3D"1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"=
normal" class=3D"text-inner-tspan" font-weight=3D"normal">unstripped</tspan=
><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"nor=
mal"> binary</tspan></tspan></text></g></g></g><g class=3D"edgeLabel" trans=
form=3D"translate(345.6504821777344, 1193.792984008789)"><g class=3D"label"=
 data-id=3D"L_native_sysroot_rootfsdbg_0" transform=3D"translate(0, -24.992=
998123168945)"><g><rect class=3D"background" style=3D"" x=3D"-48.5078125" y=
=3D"1.3299999237060547" width=3D"97.015625" height=3D"47.32599639892578"/><=
text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><=
tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text=
-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal">debug</tspan><tspan font-style=3D"normal" class=3D"t=
ext-inner-tspan" font-weight=3D"normal"> symbols:</tspan></tspan><tspan cla=
ss=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em" text-anchor=3D"m=
iddle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal">other</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> recipes'</tspan></tspan><tspan class=3D"text-=
outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em" text-anchor=3D"middle"><t=
span font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal=
">shared</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" fon=
t-weight=3D"normal"> libraries</tspan></tspan></text></g></g></g><g class=
=3D"edgeLabel" transform=3D"translate(550.0801696777344, 1018.2984886169434=
)"><g class=3D"label" data-id=3D"L_native_sysroot_debugserver_0" transform=
=3D"translate(0, -17.661499977111816)"><g><rect class=3D"background" style=
=3D"" x=3D"-42.921875" y=3D"1.3299999237060547" width=3D"85.84375" height=
=3D"32.66300010681152"/><text xml:space=3D"preserve" y=3D"-10.1" text-ancho=
r=3D"middle" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"=
-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" cl=
ass=3D"text-inner-tspan" font-weight=3D"normal">remote</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> debug</t=
span></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"=
1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal">protocol</tspan></tspan></text></g></g></=
g><g class=3D"edgeLabel" transform=3D"translate(550.0801696777344, 1207.292=
984008789)"><g class=3D"label" data-id=3D"L_debugserver_appbin_0" transform=
=3D"translate(0, -10.329999923706055)"><g><rect class=3D"background" style=
=3D"" x=3D"-35.421875" y=3D"1.3299999237060547" width=3D"70.84375" height=
=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" st=
yle=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1=
.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">attach</tspan><tspan font-style=3D"normal"=
 class=3D"text-inner-tspan" font-weight=3D"normal"> /</tspan><tspan font-st=
yle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> run</tspa=
n></tspan></text></g></g></g><g class=3D"edgeLabel" transform=3D"translate(=
469.8926696777344, 1376.6189804077148)"><g class=3D"label" data-id=3D"L_tar=
get_rootfsdbg_0" transform=3D"translate(0, -24.992998123168945)"><g><rect c=
lass=3D"background" style=3D"" x=3D"-46.734375" y=3D"1.3299999237060547" wi=
dth=3D"93.46875" height=3D"47.32599639892578"/><text xml:space=3D"preserve"=
 y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan class=3D"text-outer-t=
span row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan f=
ont-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">boot=
ed</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> from</tspan></tspan><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"1em" dy=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal">(NFS-mounted</tspa=
n></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1=
.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">root</tspan><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal"> filesystem)</tspan></tspa=
n></text></g></g></g></g><g class=3D"nodes"><g class=3D"node default orange=
" id=3D"my-svg-flowchart-idesdk-0" data-look=3D"classic" transform=3D"trans=
late(391.52167561848955, 36.331499099731445)"><rect class=3D"basic label-co=
ntainer" style=3D"fill:#ffbe6f !important;stroke:#ffa348 !important;stroke-=
width:1px !important" x=3D"-113.6640625" y=3D"-24.33150005340576" width=3D"=
227.328125" height=3D"48.66300010681152"/><g class=3D"label" style=3D"color=
:#000000 !important" transform=3D"translate(0, -14.331500053405762)"><rect/=
><g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D"p=
reserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D"text=
-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"no=
rmal" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><tsp=
an font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">=
 ide-sdk</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" fon=
t-weight=3D"normal"> --nfs=3Drootfs-dbg</tspan></tspan><tspan class=3D"text=
-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"norma=
l" class=3D"text-inner-tspan" font-weight=3D"normal">(bitbake</tspan><tspan=
 font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> t=
infoil</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-=
weight=3D"normal"> client)</tspan></tspan></text></g></g></g><g class=3D"no=
de default" id=3D"my-svg-flowchart-ideconfig-1" data-look=3D"classic" trans=
form=3D"translate(281.00214436848955, 185.32599639892578)"><polygon points=
=3D"0,0 153.078125,0 153.078125,-53.32599639892578 0,-53.32599639892578 0,0=
 -8,0 161.078125,0 161.078125,-53.32599639892578 -8,-53.32599639892578 -8,0=
" class=3D"label-container" transform=3D"translate(-76.5390625,26.662998199=
46289)" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-w=
idth:1px !important"/><g class=3D"label" style=3D"color:#000000 !important"=
 transform=3D"translate(0, -21.66299819946289)"><rect/><g><rect class=3D"ba=
ckground" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" =
style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text=
-inner-tspan" font-weight=3D"normal">IDE</tspan><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal"> configuration</tspan><=
/tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"=
><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"nor=
mal">(e.g.</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> build</tspan><tspan font-style=3D"normal" class=3D"t=
ext-inner-tspan" font-weight=3D"normal"> tool</tspan><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal"> preset,</tspan></=
tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em=
"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"no=
rmal">debugger</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal"> launch</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> config)</tspan></tspan></text=
></g></g></g><g class=3D"node default" id=3D"my-svg-flowchart-ide-2" data-l=
ook=3D"classic" transform=3D"translate(252.93235270182288, 268.988994598388=
7)"><rect class=3D"basic label-container" style=3D"fill:#99c1f1 !important;=
stroke:#62a0ea !important;stroke-width:1px !important" x=3D"-80" y=3D"-17" =
width=3D"160" height=3D"34"/><g class=3D"label" style=3D"color:#000000 !imp=
ortant" transform=3D"translate(0, -7)"><rect/><g><rect class=3D"background"=
 style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"=
fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D=
"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal">IDE</tspan><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal"> (e.g.</tspan><tspan font-style=3D=
"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> VSCode)</tspan>=
</tspan></text></g></g></g><g class=3D"node default green" id=3D"my-svg-flo=
wchart-srcdir-3" data-look=3D"classic" transform=3D"translate(134.571334838=
8672, 1111.292984008789)"><polygon points=3D"0,0 229.14266967773438,0 229.1=
4266967773438,-53.32599639892578 0,-53.32599639892578 0,0 -8,0 237.14266967=
773438,0 237.14266967773438,-53.32599639892578 -8,-53.32599639892578 -8,0" =
class=3D"label-container" transform=3D"translate(-114.57133483886719,26.662=
99819946289)" style=3D"fill:#8ff0a4 !important;stroke:#57e389 !important;st=
roke-width:1px !important"/><g class=3D"label" style=3D"color:#000000 !impo=
rtant" transform=3D"translate(0, -21.66299819946289)"><rect/><g><rect class=
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
slate(460.6068318684896, 519.9834938049316)"><polygon points=3D"0,0 201.546=
875,0 201.546875,-67.98899841308594 0,-67.98899841308594 0,0 -8,0 209.54687=
5,0 209.546875,-67.98899841308594 -8,-67.98899841308594 -8,0" class=3D"labe=
l-container" transform=3D"translate(-100.7734375,33.99449920654297)" style=
=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !imp=
ortant"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D=
"translate(0, -28.99449920654297)"><rect/><g><rect class=3D"background" sty=
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
transform=3D"translate(503.6068318684896, 699.3094940185547)"><polygon poin=
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
al"> artifacts</tspan></tspan></text></g></g></g><g class=3D"node default" =
id=3D"my-svg-flowchart-sysroot-6" data-look=3D"classic" transform=3D"transl=
ate(705.0365193684896, 699.3094940185547)"><polygon points=3D"0,0 140.85937=
5,0 140.859375,-38.66300010681152 0,-38.66300010681152 0,0 -8,0 148.859375,=
0 148.859375,-38.66300010681152 -8,-38.66300010681152 -8,0" class=3D"label-=
container" transform=3D"translate(-70.4296875,19.33150005340576)" style=3D"=
fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !importa=
nt"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D"tra=
nslate(0, -14.331500053405762)"><rect/><g><rect class=3D"background" style=
=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#=
000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1e=
m" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" fon=
t-weight=3D"normal">recipe-sysroot</tspan></tspan><tspan class=3D"text-oute=
r-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" cl=
ass=3D"text-inner-tspan" font-weight=3D"normal">(target</tspan><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> headers=
</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> &amp;</tspan><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal"> libs)</tspan></tspan></text></g></g></g><g c=
lass=3D"node default" id=3D"my-svg-flowchart-destdir-7" data-look=3D"classi=
c" transform=3D"translate(695.2865193684896, 847.3039932250977)"><polygon p=
oints=3D"0,0 187.6875,0 187.6875,-53.32599639892578 0,-53.32599639892578 0,=
0 -8,0 195.6875,0 195.6875,-53.32599639892578 -8,-53.32599639892578 -8,0" c=
lass=3D"label-container" transform=3D"translate(-93.84375,26.66299819946289=
)" style=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:=
1px !important"/><g class=3D"label" style=3D"color:#000000 !important" tran=
sform=3D"translate(0, -21.66299819946289)"><rect/><g><rect class=3D"backgro=
und" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=
=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal">D</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> =3D</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> image</tspan=
></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1e=
m"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"n=
ormal">(non-stripped,</tspan><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal"> relocated</tspan><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal"> rpath,</tspan></tsp=
an><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><=
tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norma=
l">managed</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" f=
ont-weight=3D"normal"> by</tspan><tspan font-style=3D"normal" class=3D"text=
-inner-tspan" font-weight=3D"normal"> pseudo)</tspan></tspan></text></g></g=
></g><g class=3D"node default" id=3D"my-svg-flowchart-rootfsdbg_src-8" data=
-look=3D"classic" transform=3D"translate(1154.7798970540366, 839.9724922180=
176)"><polygon points=3D"0,0 217.06588745117188,0 217.06588745117188,-67.98=
899841308594 0,-67.98899841308594 0,0 -8,0 225.06588745117188,0 225.0658874=
5117188,-67.98899841308594 -8,-67.98899841308594 -8,0" class=3D"label-conta=
iner" transform=3D"translate(-108.53294372558594,33.99449920654297)" style=
=3D"fill:#99c1f1 !important;stroke:#62a0ea !important;stroke-width:1px !imp=
ortant"/><g class=3D"label" style=3D"color:#000000 !important" transform=3D=
"translate(0, -28.99449920654297)"><rect/><g><rect class=3D"background" sty=
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
assic" transform=3D"translate(648.9981384277344, 1552.6079788208008)"><poly=
gon points=3D"0,0 199.625,0 199.625,-82.6520004272461 0,-82.6520004272461 0=
,0 -8,0 207.625,0 207.625,-82.6520004272461 -8,-82.6520004272461 -8,0" clas=
s=3D"label-container" transform=3D"translate(-99.8125,41.32600021362305)" s=
tyle=3D"fill:#8ff0a4 !important;stroke:#57e389 !important;stroke-width:1px =
!important"/><g class=3D"label" style=3D"color:#000000 !important" transfor=
m=3D"translate(0, -36.32600021362305)"><rect/><g><rect class=3D"background"=
 style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"=
fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D=
"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal">&lt;workspace&gt;/nfs-exports/</tspan></tspan><ts=
pan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan fo=
nt-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">&lt;i=
mage-recipe&gt;/rootfs-dbg</tspan></tspan><tspan class=3D"text-outer-tspan =
row" x=3D"0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D=
"text-inner-tspan" font-weight=3D"normal">(copy,</tspan><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> kept</tspan>=
<tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"norm=
al"> in</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font=
-weight=3D"normal"> sync</tspan><tspan font-style=3D"normal" class=3D"text-=
inner-tspan" font-weight=3D"normal"> by</tspan></tspan><tspan class=3D"text=
-outer-tspan row" x=3D"0" y=3D"3.2em" dy=3D"1.1em"><tspan font-style=3D"nor=
mal" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><tspa=
n font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> =
deploy-target;</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0"=
 y=3D"4.300000000000001em" dy=3D"1.1em"><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal">persists</tspan><tspan font-st=
yle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> across</t=
span><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal"> debug</tspan><tspan font-style=3D"normal" class=3D"text-inner-tsp=
an" font-weight=3D"normal"> sessions)</tspan></tspan></text></g></g></g><g =
class=3D"node default" id=3D"my-svg-flowchart-appbin-10" data-look=3D"class=
ic" transform=3D"translate(550.1582946777344, 1264.6244831085205)"><rect cl=
ass=3D"basic label-container" style=3D"fill:#99c1f1 !important;stroke:#62a0=
ea !important;stroke-width:1px !important" x=3D"-80" y=3D"-24.3315000534057=
6" width=3D"160" height=3D"48.66300010681152"/><g class=3D"label" style=3D"=
color:#000000 !important" transform=3D"translate(0, -14.331500053405762)"><=
rect/><g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=
=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D=
"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">Application</=
tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> binary</tspan></tspan><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-in=
ner-tspan" font-weight=3D"normal">(running)</tspan></tspan></text></g></g><=
/g><g class=3D"node default" id=3D"my-svg-flowchart-debugserver-11" data-lo=
ok=3D"classic" transform=3D"translate(550.1582946777344, 1149.9614849090576=
)"><rect class=3D"basic label-container" style=3D"fill:#99c1f1 !important;s=
troke:#62a0ea !important;stroke-width:1px !important" x=3D"-80" y=3D"-24.33=
150005340576" width=3D"160" height=3D"48.66300010681152"/><g class=3D"label=
" style=3D"color:#000000 !important" transform=3D"translate(0, -14.33150005=
3405762)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><tex=
t xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tsp=
an class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">deb=
ug-server</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D=
"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" =
font-weight=3D"normal">(e.g.</tspan><tspan font-style=3D"normal" class=3D"t=
ext-inner-tspan" font-weight=3D"normal"> gdbserver)</tspan></tspan></text><=
/g></g></g></g></g></g><defs><filter id=3D"my-svg-drop-shadow" height=3D"13=
0%" width=3D"130%"><feDropShadow dx=3D"4" dy=3D"4" stdDeviation=3D"0" flood=
-opacity=3D"0.06" flood-color=3D"#000000"/></filter></defs><defs><filter id=
=3D"my-svg-drop-shadow-small" height=3D"150%" width=3D"150%"><feDropShadow =
dx=3D"2" dy=3D"2" stdDeviation=3D"0" flood-opacity=3D"0.06" flood-color=3D"=
#000000"/></filter></defs><linearGradient id=3D"my-svg-gradient" gradientUn=
its=3D"objectBoundingBox" x1=3D"0%" y1=3D"0%" x2=3D"100%" y2=3D"0%"><stop o=
ffset=3D"0%" stop-color=3D"#62a0ea" stop-opacity=3D"1"/><stop offset=3D"100=
%" stop-color=3D"hsl(92.7272727273, 35.8620689655%, 67.2549019608%)" stop-o=
pacity=3D"1"/></linearGradient></svg>
\ No newline at end of file
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd =
b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd
new file mode 100644
index 000000000..b0a9c732c
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd
@@ -0,0 +1,76 @@
+---
+config:
+  theme: base
+  look: classic
+  htmlLabels: false
+  fontFamily: '"Nimbus Sans", Helvetica, Arial, sans-serif'
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
+    style loop fill:#f6f5f4,stroke:#c0bfbc,stroke-width:1px
+
+    classDef orange fill:#ffbe6f,stroke:#ffa348,stroke-width:1px,color:#00=
0000;
+    classDef green fill:#8ff0a4,stroke:#57e389,stroke-width:1px,color:#000=
000;
+    classDef purple fill:#dc8add,stroke:#c061cb,stroke-width:1px,color:#00=
0000;
+    classDef note fill:#f6f5f4,stroke:#c0bfbc,stroke-width:1px,color:#5e5c=
64;
+    classDef default fill:#99c1f1,stroke:#62a0ea,stroke-width:1px,color:#0=
00000;
+    class modify,gensdk,build,deploy,debug,finish orange;
+    class ws_src,edit green;
+    class ws_appends purple;
+    class rerun_note note;
diff --git a/documentation/dev-manual/figures/devtool-ide-sdk-workflow.svg =
b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.svg
new file mode 100644
index 000000000..a83d9ff7d
--- /dev/null
+++ b/documentation/dev-manual/figures/devtool-ide-sdk-workflow.svg
@@ -0,0 +1 @@
+<svg id=3D"my-svg" width=3D"491.6734924316406" xmlns=3D"http://www.w3.org/=
2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/xlink" class=3D"flowchart" =
height=3D"1050.97802734375" viewBox=3D"4 4 491.6734924316406 1050.978027343=
75" role=3D"graphics-document document" aria-roledescription=3D"flowchart-v=
2" style=3D"background-color: transparent;"><style>#my-svg{font-family:"Nim=
bus Sans",Helvetica,Arial,sans-serif;font-size:13.33px;fill:#000000;}@keyfr=
ames edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{str=
oke-dashoffset:0;}}#my-svg .edge-animation-slow{stroke-dasharray:9,5!import=
ant;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap=
:round;}#my-svg .edge-animation-fast{stroke-dasharray:9,5!important;stroke-=
dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#my=
-svg .error-icon{fill:hsl(32.7272727273, 75.8620689655%, 82.2549019608%);}#=
my-svg .error-text{fill:rgb(10.9224137931, 42.1293103448, 79.5775862068);st=
roke:rgb(10.9224137931, 42.1293103448, 79.5775862068);}#my-svg .edge-thickn=
ess-normal{stroke-width:1px;}#my-svg .edge-thickness-thick{stroke-width:3.5=
px;}#my-svg .edge-pattern-solid{stroke-dasharray:0;}#my-svg .edge-thickness=
-invisible{stroke-width:0;fill:none;}#my-svg .edge-pattern-dashed{stroke-da=
sharray:3;}#my-svg .edge-pattern-dotted{stroke-dasharray:2;}#my-svg .marker=
{fill:#000000;stroke:#000000;}#my-svg .marker.cross{stroke:#000000;}#my-svg=
 svg{font-family:"Nimbus Sans",Helvetica,Arial,sans-serif;font-size:13.33px=
;}#my-svg p{margin:0;}#my-svg .label{font-family:"Nimbus Sans",Helvetica,Ar=
ial,sans-serif;color:#000000;}#my-svg .cluster-label text{fill:#000000;}#my=
-svg .cluster-label span{color:#000000;}#my-svg .cluster-label span p{backg=
round-color:transparent;}#my-svg .label text,#my-svg span{fill:#000000;colo=
r:#000000;}#my-svg .node rect,#my-svg .node circle,#my-svg .node ellipse,#m=
y-svg .node polygon,#my-svg .node path{fill:#99c1f1;stroke:#62a0ea;stroke-w=
idth:1px;}#my-svg .rough-node .label text,#my-svg .node .label text,#my-svg=
 .image-shape .label,#my-svg .icon-shape .label{text-anchor:middle;}#my-svg=
 .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#my-svg .rough-n=
ode .label,#my-svg .node .label,#my-svg .image-shape .label,#my-svg .icon-s=
hape .label{text-align:center;}#my-svg .node.clickable{cursor:pointer;}#my-=
svg .root .anchor path{fill:#000000!important;stroke-width:0;stroke:#000000=
;}#my-svg .arrowheadPath{fill:#0b0b0b;}#my-svg .edgePaths .path{stroke:#000=
000;stroke-width:1px;}#my-svg .flowchart-link{stroke:#000000;fill:none;}#my=
-svg .edgeLabel{background-color:#ffffff;text-align:center;}#my-svg .edgeLa=
bel p{background-color:#ffffff;}#my-svg .edgeLabel rect{opacity:0.5;backgro=
und-color:#ffffff;fill:#ffffff;}#my-svg .labelBkg{background-color:rgba(255=
, 255, 255, 0.5);}#my-svg .cluster rect{fill:#f6f5f4;stroke:#c0bfbc;stroke-=
width:1px;}#my-svg .cluster text{fill:#000000;}#my-svg .cluster span{color:=
#000000;}#my-svg .node .collapsed-indicator{fill:#c0bfbc;stroke:none;opacit=
y:0.6;}#my-svg .node .collapsed-separator{stroke:#c0bfbc;stroke-width:0.75p=
x;}#my-svg div.mermaidTooltip{position:absolute;text-align:center;max-width=
:200px;padding:2px;font-family:"Nimbus Sans",Helvetica,Arial,sans-serif;fon=
t-size:12px;background:hsl(32.7272727273, 75.8620689655%, 82.2549019608%);b=
order:1px solid hsl(32.7272727273, 35.8620689655%, 72.2549019608%);border-r=
adius:2px;pointer-events:none;z-index:100;}#my-svg .flowchartTitleText{text=
-anchor:middle;font-size:18px;fill:#000000;}#my-svg rect.text{fill:none;str=
oke-width:0;}#my-svg .icon-shape,#my-svg .image-shape{background-color:#fff=
fff;text-align:center;}#my-svg .icon-shape p,#my-svg .image-shape p{backgro=
und-color:#ffffff;padding:2px;}#my-svg .icon-shape .label rect,#my-svg .ima=
ge-shape .label rect{opacity:0.5;background-color:#ffffff;fill:#ffffff;}#my=
-svg .label-icon{display:inline-block;height:1em;overflow:visible;vertical-=
align:-0.125em;}#my-svg .node .label-icon path{fill:currentColor;stroke:rev=
ert;stroke-width:revert;}#my-svg .node .neo-node{stroke:#62a0ea;}#my-svg [d=
ata-look=3D"neo"].node rect,#my-svg [data-look=3D"neo"].cluster rect,#my-sv=
g [data-look=3D"neo"].node polygon{stroke:url(#my-svg-gradient);filter:drop=
-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [data-look=3D"neo"].swim=
lane.cluster rect{filter:none;}#my-svg [data-look=3D"neo"].node path{stroke=
:url(#my-svg-gradient);stroke-width:1px;}#my-svg [data-look=3D"neo"].node .=
outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [d=
ata-look=3D"neo"].node .neo-line path{stroke:#62a0ea;filter:none;}#my-svg [=
data-look=3D"neo"].node circle{stroke:url(#my-svg-gradient);filter:drop-sha=
dow( 1px 2px 2px rgba(185,185,185,1));}#my-svg [data-look=3D"neo"].node cir=
cle .state-start{fill:#000000;}#my-svg [data-look=3D"neo"].icon-shape .icon=
{fill:url(#my-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,18=
5,1));}#my-svg [data-look=3D"neo"].icon-shape .icon-neo path{stroke:url(#my=
-svg-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#my-sv=
g .cluster-label tspan{font-weight:bold;}#my-svg rect{rx:7.5px;ry:7.5px;}#m=
y-svg :root{--mermaid-font-family:"Nimbus Sans",Helvetica,Arial,sans-serif;=
}#my-svg .orange rect{fill:rgb(255, 190, 111)!important;stroke:rgb(255, 163=
, 72)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#m=
y-svg .orange polygon{fill:rgb(255, 190, 111)!important;stroke:rgb(255, 163=
, 72)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#m=
y-svg .orange ellipse{fill:rgb(255, 190, 111)!important;stroke:rgb(255, 163=
, 72)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#m=
y-svg .orange circle{fill:rgb(255, 190, 111)!important;stroke:rgb(255, 163,=
 72)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my=
-svg .orange path{fill:rgb(255, 190, 111)!important;stroke:rgb(255, 163, 72=
)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;}#my-sv=
g .orange tspan{fill:rgb(0, 0, 0)!important;}#my-svg .green rect{fill:rgb(1=
43, 240, 164)!important;stroke:rgb(87, 227, 137)!important;stroke-width:1px=
!important;color:rgb(0, 0, 0)!important;}#my-svg .green polygon{fill:rgb(14=
3, 240, 164)!important;stroke:rgb(87, 227, 137)!important;stroke-width:1px!=
important;color:rgb(0, 0, 0)!important;}#my-svg .green ellipse{fill:rgb(143=
, 240, 164)!important;stroke:rgb(87, 227, 137)!important;stroke-width:1px!i=
mportant;color:rgb(0, 0, 0)!important;}#my-svg .green circle{fill:rgb(143, =
240, 164)!important;stroke:rgb(87, 227, 137)!important;stroke-width:1px!imp=
ortant;color:rgb(0, 0, 0)!important;}#my-svg .green path{fill:rgb(143, 240,=
 164)!important;stroke:rgb(87, 227, 137)!important;stroke-width:1px!importa=
nt;color:rgb(0, 0, 0)!important;}#my-svg .green tspan{fill:rgb(0, 0, 0)!imp=
ortant;}#my-svg .purple rect{fill:rgb(220, 138, 221)!important;stroke:rgb(1=
92, 97, 203)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!import=
ant;}#my-svg .purple polygon{fill:rgb(220, 138, 221)!important;stroke:rgb(1=
92, 97, 203)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!import=
ant;}#my-svg .purple ellipse{fill:rgb(220, 138, 221)!important;stroke:rgb(1=
92, 97, 203)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!import=
ant;}#my-svg .purple circle{fill:rgb(220, 138, 221)!important;stroke:rgb(19=
2, 97, 203)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!importa=
nt;}#my-svg .purple path{fill:rgb(220, 138, 221)!important;stroke:rgb(192, =
97, 203)!important;stroke-width:1px!important;color:rgb(0, 0, 0)!important;=
}#my-svg .purple tspan{fill:rgb(0, 0, 0)!important;}#my-svg .note rect{fill=
:rgb(246, 245, 244)!important;stroke:rgb(192, 191, 188)!important;stroke-wi=
dth:1px!important;color:rgb(94, 92, 100)!important;}#my-svg .note polygon{f=
ill:rgb(246, 245, 244)!important;stroke:rgb(192, 191, 188)!important;stroke=
-width:1px!important;color:rgb(94, 92, 100)!important;}#my-svg .note ellips=
e{fill:rgb(246, 245, 244)!important;stroke:rgb(192, 191, 188)!important;str=
oke-width:1px!important;color:rgb(94, 92, 100)!important;}#my-svg .note cir=
cle{fill:rgb(246, 245, 244)!important;stroke:rgb(192, 191, 188)!important;s=
troke-width:1px!important;color:rgb(94, 92, 100)!important;}#my-svg .note p=
ath{fill:rgb(246, 245, 244)!important;stroke:rgb(192, 191, 188)!important;s=
troke-width:1px!important;color:rgb(94, 92, 100)!important;}#my-svg .note t=
span{fill:rgb(94, 92, 100)!important;}#my-svg .default rect{fill:rgb(153, 1=
93, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!impo=
rtant;color:rgb(0, 0, 0)!important;}#my-svg .default polygon{fill:rgb(153, =
193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!imp=
ortant;color:rgb(0, 0, 0)!important;}#my-svg .default ellipse{fill:rgb(153,=
 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!im=
portant;color:rgb(0, 0, 0)!important;}#my-svg .default circle{fill:rgb(153,=
 193, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!im=
portant;color:rgb(0, 0, 0)!important;}#my-svg .default path{fill:rgb(153, 1=
93, 241)!important;stroke:rgb(98, 160, 234)!important;stroke-width:1px!impo=
rtant;color:rgb(0, 0, 0)!important;}#my-svg .default tspan{fill:rgb(0, 0, 0=
)!important;}</style><g><marker id=3D"my-svg_flowchart-v2-pointEnd" class=
=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"5" refY=3D"5" marker=
Units=3D"userSpaceOnUse" markerWidth=3D"8" markerHeight=3D"8" orient=3D"aut=
o"><path d=3D"M 0 0 L 10 5 L 0 10 z" class=3D"arrowMarkerPath" style=3D"str=
oke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowc=
hart-v2-pointStart" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" ref=
X=3D"4.5" refY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"8" marke=
rHeight=3D"8" orient=3D"auto"><path d=3D"M 0 5 L 10 10 L 10 0 z" class=3D"a=
rrowMarkerPath" style=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marke=
r><marker id=3D"my-svg_flowchart-v2-pointEnd-margin" class=3D"marker flowch=
art-v2" viewBox=3D"0 0 11.5 14" refX=3D"11.5" refY=3D"7" markerUnits=3D"use=
rSpaceOnUse" markerWidth=3D"10.5" markerHeight=3D"14" orient=3D"auto"><path=
 d=3D"M 0 0 L 11.5 7 L 0 14 z" class=3D"arrowMarkerPath" style=3D"stroke-wi=
dth: 0; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v=
2-pointStart-margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 11.5 14" =
refX=3D"1" refY=3D"7" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11.5" m=
arkerHeight=3D"14" orient=3D"auto"><polygon points=3D"0,7 11.5,14 11.5,0" c=
lass=3D"arrowMarkerPath" style=3D"stroke-width: 0; stroke-dasharray: 1, 0;"=
/></marker><marker id=3D"my-svg_flowchart-v2-circleEnd" class=3D"marker flo=
wchart-v2" viewBox=3D"0 0 10 10" refX=3D"11" refY=3D"5" markerUnits=3D"user=
SpaceOnUse" markerWidth=3D"11" markerHeight=3D"11" orient=3D"auto"><circle =
cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: =
1; stroke-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-cir=
cleStart" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"-1" r=
efY=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D=
"11" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarker=
Path" style=3D"stroke-width: 1; stroke-dasharray: 1, 0;"/></marker><marker =
id=3D"my-svg_flowchart-v2-circleEnd-margin" class=3D"marker flowchart-v2" v=
iewBox=3D"0 0 10 10" refY=3D"5" refX=3D"12.25" markerUnits=3D"userSpaceOnUs=
e" markerWidth=3D"14" markerHeight=3D"14" orient=3D"auto"><circle cx=3D"5" =
cy=3D"5" r=3D"5" class=3D"arrowMarkerPath" style=3D"stroke-width: 0; stroke=
-dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-circleStart-=
margin" class=3D"marker flowchart-v2" viewBox=3D"0 0 10 10" refX=3D"-2" ref=
Y=3D"5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"14" markerHeight=3D"1=
4" orient=3D"auto"><circle cx=3D"5" cy=3D"5" r=3D"5" class=3D"arrowMarkerPa=
th" style=3D"stroke-width: 0; stroke-dasharray: 1, 0;"/></marker><marker id=
=3D"my-svg_flowchart-v2-crossEnd" class=3D"marker cross flowchart-v2" viewB=
ox=3D"0 0 11 11" refX=3D"12" refY=3D"5.2" markerUnits=3D"userSpaceOnUse" ma=
rkerWidth=3D"11" markerHeight=3D"11" orient=3D"auto"><path d=3D"M 1,1 l 9,9=
 M 10,1 l -9,9" class=3D"arrowMarkerPath" style=3D"stroke-width: 2; stroke-=
dasharray: 1, 0;"/></marker><marker id=3D"my-svg_flowchart-v2-crossStart" c=
lass=3D"marker cross flowchart-v2" viewBox=3D"0 0 11 11" refX=3D"-1" refY=
=3D"5.2" markerUnits=3D"userSpaceOnUse" markerWidth=3D"11" markerHeight=3D"=
11" orient=3D"auto"><path d=3D"M 1,1 l 9,9 M 10,1 l -9,9" class=3D"arrowMar=
kerPath" style=3D"stroke-width: 2; stroke-dasharray: 1, 0;"/></marker><mark=
er id=3D"my-svg_flowchart-v2-crossEnd-margin" class=3D"marker cross flowcha=
rt-v2" viewBox=3D"0 0 15 15" refX=3D"17.7" refY=3D"7.5" markerUnits=3D"user=
SpaceOnUse" markerWidth=3D"12" markerHeight=3D"12" orient=3D"auto"><path d=
=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=3D"arrowMarkerPath" style=3D"stroke-=
width: 2.5;"/></marker><marker id=3D"my-svg_flowchart-v2-crossStart-margin"=
 class=3D"marker cross flowchart-v2" viewBox=3D"0 0 15 15" refX=3D"-3.5" re=
fY=3D"7.5" markerUnits=3D"userSpaceOnUse" markerWidth=3D"12" markerHeight=
=3D"12" orient=3D"auto"><path d=3D"M 1,1 L 14,14 M 1,14 L 14,1" class=3D"ar=
rowMarkerPath" style=3D"stroke-width: 2.5; stroke-dasharray: 1, 0;"/></mark=
er><g class=3D"root"><g class=3D"clusters"><g class=3D"cluster" id=3D"my-sv=
g-loop" data-look=3D"classic"><rect style=3D"fill:#f6f5f4 !important;stroke=
:#c0bfbc !important;stroke-width:1px !important" x=3D"12" y=3D"501.32600021=
362305" width=3D"344.11895751953125" height=3D"388.9889945983887"/><g class=
=3D"cluster-label" transform=3D"translate(115.80947875976562, 501.326000213=
62305)"><g><rect class=3D"background" style=3D"stroke: none"/><text xml:spa=
ce=3D"preserve" y=3D"-10.1" style=3D""><tspan class=3D"text-outer-tspan row=
" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"t=
ext-inner-tspan" font-weight=3D"normal">Edit/build/debug</tspan><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> loop</=
tspan></tspan></text></g></g></g><g class=3D"cluster" id=3D"my-svg-workspac=
e" data-look=3D"classic"><rect style=3D"fill:#f6f5f4 !important;stroke:#c06=
1cb !important;stroke-width:1px !important" x=3D"63.98600311279296" y=3D"15=
4" width=3D"423.6875" height=3D"103.66300201416016"/><g class=3D"cluster-la=
bel" transform=3D"translate(216.11881561279296, 154)"><g><rect class=3D"bac=
kground" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" s=
tyle=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"=
1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal">devtool</tspan><tspan font-style=3D"normal" class=3D"text-inner=
-tspan" font-weight=3D"normal"> workspace</tspan></tspan></text></g></g></g=
></g><g class=3D"edges edgePaths"><path d=3D"M274.9992515563965,46L274.9992=
515563965,58.928932188134524Q274.9992515563965,66 267.928183744531,66L213.6=
4063186826195,66Q206.56956405639647,66 206.56956405639647,73.07106781186548=
L206.56956405639647,95L206.56956405639647,116.92893218813452Q206.5695640563=
9647,124 199.498496244531,124L184.90082092465843,124Q177.82975311279296,124=
 177.82975311279296,131.07106781186548L177.82975311279296,144L177.829753112=
79296,198.33150100708008" id=3D"my-svg-L_modify_ws_appends_0" class=3D"edge=
-thickness-normal edge-pattern-solid edge-thickness-normal edge-pattern-sol=
id flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=
=3D"L_modify_ws_appends_0" data-points=3D"W3sieCI6Mjc0Ljk5OTI1MTU1NjM5NjUsI=
nkiOjQ2fSx7IngiOjI3NC45OTkyNTE1NTYzOTY1LCJ5Ijo2Nn0seyJ4IjoyMDYuNTY5NTY0MDU2=
Mzk2NDcsInkiOjY2fSx7IngiOjIwNi41Njk1NjQwNTYzOTY0NywieSI6OTV9LHsieCI6MjA2LjU=
2OTU2NDA1NjM5NjQ3LCJ5IjoxMjR9LHsieCI6MTc3LjgyOTc1MzExMjc5Mjk2LCJ5IjoxMjR9LH=
sieCI6MTc3LjgyOTc1MzExMjc5Mjk2LCJ5IjoxNDR9LHsieCI6MTc3LjgyOTc1MzExMjc5Mjk2L=
CJ5IjoyMDIuMzMxNTAxMDA3MDgwMDh9XQ=3D=3D" data-look=3D"classic" marker-end=
=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M350.9836265563965,46L3=
50.9836265563965,116.92893218813452Q350.9836265563965,124 358.0546943682619=
5,124L383.6024353009275,124Q390.67350311279296,124 390.67350311279296,131.0=
7106781186548L390.67350311279296,144L390.67350311279296,191" id=3D"my-svg-L=
_modify_ws_src_0" class=3D"edge-thickness-normal edge-pattern-solid edge-th=
ickness-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=3D"=
true" data-et=3D"edge" data-id=3D"L_modify_ws_src_0" data-points=3D"W3sieCI=
6MzUwLjk4MzYyNjU1NjM5NjUsInkiOjQ2fSx7IngiOjM1MC45ODM2MjY1NTYzOTY1LCJ5IjoxMj=
R9LHsieCI6MzkwLjY3MzUwMzExMjc5Mjk2LCJ5IjoxMjR9LHsieCI6MzkwLjY3MzUwMzExMjc5M=
jk2LCJ5IjoxNDR9LHsieCI6MzkwLjY3MzUwMzExMjc5Mjk2LCJ5IjoxOTV9XQ=3D=3D" data-l=
ook=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=
=3D"M177.82975311279296,226.33150100708008L177.82975311279296,284L177.82975=
311279296,296.9289321881345Q177.82975311279296,304 184.90082092465843,304L2=
48.4065363548012,304Q255.47760416666668,304 255.47760416666668,311.07106781=
18655L255.47760416666668,320" id=3D"my-svg-L_ws_appends_gensdk_0" class=3D"=
edge-thickness-normal edge-pattern-solid edge-thickness-normal edge-pattern=
-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data=
-id=3D"L_ws_appends_gensdk_0" data-points=3D"W3sieCI6MTc3LjgyOTc1MzExMjc5Mj=
k2LCJ5IjoyMjYuMzMxNTAxMDA3MDgwMDh9LHsieCI6MTc3LjgyOTc1MzExMjc5Mjk2LCJ5IjoyO=
DR9LHsieCI6MTc3LjgyOTc1MzExMjc5Mjk2LCJ5IjozMDR9LHsieCI6MjU1LjQ3NzYwNDE2NjY2=
NjY4LCJ5IjozMDR9LHsieCI6MjU1LjQ3NzYwNDE2NjY2NjY4LCJ5IjozMjR9XQ=3D=3D" data-=
look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=
=3D"M390.67350311279296,233.66298357820415L390.67350311279296,233.663002014=
16016L390.67350311279296,284L390.67350311279296,296.9289321881345Q390.67350=
311279296,304 383.6024353009275,304L325.5903386451988,304Q318.5192708333333=
4,304 318.51927083333334,311.0710678118655L318.51927083333334,320" id=3D"my=
-svg-L_ws_src_gensdk_0" class=3D"edge-thickness-normal edge-pattern-solid e=
dge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-ed=
ge=3D"true" data-et=3D"edge" data-id=3D"L_ws_src_gensdk_0" data-points=3D"W=
3sieCI6MzkwLjY3MzUwMzExMjc5Mjk2LCJ5IjoyMzMuNjYyOTgzNTc4MjA0MTV9LHsieCI6Mzkw=
LjY3MzUwMzExMjc5Mjk2LCJ5IjoyMzMuNjYzMDAyMDE0MTYwMTZ9LHsieCI6MzkwLjY3MzUwMzE=
xMjc5Mjk2LCJ5IjoyODR9LHsieCI6MzkwLjY3MzUwMzExMjc5Mjk2LCJ5IjozMDR9LHsieCI6Mz=
E4LjUxOTI3MDgzMzMzMzM0LCJ5IjozMDR9LHsieCI6MzE4LjUxOTI3MDgzMzMzMzM0LCJ5IjozM=
jR9XQ=3D=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-p=
ointEnd)"/><path d=3D"M255.47760416666668,372.6629981994629L255.47760416666=
668,385.5919303875974Q255.47760416666668,392.6629981994629 248.406536354801=
2,392.6629981994629L242.38044281186546,392.6629981994629Q235.309375,392.662=
9981994629 235.309375,399.73406601132837L235.309375,491.32600021362305L235.=
309375,538.326000213623" id=3D"my-svg-L_gensdk_edit_0" class=3D"edge-thickn=
ess-normal edge-pattern-solid edge-thickness-normal edge-pattern-solid flow=
chart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_ge=
nsdk_edit_0" data-points=3D"W3sieCI6MjU1LjQ3NzYwNDE2NjY2NjY4LCJ5IjozNzIuNjY=
yOTk4MTk5NDYyOX0seyJ4IjoyNTUuNDc3NjA0MTY2NjY2NjgsInkiOjM5Mi42NjI5OTgxOTk0Nj=
I5fSx7IngiOjIzNS4zMDkzNzUsInkiOjM5Mi42NjI5OTgxOTk0NjI5fSx7IngiOjIzNS4zMDkzN=
zUsInkiOjQ5MS4zMjYwMDAyMTM2MjMwNX0seyJ4IjoyMzUuMzA5Mzc1LCJ5Ijo1NDIuMzI2MDAw=
MjEzNjIzfV0=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v=
2-pointEnd)"/><path d=3D"M235.309375,576.326000213623L235.309375,599.254932=
4017575Q235.309375,606.326000213623 242.38044281186546,606.326000213623L245=
.04788970766577,606.326000213623Q252.11895751953125,606.326000213623 252.11=
895751953125,613.3970680254886L252.11895751953125,632.326000213623" id=3D"m=
y-svg-L_edit_build_0" class=3D"edge-thickness-normal edge-pattern-solid edg=
e-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-edge=
=3D"true" data-et=3D"edge" data-id=3D"L_edit_build_0" data-points=3D"W3sieC=
I6MjM1LjMwOTM3NSwieSI6NTc2LjMyNjAwMDIxMzYyM30seyJ4IjoyMzUuMzA5Mzc1LCJ5Ijo2M=
DYuMzI2MDAwMjEzNjIzfSx7IngiOjI1Mi4xMTg5NTc1MTk1MzEyNSwieSI6NjA2LjMyNjAwMDIx=
MzYyM30seyJ4IjoyNTIuMTE4OTU3NTE5NTMxMjUsInkiOjYzNi4zMjYwMDAyMTM2MjN9XQ=3D=
=3D" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)=
"/><path d=3D"M252.11895751953125,699.6519966125488L252.11895751953125,719.=
6519966125488" id=3D"my-svg-L_build_deploy_0" class=3D"edge-thickness-norma=
l edge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-lin=
k" style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_build_deplo=
y_0" data-points=3D"W3sieCI6MjUyLjExODk1NzUxOTUzMTI1LCJ5Ijo2OTkuNjUxOTk2NjE=
yNTQ4OH0seyJ4IjoyNTIuMTE4OTU3NTE5NTMxMjUsInkiOjcyMy42NTE5OTY2MTI1NDg4fV0=3D=
" data-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/>=
<path d=3D"M252.11895751953125,757.6519966125488L252.11895751953125,780.580=
9288006833Q252.11895751953125,787.6519966125488 245.04788970766577,787.6519=
966125488L227.15856781186545,787.6519966125488Q220.08749999999998,787.65199=
66125488 220.08749999999998,794.7230644244144L220.08749999999998,813.651996=
6125488" id=3D"my-svg-L_deploy_debug_0" class=3D"edge-thickness-normal edge=
-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-link" sty=
le=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_deploy_debug_0" d=
ata-points=3D"W3sieCI6MjUyLjExODk1NzUxOTUzMTI1LCJ5Ijo3NTcuNjUxOTk2NjEyNTQ4O=
H0seyJ4IjoyNTIuMTE4OTU3NTE5NTMxMjUsInkiOjc4Ny42NTE5OTY2MTI1NDg4fSx7IngiOjIy=
MC4wODc0OTk5OTk5OTk5OCwieSI6Nzg3LjY1MTk5NjYxMjU0ODh9LHsieCI6MjIwLjA4NzQ5OTk=
5OTk5OTk4LCJ5Ijo4MTcuNjUxOTk2NjEyNTQ4OH1d" data-look=3D"classic" marker-end=
=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M133.44375,817.65199661=
25488L133.44375,794.7230644244144Q133.44375,787.6519966125488 126.372682188=
13452,787.6519966125488L108.48336029233423,787.6519966125488Q101.4122924804=
6875,787.6519966125488 101.41229248046875,780.5809288006833L101.41229248046=
875,613.3970680254886Q101.41229248046875,606.326000213623 108.4833602923342=
3,606.326000213623L193.6383071881345,606.326000213623Q200.70937499999997,60=
6.326000213623 200.70937499999997,599.2549324017575L200.70937499999997,580.=
326000213623" id=3D"my-svg-L_debug_edit_0" class=3D"edge-thickness-normal e=
dge-pattern-solid edge-thickness-normal edge-pattern-solid flowchart-link" =
style=3D";" data-edge=3D"true" data-et=3D"edge" data-id=3D"L_debug_edit_0" =
data-points=3D"W3sieCI6MTMzLjQ0Mzc1LCJ5Ijo4MTcuNjUxOTk2NjEyNTQ4OH0seyJ4Ijox=
MzMuNDQzNzUsInkiOjc4Ny42NTE5OTY2MTI1NDg4fSx7IngiOjEwMS40MTIyOTI0ODA0Njg3NSw=
ieSI6Nzg3LjY1MTk5NjYxMjU0ODh9LHsieCI6MTAxLjQxMjI5MjQ4MDQ2ODc1LCJ5Ijo2MDYuMz=
I2MDAwMjEzNjIzfSx7IngiOjIwMC43MDkzNzQ5OTk5OTk5NywieSI6NjA2LjMyNjAwMDIxMzYyM=
30seyJ4IjoyMDAuNzA5Mzc0OTk5OTk5OTcsInkiOjU3Ni4zMjYwMDAyMTM2MjN9XQ=3D=3D" da=
ta-look=3D"classic" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><pat=
h d=3D"M269.90937499999995,576.326000213623L269.90937499999995,599.25493240=
17575Q269.90937499999995,606.326000213623 276.98044281186543,606.3260002136=
23L345.7697647076658,606.326000213623Q352.84083251953126,606.326000213623 3=
52.84083251953126,613.3970680254886L352.84083251953126,900.3149948120117L35=
2.84083251953126,994.3149948120117" id=3D"my-svg-L_edit_finish_0" class=3D"=
edge-thickness-normal edge-pattern-dotted edge-thickness-normal edge-patter=
n-solid flowchart-link" style=3D";" data-edge=3D"true" data-et=3D"edge" dat=
a-id=3D"L_edit_finish_0" data-points=3D"W3sieCI6MjY5LjkwOTM3NDk5OTk5OTk1LCJ=
5Ijo1NzYuMzI2MDAwMjEzNjIzfSx7IngiOjI2OS45MDkzNzQ5OTk5OTk5NSwieSI6NjA2LjMyNj=
AwMDIxMzYyM30seyJ4IjozNTIuODQwODMyNTE5NTMxMjYsInkiOjYwNi4zMjYwMDAyMTM2MjN9L=
HsieCI6MzUyLjg0MDgzMjUxOTUzMTI2LCJ5Ijo5MDAuMzE0OTk0ODEyMDExN30seyJ4IjozNTIu=
ODQwODMyNTE5NTMxMjYsInkiOjk5OC4zMTQ5OTQ4MTIwMTE3fV0=3D" data-look=3D"classi=
c" marker-end=3D"url(#my-svg_flowchart-v2-pointEnd)"/><path d=3D"M318.51927=
083333334,372.6629981994629L318.51927083333334,385.5919303875974Q318.519270=
83333334,392.6629981994629 325.5903386451988,392.6629981994629L383.60243530=
09275,392.6629981994629Q390.67350311279296,392.6629981994629 390.6735031127=
9296,399.73406601132837L390.67350311279296,412.6629981994629" id=3D"my-svg-=
L_gensdk_rerun_note_0" class=3D"edge-thickness-normal edge-pattern-dotted e=
dge-thickness-normal edge-pattern-solid flowchart-link" style=3D";" data-ed=
ge=3D"true" data-et=3D"edge" data-id=3D"L_gensdk_rerun_note_0" data-points=
=3D"W3sieCI6MzE4LjUxOTI3MDgzMzMzMzM0LCJ5IjozNzIuNjYyOTk4MTk5NDYyOX0seyJ4Ijo=
zMTguNTE5MjcwODMzMzMzMzQsInkiOjM5Mi42NjI5OTgxOTk0NjI5fSx7IngiOjM5MC42NzM1MD=
MxMTI3OTI5NiwieSI6MzkyLjY2Mjk5ODE5OTQ2Mjl9LHsieCI6MzkwLjY3MzUwMzExMjc5Mjk2L=
CJ5Ijo0MTIuNjYyOTk4MTk5NDYyOX1d" data-look=3D"classic"/></g><g class=3D"edg=
eLabels"><g class=3D"edgeLabel" transform=3D"translate(350.9836265563965, 9=
5)"><g class=3D"label" data-id=3D"L_modify_ws_src_0" transform=3D"translate=
(-0.166015625, -10.329999923706055)"><g><rect class=3D"background" style=3D=
"" x=3D"-25.1328125" y=3D"1.3299999237060547" width=3D"50.59765625" height=
=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" st=
yle=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1=
.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal">extracts</tspan></tspan></text></g></g></g=
><g class=3D"edgeLabel" transform=3D"translate(234.825, 431.99449920654297)=
"><g class=3D"label" data-id=3D"L_gensdk_edit_0" transform=3D"translate(0, =
-10.329999923706055)"><g><rect class=3D"background" style=3D"" x=3D"-46.015=
625" y=3D"1.3299999237060547" width=3D"92.03125" height=3D"18"/><text xml:s=
pace=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D""><tspan clas=
s=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" text-anchor=3D=
"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weigh=
t=3D"normal">one-time</tspan><tspan font-style=3D"normal" class=3D"text-inn=
er-tspan" font-weight=3D"normal"> setup</tspan></tspan></text></g></g></g><=
g class=3D"edgeLabel" transform=3D"translate(101.265625, 667.9889984130859)=
"><g class=3D"label" data-id=3D"L_debug_edit_0" transform=3D"translate(-0.1=
4239501953125, -10.329999923706055)"><g><rect class=3D"background" style=3D=
"" x=3D"-20.7109375" y=3D"1.3299999237060547" width=3D"41.7066650390625" he=
ight=3D"18"/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle=
" style=3D""><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=
=3D"1.1em" text-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal">repeat</tspan></tspan></text></g></g>=
</g><g class=3D"edgeLabel" transform=3D"translate(352.45020751953126, 949.3=
149948120117)"><g class=3D"label" data-id=3D"L_edit_finish_0" transform=3D"=
translate(0, -10.329999923706055)"><g><rect class=3D"background" style=3D""=
 x=3D"-34.609375" y=3D"1.3299999237060547" width=3D"69.21875" height=3D"18"=
/><text xml:space=3D"preserve" y=3D"-10.1" text-anchor=3D"middle" style=3D"=
"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em" t=
ext-anchor=3D"middle"><tspan font-style=3D"normal" class=3D"text-inner-tspa=
n" font-weight=3D"normal">when</tspan><tspan font-style=3D"normal" class=3D=
"text-inner-tspan" font-weight=3D"normal"> done</tspan></tspan></text></g><=
/g></g></g><g class=3D"nodes"><g class=3D"node default orange" id=3D"my-svg=
-flowchart-modify-0" data-look=3D"classic" transform=3D"translate(312.99143=
90563965, 29)"><rect class=3D"basic label-container" style=3D"fill:#ffbe6f =
!important;stroke:#ffa348 !important;stroke-width:1px !important" x=3D"-123=
.9765625" y=3D"-17" width=3D"247.953125" height=3D"34"/><g class=3D"label" =
style=3D"color:#000000 !important" transform=3D"translate(0, -7)"><rect/><g=
><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D"pres=
erve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-ou=
ter-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"norma=
l" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> mo=
dify</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal"> recipe</tspan><tspan font-style=3D"normal" class=3D"text-i=
nner-tspan" font-weight=3D"normal"> --debug-build</tspan></tspan></text></g=
></g></g><g class=3D"node default purple" id=3D"my-svg-flowchart-ws_appends=
-1" data-look=3D"classic" transform=3D"translate(177.82975311279296, 214.33=
150100708008)"><polygon points=3D"0,0 163.6875,0 163.6875,-24 0,-24 0,0 -8,=
0 171.6875,0 171.6875,-24 -8,-24 -8,0" class=3D"label-container" transform=
=3D"translate(-81.84375,12)" style=3D"fill:#dc8add !important;stroke:#c061c=
b !important;stroke-width:1px !important"/><g class=3D"label" style=3D"colo=
r:#000000 !important" transform=3D"translate(0, -7)"><rect/><g><rect class=
=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-=
10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan ro=
w" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal">appends/recipe.bbappend</tspan></t=
span></text></g></g></g><g class=3D"node default green" id=3D"my-svg-flowch=
art-ws_src-2" data-look=3D"classic" transform=3D"translate(390.673503112792=
96, 214.33150100708008)"><polygon points=3D"0,0 130,0 130,-38.6630001068115=
2 0,-38.66300010681152 0,0 -8,0 138,0 138,-38.66300010681152 -8,-38.6630001=
0681152 -8,0" class=3D"label-container" transform=3D"translate(-65,19.33150=
005340576)" style=3D"fill:#8ff0a4 !important;stroke:#57e389 !important;stro=
ke-width:1px !important"/><g class=3D"label" style=3D"color:#000000 !import=
ant" transform=3D"translate(0, -14.331500053405762)"><rect/><g><rect class=
=3D"background" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-=
10.1" style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan ro=
w" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"=
text-inner-tspan" font-weight=3D"normal">sources/recipe</tspan></tspan><tsp=
an class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan fon=
t-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">(extra=
cted</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-we=
ight=3D"normal"> here)</tspan></tspan></text></g></g></g><g class=3D"node d=
efault orange" id=3D"my-svg-flowchart-gensdk-3" data-look=3D"classic" trans=
form=3D"translate(286.9984375, 348.33149909973145)"><rect class=3D"basic la=
bel-container" style=3D"fill:#ffbe6f !important;stroke:#ffa348 !important;s=
troke-width:1px !important" x=3D"-104.5625" y=3D"-24.33150005340576" width=
=3D"209.125" height=3D"48.66300010681152"/><g class=3D"label" style=3D"colo=
r:#000000 !important" transform=3D"translate(0, -14.331500053405762)"><rect=
/><g><rect class=3D"background" style=3D"stroke: none"/><text xml:space=3D"=
preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspan class=3D"tex=
t-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"n=
ormal" class=3D"text-inner-tspan" font-weight=3D"normal">devtool</tspan><ts=
pan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"=
> ide-sdk</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" fo=
nt-weight=3D"normal"> recipe</tspan><tspan font-style=3D"normal" class=3D"t=
ext-inner-tspan" font-weight=3D"normal"> image</tspan></tspan><tspan class=
=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=
=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">(generate</ts=
pan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"=
normal"> SDK</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan"=
 font-weight=3D"normal"> +</tspan><tspan font-style=3D"normal" class=3D"tex=
t-inner-tspan" font-weight=3D"normal"> IDE</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> config)</tspan></tsp=
an></text></g></g></g><g class=3D"node default green" id=3D"my-svg-flowchar=
t-edit-4" data-look=3D"classic" transform=3D"translate(235.309375, 559.3260=
00213623)"><rect class=3D"basic label-container" style=3D"fill:#8ff0a4 !imp=
ortant;stroke:#57e389 !important;stroke-width:1px !important" x=3D"-80" y=
=3D"-17" width=3D"160" height=3D"34"/><g class=3D"label" style=3D"color:#00=
0000 !important" transform=3D"translate(0, -7)"><rect/><g><rect class=3D"ba=
ckground" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" =
style=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=
=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text=
-inner-tspan" font-weight=3D"normal">Edit</tspan><tspan font-style=3D"norma=
l" class=3D"text-inner-tspan" font-weight=3D"normal"> source</tspan><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> co=
de</tspan></tspan></text></g></g></g><g class=3D"node default orange" id=3D=
"my-svg-flowchart-build-5" data-look=3D"classic" transform=3D"translate(252=
.11895751953125, 667.9889984130859)"><rect class=3D"basic label-container" =
style=3D"fill:#ffbe6f !important;stroke:#ffa348 !important;stroke-width:1px=
 !important" x=3D"-80" y=3D"-31.66299819946289" width=3D"160" height=3D"63.=
32599639892578"/><g class=3D"label" style=3D"color:#000000 !important" tran=
sform=3D"translate(0, -21.66299819946289)"><rect/><g><rect class=3D"backgro=
und" style=3D"stroke: none"/><text xml:space=3D"preserve" y=3D"-10.1" style=
=3D"fill:#000000 !important"><tspan class=3D"text-outer-tspan row" x=3D"0" =
y=3D"-0.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inner-=
tspan" font-weight=3D"normal">Build</tspan></tspan><tspan class=3D"text-out=
er-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal">(build</tspan><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> tool</t=
span><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal"> called</tspan></tspan><tspan class=3D"text-outer-tspan row" x=3D"=
0" y=3D"2.1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text-inne=
r-tspan" font-weight=3D"normal">directly</tspan><tspan font-style=3D"normal=
" class=3D"text-inner-tspan" font-weight=3D"normal"> by</tspan><tspan font-=
style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> the</ts=
pan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"=
normal"> IDE)</tspan></tspan></text></g></g></g><g class=3D"node default or=
ange" id=3D"my-svg-flowchart-deploy-6" data-look=3D"classic" transform=3D"t=
ranslate(252.11895751953125, 740.6519966125488)"><rect class=3D"basic label=
-container" style=3D"fill:#ffbe6f !important;stroke:#ffa348 !important;stro=
ke-width:1px !important" x=3D"-80" y=3D"-17" width=3D"160" height=3D"34"/><=
g class=3D"label" style=3D"color:#000000 !important" transform=3D"translate=
(0, -7)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><text=
 xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tspa=
n class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan f=
ont-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">Depl=
oy</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> to</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> target</tspan></tspan></text></g></g></g><g c=
lass=3D"node default orange" id=3D"my-svg-flowchart-debug-7" data-look=3D"c=
lassic" transform=3D"translate(176.765625, 841.9834957122803)"><rect class=
=3D"basic label-container" style=3D"fill:#ffbe6f !important;stroke:#ffa348 =
!important;stroke-width:1px !important" x=3D"-140.765625" y=3D"-24.33150005=
340576" width=3D"281.53125" height=3D"48.66300010681152"/><g class=3D"label=
" style=3D"color:#000000 !important" transform=3D"translate(0, -14.33150005=
3405762)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><tex=
t xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !important"><tsp=
an class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan =
font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">Deb=
ug</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> remotely</tspan></tspan><tspan class=3D"text-outer-tspan row=
" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-style=3D"normal" class=3D"text=
-inner-tspan" font-weight=3D"normal">(e.g.</tspan><tspan font-style=3D"norm=
al" class=3D"text-inner-tspan" font-weight=3D"normal"> GDB/LLDB</tspan><tsp=
an font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">=
 +</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> gdbserver/lldb-server)</tspan></tspan></text></g></g></g><g =
class=3D"node default orange" id=3D"my-svg-flowchart-finish-8" data-look=3D=
"classic" transform=3D"translate(352.84083251953126, 1022.6464939117432)"><=
rect class=3D"basic label-container" style=3D"fill:#ffbe6f !important;strok=
e:#ffa348 !important;stroke-width:1px !important" x=3D"-100.4296875" y=3D"-=
24.33150005340576" width=3D"200.859375" height=3D"48.66300010681152"/><g cl=
ass=3D"label" style=3D"color:#000000 !important" transform=3D"translate(0, =
-14.331500053405762)"><rect/><g><rect class=3D"background" style=3D"stroke:=
 none"/><text xml:space=3D"preserve" y=3D"-10.1" style=3D"fill:#000000 !imp=
ortant"><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.=
1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D=
"normal">devtool</tspan><tspan font-style=3D"normal" class=3D"text-inner-ts=
pan" font-weight=3D"normal"> finish</tspan><tspan font-style=3D"normal" cla=
ss=3D"text-inner-tspan" font-weight=3D"normal"> recipe</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> layer</t=
span></tspan><tspan class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"=
1.1em"><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal">(turn</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> changes</tspan><tspan font-style=3D"normal" c=
lass=3D"text-inner-tspan" font-weight=3D"normal"> into</tspan><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal"> patches)=
</tspan></tspan></text></g></g></g><g class=3D"node default note" id=3D"my-=
svg-flowchart-rerun_note-9" data-look=3D"classic" transform=3D"translate(39=
0.67350311279296, 431.99449920654297)"><g class=3D"basic label-container ou=
ter-path" transform=3D"translate(4.83287501335144,0)"><path d=3D"M-74.66575=
002670288 -19.33150005340576 C-71.40538971050414 -12.810779421008267, -68.1=
4502939430538 -6.29005878861077, -65 0 C-67.94551634496064 5.89103268992128=
6, -70.89103268992129 11.782065379842573, -74.66575002670288 19.33150005340=
576 C-44.44243276766865 19.33150005340576, -14.219115508634424 19.331500053=
40576, 65 19.33150005340576 C65 5.559444130880824, 65 -8.212611791644115, 6=
5 -19.33150005340576 C15.99965419423188 -19.33150005340576, -33.00069161153=
624 -19.33150005340576, -74.66575002670288 -19.33150005340576" stroke=3D"no=
ne" stroke-width=3D"0" fill=3D"#f6f5f4" style=3D"fill:#f6f5f4 !important;st=
roke:#c0bfbc !important;stroke-width:1px !important"/><path d=3D"M-74.66575=
002670288 -19.33150005340576 C-71.5251224278427 -13.050244855685419, -68.38=
449482898254 -6.768989657965076, -65 0 M-74.66575002670288 -19.331500053405=
76 C-71.62351113337313 -13.247022266746264, -68.58127224004338 -7.162544480=
0867655, -65 0 M-65 0 C-67.82578458116387 5.651569162327756, -70.6515691623=
2776 11.303138324655512, -74.66575002670288 19.33150005340576 M-65 0 C-68.3=
1876689677354 6.637533793547082, -71.63753379354708 13.275067587094163, -74=
.66575002670288 19.33150005340576 M-74.66575002670288 19.33150005340576 C-3=
9.987920406742916 19.33150005340576, -5.3100907867829505 19.33150005340576,=
 65 19.33150005340576 M-74.66575002670288 19.33150005340576 C-42.1151189255=
76866 19.33150005340576, -9.56448782445085 19.33150005340576, 65 19.3315000=
5340576 M65 19.33150005340576 C65 5.214944971224332, 65 -8.901610110957098,=
 65 -19.33150005340576 M65 19.33150005340576 C65 10.24527523198579, 65 1.15=
90504105658184, 65 -19.33150005340576 M65 -19.33150005340576 C21.2885274457=
18366 -19.33150005340576, -22.42294510856327 -19.33150005340576, -74.665750=
02670288 -19.33150005340576 M65 -19.33150005340576 C21.919020972014586 -19.=
33150005340576, -21.16195805597083 -19.33150005340576, -74.66575002670288 -=
19.33150005340576" stroke=3D"#c0bfbc" stroke-width=3D"1" fill=3D"none" stro=
ke-dasharray=3D"0 0" style=3D"fill:#f6f5f4 !important;stroke:#c0bfbc !impor=
tant;stroke-width:1px !important"/></g><g class=3D"label" style=3D"color:#5=
e5c64 !important" transform=3D"translate(4.83287501335144, -17.661499977111=
816)"><rect/><g><rect class=3D"background" style=3D"stroke: none"/><text xm=
l:space=3D"preserve" y=3D"-10.1" style=3D"fill:#5e5c64 !important"><tspan c=
lass=3D"text-outer-tspan row" x=3D"0" y=3D"-0.1em" dy=3D"1.1em"><tspan font=
-style=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">rerun</=
tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weight=
=3D"normal"> only</tspan><tspan font-style=3D"normal" class=3D"text-inner-t=
span" font-weight=3D"normal"> if</tspan><tspan font-style=3D"normal" class=
=3D"text-inner-tspan" font-weight=3D"normal"> recipe</tspan></tspan><tspan =
class=3D"text-outer-tspan row" x=3D"0" y=3D"1em" dy=3D"1.1em"><tspan font-s=
tyle=3D"normal" class=3D"text-inner-tspan" font-weight=3D"normal">deps/conf=
ig</tspan><tspan font-style=3D"normal" class=3D"text-inner-tspan" font-weig=
ht=3D"normal"> change</tspan></tspan></text></g></g></g></g></g></g><defs><=
filter id=3D"my-svg-drop-shadow" height=3D"130%" width=3D"130%"><feDropShad=
ow dx=3D"4" dy=3D"4" stdDeviation=3D"0" flood-opacity=3D"0.06" flood-color=
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
index 3912872e1..3823db820 100644
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

